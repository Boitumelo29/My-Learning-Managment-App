import 'package:flutter/material.dart';
import 'package:mylearning/notes/connection_examlpe/bloc/network_bloc.dart';
import 'network_bloc.dart'; // Import your bloc file
import 'network_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NetworkBloc()..add(NetworkObserve()),
      const Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state is NetworkFailure) {
              return const Text("No Internet Connection");
            } else if (state is NetworkSuccess) {
              return const Text("You're Connected to Internet");
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
