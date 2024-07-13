import 'package:flutter/material.dart';
import 'package:myapp/Provider/authprovider/auth_provider.dart';
import 'package:myapp/Util/router.dart';
import 'package:myapp/Widget/button.dart';
import 'package:myapp/Widget/textfield.dart';
import 'package:myapp/screen/auth/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  @override
  void dispose() {
    _email.clear();
    _password.clear();
    _firstName.clear();
    _lastName.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextfield(
                      title: 'firstname',
                      hint: "enter your firstname",
                      controller: _firstName),
                  customTextfield(
                      title: 'lasttname',
                      hint: "enter your lastname",
                      controller: _lastName),
                  customTextfield(
                      title: 'Email',
                      hint: "enter your mail",
                      controller: _email),
                  customTextfield(
                      title: 'password',
                      hint: 'enter your password',
                      controller: _password),
                  customButton(
                      text: 'register',
                      tap: () {
                        Authentication().registerUser(
                            email: _email.text,
                            password: _password.text,
                            firstName: _firstName.text,
                            lastName: _lastName.text);
                      },
                      context: context,
                      status: false,
                      isValid: true),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPage(page: LoginPage());
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
