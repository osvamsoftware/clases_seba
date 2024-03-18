import 'package:clase_1/cubit/contador_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App1());
}

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContadorCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: const ContadorCubitScreen(),
      ),
    );
  }
}

//!------------------------------------------
class ContadorCubitScreen extends StatelessWidget {
  const ContadorCubitScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<ContadorCubit, ContadorState>(
            builder: (context, state) {
              if (state is ContadorLoading) {
                return CircularProgressIndicator();
              } else if (state is ContadorInitial) {
                return Text(
                  'INICIAR CONTADOR ',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.amber),
                );
              } else {
                return Text(
                  state.currentIndex.toString(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(),
                );
              }
            },
          ),
          NuevoWidget()
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ContadorCubit>().reset();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.reset_tv),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ContadorCubit>().sumar();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NuevoWidget extends StatelessWidget {
  const NuevoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<ContadorCubit>().restar(),
      child: Container(
        height: 80,
        width: 80,
        color: Colors.red,
        child: Center(
          child: BlocBuilder<ContadorCubit, ContadorState>(
            builder: (context, state) {
              return Text(
                (state.currentIndex + 1).toString(),
                style: TextStyle(fontSize: 25),
              );
            },
          ),
        ),
      ),
    );
  }
}

//!------------------------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2;
  String _st = 'done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          (_st == 'loading')
              ? const CircularProgressIndicator()
              : Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(),
                ),
          // NuevoWidget()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
