import 'dart:convert';

import 'package:kubenmat/data/network.dart';
import 'package:kubenmat/data/response.dart';

class AdminService {
  static const serverPath = "/admins";

  Future<bool> isAdmin({
    required String token,
  }) async {
    final ServerResponse response = await sendServerRequestAuthenticated(
      serverPath,
      RequestType.Get,
      token: token,
    );
    print(response.data);
    if (response.data.containsKey("isadmin")) {
      return (response.data["isadmin"] as bool);
    }
    return false;
  }

  Future<List<String>> getAdmins({required String token}) async {
    final ServerResponse response = await sendServerRequestAuthenticated(
      serverPath,
      RequestType.Get,
      queryParams: {
        "list": "true",
      },
      token: token,
    );

    return (response.data["admins"] ?? []) as List<String>;
  }

  Future<bool> addAdmin({
    required String token,
    required String number,
  }) async {
    final ServerResponse response = await sendServerRequestAuthenticated(
      serverPath,
      RequestType.Post,
      token: token,
      data: jsonEncode({
        "number": number,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    return (response.data["success"] ?? false) as bool;
  }
}
