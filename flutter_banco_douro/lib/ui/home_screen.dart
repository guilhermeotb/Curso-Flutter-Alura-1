import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: AppColor.greyApp,
            title: const Text("Sistema de Gestão de Contas"),
            actions: [
              IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, "login" );} , icon: Icon(Icons.logout))
            ],
          ),
        ]
      ),
    );
  }
}