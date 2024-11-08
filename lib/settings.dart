import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/app_localization.dart';
import 'package:localization_bloc/cubit/locale_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('settings')),
        centerTitle: true,
      ),
      body: Center(child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ChangeLocaleState) {
            return DropdownButton<String>(
              value: state.locale.languageCode,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: ['ar', 'en'].map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? v) {
                if (v != null) {
                  context.read<LocaleCubit>().changeLanguage(v);
                }
              },
            );
          }
          return const SizedBox();
        },
      )),
    );
  }
}
