import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kubenmat/services/admin_service.dart';

class AdminView extends StatefulWidget {
  final String token;
  const AdminView(this.token, {Key? key}) : super(key: key);

  @override
  _AdminViewState createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  Future? _future;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _future = GetIt.instance<AdminService>().isAdmin(
        token: widget.token,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin kontroll panel"),
      ),
      body: _future == null
          ? Container()
          : FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    if (snapshot.data as bool) {
                      print("ok");
                      return ListView(
                        children: [
                          Flexible(
                            flex: 7,
                            child: Container(
                              child: Text("abc"),
                            ),
                          )
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text("Ikke autorisert."),
                      );
                    }
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}
