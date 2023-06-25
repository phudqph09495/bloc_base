import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/screen/auth/login_screen/login_screen.dart';
import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'bloc/auth/bloc_check_login.dart';
import 'bloc/bloc_counter.dart';
import 'bloc/counter_observer.dart';
import 'bloc/event_bloc.dart';
import 'bloc/language/bloc_lang.dart';
import 'config/share_pref.dart';
import 'router/router.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await SharedPrefs.init();
  Bloc.observer = CounterObserver();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => BlocCheckLogin()..add(GetData())),
        BlocProvider(create: (_) => BlocLanguage()..add(GetLanguage())),
        BlocProvider(create: (_) => SearchTabBloc()),

        // BlocProvider(create: (_) => BlocFireBaseMS()..add(firebase())),
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.

        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
      ],
      child: MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('en'), Locale('vi')],
        home: UpgradeAlert(
          // child: MyHomePage()
          child: const LoginScreen(),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouterName.loginScreen,
      ),
    );
  }
}
