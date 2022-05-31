import 'package:flutter/material.dart';

final Map<String, String> faqItems = {
  "Hvor mye tar dere?":
      "For ordre under 50kr tar vi 10kr i leverings-kostnader",
};
final Map<int, String> faqItemsState = faqItems.keys.toList().asMap();

class FAQDialog extends StatefulWidget {
  const FAQDialog({Key? key}) : super(key: key);

  @override
  State<FAQDialog> createState() => _FAQDialogState();
}

class _FAQDialogState extends State<FAQDialog> {
  final Map<String, bool> expanded = {};

  bool getExpanded(String key) {
    return expanded[key] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Spørsmål & Svar"),
      content: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                expanded[faqItemsState[index]!] = !isExpanded;
              });
            },
            children: faqItems.keys.map((String key) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(key),
                  );
                },
                body: ListTile(
                  title: Text(faqItems[key] as String),
                ),
                isExpanded: getExpanded(key),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
