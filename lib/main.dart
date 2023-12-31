import 'package:flutter/material.dart';
import 'package:note_app/common_button.dart';
import 'package:note_app/rich_text.dart';
import 'package:note_app/utils/color.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/helper.dart';
import 'package:note_app/utils/style.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system, // comment if not providing dark theme
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  // handles the operations on page mount
  @override
  void initState() {
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hey,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      loginHere,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const RichTextFormatter(
                        content: signup, title: haveAccount),
                    const SizedBox(
                      height: 32.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.isEmpty
                          ? requiredValue
                          : !emailValid(value)
                              ? invalidEmail
                              : null,
                      cursorColor: lightTextColor,
                      decoration: decoration(context, emailAddress),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isPasswordVisible,
                      cursorColor: lightTextColor,
                      validator: (value) => value!.isEmpty
                          ? requiredValue
                          : value.length < 8
                              ? passwordLength
                              : null,
                      decoration: decoration(context, password).copyWith(
                        suffixIconColor: lightTextColor,
                        suffixIcon: IconButton(
                          icon: !_isPasswordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const RichTextFormatter(
                        title: "$forgotPassword?", content: clickHere),
                    const SizedBox(
                      height: 40.0,
                    ),
                    CommonButton(
                      buttonName: login,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          print(_emailController.text);
                          print(_passwordController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
