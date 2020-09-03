import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jtm/presenter/widgets/sign_up.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: signUpForm(),
    );
  }

  Widget signUpForm() {
    final _formKey = GlobalKey<FormState>();

    return SafeArea(child: Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 75, 20, 0),
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              signUpUsernameField(_username),
              signUpEmailField(_email),
              signUpPasswordField(_password),
              signUpPasswordConfirmField(_confirmPassword, _password),
              signUpBtn(context, _formKey, _username, _email, _password),
              signInBtn(context)
            ]),
      ),
    ));
  }
}
