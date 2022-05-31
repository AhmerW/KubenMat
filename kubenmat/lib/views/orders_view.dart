import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ordre Historikk"),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            ListTile(
              title: const Text("Bestilt 11.01.2021"),
              subtitle: const Text("Bestilt, venter på levering."),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.help),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text("Bestilt 11.01.2021"),
              subtitle: const Text("Levert 11.01.2021."),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.help),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
