# 🔐 Configuração do Usuário Admin no Supabase

## Passo a Passo:

### 1. Acessar o Dashboard do Supabase
- Vá em: https://supabase.com/dashboard
- Entre no seu projeto **Locare**

---

### 2. Criar Usuário Admin

#### Opção A: Via Interface (Recomendado)
1. No menu lateral, clique em **Authentication**
2. Clique em **Users**
3. Clique no botão **Add User** (canto superior direito)
4. Preencha:
   - **Email**: `admin@locare.com`
   - **Password**: `admin123` (ou escolha uma senha mais segura)
   - **Auto Confirm User**: ✅ ATIVADO (importante!)
5. Clique em **Create User**

#### Opção B: Via SQL
1. No menu lateral, clique em **SQL Editor**
2. Cole este comando:

```sql
-- Inserir usuário admin
INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    encrypted_password,
    email_confirmed_at,
    created_at,
    updated_at,
    confirmation_token,
    raw_app_meta_data,
    raw_user_meta_data
) VALUES (
    '00000000-0000-0000-0000-000000000000',
    gen_random_uuid(),
    'authenticated',
    'authenticated',
    'admin@locare.com',
    crypt('admin123', gen_salt('bf')),
    NOW(),
    NOW(),
    NOW(),
    '',
    '{"provider":"email","providers":["email"]}',
    '{}'
);
```

3. Clique em **RUN** (F5)

---

### 3. Configurar Políticas de Segurança (RLS)

No **SQL Editor**, execute estes comandos:

```sql
-- Desabilitar RLS temporariamente para testes (apenas desenvolvimento)
ALTER TABLE TIMOBILIARIAS DISABLE ROW LEVEL SECURITY;
ALTER TABLE TCASAS DISABLE ROW LEVEL SECURITY;
ALTER TABLE TLOCATARIOS DISABLE ROW LEVEL SECURITY;
ALTER TABLE TVINCULOS DISABLE ROW LEVEL SECURITY;
ALTER TABLE TPAGAMENTOS DISABLE ROW LEVEL SECURITY;

-- OU, se preferir manter RLS ativo, crie políticas permissivas:
ALTER TABLE TIMOBILIARIAS ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir tudo para usuários autenticados" ON TIMOBILIARIAS
  FOR ALL USING (auth.role() = 'authenticated');

ALTER TABLE TCASAS ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir tudo para usuários autenticados" ON TCASAS
  FOR ALL USING (auth.role() = 'authenticated');

ALTER TABLE TLOCATARIOS ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir tudo para usuários autenticados" ON TLOCATARIOS
  FOR ALL USING (auth.role() = 'authenticated');

ALTER TABLE TVINCULOS ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir tudo para usuários autenticados" ON TVINCULOS
  FOR ALL USING (auth.role() = 'authenticated');

ALTER TABLE TPAGAMENTOS ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir tudo para usuários autenticados" ON TPAGAMENTOS
  FOR ALL USING (auth.role() = 'authenticated');
```

---

### 4. Testar o Login

1. Rode o app Flutter: `flutter run`
2. Você será redirecionado para a tela de login
3. Use as credenciais:
   - **Email**: `admin@locare.com`
   - **Senha**: `admin123`
4. Clique em **ENTRAR**

---

### 5. Verificar se Funcionou

Após o login, você deve:
- ✅ Ser redirecionado para o Dashboard
- ✅ Ver o menu de navegação inferior
- ✅ Ver o botão de logout no canto superior direito
- ✅ Conseguir criar imobiliárias, casas, etc.

---

## 🔒 Segurança (IMPORTANTE para Produção)

### Mudar a senha padrão:
1. No Supabase Dashboard > **Authentication** > **Users**
2. Clique no email `admin@locare.com`
3. Clique em **Reset password**
4. Envie email ou defina nova senha manualmente

### Criar senhas fortes:
- Mínimo 12 caracteres
- Misturar letras, números e símbolos
- Exemplo: `Loc@re2025#Admin!`

---

## 🧪 Troubleshooting

### Erro: "Invalid login credentials"
**Solução:**
1. Verifique se o email está correto
2. Verifique se marcou **Auto Confirm User**
3. No SQL Editor, rode:
```sql
UPDATE auth.users 
SET email_confirmed_at = NOW() 
WHERE email = 'admin@locare.com';
```

### Erro: "User not allowed"
**Solução:**
- Vá em **Authentication** > **Providers** > **Email**
- Certifique-se de que está **ENABLED**

### Erro ao acessar tabelas
**Solução:**
- Execute os comandos de RLS (passo 3)
- Ou desative RLS para testes

---

## ✅ Checklist Final

- [ ] Usuário `admin@locare.com` criado
- [ ] Email confirmado (Auto Confirm)
- [ ] RLS configurado nas tabelas
- [ ] Login funcionando no app
- [ ] Consegue criar/editar dados
- [ ] Logout funcionando

---

## 📞 Próximos Passos

Depois que o login estiver funcionando, você precisa:
1. Atualizar os formulários para usar os novos repositórios Supabase
2. Remover referências ao Isar (ou manter como backup local)
3. Testar todas as funcionalidades (criar, editar, deletar)
