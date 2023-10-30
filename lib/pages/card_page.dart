import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/card_detail.dart';
import 'package:flutter_application_1/pages/card_detail.dart';
import 'package:flutter_application_1/repositores/card_detail_repository.dart';


class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: cardDetail == null ? LinearProgressIndicator() : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => CardDetailPage(
                    cardDetail: cardDetail!,
                   ),));
              },
              child: Hero(
                tag: cardDetail!.id,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                             cardDetail!.url,
                              height: 20,
                            ),
                            Text(cardDetail!.title,
                             style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cardDetail!.Text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                          ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {
                    
                      }, child: const Text("Ler Mais")),
                    )
                    ],
                    
                    ),
                  ),
                ),
              ),
              
            ),
          ),
          const Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: cardDetail == null ? LinearProgressIndicator() : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => CardDetailPage(
                    cardDetail: cardDetail!,
                   ),));
              },
              child: Hero(
                tag: cardDetail!.id,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                             cardDetail!.url,
                              height: 20,
                            ),
                            Text(cardDetail!.title,
                             style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cardDetail!.Text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                          ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {
                    
                      }, child: const Text("Ler Mais")),
                    )
                    ],
                    
                    ),
                  ),
                ),
              ),
              
            ),
          ),
        ],
      )
      ],
    );
  }
}