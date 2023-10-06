import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/core/service_locator.dart';
import 'app/models/random_factory_model.dart';
import 'app/models/random_lazy_singleton_model.dart';
import 'app/models/random_singleton_model.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Factory and Singleton Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  //const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 1;
  int id = 0;
  String name = '';

   void _onItemTapped(int index) {
    switch (index) {
      case 0:
        //every time the button id pressed, a new instance is created
        final instance = GetIt.I.get<RandomFactoryModel>();
        setState(() {
          id = instance.id;
          name = instance.name;
        });
        break;

      case 1:
        final instance = GetIt.I.get<RandomSingletonModel>();
        setState(() {
          id = instance.id;
          name = instance.name;
        });
        break;

      case 2:
        final instance = GetIt.I.get<RandomLazySingletonModel>();
        setState(() {
          id = instance.id;
          name = instance.name;
        });
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.99,
          height: 200,
          decoration: BoxDecoration(
            //color: Colors.deepPurple,
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
         
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Text('$id', style: TextStyle(fontSize: 28, color: Colors.black)),
              Divider(thickness: 2, color: Colors.black,),
              Text('Message: $name', style: const TextStyle(fontSize: 20, color: Colors.black)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.factory),
            label: 'Factory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Singleton',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bed),
            label: 'Lazy Singleton',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
