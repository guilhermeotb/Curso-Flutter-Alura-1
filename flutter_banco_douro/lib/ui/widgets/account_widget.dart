import 'package:flutter/material.dart';
import 'dart:math';
import '../../models/account.dart';
import '../styles/colors.dart';

class AccountWidget extends StatelessWidget {
  final Account account;
  const AccountWidget({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColor.lightOrangeApp,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("${account.name} ${account.lastName}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text("ID: ${account.id.substring(0, min(account.id.length, 5))}"),
              Text("Saldo: R\$ ${account.balance.toStringAsFixed(2)}"),
              Text("Tipo: ${account.accountType ?? "Não definido"}"),
            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
       ),
   );
  }
}