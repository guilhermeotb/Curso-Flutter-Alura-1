import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           const Text(
            "Sistema de Gestão de Contas",
            textAlign: TextAlign.center,
             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
             ),
           TextFormField(decoration: const InputDecoration(label: Text("E-mail")),),
           TextFormField(obscureText: true, decoration: const InputDecoration(label: Text("Senha")), ),
           SizedBox(height: 32,),
           ElevatedButton(
            onPressed: (){},
            style: ButtonStyle( 
              backgroundColor: WidgetStateProperty.all(
                Color(0xFFFFA902),
                 ),
            ),
            child: const Text(
              "Entrar",
               style: TextStyle(color: Colors.black),

               ),
           ),
          ],
        ),
      ),
    );
  }
}