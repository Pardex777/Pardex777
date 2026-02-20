import 'package:flutter/material.dart';

import '../../../../components/primary_button.dart';

class PersonalDashboardPage extends StatelessWidget {
  const PersonalDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área do Personal')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          _SubscriptionStatusCard(),
          SizedBox(height: 16),
          PrimaryButton(
            label: 'Criar treino',
            onPressed: null,
            icon: Icons.add_circle_outline,
          ),
          SizedBox(height: 12),
          PrimaryButton(
            label: 'Gerenciar alunos',
            onPressed: null,
            icon: Icons.people_alt_outlined,
          ),
          SizedBox(height: 12),
          PrimaryButton(
            label: 'Assinatura R\$19,90/mês',
            onPressed: null,
            icon: Icons.workspace_premium,
          ),
        ],
      ),
    );
  }
}

class _SubscriptionStatusCard extends StatelessWidget {
  const _SubscriptionStatusCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: const <Widget>[
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 12),
            Expanded(
              child: Text('Status da assinatura: ativa'),
            ),
          ],
        ),
      ),
    );
  }
}
