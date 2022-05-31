import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kubenmat/services/auth_service.dart';

class AuthLoginDialog extends StatefulWidget {
  const AuthLoginDialog({Key? key}) : super(key: key);

  @override
  _AuthLoginDialogState createState() => _AuthLoginDialogState();
}

class _AuthLoginDialogState extends State<AuthLoginDialog> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _hideText = false;
  bool _agrees = false;

  @override
  void dispose() {
    // dispose _controller
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logg inn'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'skriv inn ditt telefonnummer',
              prefix: Text("+47"),
            ),
            onChanged: (String value) {
              if (!_hideText) {
                setState(() {
                  _hideText = true;
                });
              }
            },
          ),
          _hideText
              ? const Text(
                  "Vi bruker ikke mobilnummeret ditt annet enn til registrering og for eventuell kontakt når det skulle trengs i henhold til dine eventuelle bestillinger.",
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : const SizedBox.shrink(),
          _hideText
              ? CheckboxListTile(
                  value: _agrees,
                  title: InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              title: Text("Vilkår og betingelser"),
                              content: Text(
                                  "Du må godkjenne disse vilkårene for å kunne bestille på Kubenmat."),
                            )),
                    child: const Text(
                      'Jeg godtar vilkår og betingelser',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null)
                      // ignore: curly_braces_in_flow_control_structures
                      setState(() {
                        _agrees = value;
                      });
                  })
              : const SizedBox.shrink()
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Send SMS.'),
          onPressed: () {
            if (_controller.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Du må skrive inn ditt telefonnummer.'),
                ),
              );
              return;
            }
            if (!_agrees) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Du må godkjenne våre vilkår og betingelser for å logge inn'),
                ),
              );
            } else {
              AuthService aus = GetIt.instance<AuthService>();
              aus.startPhoneNumberVerification(phoneNumber: _controller.text);
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => const AuthFinishLoginDialog(),
              );
            }
          },
        ),
      ],
    );
  }
}

// Finish Authentication

class AuthFinishLoginDialog extends StatefulWidget {
  const AuthFinishLoginDialog({Key? key}) : super(key: key);

  @override
  _AuthFinishLoginDialogState createState() => _AuthFinishLoginDialogState();
}

class _AuthFinishLoginDialogState extends State<AuthFinishLoginDialog> {
  String? error;
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // dispose _controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Logg inn"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          error == null
              ? const SizedBox.shrink()
              : Text(
                  error!,
                  style: const TextStyle(color: Colors.red),
                ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Skriv inn koden du fikk på SMS",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_controller.text.isEmpty) {
              return;
            }
            AuthService aus = GetIt.instance<AuthService>();
            aus.verifyPhoneNumber(code: _controller.text);
            if (aus.authProvider.hasError) {
              setState(() {
                error = aus.authProvider.error!.message;
              });
            } else if (aus.authProvider.isLoggedIn) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Velkommen til KubenMat!"),
              ));
            }
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}
