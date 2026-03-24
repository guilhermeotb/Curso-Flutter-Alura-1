import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.greyApp,
            title: const Text("Sistema de Gestão de Contas"),
            actions: [
              IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, "login" );} , icon: Icon(Icons.logout)
              )
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(future: AccountService().getAll(),
            builder:(context, snapshot) {
              switch(snapshot.connectionState){
              
                case ConnectionState.none:
                  return Center(child: CircularProgressIndicator(),);
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator(),);
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator(),);
                case ConnectionState.done: {
                  return const Text("A operação foi concluída.");
                }

              }
            },
            ),
              
               
                  
                  
          ),
    );
  }
}