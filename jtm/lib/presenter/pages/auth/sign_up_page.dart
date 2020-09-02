import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jtm/presenter/widgets/sign_up.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: signUpForm(),
    );
  }

  Widget signUpForm() {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 110),
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              signUpEmailField(_emailController),
              signUpPasswordField(_passwordController),
              signUpPasswordConfirmField(_confirmPasswordController),
              signUpBtn(_formKey),
              signInBtn(context)
            ]),
      ),
    );
  }
}
