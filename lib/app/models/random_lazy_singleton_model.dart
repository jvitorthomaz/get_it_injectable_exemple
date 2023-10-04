import 'dart:math';

import 'package:injectable/injectable.dart';

@LazySingleton()
class RandomLazySingletonModel {
  int id;
  String name;

  RandomLazySingletonModel() : id = Random().nextInt(1000), name = 'Random Lazy Singleton Model' {
    print('name: $name \nid: $id');
  }
}