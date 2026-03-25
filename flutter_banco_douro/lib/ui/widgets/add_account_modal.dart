import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:uuid/uuid.dart';

import '../../models/account.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

final TextEditingController _nameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();

bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightOrangeApp,
        borderRadius: BorderRadius.circular(32),
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Image.asset(
                "assets/images/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Adicionar nova conta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preencha os dados abaixo:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(label: Text("Nome")),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(label: Text("Último nome")),
            ),
            SizedBox(height: 16),
            Text("Tipo de conta"),
            
            DropdownButton<String>(
              
              value: _accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "AMBROSIA", child: Text("Ambrósia")),
                DropdownMenuItem(value: "CANJICA", child: Text("Canjica")),
                DropdownMenuItem(value: "PUDIM", child: Text("Pudim")),
                DropdownMenuItem(value: "BRIGADEIRO", child: Text("Brigadeiro")),
              ],
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    _accountType = valor!;
                  });
                }
              },
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:(isLoading)? null : () {
                       onButtonCancelClicked();
                    },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onButtonAddClicked();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColor.orangeApp,
                      ),
                    ),
                    child:(isLoading)? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white),) 
                    : const Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onButtonCancelClicked(){
    if(!isLoading){
        closeModal();
    }
   
  }

  onButtonAddClicked () async {
  if(!isLoading){
       setState(() {
      isLoading = true;
    });
    String name = _nameController.text;
    String lastName = _lastNameController.text; 
    Account account = Account(
      id: const Uuid().v4(),
      name: name,
      lastName: lastName,
      balance: 0,
      accountType: _accountType,
    );
    await AccountService().addAccount(account);
    _nameController.clear();
    _lastNameController.clear();  
    closeModal();
    setState(() {
      isLoading = false;
    });
    }
  }

  closeModal(){
    Navigator.pop(context);
  }
}
