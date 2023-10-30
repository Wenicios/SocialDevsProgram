import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/card_page.dart';
import 'package:flutter_application_1/pages/image_assets.dart';
import 'package:flutter_application_1/pages/list_view.dart';
//import 'package:flutter_application_1/pages/list_view_horizontal.dart';
import 'package:flutter_application_1/pages/tarefa_page.dart';
import 'package:flutter_application_1/shared/widgets/custom_drawer.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("SocialDevs")),
        drawer: CustomDrawer(),
        body: Column(
          children: [ Expanded(child: 
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
                },
              
              children: const [
              CardPage(),
              ImageAssetsPage(),
              ListViewPage(),
              //ListViewHorizontal(),
              TarefaPage()
            ],
          ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: posicaoPagina,
            items: const [
            BottomNavigationBarItem(label: "Feed", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Post", icon: Icon(Icons.add)),
            BottomNavigationBarItem(label: "Mensagens", icon: Icon(Icons.person)),
            //BottomNavigationBarItem(label: "page4", icon: Icon(Icons.image)),
            BottomNavigationBarItem(label: "Tarefas", icon: Icon(Icons.list)),
          ])
          ],
        ),
      ),
    );
  }
}