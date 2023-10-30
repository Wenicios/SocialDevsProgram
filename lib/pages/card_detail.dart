import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          //appBar: AppBar(),
          body: Padding(        
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.close)),
                        Row(
                          children: [
                            Image.network(
                             cardDetail.url,
                              height: 100,
                            ),
                            Text(cardDetail.title,
                             style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            cardDetail.Text,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 16,
                            ),
                                            ),
                        ),
                    ],
                    
                    ),
                  ),),
      ),
    );
  }
}