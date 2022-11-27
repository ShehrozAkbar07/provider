import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (BuildContext context) => MyModel(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 200, horizontal: 100),
              child: Column(
                children: [
                  Consumer<MyModel>(builder: (context, MyModel, child) {
                    return Text(
                      MyModel.someValue,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'GoodBye';
    notifyListeners();
    print(someValue);
  }
}
