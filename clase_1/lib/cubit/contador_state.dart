part of 'contador_cubit.dart';

//!---- ESTADO PADRE////
abstract class ContadorState {
  final int currentIndex;

  ContadorState(this.currentIndex);
}

//!-----  ESTADOS HIJOS/////
class ContadorInitial extends ContadorState {
  ContadorInitial(super.currentIndex);
}

class ContadorLoading extends ContadorState {
  ContadorLoading(super.currentIndex);
}

class ContadorDone extends ContadorState {
  ContadorDone(super.currentIndex);
}

class ContadorError extends ContadorState {
  final String messageError;
  ContadorError(super.currentIndex, this.messageError);
}
