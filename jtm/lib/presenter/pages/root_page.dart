
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jtm/presenter/pages/auth/sign_in_page.dart';

import 'home_page.dart';

class RootPage extends StatefulWidget {

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  final _storage = FlutterSecureStorage();
  AuthStatus status = AuthStatus.UNAUTHENTICATED;

  @override
  void initState() {
    super.initState();

    _storage.read(key: "refresh_token").then((value) {
      if (value != null) {
        setState(() {
          this.status = AuthStatus.AUTHENTICATED;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(status) {
      case AuthStatus.AUTHENTICATED:
          return HomePage();
      default:
          return SignInPage();
    }
  }
}

enum AuthStatus {
  AUTHENTICATED,
  UNAUTHENTICATED
}