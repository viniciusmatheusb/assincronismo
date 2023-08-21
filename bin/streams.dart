import 'dart:async';

void main() async {
  Stream myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print('Contando: $i');
      Future.delayed(Duration(seconds: interval));
      yield i++;
    }

    print('A Stream acabou');
  }

  StreamSubscription myStreamSubcription = myStream(1).listen((event) {
    if (event.isEven) {
      print('Esse número é Even!');
    }
  }, onError: (e) {
    print('Error: $e');
  }, onDone: () {
    print('Deu certo');
  });

  await Future.delayed(Duration(seconds: 3));
  myStreamSubcription.pause();
  print('Stream Pausada');

  await Future.delayed(Duration(seconds: 3));
  myStreamSubcription.resume();
  print('Stream retomada');

  await Future.delayed(Duration(seconds: 3));
  myStreamSubcription.cancel();
  print('Stream cancelada');

  print('A main acabou');
}
