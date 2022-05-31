import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubenmat/services/router.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.remove_shopping_cart_outlined,
            size: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Tom handlekurv",
            style: GoogleFonts.roboto(color: Colors.black),
          ),
          Text(
            "Det ser ut som at du ikke har lag til noen produkter enda...",
            style: GoogleFonts.lato(fontSize: 15, color: Colors.grey),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50,
            child: ElevatedButton(
              onPressed: () => router.navigateTo(
                context,
                "/home",
                clearStack: true,
                transition: TransitionType.native,
              ),
              child: const Text("til produktlisten"),
            ),
          )
        ],
      ),
    );
  }
}
