import 'package:flutter/material.dart';
import 'package:jtm/data/service/auth_service.dart';


Widget signUpUsernameField(TextEditingController _controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: _controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Enter a username',
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Required.';
        }
        return null;
      },
    ),
  );
}

Widget signUpEmailField(TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Enter a email address',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Required.';
        }
        return null;
      },
    ),
  );
}

Widget signUpPasswordField(TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Enter a password.',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Required';
        }

        return null;
      },
    ),
  );
}

Widget signUpPasswordConfirmField(TextEditingController controller, TextEditingController _password) {
  return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Please confirm your password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
        validator: (value) {
          if (value.isEmpty) {
            return 'Required';
          }

          if (value != _password.value.text) {
            return 'Password does not match.';
          }
          return null;
        },
      ));
}

Widget signUpBtn(BuildContext context, GlobalKey<FormState> formKey, TextEditingController username, TextEditingController email, TextEditingController password) {
  final authService = AuthService();

  return Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: ButtonTheme(
      height: 56,
      child: RaisedButton(
          child: Text('Sign Up',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          color: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () async => {
                if (formKey.currentState.validate()) {
                  await authService.register(username.value.text, email.value.text, password.value.text)
                              .then((value) => {
                                if (value) Navigator.of(context).pushReplacementNamed('/signin')
                              })
                              .catchError((error) {
                                print(error.toString());
                              })
                }
              }),
    ),
  );
}

Widget signInBtn(BuildContext context) {
  return FlatButton(
      child: Text('Already got an account? Sign In',
          style: TextStyle(color: Colors.grey, fontSize: 13)),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/signin');
      });
}
