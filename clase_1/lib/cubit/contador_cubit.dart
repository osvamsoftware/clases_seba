import 'package:flutter_bloc/flutter_bloc.dart';

part 'contador_state.dart';

class ContadorCubit extends Cubit<ContadorState> {
  ContadorCubit() : super(ContadorInitial(2));

  sumar() async {
    emit(ContadorLoading(state.currentIndex));
    await Future.delayed(const Duration(seconds: 1));
    emit(ContadorDone(state.currentIndex + 1));
  }

  restar() async {
    emit(ContadorLoading(state.currentIndex));
    await Future.delayed(const Duration(seconds: 1));
    emit(ContadorDone(state.currentIndex - 1));
  }

  reset() {
    emit(ContadorInitial(0));
  }
}
