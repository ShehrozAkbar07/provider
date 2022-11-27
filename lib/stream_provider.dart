import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class StreamProviderr extends StatefulWidget {
  const StreamProviderr({super.key});

  @override
  State<StreamProviderr> createState() => _StreamProviderrState();
}

class _StreamProviderrState extends State<StreamProviderr> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyModel>(
      initialData: MyModel(userName: 'userr'),
      create: (BuildContext context) => GetModel(),
      child: Scaffold(
          body: Column(children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 200, horizontal: 100),
            child: Column(children: [
              Consumer<MyModel>(builder: (context, MyModel, child) {
                return Text(
                  MyModel.userName,
                  style: TextStyle(fontSize: 30),
                );
              }),
              Consumer<MyModel>(
                builder: ((context, MyModel, child) {
                  return ElevatedButton(
                      onPressed: () {
                        MyModel.doSomething();
                      },
                      child: const Text('Pressed'));
                }),
              )
            ]))
      ])),
    );
  }
}

Stream<MyModel> GetModel() {
  return Stream<MyModel>.periodic(
      Duration(seconds: 1), (x) => MyModel(userName: '$x')).take(10);
}

class MyModel {
  String userName;
  MyModel({required this.userName});
  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    String userName = "Shehroz";

    print(userName);
  }
}
