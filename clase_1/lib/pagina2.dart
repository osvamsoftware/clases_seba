import 'package:clase_1/cubit/contador_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Paginas2 extends StatelessWidget {
  const Paginas2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ContadorCubit, ContadorState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [Text('ESTAMOS EN LA PAGINA AL FIN'), Text(state.currentIndex.toString())],
            ),
          );
        },
      ),
    );
  }
}
