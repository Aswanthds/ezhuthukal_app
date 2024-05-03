import 'package:ezhuthukal_app/view/main_page_nav.dart';
import 'package:flutter/material.dart';
import 'package:ezhuthukal_app/view/ui_utils/colors.dart';
import 'package:ezhuthukal_app/model/functions/functions.dart';
import 'package:ezhuthukal_app/model/functions/sessions.dart';
import 'package:ezhuthukal_app/model/functions/storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Ezhutukal - A writing app',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.password,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _login();
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppTheme.secondaryColor,
          ),
          labelText: labelText,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.black),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.red),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppTheme.red,
              style: BorderStyle.solid,
            ),
          ),
          labelStyle: const TextStyle(color: AppTheme.secondaryColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppTheme.black,
              style: BorderStyle.solid,
            ),
          ),
        ),
        style: const TextStyle(
          color: AppTheme.secondaryColor,
        ),
        autocorrect: false,
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final data = await gettoken(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      StorageFunctions.securelyStoreToken(data['refresh'], data['access']);

      if (await verifyAccessToken(data['access'])) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainPageNav(),
          ),
        );
        saveLoginState(true);
      }
    }
  }
}
