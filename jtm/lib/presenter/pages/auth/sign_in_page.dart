import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jtm/data/service/auth_service.dart';
import 'package:jtm/presenter/widgets/sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: signInForm(),
    );
  }

  Widget signInForm() {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              emailSignInField(_emailController),
              passwordSignInField(_passwordController),
              signInBtn(context, _formKey, _emailController, _passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  forgotPasswordBtn(context),
                  registerBtn(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
