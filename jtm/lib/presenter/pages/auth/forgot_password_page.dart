
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jtm/presenter/widgets/forgot_password.dart';
import 'package:jtm/presenter/widgets/sign_up.dart';

class ForgotPasswordPage extends StatefulWidget {

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: forgotPasswordForm(),
    );
  }

  Widget forgotPasswordForm() {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Center(child: Text("Forgot your password?", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20))),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 50),
              child: Text("Please enter the email address registered to your account.", style: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
            requestEmail(_email),
            resetPwdBtn(_formKey),
            signInBtn(context)
          ],
        ),
      ),
    );
  }
}