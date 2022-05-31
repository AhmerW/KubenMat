import 'package:flutter/material.dart';
import 'package:kubenmat/data/theme.dart';
import 'package:kubenmat/widgets/dialogs/info/faq_dialog.dart';
import 'package:kubenmat/widgets/dialogs/info/prices_dialog.dart';

class HowDialog extends StatelessWidget {
  const HowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: themeColor,
      content: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 1,
          maxWidth: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/KubenMatHow.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const PricesDialog(),
                ),
                child: const Text("Våre priser"),
              ),
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const FAQDialog(),
              ),
              child: const Text("Spørsmål & Svar"),
            )
          ],
        ),
      ),
    );
  }
}
