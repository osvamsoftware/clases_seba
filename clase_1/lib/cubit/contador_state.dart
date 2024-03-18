part of 'contador_cubit.dart';

abstract class ContadorState {
  final int currentIndex;

  ContadorState(this.currentIndex);
}

class ContadorInitial extends ContadorState {
  ContadorInitial(super.currentIndex);
}

class ContadorLoading extends ContadorState {
  ContadorLoading(super.currentIndex);
}

class ContadorDone extends ContadorState {
  ContadorDone(super.currentIndex);
}
