// src/presentation/screens/termos/politica_privacidade_screen.dart
// Tela de Política de Privacidade do Locare.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PoliticaPrivacidadeScreen extends StatelessWidget {
  const PoliticaPrivacidadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('POLÍTICA DE PRIVACIDADE DO LOCARE'),
            _buildUpdateDate('Última atualização: 25 de Novembro de 2025'),
            const SizedBox(height: 24),
            _buildSection('1. INTRODUÇÃO', '''
O Locare ("nós", "nosso" ou "Aplicativo") está comprometido em proteger a privacidade dos usuários. Esta Política de Privacidade explica como coletamos, usamos, armazenamos e protegemos suas informações pessoais.

Esta política se aplica a todas as informações coletadas através do nosso aplicativo móvel e serviços relacionados.

Ao utilizar o Locare, você concorda com as práticas descritas nesta Política de Privacidade.
'''),
            _buildSection('2. INFORMAÇÕES QUE COLETAMOS', '''
2.1. Informações fornecidas por você:
• Nome completo
• Endereço de email
• Número de telefone/WhatsApp
• Senha (armazenada de forma criptografada)

2.2. Informações sobre seus imóveis e locações:
• Dados de imóveis (endereço, descrição)
• Dados de locatários (nome, CPF, RG, telefone, dados do fiador)
• Dados de imobiliárias parceiras
• Informações de vínculos e pagamentos

2.3. Informações coletadas automaticamente:
• Dados de uso do aplicativo
• Informações do dispositivo (modelo, sistema operacional)
• Logs de acesso e atividades
• Endereço IP
'''),
            _buildSection('3. COMO USAMOS SUAS INFORMAÇÕES', '''
Utilizamos suas informações para:
• Fornecer e manter o serviço do Locare
• Processar seu cadastro e gerenciar sua conta
• Permitir a gestão de seus imóveis e locações
• Enviar comunicações sobre o serviço (atualizações, avisos)
• Processar pagamentos de assinatura
• Melhorar nossos serviços e experiência do usuário
• Prevenir fraudes e garantir a segurança
• Cumprir obrigações legais
• Responder a solicitações de suporte
'''),
            _buildSection('4. COMPARTILHAMENTO DE INFORMAÇÕES', '''
NÃO vendemos suas informações pessoais. Podemos compartilhar dados apenas:

4.1. Com provedores de serviço:
• Supabase (hospedagem e banco de dados)
• Processadores de pagamento (para assinaturas)
• Serviços de análise (dados anonimizados)

4.2. Por obrigação legal:
• Quando exigido por lei, ordem judicial ou autoridade competente
• Para proteger direitos, propriedade ou segurança

4.3. Com seu consentimento:
• Quando você autorizar expressamente o compartilhamento
'''),
            _buildSection('5. ARMAZENAMENTO E SEGURANÇA', '''
5.1. Onde armazenamos:
Seus dados são armazenados em servidores seguros do Supabase, com data centers localizados em conformidade com regulamentações internacionais de proteção de dados.

5.2. Medidas de segurança:
• Criptografia de dados em trânsito (HTTPS/TLS)
• Criptografia de senhas (hash seguro)
• Isolamento de dados por usuário (Row Level Security)
• Backups regulares
• Monitoramento de acessos
• Autenticação segura

5.3. Retenção de dados:
• Dados de conta: enquanto a conta estiver ativa
• Após exclusão: até 30 dias para backup, depois removidos permanentemente
• Logs de acesso: até 12 meses
'''),
            _buildSection('6. SEUS DIREITOS (LGPD)', '''
Conforme a Lei Geral de Proteção de Dados (LGPD), você tem direito a:

• Acesso: solicitar uma cópia dos seus dados pessoais
• Correção: corrigir dados incompletos ou inexatos
• Exclusão: solicitar a remoção de seus dados
• Portabilidade: receber seus dados em formato estruturado
• Revogação: retirar seu consentimento a qualquer momento
• Informação: saber com quem seus dados foram compartilhados
• Oposição: opor-se ao tratamento de dados

Para exercer esses direitos, entre em contato através do email: locare.oficial@gmail.com
'''),
            _buildSection('7. COOKIES E TECNOLOGIAS SIMILARES', '''
O aplicativo móvel Locare não utiliza cookies tradicionais. Porém, podemos usar:

• Armazenamento local (para manter sua sessão)
• Identificadores de dispositivo (para segurança)
• Tokens de autenticação (para login persistente)

Você pode gerenciar essas configurações através das opções do aplicativo.
'''),
            _buildSection('8. DADOS DE TERCEIROS', '''
Ao cadastrar dados de locatários, imobiliárias ou fiadores:

• Você garante ter autorização para fornecer esses dados
• Você é responsável por informar essas pessoas sobre o uso de seus dados
• O Locare tratará esses dados com o mesmo nível de proteção

Recomendamos obter consentimento expresso de terceiros antes de cadastrar seus dados no aplicativo.
'''),
            _buildSection('9. MENORES DE IDADE', '''
O Locare é destinado a usuários maiores de 18 anos. Não coletamos intencionalmente informações de menores de idade.

Se tomarmos conhecimento de que coletamos dados de menor de 18 anos, tomaremos medidas para excluir essas informações.
'''),
            _buildSection('10. TRANSFERÊNCIA INTERNACIONAL', '''
Seus dados podem ser transferidos e processados em servidores localizados fora do Brasil. Nesses casos, garantimos que:

• Os países de destino possuem nível adequado de proteção
• Existem cláusulas contratuais de proteção
• O tratamento segue os padrões da LGPD
'''),
            _buildSection('11. ALTERAÇÕES NESTA POLÍTICA', '''
Podemos atualizar esta Política de Privacidade periodicamente. Quando fizermos alterações significativas:

• Notificaremos você por email ou através do aplicativo
• A data de "última atualização" será modificada
• Daremos prazo para revisão antes da entrada em vigor

O uso continuado do serviço após alterações constitui aceitação da nova política.
'''),
            _buildSection('12. CONTATO', '''
Para questões sobre privacidade ou exercício de direitos:

• Email: locare.oficial@gmail.com
• Email geral: locare.oficial@gmail.com

Encarregado de Proteção de Dados (DPO):
• Email: locare.oficial@gmail.com

Responderemos sua solicitação em até 15 dias úteis.
'''),
            _buildSection('13. CONSENTIMENTO', '''
Ao criar uma conta no Locare, você declara que:

✓ Leu e compreendeu esta Política de Privacidade
✓ Consente com a coleta e uso de seus dados conforme descrito
✓ Tem ciência de seus direitos e como exercê-los
✓ Concorda com os Termos de Uso do aplicativo

Este consentimento pode ser revogado a qualquer momento, entrando em contato conosco ou excluindo sua conta.
'''),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildUpdateDate(String date) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        date,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content.trim(),
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
