-- =====================================================
-- SCRIPT PARA DEBUG DE PAGAMENTOS
-- Execute no SQL Editor do Supabase
-- =====================================================

-- 1. Verificar se existem pagamentos na tabela (sem RLS - como admin)
SELECT 
    p.id,
    p.usuario_id,
    p.vinculo_id,
    p.ano,
    p.mes,
    p.recebido,
    p.recebido_em,
    u.email as usuario_email
FROM tpagamentos p
LEFT JOIN auth.users u ON u.id = p.usuario_id
ORDER BY p.created_at DESC
LIMIT 20;

-- 2. Verificar a estrutura da tabela
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'tpagamentos'
ORDER BY ordinal_position;

-- 3. Verificar as políticas RLS atuais
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE tablename = 'tpagamentos';

-- 4. Verificar se RLS está habilitado e forçado
SELECT 
    relname as table_name,
    relrowsecurity as rls_enabled,
    relforcerowsecurity as rls_forced
FROM pg_class
WHERE relname = 'tpagamentos';

-- =====================================================
-- SE O PROBLEMA FOR QUE OS PAGAMENTOS EXISTEM MAS NÃO APARECEM,
-- PODE SER QUE O usuario_id ESTEJA ERRADO. 
-- VERIFIQUE COM A QUERY 1 ACIMA.
-- =====================================================

-- 5. Se precisar corrigir pagamentos com usuario_id errado,
-- primeiro identifique os vínculos e seus usuários:
SELECT DISTINCT
    v.id as vinculo_id,
    v.usuario_id as vinculo_usuario_id,
    p.id as pagamento_id,
    p.usuario_id as pagamento_usuario_id,
    CASE WHEN v.usuario_id = p.usuario_id THEN '✅ OK' ELSE '❌ DIFERENTE' END as status
FROM tvinculos v
LEFT JOIN tpagamentos p ON p.vinculo_id = v.id
WHERE p.id IS NOT NULL;

-- 6. CORREÇÃO: Atualizar pagamentos para ter o mesmo usuario_id do vínculo
-- ⚠️ CUIDADO: Execute apenas se tiver certeza!
/*
UPDATE tpagamentos p
SET usuario_id = v.usuario_id
FROM tvinculos v
WHERE p.vinculo_id = v.id
AND p.usuario_id != v.usuario_id;
*/

-- 7. Verificar se FORCE ROW LEVEL SECURITY está ativo
-- Se não estiver, execute:
ALTER TABLE tpagamentos FORCE ROW LEVEL SECURITY;
