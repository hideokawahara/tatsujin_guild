//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//BottomTab
import 'bottom_tab.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/auth_view_model.dart';
import 'package:tatsujin_guild/view_models/master_view_model.dart';

//Widgets
import 'package:tatsujin_guild/widgets/circular_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(
            auth: AuthRepositoryImpl(),
          ),
        ),
        ChangeNotifierProvider<MasterViewModel>(
          create: (_) => MasterViewModel(),
        ),
      ],
      child: const MyAppBody(),
    );
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLogin =
        Provider.of<AuthViewModel>(context, listen: false).isLogin;
    if (isLogin) {
      return MaterialApp(
        title: 'TATSUJIN GUILD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale("en"),
        //   Locale("ja"),
        // ],
        // locale: const Locale('ja', 'JP'),
        initialRoute: '/home',
        routes: {
          '/home': (_) => BottomTab(),
          '/login': (_) => const Center(child: Text('ログインしてね')),
        },
      );
    } else {
      return FutureBuilder(
        future: Future.wait([
          Provider.of<AuthViewModel>(context, listen: false).fetchMyData(),
          Provider.of<MasterViewModel>(context, listen: false).fetchTopic(),
        ]),
        builder: (_, snapshot) {
          final String initialRoute;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DefaultCircularIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            final bool isLoginSuccess =
                Provider.of<AuthViewModel>(context, listen: false).isLogin;
            initialRoute = isLoginSuccess ? '/home' : '/login';
          } else {
            initialRoute = '/login';
          }
          return MaterialApp(
            title: 'TATSUJIN GUILD',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            // supportedLocales: const [
            //   Locale("en"),
            //   Locale("ja"),
            // ],
            // locale: const Locale('ja', 'JP'),
            initialRoute: initialRoute,
            routes: {
              '/home': (_) => BottomTab(),
              '/login': (_) => const Center(child: Text('ログインしてね')),
            },
          );
        },
      );
    }
  }
}
