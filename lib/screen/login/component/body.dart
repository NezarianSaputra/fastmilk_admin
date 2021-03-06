import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/screen/homepage/home_page.dart';
import 'package:fastmilk_admin/services/auth_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 7,
                vertical: SizeConfig.blockSizeVertical * 7),
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  color: kPrimaryColor,
                  size: SizeConfig.blockSizeHorizontal * 40,
                ),
                Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 30,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Text(
                  "Silahkan Masuk Sebagai Admin",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 5),
                LoginForm(),
                SizedBox(height: SizeConfig.blockSizeVertical * 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String _error;

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          showAlert(),
          buildEmailTextFormField(),
          buildPassTextFormField(),
          SizedBox(height: SizeConfig.blockSizeVertical * 5),
          DefaultButton(text: "Masuk", press: submit),
        ],
      ),
    );
  }

  void submit() async {
    if (_formKey.currentState.validate()) {
      try {
        await context.read<AuthServices>().login(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } catch (e) {
        print(e);
        setState(() {
          _error = e.message;
        });
      }
    }
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  TextFormField buildPassTextFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: hidePassword,
      validator: passwordValidator,

      // onSaved: (String value) {
      //   _password = value;
      // },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Masukan Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            color: Theme.of(context).accentColor.withOpacity(0.4),
            icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
          )),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      controller: emailController,
      validator: emailValidator,
      // onSaved: (String value) {
      //   _email = value;
      // },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Masukan Email",
      ),
    );
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      print("Password: null");
      return "Email harus diisi";
    } else if (!regex.hasMatch(value)) {
      return 'Format penulisan email salah!';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) {
      print("Password: null");
      return "Password harus diisi";
    } else if (value.length < 4) {
      return "Password minimal 5 karakter";
    }
    return null;
  }
}
