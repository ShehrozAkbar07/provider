import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FutureProviderr extends StatefulWidget {
  const FutureProviderr({super.key});

  @override
  State<FutureProviderr> createState() => _FutureProviderrState();
}

class _FutureProviderrState extends State<FutureProviderr> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>(
      initialData: MyModel(userName: 'userr'),
      create: (BuildContext context)=>GetModel(),
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

Future<MyModel> GetModel() async {
  await Future.delayed(Duration(seconds: 2));
  return MyModel(userName: 'user');
}


class MyModel  {
  String userName;
  MyModel({required this.userName});
  Future<void> doSomething() async {
   await Future.delayed(Duration(seconds: 2));
    String userName = "Shehroz";

    print(userName);
  }
}
