import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_bloc.dart';
import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_event.dart';
import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_state.dart';
import 'package:crypto_bloc/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xff161520),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff161520),
          //  Colors.grey.shade900.withOpacity(.4),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
          textTheme: GoogleFonts.dmSansTextTheme()),
      home:  BlocProvider(
        create: (context) => CryptoBloc(),
        child: const ScreenHome(),
      ),
    );
  }
}

class Try extends StatefulWidget {
  const Try({super.key});

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  final bloc = CryptoBloc();
  @override
  void initState() {
    bloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryptoBloc, CryptoState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.yellow),
          );
        } else if (state is CryptoFetchSuccessState) {
          return Container(
            color: Colors.yellow,
          );
        } else if (state is CryptoErrorState) {
          return const Scaffold(
              body: Center(
            child: Text('Somthing went wrong'),
          ));
        }

        return const SizedBox();
      },
    );
  }
}
