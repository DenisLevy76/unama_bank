import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'ShoesBank',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(seconds: 1),
                      child: Image.asset('assets/login_image.jpg')),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) {
                        email = text;
                      },
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.people_alt, color: Colors.black),
                          labelText: "Email",
                          labelStyle: const TextStyle(fontSize: 18),
                          floatingLabelStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(height: 20),
                  TextFormField(
                      obscureText: true,
                      onChanged: (text) {
                        password = text;
                      },
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.key, color: Colors.black),
                          labelText: "Senha",
                          labelStyle: const TextStyle(fontSize: 18),
                          floatingLabelStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(height: 40),
                  MaterialButton(
                    onPressed: () {
                      if (email == 'test@test.com' && password == '123') {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Email ou senha inválidos.'),
                        ));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    height: 48,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
