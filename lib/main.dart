import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'presentation/auth/cubit/cubit.dart';
import 'presentation/auth/login_check.dart';
import 'presentation/auth/sign_up.dart';
import 'presentation/category/cubit/cubit.dart';
import 'presentation/document/cubit/cubit.dart';
import 'presentation/home/cubit/cubit.dart';
import 'presentation/home/cubit/state.dart';
import 'presentation/main_screen/main_screen.dart';
import 'presentation/profile/cubit/cubit.dart';
import 'presentation/salon_screen/cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utils/cash_helper/cash_helper.dart';
//360
//800
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SalonCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => MainDocCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
      ],
      child: BlocBuilder<MainCubit,MainState>(
          builder: (context,state) {
            if(CacheHelper.get(key: "lang") == null){
            CacheHelper.put(key: "lang", value: "en");}
            return MaterialApp(
          locale: Locale(CacheHelper.get(key: "lang")) ,
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
            Locale('fr'),
          ],
          localizationsDelegates:const[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // supportedLocales: S.delegate.supportedLocales,
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/main_Screen': (context) => const MainScreen(),
            '/login': (context) => const LoginCheck(),
            '/Sign_Up': (context) => const SignUpScreen(),

            // When navigating to the "/second" route, build the SecondScreen widget.
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
              home:const MainScreen(),
          );
        }
      ),
    );
  }
}