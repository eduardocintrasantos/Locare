// src/presentation/screens/termos/termos_uso_screen.dart
// Tela de Termos de Uso do Locare.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermosUsoScreen extends StatelessWidget {
  const TermosUsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos de Uso'),
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
            _buildTitle('TERMOS DE USO DO LOCARE'),
            _buildUpdateDate('Última atualização: 25 de Novembro de 2025'),
            const SizedBox(height: 24),
            _buildSection('1. ACEITAÇÃO DOS TERMOS', '''
Ao acessar e utilizar o aplicativo Locare ("Aplicativo"), você concorda em cumprir e estar vinculado a estes Termos de Uso. Se você não concordar com qualquer parte destes termos, não deverá utilizar o Aplicativo.

O Locare é um sistema de gestão de imóveis para pessoas físicas, permitindo o cadastro e gerenciamento de imóveis, locatários, imobiliárias, vínculos de locação e controle de pagamentos.
'''),
            _buildSection('2. DESCRIÇÃO DO SERVIÇO', '''
O Locare oferece:
• Cadastro e gestão de imóveis (casas)
• Cadastro e gestão de locatários
• Cadastro e gestão de imobiliárias parceiras
• Criação de vínculos entre imóveis, locatários e imobiliárias
• Controle de pagamentos mensais de aluguéis
• Relatórios e dashboards financeiros

O serviço é oferecido "como está" e "conforme disponível", sem garantias de qualquer tipo.
'''),
            _buildSection('3. PERÍODO DE TESTE GRATUITO', '''
Novos usuários têm direito a um período de teste gratuito de 7 (sete) dias corridos, contados a partir da data de criação da conta.

Durante o período de teste, você terá acesso completo a todas as funcionalidades do Aplicativo.

Após o término do período de teste, será necessário assinar um plano pago para continuar utilizando o serviço. Não é necessário fornecer dados de cartão de crédito para iniciar o período de teste.
'''),
            _buildSection('4. CONTA DO USUÁRIO', '''
Para utilizar o Locare, você deve:
• Ter pelo menos 18 anos de idade
• Fornecer informações verdadeiras, precisas e completas durante o cadastro
• Manter a confidencialidade de sua senha
• Notificar imediatamente sobre qualquer uso não autorizado de sua conta

Você é responsável por todas as atividades realizadas em sua conta. O Locare não se responsabiliza por perdas decorrentes do uso não autorizado de sua conta.
'''),
            _buildSection('5. USO ACEITÁVEL', '''
Você concorda em NÃO:
• Utilizar o Aplicativo para fins ilegais ou não autorizados
• Tentar acessar áreas restritas do sistema
• Transmitir vírus ou códigos maliciosos
• Interferir no funcionamento adequado do Aplicativo
• Coletar informações de outros usuários sem consentimento
• Revender ou redistribuir o serviço sem autorização
• Utilizar o serviço para assédio, spam ou atividades fraudulentas
'''),
            _buildSection('6. PROPRIEDADE INTELECTUAL', '''
Todo o conteúdo do Locare, incluindo mas não limitado a textos, gráficos, logos, ícones, imagens, clipes de áudio, downloads digitais e compilações de dados, é de propriedade exclusiva do Locare ou de seus licenciadores.

O uso do Aplicativo não lhe concede nenhum direito de propriedade sobre qualquer conteúdo, código, dados ou materiais que você possa acessar.
'''),
            _buildSection('7. DADOS E PRIVACIDADE', '''
A coleta e uso de dados pessoais são regidos pela nossa Política de Privacidade, que faz parte integrante destes Termos de Uso.

Ao utilizar o Aplicativo, você consente com a coleta, uso e compartilhamento de informações conforme descrito na Política de Privacidade.
'''),
            _buildSection('8. PAGAMENTOS E ASSINATURAS', '''
Após o período de teste gratuito:
• Você poderá escolher entre os planos de assinatura disponíveis
• Os pagamentos são processados de forma segura por parceiros terceirizados
• As assinaturas são renovadas automaticamente, salvo cancelamento prévio
• Não há reembolso para períodos parciais de assinatura

Os preços podem ser alterados com aviso prévio de 30 dias.
'''),
            _buildSection('9. LIMITAÇÃO DE RESPONSABILIDADE', '''
O Locare não será responsável por:
• Perdas indiretas, incidentais, especiais ou consequenciais
• Perda de dados, lucros ou oportunidades de negócio
• Interrupções no serviço devido a manutenção ou fatores externos
• Ações de terceiros que afetem o funcionamento do Aplicativo

Em nenhuma circunstância nossa responsabilidade total excederá o valor pago por você nos últimos 12 meses.
'''),
            _buildSection('10. MODIFICAÇÕES DO SERVIÇO', '''
Reservamo-nos o direito de:
• Modificar ou descontinuar o Aplicativo a qualquer momento
• Alterar estes Termos de Uso com aviso prévio
• Adicionar ou remover funcionalidades

Alterações significativas serão comunicadas por email ou através do Aplicativo.
'''),
            _buildSection('11. RESCISÃO', '''
Você pode encerrar sua conta a qualquer momento através das configurações do Aplicativo.

Reservamo-nos o direito de suspender ou encerrar sua conta caso você viole estes Termos de Uso, sem aviso prévio e sem direito a reembolso.

Após o encerramento, seus dados serão tratados conforme nossa Política de Privacidade.
'''),
            _buildSection('12. DISPOSIÇÕES GERAIS', '''
• Estes Termos constituem o acordo integral entre você e o Locare
• A invalidade de qualquer disposição não afetará as demais
• A omissão em exercer qualquer direito não constitui renúncia
• Estes Termos são regidos pelas leis do Brasil
• Quaisquer disputas serão resolvidas no foro da comarca de sua cidade
'''),
            _buildSection('13. CONTATO', '''
Para dúvidas sobre estes Termos de Uso:
• Email: locare.oficial@gmail.com
• Através do Aplicativo, na seção "Ajuda"

Ao utilizar o Locare, você confirma que leu, entendeu e concorda com estes Termos de Uso.
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
