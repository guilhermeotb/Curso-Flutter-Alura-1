import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../models/account.dart';
import 'api_key.dart';


class AccountService {
  StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;
  String url = "https://api.github.com/gists/b5e5988083befbf76bfc7e34c6f518d1";

  Future<List<Account>> getAll() async {
    Response response = await get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $githubApiKey",
        "Accept": "application/json; charset=utf-8",
      },
    );

    _streamController.add("${DateTime.now()} | Requisição de leitura.");

    final String responseUtf8 = utf8.decode(response.bodyBytes);
    Map<String, dynamic> mapResponse = json.decode(responseUtf8);
    List<dynamic> listDynamic = json.decode(
      mapResponse["files"]["accounts.json"]["content"],
    );
    List<Account> listAccounts = [];
    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);
    }

    return listAccounts;
  }

  addAccount(Account account) async{
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);
    save(listAccounts, accountName: account.name);
  }

  save(List<Account> listAccounts, {String accountName = ""}) async {
    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = JsonEncoder.withIndent('  ').convert(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $githubApiKey",
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json; charset=utf-8",
      },
      body: utf8.encode(
        json.encode({
          "description": "account.json",
          "public": true,
          "files": {
            "accounts.json": {"content": content},
          },
        }),
      ),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add("${DateTime.now()} | Requisição adição bem sucedida ($accountName).");
    } else {
      _streamController.add("${DateTime.now()} | Requisição falhou ($accountName).");
    }
  }



  deleteAccount(String accountId) async {
    List<Account> listAccounts = await getAll();
    listAccounts.removeWhere((account) => account.id == accountId);

    List<Map<String, dynamic>> listContent =
        listAccounts.map((account) => account.toMap()).toList();
    String content = JsonEncoder.withIndent('  ').convert(listContent);

    Response response = await patch(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $githubApiKey",
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json; charset=utf-8",
      },
      body: utf8.encode(
        json.encode({
          "files": {
            "accounts.json": {"content": content},
          },
        }),
      ),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add(
        "${DateTime.now()} | Requisição de remoção bem sucedida ($accountId).",
      );
    } else {
      _streamController.add(
        "${DateTime.now()} | Requisição falhou. ($accountId).",
      );
    }
  }












  }







  
