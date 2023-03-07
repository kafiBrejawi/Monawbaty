import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monawpaty/core/locator.dart';
import 'package:monawpaty/src/modules/otp/cubit/otp_cubit.dart';
import 'package:monawpaty/src/shared/bloc_observer.dart';
import 'src/modules/login/cubit/login_cubit.dart';
import 'src/modules/registration/cubit/registration_cubit.dart';
import 'src/modules/splash/splash_screen.dart';
import 'src/shared/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegistrationCubit()),
        BlocProvider(create: (context) => OtpCubit()),
      ],
      child: MaterialApp(
          color: primaryColor,
          debugShowCheckedModeBanner: false,
          title: 'Monawpaty',
          theme: ThemeData(
            fontFamily: GoogleFonts.cairo().fontFamily,
            primarySwatch: Colors.red,
          ),
          home: const SplashScreeen()),
    );
  }
}