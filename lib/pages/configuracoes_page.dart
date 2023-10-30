import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfifuracoesPage extends StatefulWidget {
  const ConfifuracoesPage({super.key});

  @override
  State<ConfifuracoesPage> createState() => _ConfifuracoesPageState();
}

class _ConfifuracoesPageState extends State<ConfifuracoesPage> {

  late SharedPreferences storage;
  
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_TEMA_ESCURO = "CHAVE_MODO_ESCURO";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberNotificacoes = storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
      temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
        appBar: AppBar(title: Text("Configurações"),),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Nome Usuário",
                  ),
                  controller: nomeUsuarioController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Altura",
                  ),
                  controller: alturaController
                ),
              ),
              SwitchListTile(
                title: const Text("Receber Notificações"),
                value: receberNotificacoes, onChanged: (bool value) {
                setState(() {
                  receberNotificacoes = value;
                });
              }),
              SwitchListTile(
                title: const Text("Tema Escuro"),
                value: temaEscuro, onChanged: (bool value) {
                setState(() {
                  temaEscuro = value;
                });
              }),
              TextButton(onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                try {
                await storage.setDouble(CHAVE_ALTURA, double.parse(alturaController.text));
                } catch (e) {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text("Meu App"),
                                  content:
                                      Text("Favor informar uma altura válida!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              });
                          return;
                        }
                await storage.setString(CHAVE_NOME_USUARIO, nomeUsuarioController.text);        
                await storage.setDouble(CHAVE_ALTURA, double.parse(alturaController.text));
                await storage.setBool(CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
                Navigator.pop(context);
              }, child:
               const Text("Salvar"))
            ],
          ),
        ),
    ));
  }
}