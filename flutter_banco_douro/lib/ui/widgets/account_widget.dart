import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        color: AppColor.lightOrangeApp,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
       ),
   );
  }
}