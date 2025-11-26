// src/presentation/screens/assinatura/assinatura_screen.dart
// Tela de seleção de planos e assinatura.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AssinaturaScreen extends ConsumerWidget {
  const AssinaturaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assinar Locare'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabeçalho
            Icon(
              Icons.workspace_premium,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Escolha seu plano',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Gerencie seus imóveis de forma profissional',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Plano Mensal
            _PlanCard(
              titulo: 'Mensal',
              preco: 'R\$ 14,90',
              periodo: '/mês',
              descricao: 'Flexibilidade para cancelar quando quiser',
              beneficios: const [
                'Imóveis ilimitados',
                'Controle de locatários',
                'Gestão de imobiliárias',
                'Controle de aluguéis',
                'Resumo financeiro',
              ],
              destaque: false,
              onAssinar: () {
                _mostrarEmDesenvolvimento(context);
              },
            ),

            const SizedBox(height: 16),

            // Plano Anual
            _PlanCard(
              titulo: 'Anual',
              preco: 'R\$ 9,90',
              periodo: '/mês',
              descricao: 'Economia de 33% - Pague R\$ 118,80/ano',
              beneficios: const [
                'Imóveis ilimitados',
                'Controle de locatários',
                'Gestão de imobiliárias',
                'Controle de aluguéis',
                'Resumo financeiro',
                '2 meses grátis',
              ],
              destaque: true,
              onAssinar: () {
                _mostrarEmDesenvolvimento(context);
              },
            ),

            const SizedBox(height: 32),

            // Garantia
            /*Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified_user, color: Colors.green.shade700),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Garantia de 7 dias',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                        Text(
                          'Não gostou? Devolvemos seu dinheiro, sem perguntas.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),*/

            const SizedBox(height: 24),

            // Informações adicionais
            Text(
              'Pagamento seguro via Google Play',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.push('/termos-uso'),
                  child: const Text('Termos de Uso'),
                ),
                TextButton(
                  onPressed: () => context.push('/politica-privacidade'),
                  child: const Text('Privacidade'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarEmDesenvolvimento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Em Desenvolvimento'),
        content: const Text(
          'A integração com o sistema de pagamentos está em desenvolvimento. '
          'Em breve você poderá assinar o Locare!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String titulo;
  final String preco;
  final String periodo;
  final String descricao;
  final List<String> beneficios;
  final bool destaque;
  final VoidCallback onAssinar;

  const _PlanCard({
    required this.titulo,
    required this.preco,
    required this.periodo,
    required this.descricao,
    required this.beneficios,
    required this.destaque,
    required this.onAssinar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: destaque ? 8 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: destaque
            ? BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (destaque) const SizedBox(height: 12),

                // Título
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 8),

                // Preço
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      preco,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        periodo,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Descrição
                Text(
                  descricao,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 16),

                // Benefícios
                ...beneficios.map(
                  (b) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Colors.green.shade600,
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(b)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Botão
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onAssinar,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: destaque
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      foregroundColor: destaque ? Colors.white : null,
                    ),
                    child: Text(destaque ? 'Assinar Agora' : 'Selecionar'),
                  ),
                ),
              ],
            ),
          ),

          // Badge "Melhor Oferta"
          if (destaque)
            Positioned(
              top: 0,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'MELHOR OFERTA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
