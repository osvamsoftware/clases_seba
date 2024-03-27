import 'package:clase_1/cubit/contador_cubit.dart';
import 'package:clase_1/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      body: BlocConsumer<ContadorCubit, ContadorState>(
        listenWhen: (previous, current) => current.currentIndex != previous.currentIndex,
        listener: (context, state) {
          if (state.currentIndex == 5) {
            showDialog(
              context: context,
              builder: (context) => const Dialog(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Text('Todo ok'),
                ),
              ),
            );
          }
          if (state.currentIndex == 10) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Paginas2(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ContadorLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ContadorDone) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                // const CircularProgressIndicator(),
                Text(state.currentIndex.toString()),
                const NuevoWidget(),
              ],
            );
          } else {
            return Center(
              child: Text('Estado desconocido'),
            );
          }
        },
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
          const SizedBox(
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
                style: const TextStyle(fontSize: 25),
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
// BlocBuilder<DataCubit, List<DocumentSnapshot>>(
//   builder: (context, data) {
//     // Usa los datos en tu interfaz de usuario
//     return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         // Construye los elementos de la lista
//         return ListTile(
//           title: Text(data[index]['campo']),
//           // Otra información de tus documentos
//         );
//       },
//     );
//   },
// )

// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
// Crear un Cubit para manejar los datos:
// Crea un Cubit para manejar los estados de tus datos. Por ejemplo, podrías tener un Cubit llamado DataCubit.

// dart
// Copy code
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DataCubit extends Cubit<List<DocumentSnapshot>> {
//   DataCubit() : super([]);

//   final CollectionReference _collection = FirebaseFirestore.instance.collection('tu_coleccion');

//   void getData() {
//     _collection.snapshots().listen((QuerySnapshot snapshot) {
//       emit(snapshot.docs);
//     });
//   }
// }