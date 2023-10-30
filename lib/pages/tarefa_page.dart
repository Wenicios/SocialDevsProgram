import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/tarefa.dart';
import 'package:flutter_application_1/repositores/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var descricaoController = TextEditingController();
  var tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if(apenasNaoConcluidos) {
    _tarefas = await tarefaRepository.listarNaoConcluidas();
    } else {
       _tarefas = await tarefaRepository.listar();
    }

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          descricaoController.text = "";
          showDialog(context: context, builder: (BuildContext bc) {
          return AlertDialog(
            title: const Text("Adicionar tarefa"),
            content: TextField(
              controller: descricaoController,
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("Cancelar")),
              TextButton(onPressed: () async {
                await tarefaRepository.adicionar(Tarefa(descricaoController.text, false));
                Navigator.pop(context);
                setState(() {});
              }, child: const Text("Salvar"))
            ],
          );
        });
      }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluidos",
                    style: TextStyle(fontSize: 18),
                    ),
                  Switch(value: apenasNaoConcluidos, onChanged: (bool value) {
                  apenasNaoConcluidos = value;
                  obterTarefas();
                })
              ],
            ),),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefa = _tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await tarefaRepository.remove(tarefa.id);
                      obterTarefas();
                    },
                    key: Key(tarefa.id),
                    child: ListTile(title: Text(tarefa.descricao),
                    trailing: Switch(onChanged: (bool value) async {
                      await tarefaRepository.alternar(tarefa.id, value);
                      obterTarefas();
                     },
                      value: tarefa.concluido,),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}