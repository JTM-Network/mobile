import 'package:flutter/material.dart';
import 'package:jtm/data/service/auth_service.dart';


Widget emailSignInField(TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some email';
        }
        return null;
      },
    ),
  );
}

Widget passwordSignInField(TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some password';
        }
        return null;
      },
    ),
  );
}

Widget signInBtn(BuildContext context, GlobalKey<FormState> formKey, TextEditingController _email, TextEditingController _password) {
  final authService = AuthService();

  return Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: ButtonTheme(
      height: 56,
      child: RaisedButton(
        child: Text('Sign In',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        color: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () async => {
          if (formKey.currentState.validate()) {
            await authService.login(_email.value.text, _password.value.text)
                              .then((value) => {
                                Navigator.of(context).pushReplacementNamed('/home')
                              })
                              .catchError((error) {
                                print(error.toString());
                              })
          }
        },
      ),
    ),
  );
}

Widget forgotPasswordBtn(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 20),
    child: FlatButton(
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/forgotpassword');
        }),
  );
}

Widget registerBtn(BuildContext context) {
  return FlatButton(
      child:
          Text('Sign Up', style: TextStyle(color: Colors.grey, fontSize: 13)),
      onPressed: () {
          Navigator.of(context).pushReplacementNamed('/signup');
      });
}
