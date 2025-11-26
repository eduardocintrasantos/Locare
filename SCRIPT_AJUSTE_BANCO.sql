-- =====================================================
-- LOCARE - SCRIPT COMPLETO DE CRIAÇÃO DO BANCO DE DADOS
-- Sistema de Gestão de Imóveis para Pessoas Físicas
-- =====================================================
-- Executar no SQL Editor do Supabase
-- Este script cria todas as tabelas, índices, políticas RLS e triggers
-- Execute em um banco ZERADO ou remova as tabelas existentes primeiro
-- =====================================================

-- =====================================================
-- 0. LIMPAR TABELAS EXISTENTES (OPCIONAL - CUIDADO!)
-- =====================================================
-- Descomente as linhas abaixo APENAS se quiser resetar o banco

-- DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
-- DROP FUNCTION IF EXISTS public.handle_new_user();
-- DROP FUNCTION IF EXISTS public.update_updated_at_column();
-- DROP VIEW IF EXISTS vw_vinculos_ativos;
-- DROP VIEW IF EXISTS vw_resumo_mensal;
-- DROP TABLE IF EXISTS TPAGAMENTOS CASCADE;
-- DROP TABLE IF EXISTS TVINCULOS CASCADE;
-- DROP TABLE IF EXISTS TLOCATARIOS CASCADE;
-- DROP TABLE IF EXISTS TCASAS CASCADE;
-- DROP TABLE IF EXISTS TIMOBILIARIAS CASCADE;
-- DROP TABLE IF EXISTS TUSUARIOS CASCADE;

-- =====================================================
-- 1. TABELA DE USUÁRIOS (TUSUARIOS)
-- =====================================================
-- Perfil do usuário (pessoa física)
-- O ID é o mesmo do Supabase Auth (UUID)

CREATE TABLE IF NOT EXISTS TUSUARIOS (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    
    -- Trial de 7 dias gratuitos
    trial_ends_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL '7 days'),
    
    -- Premium (plano pago)
    is_premium BOOLEAN NOT NULL DEFAULT FALSE,
    premium_expires_at TIMESTAMP,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Índice para busca por email
CREATE INDEX IF NOT EXISTS idx_tusuarios_email ON TUSUARIOS(email);

-- Comentário
COMMENT ON TABLE TUSUARIOS IS 'Perfil dos usuários (pessoas físicas). ID referencia auth.users do Supabase.';

-- =====================================================
-- 2. TABELA DE IMOBILIÁRIAS (TIMOBILIARIAS)
-- =====================================================

CREATE TABLE IF NOT EXISTS TIMOBILIARIAS (
    id SERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(20),
    rua VARCHAR(255),
    cep VARCHAR(10),
    bairro VARCHAR(100),
    numero VARCHAR(20),
    telefone VARCHAR(20),
    nome_contato VARCHAR(255),
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_timobiliarias_usuario ON TIMOBILIARIAS(usuario_id);
CREATE INDEX IF NOT EXISTS idx_timobiliarias_nome ON TIMOBILIARIAS(nome);

-- Comentário
COMMENT ON TABLE TIMOBILIARIAS IS 'Imobiliárias cadastradas pelo usuário.';

-- =====================================================
-- 3. TABELA DE CASAS (TCASAS)
-- =====================================================
-- O vínculo com Imobiliária é feito apenas na tabela TVINCULOS

CREATE TABLE IF NOT EXISTS TCASAS (
    id SERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    
    descricao VARCHAR(255) NOT NULL,
    rua VARCHAR(255),
    numero VARCHAR(20),
    cep VARCHAR(10),
    bairro VARCHAR(100),
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_tcasas_usuario ON TCASAS(usuario_id);
CREATE INDEX IF NOT EXISTS idx_tcasas_descricao ON TCASAS(descricao);

-- Comentário
COMMENT ON TABLE TCASAS IS 'Casas/Imóveis do usuário. O vínculo com Imobiliária é feito na tabela TVINCULOS.';

-- =====================================================
-- 4. TABELA DE LOCATÁRIOS (TLOCATARIOS)
-- =====================================================

CREATE TABLE IF NOT EXISTS TLOCATARIOS (
    id SERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14),
    rg VARCHAR(20),
    telefone VARCHAR(20),
    celular VARCHAR(20),
    
    -- Dados do Fiador
    fiador_nome VARCHAR(255),
    fiador_cpf VARCHAR(14),
    fiador_rg VARCHAR(20),
    fiador_telefone VARCHAR(20),
    fiador_celular VARCHAR(20),
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_tlocatarios_usuario ON TLOCATARIOS(usuario_id);
CREATE INDEX IF NOT EXISTS idx_tlocatarios_nome ON TLOCATARIOS(nome);
CREATE INDEX IF NOT EXISTS idx_tlocatarios_cpf ON TLOCATARIOS(cpf);

-- Comentário
COMMENT ON TABLE TLOCATARIOS IS 'Locatários (inquilinos) cadastrados pelo usuário.';

-- =====================================================
-- 5. TABELA DE VÍNCULOS (TVINCULOS)
-- =====================================================
-- Vincula Casa + Imobiliária + Locatário com valores e período

CREATE TABLE IF NOT EXISTS TVINCULOS (
    id SERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    
    casa_id INTEGER NOT NULL REFERENCES TCASAS(id) ON DELETE CASCADE,
    imobiliaria_id INTEGER NOT NULL REFERENCES TIMOBILIARIAS(id) ON DELETE CASCADE,
    locatario_id INTEGER NOT NULL REFERENCES TLOCATARIOS(id) ON DELETE CASCADE,
    
    -- Valores
    valor_aluguel DECIMAL(10, 2),
    taxa_percent DECIMAL(5, 2),  -- Percentual da taxa
    taxa_valor DECIMAL(10, 2),   -- Valor fixo da taxa
    
    -- Vigência
    inicio TIMESTAMP NOT NULL,
    fim TIMESTAMP,  -- NULL = vínculo ativo
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_tvinculos_usuario ON TVINCULOS(usuario_id);
CREATE INDEX IF NOT EXISTS idx_tvinculos_casa ON TVINCULOS(casa_id);
CREATE INDEX IF NOT EXISTS idx_tvinculos_imobiliaria ON TVINCULOS(imobiliaria_id);
CREATE INDEX IF NOT EXISTS idx_tvinculos_locatario ON TVINCULOS(locatario_id);
CREATE INDEX IF NOT EXISTS idx_tvinculos_ativo ON TVINCULOS(fim) WHERE fim IS NULL;

-- Comentário
COMMENT ON TABLE TVINCULOS IS 'Vínculos entre Casa, Imobiliária e Locatário com período de vigência.';

-- =====================================================
-- 6. TABELA DE PAGAMENTOS (TPAGAMENTOS)
-- =====================================================
-- Controle de pagamentos mensais por vínculo

CREATE TABLE IF NOT EXISTS TPAGAMENTOS (
    id SERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    
    vinculo_id INTEGER NOT NULL REFERENCES TVINCULOS(id) ON DELETE CASCADE,
    ano INTEGER NOT NULL,
    mes INTEGER NOT NULL CHECK (mes >= 1 AND mes <= 12),
    
    recebido BOOLEAN NOT NULL DEFAULT FALSE,
    recebido_em TIMESTAMP,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    
    -- Garante que não há duplicidade de pagamento para mesmo vínculo/ano/mês
    UNIQUE(vinculo_id, ano, mes)
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_tpagamentos_usuario ON TPAGAMENTOS(usuario_id);
CREATE INDEX IF NOT EXISTS idx_tpagamentos_vinculo ON TPAGAMENTOS(vinculo_id);
CREATE INDEX IF NOT EXISTS idx_tpagamentos_periodo ON TPAGAMENTOS(ano, mes);
CREATE INDEX IF NOT EXISTS idx_tpagamentos_recebido ON TPAGAMENTOS(recebido);

-- Comentário
COMMENT ON TABLE TPAGAMENTOS IS 'Controle de pagamentos mensais dos aluguéis.';

-- =====================================================
-- 7. ROW LEVEL SECURITY (RLS) - SEGURANÇA POR LINHA
-- =====================================================
-- Cada usuário só vê e manipula seus próprios dados

-- Habilitar RLS em todas as tabelas
ALTER TABLE TUSUARIOS ENABLE ROW LEVEL SECURITY;
ALTER TABLE TIMOBILIARIAS ENABLE ROW LEVEL SECURITY;
ALTER TABLE TCASAS ENABLE ROW LEVEL SECURITY;
ALTER TABLE TLOCATARIOS ENABLE ROW LEVEL SECURITY;
ALTER TABLE TVINCULOS ENABLE ROW LEVEL SECURITY;
ALTER TABLE TPAGAMENTOS ENABLE ROW LEVEL SECURITY;

-- -----------------------------------------------------
-- Políticas para TUSUARIOS
-- -----------------------------------------------------
DROP POLICY IF EXISTS "tusuarios_select" ON TUSUARIOS;
CREATE POLICY "tusuarios_select" ON TUSUARIOS
    FOR SELECT USING (auth.uid() = id);

DROP POLICY IF EXISTS "tusuarios_insert" ON TUSUARIOS;
CREATE POLICY "tusuarios_insert" ON TUSUARIOS
    FOR INSERT WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "tusuarios_update" ON TUSUARIOS;
CREATE POLICY "tusuarios_update" ON TUSUARIOS
    FOR UPDATE USING (auth.uid() = id);

-- -----------------------------------------------------
-- Políticas para TIMOBILIARIAS
-- -----------------------------------------------------
DROP POLICY IF EXISTS "timobiliarias_select" ON TIMOBILIARIAS;
CREATE POLICY "timobiliarias_select" ON TIMOBILIARIAS
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "timobiliarias_insert" ON TIMOBILIARIAS;
CREATE POLICY "timobiliarias_insert" ON TIMOBILIARIAS
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "timobiliarias_update" ON TIMOBILIARIAS;
CREATE POLICY "timobiliarias_update" ON TIMOBILIARIAS
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "timobiliarias_delete" ON TIMOBILIARIAS;
CREATE POLICY "timobiliarias_delete" ON TIMOBILIARIAS
    FOR DELETE USING (auth.uid() = usuario_id);

-- -----------------------------------------------------
-- Políticas para TCASAS
-- -----------------------------------------------------
DROP POLICY IF EXISTS "tcasas_select" ON TCASAS;
CREATE POLICY "tcasas_select" ON TCASAS
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tcasas_insert" ON TCASAS;
CREATE POLICY "tcasas_insert" ON TCASAS
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tcasas_update" ON TCASAS;
CREATE POLICY "tcasas_update" ON TCASAS
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tcasas_delete" ON TCASAS;
CREATE POLICY "tcasas_delete" ON TCASAS
    FOR DELETE USING (auth.uid() = usuario_id);

-- -----------------------------------------------------
-- Políticas para TLOCATARIOS
-- -----------------------------------------------------
DROP POLICY IF EXISTS "tlocatarios_select" ON TLOCATARIOS;
CREATE POLICY "tlocatarios_select" ON TLOCATARIOS
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tlocatarios_insert" ON TLOCATARIOS;
CREATE POLICY "tlocatarios_insert" ON TLOCATARIOS
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tlocatarios_update" ON TLOCATARIOS;
CREATE POLICY "tlocatarios_update" ON TLOCATARIOS
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tlocatarios_delete" ON TLOCATARIOS;
CREATE POLICY "tlocatarios_delete" ON TLOCATARIOS
    FOR DELETE USING (auth.uid() = usuario_id);

-- -----------------------------------------------------
-- Políticas para TVINCULOS
-- -----------------------------------------------------
DROP POLICY IF EXISTS "tvinculos_select" ON TVINCULOS;
CREATE POLICY "tvinculos_select" ON TVINCULOS
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tvinculos_insert" ON TVINCULOS;
CREATE POLICY "tvinculos_insert" ON TVINCULOS
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tvinculos_update" ON TVINCULOS;
CREATE POLICY "tvinculos_update" ON TVINCULOS
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tvinculos_delete" ON TVINCULOS;
CREATE POLICY "tvinculos_delete" ON TVINCULOS
    FOR DELETE USING (auth.uid() = usuario_id);

-- -----------------------------------------------------
-- Políticas para TPAGAMENTOS
-- -----------------------------------------------------
DROP POLICY IF EXISTS "tpagamentos_select" ON TPAGAMENTOS;
CREATE POLICY "tpagamentos_select" ON TPAGAMENTOS
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tpagamentos_insert" ON TPAGAMENTOS;
CREATE POLICY "tpagamentos_insert" ON TPAGAMENTOS
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tpagamentos_update" ON TPAGAMENTOS;
CREATE POLICY "tpagamentos_update" ON TPAGAMENTOS
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tpagamentos_delete" ON TPAGAMENTOS;
CREATE POLICY "tpagamentos_delete" ON TPAGAMENTOS
    FOR DELETE USING (auth.uid() = usuario_id);

-- =====================================================
-- 8. TRIGGER PARA CRIAR PERFIL AUTOMÁTICO
-- =====================================================
-- Quando um usuário se cadastra via Auth, cria automaticamente o perfil

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.tusuarios (id, nome, email, telefone)
    VALUES (
        NEW.id,
        COALESCE(NEW.raw_user_meta_data->>'nome', 'Usuário'),
        NEW.email,
        NEW.raw_user_meta_data->>'telefone'
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Remover trigger existente e criar novo
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- =====================================================
-- 9. FUNÇÃO PARA ATUALIZAR updated_at AUTOMATICAMENTE
-- =====================================================

CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers para atualizar updated_at em cada tabela
DROP TRIGGER IF EXISTS update_tusuarios_updated_at ON TUSUARIOS;
CREATE TRIGGER update_tusuarios_updated_at
    BEFORE UPDATE ON TUSUARIOS
    FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_timobiliarias_updated_at ON TIMOBILIARIAS;
CREATE TRIGGER update_timobiliarias_updated_at
    BEFORE UPDATE ON TIMOBILIARIAS
    FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_tcasas_updated_at ON TCASAS;
CREATE TRIGGER update_tcasas_updated_at
    BEFORE UPDATE ON TCASAS
    FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_tlocatarios_updated_at ON TLOCATARIOS;
CREATE TRIGGER update_tlocatarios_updated_at
    BEFORE UPDATE ON TLOCATARIOS
    FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_tvinculos_updated_at ON TVINCULOS;
CREATE TRIGGER update_tvinculos_updated_at
    BEFORE UPDATE ON TVINCULOS
    FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_tpagamentos_updated_at ON TPAGAMENTOS;
CREATE TRIGGER update_tpagamentos_updated_at
    BEFORE UPDATE ON TPAGAMENTOS
    FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- =====================================================
-- 10. VIEWS ÚTEIS
-- =====================================================

-- View de vínculos ativos com informações completas
CREATE OR REPLACE VIEW vw_vinculos_ativos AS
SELECT 
    v.id,
    v.usuario_id,
    v.casa_id,
    c.descricao AS casa_descricao,
    c.rua AS casa_rua,
    c.numero AS casa_numero,
    c.bairro AS casa_bairro,
    v.imobiliaria_id,
    i.nome AS imobiliaria_nome,
    i.telefone AS imobiliaria_telefone,
    v.locatario_id,
    l.nome AS locatario_nome,
    l.celular AS locatario_celular,
    v.valor_aluguel,
    v.taxa_percent,
    v.taxa_valor,
    v.inicio,
    v.fim,
    v.created_at
FROM TVINCULOS v
JOIN TCASAS c ON v.casa_id = c.id
JOIN TIMOBILIARIAS i ON v.imobiliaria_id = i.id
JOIN TLOCATARIOS l ON v.locatario_id = l.id
WHERE v.fim IS NULL;

COMMENT ON VIEW vw_vinculos_ativos IS 'Vínculos ativos (sem data de fim) com informações completas.';

-- View de resumo financeiro mensal
CREATE OR REPLACE VIEW vw_resumo_mensal AS
SELECT 
    p.usuario_id,
    p.ano,
    p.mes,
    COUNT(*) AS total_vinculos,
    SUM(CASE WHEN p.recebido THEN 1 ELSE 0 END) AS recebidos,
    SUM(CASE WHEN NOT p.recebido THEN 1 ELSE 0 END) AS pendentes,
    SUM(CASE WHEN p.recebido THEN v.valor_aluguel ELSE 0 END) AS valor_recebido,
    SUM(CASE WHEN NOT p.recebido THEN v.valor_aluguel ELSE 0 END) AS valor_pendente
FROM TPAGAMENTOS p
JOIN TVINCULOS v ON p.vinculo_id = v.id
GROUP BY p.usuario_id, p.ano, p.mes
ORDER BY p.ano DESC, p.mes DESC;

COMMENT ON VIEW vw_resumo_mensal IS 'Resumo financeiro mensal por usuário.';

-- =====================================================
-- 11. CONSULTAS ÚTEIS (REFERÊNCIA)
-- =====================================================

-- Ver todos os usuários
-- SELECT * FROM TUSUARIOS;

-- Ver usuários com trial expirado (precisam pagar)
-- SELECT * FROM TUSUARIOS 
-- WHERE trial_ends_at < NOW() AND is_premium = FALSE;

-- Ver usuários premium ativos
-- SELECT * FROM TUSUARIOS 
-- WHERE is_premium = TRUE AND (premium_expires_at IS NULL OR premium_expires_at > NOW());

-- Ver todas as casas de um usuário
-- SELECT * FROM TCASAS WHERE usuario_id = 'uuid-do-usuario';

-- Ver vínculos ativos
-- SELECT * FROM vw_vinculos_ativos;

-- Ver pagamentos pendentes do mês atual
-- SELECT * FROM TPAGAMENTOS 
-- WHERE ano = EXTRACT(YEAR FROM NOW()) 
--   AND mes = EXTRACT(MONTH FROM NOW()) 
--   AND recebido = FALSE;

-- Resumo financeiro
-- SELECT * FROM vw_resumo_mensal WHERE usuario_id = 'uuid-do-usuario';

-- =====================================================
-- FIM DO SCRIPT
-- =====================================================
-- Após executar, o banco estará pronto para uso!
-- O app Flutter já está configurado para usar essas tabelas.
-- =====================================================
