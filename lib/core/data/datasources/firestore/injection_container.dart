import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

Future<void>? setup(GetIt di) async {
  //Firestore
  di.registerLazySingleton(() => FirebaseFirestore.instance);
}
