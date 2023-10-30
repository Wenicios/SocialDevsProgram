import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/configuracoes_page.dart';
import 'package:flutter_application_1/pages/dados_cadastrais.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/numeros_aleatorios_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Wrap(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                     ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text("Camera"), leading: Icon(Icons.camera)),
                     ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text("Galeria"),  leading: Icon(Icons.photo_album)),
                    ],
                  );
                });
              },
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/4792/4792929.png"),
                ),
                accountName: Text("Wenicios"),
                 accountEmail: Text("email@teste.com")),
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5), 
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Dados Cadastrais  "),
                  ],
                )),
                onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DadosCadastraisPage(
                  )
                  )
                  );
              },
              ),
              
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5), 
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  context: context, builder: (BuildContext bc) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child:
                     const Column(
                       children: [
                        Text(
                          "Termos de Privacidade",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 20,
                          ),
                        Text(
                          "Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o acompanhamento das preferências de consumo apresenta tendências no sentido de aprovar a manutenção do sistema de participação geral.",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify
                          ),
                       ],
                     ),
                      
                      );
                
                });
            },
              ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5), 
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (bc) => 
                const ConfifuracoesPage()
                ));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5), 
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Gerador de Números"),
                  ],
                )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (bc) => 
                const NumerosAleatoriosPage()
                ));
              },
            ),
            const Divider(), 
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5), 
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair"),
                  ],
                )),
              onTap: () {
                showDialog(context: context, builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                      ),

                    title: const Text("Meu App", style: TextStyle(fontWeight: FontWeight.bold),),
                    content: const Wrap(
                      children: [
                        Text("Atenção você sairá do app!"),
                        Text("Deseja realmente Sair do Aplicativo?"),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text("Não")),
                      TextButton(onPressed: () {
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      }, child: const Text("Sim")),
                      ],
                  );
                });
              },
            )
            ],
          ),
        );
  }
}