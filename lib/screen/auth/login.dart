import 'package:flutter/material.dart';
import 'package:myapp/Provider/authprovider/auth_provider.dart';
import 'package:myapp/Util/router.dart';
import 'package:myapp/Util/snack_bar.dart';
import 'package:myapp/Widget/button.dart';
import 'package:myapp/Widget/textfield.dart';
import 'package:myapp/screen/auth/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextfield(
                    title: 'Email',
                    hint: "enter your mail",
                    controller: _email,
                  ),
                  customTextfield(
                    title: 'password',
                    hint: 'enter your password',
                    controller: _password,
                  ),
                  Consumer<Authentication>(
                    builder: (context, auth, child) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (auth.resMessage.isNotEmpty) {
                          ShowMessage(
                            message: auth.resMessage,
                            context: context,
                          );
                          auth.clear();
                        }
                      });
                      return customButton(
                        text: 'login',
                        tap: () {
                          if (_email.text.isEmpty || _password.text.isEmpty) {
                            ShowMessage(
                              message: "all fields are required",
                              context: context,
                            );
                          } else {
                            auth.LoginUser(
                              email: _email.text.trim(),
                              password: _password.text.trim(),
                            );
                          }
                        },
                        context: context,
                        status: auth.isLoading,
                        isValid: true,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(ctx: context).nextPage(page: RegisterPage());
                    },
                    child: Text("Register"),
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
