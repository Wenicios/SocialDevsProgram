import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositores/linguagens_repository.dart';
import 'package:flutter_application_1/repositores/nivel_repository.dart';
import 'package:flutter_application_1/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensselecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;
  
  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
        ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando ? const Center(child: CircularProgressIndicator()) : ListView(
          children: [
             const TextLabel(texto: "Nome"),
              TextField(
                controller: nomeController,
              ),
              const SizedBox(
                height: 10,
              ),
              const TextLabel(texto: "Data de Nascimento"),
              TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000,1,1),
                    firstDate: DateTime(1900,1,1),
                    lastDate: DateTime(2023,10,23));
                  if (data != null) {
                    dataNascimentoController.text = data.toString();
                  }
                },
              ),

              const TextLabel(texto: "Nivel de expereiência"),
              Column(children: niveis
              .map((nivel) => RadioListTile(
                dense: true,
                title: Text(nivel.toString()),
                selected: nivelSelecionado == nivel,
                value: nivel.toString(),
                groupValue: nivelSelecionado,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      nivelSelecionado = value.toString();
                    });
                  })).toList()),
              
              const TextLabel(texto: "Linguagens Preferidas"),
              Column(children: 
              linguagens.map((linguagem) =>  CheckboxListTile(
                dense: true,
                title: Text(linguagem),
                value: linguagensselecionadas.contains(linguagem),
                onChanged: (bool? value) {
                  if(value!) {  
                  setState(() {
                    linguagensselecionadas.add(linguagem);                      
                  });

                  } else {
                    setState(() {
                    linguagensselecionadas.remove(linguagem);                      
                  });
                  }
                  setState(() {
                    
                  });
              })).toList()
              ),
              const TextLabel(texto: "Tempo de Experiência"),
              DropdownButton(
                value: tempoExperiencia,
                isExpanded: true,
                items: returnItens(50), onChanged: (value) {
                setState(() {
                  tempoExperiencia = int.parse(value.toString());
                });
              }),
              TextLabel(texto: "Pretenção Salarial. R\$ ${salarioEscolhido.round().toString()}"),
              Slider(
                min: 0,
                max: 10000,
                value: salarioEscolhido,
                onChanged: (double value) {
                  setState(() {
                    salarioEscolhido = value;
                  });
              }),
              TextButton(onPressed: () {
                setState(() {
                  salvando = false;
                });
                if (nomeController.text.trim().length < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Preencha o campo com um nome valido")));
                  return;
                }
                // if (dataNascimento == null) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text("Data de nascimento inválida")));
                //   return;
                //}
                if (nivelSelecionado.trim() == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("O nivel deve ser selecionado")));
                  return;
                }
                if (linguagensselecionadas.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Deve ser selecionado ao menos uma linguagem")));
                  return;
                }
                if (tempoExperiencia == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Deve-se ter ao menos 1 ano de experiência")));
                  return;
                }
                if (salarioEscolhido == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("A pretenção salarial deve ser escolhida!")));
                  return;
                }
                setState(() {
                    salvando = true;
                });
                Future.delayed(Duration(seconds: 2), () {
                   ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Dados salvos com sucesso")));
                  setState(() {
                    salvando = false;
                  });  
                Navigator.pop(context);
                });
                },
                child: const Text("Salvar")),
          ]
        ),
      )
    );
  }
}