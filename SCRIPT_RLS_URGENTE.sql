-- =====================================================
-- SCRIPT URGENTE - HABILITAR RLS (SEGURANÇA)
-- =====================================================
-- EXECUTE IMEDIATAMENTE NO SUPABASE SQL EDITOR!
-- Este script garante que cada usuário só veja seus próprios dados
-- =====================================================

-- =====================================================
-- 1. HABILITAR RLS EM TODAS AS TABELAS
-- =====================================================

ALTER TABLE tusuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE timobiliarias ENABLE ROW LEVEL SECURITY;
ALTER TABLE tcasas ENABLE ROW LEVEL SECURITY;
ALTER TABLE tlocatarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE tvinculos ENABLE ROW LEVEL SECURITY;
ALTER TABLE tpagamentos ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- 2. FORÇAR RLS PARA TODOS (INCLUSIVE OWNER)
-- =====================================================
-- Isso é CRÍTICO! Sem isso, o owner da tabela ignora o RLS

ALTER TABLE tusuarios FORCE ROW LEVEL SECURITY;
ALTER TABLE timobiliarias FORCE ROW LEVEL SECURITY;
ALTER TABLE tcasas FORCE ROW LEVEL SECURITY;
ALTER TABLE tlocatarios FORCE ROW LEVEL SECURITY;
ALTER TABLE tvinculos FORCE ROW LEVEL SECURITY;
ALTER TABLE tpagamentos FORCE ROW LEVEL SECURITY;

-- =====================================================
-- 3. POLÍTICAS PARA TUSUARIOS
-- =====================================================

DROP POLICY IF EXISTS "tusuarios_select" ON tusuarios;
CREATE POLICY "tusuarios_select" ON tusuarios
    FOR SELECT USING (auth.uid() = id);

DROP POLICY IF EXISTS "tusuarios_insert" ON tusuarios;
CREATE POLICY "tusuarios_insert" ON tusuarios
    FOR INSERT WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "tusuarios_update" ON tusuarios;
CREATE POLICY "tusuarios_update" ON tusuarios
    FOR UPDATE USING (auth.uid() = id);

-- =====================================================
-- 4. POLÍTICAS PARA TIMOBILIARIAS
-- =====================================================

DROP POLICY IF EXISTS "timobiliarias_select" ON timobiliarias;
CREATE POLICY "timobiliarias_select" ON timobiliarias
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "timobiliarias_insert" ON timobiliarias;
CREATE POLICY "timobiliarias_insert" ON timobiliarias
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "timobiliarias_update" ON timobiliarias;
CREATE POLICY "timobiliarias_update" ON timobiliarias
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "timobiliarias_delete" ON timobiliarias;
CREATE POLICY "timobiliarias_delete" ON timobiliarias
    FOR DELETE USING (auth.uid() = usuario_id);

-- =====================================================
-- 5. POLÍTICAS PARA TCASAS
-- =====================================================

DROP POLICY IF EXISTS "tcasas_select" ON tcasas;
CREATE POLICY "tcasas_select" ON tcasas
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tcasas_insert" ON tcasas;
CREATE POLICY "tcasas_insert" ON tcasas
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tcasas_update" ON tcasas;
CREATE POLICY "tcasas_update" ON tcasas
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tcasas_delete" ON tcasas;
CREATE POLICY "tcasas_delete" ON tcasas
    FOR DELETE USING (auth.uid() = usuario_id);

-- =====================================================
-- 6. POLÍTICAS PARA TLOCATARIOS
-- =====================================================

DROP POLICY IF EXISTS "tlocatarios_select" ON tlocatarios;
CREATE POLICY "tlocatarios_select" ON tlocatarios
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tlocatarios_insert" ON tlocatarios;
CREATE POLICY "tlocatarios_insert" ON tlocatarios
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tlocatarios_update" ON tlocatarios;
CREATE POLICY "tlocatarios_update" ON tlocatarios
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tlocatarios_delete" ON tlocatarios;
CREATE POLICY "tlocatarios_delete" ON tlocatarios
    FOR DELETE USING (auth.uid() = usuario_id);

-- =====================================================
-- 7. POLÍTICAS PARA TVINCULOS
-- =====================================================

DROP POLICY IF EXISTS "tvinculos_select" ON tvinculos;
CREATE POLICY "tvinculos_select" ON tvinculos
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tvinculos_insert" ON tvinculos;
CREATE POLICY "tvinculos_insert" ON tvinculos
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tvinculos_update" ON tvinculos;
CREATE POLICY "tvinculos_update" ON tvinculos
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tvinculos_delete" ON tvinculos;
CREATE POLICY "tvinculos_delete" ON tvinculos
    FOR DELETE USING (auth.uid() = usuario_id);

-- =====================================================
-- 8. POLÍTICAS PARA TPAGAMENTOS
-- =====================================================

DROP POLICY IF EXISTS "tpagamentos_select" ON tpagamentos;
CREATE POLICY "tpagamentos_select" ON tpagamentos
    FOR SELECT USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tpagamentos_insert" ON tpagamentos;
CREATE POLICY "tpagamentos_insert" ON tpagamentos
    FOR INSERT WITH CHECK (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tpagamentos_update" ON tpagamentos;
CREATE POLICY "tpagamentos_update" ON tpagamentos
    FOR UPDATE USING (auth.uid() = usuario_id);

DROP POLICY IF EXISTS "tpagamentos_delete" ON tpagamentos;
CREATE POLICY "tpagamentos_delete" ON tpagamentos
    FOR DELETE USING (auth.uid() = usuario_id);

-- =====================================================
-- 9. VERIFICAÇÃO
-- =====================================================
-- Execute isso para confirmar que RLS está ativo:

SELECT 
    schemaname,
    tablename,
    rowsecurity
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('tusuarios', 'timobiliarias', 'tcasas', 'tlocatarios', 'tvinculos', 'tpagamentos');

-- Todas as tabelas devem mostrar rowsecurity = true

-- =====================================================
-- FIM DO SCRIPT
-- =====================================================
-- Após executar, faça logout e login novamente no app
-- Cada usuário só verá seus próprios dados!
-- =====================================================
