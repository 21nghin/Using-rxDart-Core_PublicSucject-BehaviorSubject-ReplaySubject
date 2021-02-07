import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main(List<String> arguments) {
  demoCombineLatestStream();
}

void demoBehaviorSubject() async {
  final _subject = BehaviorSubject<int>();

  await _subject.listen((value) {
    print('lần 1 ====> $value');
  });

  await _subject.add(0);
  await _subject.add(1);
  await _subject.add(2);

  await _subject.listen((value) {
    print('Lắng nghe lần 2 nghe được ====> $value');
  });
  await _subject.add(3);
  await _subject.add(4);


  _subject.close();

}

void demoPublishSubject() async {
  final _subject = PublishSubject<int>();

  await _subject.listen((value) {
    print('lần 1 ====> $value');
  });

  await _subject.add(0);
  await _subject.add(1);
  await _subject.add(2);

  await _subject.listen((value) {
    print('Lắng nghe lần 2 nghe được ====> $value');
  });
  await _subject.add(3);
  await _subject.add(4);
  await _subject.add(5);


  _subject.close();
}


void demoReplaySubject() async {
  final _subject = ReplaySubject<int>();

  await _subject.listen((value) {
    print('lần 1 ====> $value');
  });

  await _subject.add(0);
  await _subject.add(1);
  await _subject.add(2);

  await _subject.listen((value) {
    print('Lắng nghe lần 2 nghe được ====> $value');
  });

  await _subject.add(3);
  await _subject.add(4);
  await _subject.add(5);

  _subject.close();
}

void demoCombineLatestStream(){
  CombineLatestStream.list<String>([
    Stream.fromIterable(['a']),
    Stream.fromIterable(['b']),
    Stream.fromIterable(['C', 'D'])])
      .listen(print); //prints ['a', 'b', 'C'], ['a', 'b', 'D']
}

class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
