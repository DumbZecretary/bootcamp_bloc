import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/counting/logic/events/counting_get_current_state_event.dart';
import 'package:count_app/l10n/l10n.dart';
import 'package:count_app/model/app_state/app_state_model.dart';
import 'package:count_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppView extends StatefulWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    context.read<CountingBloc>().add(CountingGetCurrentStateEvent());
    delayTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CountingBloc, AppState, String>(
        selector: (appState) => appState.locale ?? "en",
        builder: (context, data) {
          return MaterialApp(
            locale: Locale(data, ''),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            // TODO: idle state - home, else - loading circle
            home: BlocSelector<CountingBloc, AppState, String>(
                selector: (appState) {
              return appState.status ?? "loading";
            }, builder: (context, data) {
              if (data == "idle") {
                return const HomeScreen();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.pinkAccent,
                    ),
                  ),
                );
              }
            }),
          );
        });
  }
}

Future<void> delayTime() async {
  await Future.delayed(const Duration(seconds: 3));
}
