import 'package:get_it/get_it.dart';
import 'package:get_it_injectable_exemple/app/models/random_factory_model.dart';
import 'package:get_it_injectable_exemple/app/models/random_lazy_singleton_model.dart';
import 'package:get_it_injectable_exemple/app/models/random_singleton_model.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

// void configureDependencies(){
//   final getIt = GetIt.I;

//   getIt.registerFactory(() => RandomFactoryModel());
//   getIt.registerSingleton(RandomSingletonModel());
//   getIt.registerLazySingleton(() => RandomLazySingletonModel());

// }
	
// final getIt = GetIt.instance;  
  
// @InjectableInit(  
//   initializerName: 'init', // default  
//   preferRelativeImports: true, // default  
//   asExtension: true, // default  
// )  
// void configureDependencies() => getIt.init();  

final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: r'$initGetIt', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() => $initGetIt(getIt);  
