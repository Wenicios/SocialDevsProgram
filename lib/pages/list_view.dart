import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.User3),
          title: Text("Tanjiro"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Suave?"),
              Text("11:59"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
          // Divider(),
          //  ListTile(
          // leading: Image.asset(AppImages.User5),
          // title: const Text("Vega"),
          // subtitle: const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("capotei o corsa KKKKK"),
          //     Text("11:50"),

          //   ],
          // ),
          
          // trailing: PopupMenuButton<String>(
          //   onSelected: (menu) {
          //     print(menu);
          //   },
          //   itemBuilder: (BuildContext bc) {
          //     return <PopupMenuEntry<String>>[
          //       const PopupMenuItem<String>(
          //         value: "opcao1",
          //         child: Text("Bloquear")),
          //         const PopupMenuItem<String>(
          //         value: "opcao1",
          //         child: Text("Excluir Conversa")),
          //         const PopupMenuItem<String>(
          //         value: "opcao1",
          //         child: Text("Silenciar")),
          //     ];
                
          //   },
          // ),
          // ),
           Divider(),
           ListTile(
          leading: Image.asset(AppImages.User6),
          title: const Text("Kevin"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Como se faz um print em java? :p"),
              Text("11:20"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
           Divider(),
           ListTile(
          leading: Image.asset(AppImages.User7),
          title: const Text("Allysa"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Terminei o projeto"),
              Text("10:20"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
           Divider(),
           ListTile(
          leading: Image.asset(AppImages.User8),
          title: const Text("Elyot"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hackear a nasa hoje, tá dentro?"),
              Text("10:05"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),

           Divider(),
           ListTile(
          leading: Image.asset(AppImages.User9),
          title: const Text("Ace"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("tenho uma proposta de emprego"),
              Text("10:01"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao3",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
          
          Divider(),
           ListTile(
          leading: Image.asset(AppImages.User11),
          title: const Text("Barney"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Vai ser LEGENDARIO!"),
              Text("08:00"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao3",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
          Divider(),
           ListTile(
          leading: Image.asset(AppImages.User12),
          title: const Text("Ted"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tô dizendo cara, ela é a certa"),
              Text("ontem"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao3",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
          Divider(),
           ListTile(
          leading: Image.asset(AppImages.User14),
          title: const Text("Bloom"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Você vai querer ser uma de nós?"),
              Text("ontem"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao3",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
          Divider(),
           ListTile(
          leading: Image.asset(AppImages.User13),
          title: const Text("Annie"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("concordo"),
              Text("ontem"),

            ],
          ),
          
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Bloquear")),
                  const PopupMenuItem<String>(
                  value: "opcao2",
                  child: Text("Excluir Conversa")),
                  const PopupMenuItem<String>(
                  value: "opcao3",
                  child: Text("Silenciar")),
              ];
                
            },
          ),
          ),
        // Image.asset(AppImages.User1),
        // Image.asset(AppImages.User2),
        // Image.asset(AppImages.User3),
        // Image.asset(AppImages.User4),
        // Image.asset(AppImages.User5),
        // Image.asset(AppImages.User6),
      ],
    );
  }
}