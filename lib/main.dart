import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_bloc/app_localization.dart';
import 'package:localization_bloc/cubit/locale_cubit.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //. return returnType of function, but .. return LocaleCubit wich is required and commit the function
      // to not be inially on LocaleInitial state
      create: (context) => LocaleCubit()..getSavedLanguage(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ChangeLocaleState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              // supported langs
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                //customized
                AppLocalizations.delegate,
                // is responsible for translation some words (ok موافق) android
                GlobalMaterialLocalizations.delegate,
                // is responsible for widgets directions
                GlobalWidgetsLocalizations.delegate,
                // is responsible for translation some words (ok موافق) ios
                GlobalCupertinoLocalizations.delegate
              ],

              home: const Home(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
