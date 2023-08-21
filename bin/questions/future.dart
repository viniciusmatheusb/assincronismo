import 'dart:math';

void main() {
  /*Future myFuture = Future(() {
    print('Estou dentro da função Future!');
    return 21;
  }).then((value) => print('O valor é $value'));*/

  Future<int> myFutureFunc() async {
    print('Eu tenho uma função no Futuro!');
    await Future.delayed(Duration(seconds: 5));
    throw Exception();
    //return 12;
  }

  myFutureFunc().then((value) {
    print('O valor é $value');
  }).onError((error, stackTrace) {
    print('Ocorreu um erro.');
  }).whenComplete(() {
    print('O Futuro acabou.');
  });

  Future<int> myFutureFuncError(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }
      print('Eu tenho uma função no Futuro!');
      await Future.delayed(Duration(seconds: 5));
      return 12;
    } catch (e) {
      print('Ocorreu um erro $e');
      return 42;
    } finally {
      print('O Futuro chegou ao fim');
      return 42;
    }
  }

  myFutureFuncError(1, 2).then((value) {
    print('O valor é $value');
  });

  print('Função main foi terminada');
}
