import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kubenmat/services/auth_service.dart';
import 'package:kubenmat/services/router.dart';
import 'package:kubenmat/views/admin/admin_view.dart';

class AdminEnterDialog extends StatelessWidget {
  const AdminEnterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Kontroll panel'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TextField which asks for the password, if its not equal to 'admin' the dialog should close
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Kontroll panel verdi',
            ),
            onSubmitted: (value) {
              // kubenmatkontrollpanel116
              if (value == '') {
                AuthService aus = GetIt.instance<AuthService>();
                if (aus.authProvider.isLoggedIn) {
                  GetIt.instance<AuthService>()
                      .authProvider
                      .user!
                      .getIdToken()
                      .then((token) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AdminView(token),
                      ),
                    );
                  });
                  return;
                }
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
