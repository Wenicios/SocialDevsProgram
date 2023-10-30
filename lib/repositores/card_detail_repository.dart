import 'package:flutter_application_1/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async{
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
    1,
    "DIO Comunity",
    "https://cdn-icons-png.flaticon.com/512/4792/4792929.png",
    "As linguagens de programação desempenham um papel fundamental na criação de software, aplicativos e soluções em tecnologia pelos desenvolvedores. Constantemente atualizadas, elas evoluem rapidamente para atender às necessidades do mercado de trabalho e às demandas dos usuários. Entre as diversas linguagens de programação disponíveis, o Python tem se destacado como uma das mais populares e requisitadas pelos desenvolvedores. Sua facilidade de aprendizado, ampla variedade de bibliotecas e frameworks e versatilidade contribuem para sua crescente popularidade no mercado de trabalho."
  );
  }
}