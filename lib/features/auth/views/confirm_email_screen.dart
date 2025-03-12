import 'package:flutter/material.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conferma Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Per favore, controlla la tua email e conferma il tuo account.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                // Aggiungi qui la logica per verificare se l’email è stata confermata.
                // Se confermata, naviga alla dashboard.
              },
              child: const Text('Ho confermato la mia email'),
            ),
          ],
        ),
      ),
    );
  }
}
