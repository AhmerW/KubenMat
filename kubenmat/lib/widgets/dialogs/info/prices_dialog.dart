import 'package:flutter/material.dart';

class PricesDialog extends StatelessWidget {
  const PricesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Våre priser"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Table(
            border: TableBorder.all(color: Colors.grey),
            children: const [
              TableRow(
                children: [
                  TableCell(child: Text("0-50kr")),
                  TableCell(child: Text("Kostnad: 10kr"))
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "MVA er inkludert i alle priser med mindre det er oppgitt noe annet.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
