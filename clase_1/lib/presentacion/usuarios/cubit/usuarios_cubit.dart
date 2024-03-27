import 'package:clase_1/data/models/user/user_model.dart';
import 'package:clase_1/domain/user/datasource_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuarios_state.dart';

class UsuariosCubit extends Cubit<UsuariosState> {
  final DataSourceUser sourceUser;
  UsuariosCubit(this.sourceUser) : super(UsuariosInitial());
  crearUsuario() {
    final Usuario usuario = Usuario(nombre: "Rabanito", email: "perrito@gmail.com", ubicacion: "jijijij", edad: 20);
    sourceUser.createUser(usuario);
  }
}
