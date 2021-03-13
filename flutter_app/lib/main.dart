import 'dart:async';

void main() async {
  final future = await helloWorld();
  Future<int> future1=futureNumber();
  future1.then((val){
    print('val:$val');
  }).catchError((error){
    print('error:$error');
  });
  print(100);
  print(future);
}

Future<String> helloWorld(){
  return Future.delayed(Duration(seconds: 3),(){
    final hello="Hello world1";
    print(hello);
    return hello;

  });
}

Future<int> futureNumber(){
  return Future<int>.delayed(Duration(seconds: 3),(){
    return 100;
  });
}