import 'package:clase_1/data/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataSourceUser {
  final instance = FirebaseFirestore.instance;

  Future<void> createUser(Usuario usuario) async {
    print(usuario);
    final mapa = usuario.toJson();
    print(mapa);
    await instance.collection("usuarios").add(usuario.toJson());
  }

  Future<Usuario> getUser(String usuario) async {
    final userResultado = await instance.collection("usuarios").where("nombre", isEqualTo: usuario).get();
    final userDos = userResultado.docs.first.data();
    return Usuario.fromJson(userDos);
  }
}
