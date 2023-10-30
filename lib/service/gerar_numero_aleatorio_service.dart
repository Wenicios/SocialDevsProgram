import 'dart:math';

class geradorDeNumeroAleatorio {

  static int gerarNumeroAleatorio() {
    Random numeroAleatorio = Random();
    
    return numeroAleatorio.nextInt(1000); 
  }
}