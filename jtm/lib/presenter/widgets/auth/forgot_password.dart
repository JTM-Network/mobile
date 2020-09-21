import 'package:flutter/material.dart';

Widget requestEmail(TextEditingController _controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: _controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email Address',
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter an email.';
        }

        return null;
      },
    ),
  );
}

Widget resetPwdBtn(GlobalKey<FormState> _formKey) {
  return Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: ButtonTheme(
      height: 56,
      child: RaisedButton(
        child: Text('Reset password', style: TextStyle(color: Colors.white, fontSize: 15)),
        color: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () => {
          if (_formKey.currentState.validate()) {
            print("valid")
          }
        },
      ),
    ),
  );
}
