class BotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream KakoBotStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      Future.delayed(Duration(seconds: interval));
      yield i++;
    }

    print('A Stream acabou');
  }
}
