import 'package:artos/blocs/auth/auth_bloc.dart';
import 'package:artos/shared/theme.dart';
import 'package:artos/ui/pages/data_package_page.dart';
import 'package:artos/ui/pages/data_provider_page.dart';
import 'package:artos/ui/pages/data_success_page.dart';
import 'package:artos/ui/pages/home_page.dart';
import 'package:artos/ui/pages/onboarding_page.dart';
import 'package:artos/ui/pages/pin_page.dart';
import 'package:artos/ui/pages/profile_edit_page.dart';
import 'package:artos/ui/pages/profile_edit_pin_page.dart';
import 'package:artos/ui/pages/profile_edit_success_page.dart';
import 'package:artos/ui/pages/profile_page.dart';
import 'package:artos/ui/pages/sign_in_page.dart';
import 'package:artos/ui/pages/sign_up_page.dart';
import 'package:artos/ui/pages/sign_up_success_page.dart';
import 'package:artos/ui/pages/splash_page.dart';
import 'package:artos/ui/pages/top_up_page.dart';
import 'package:artos/ui/pages/top_up_success.dart';
import 'package:artos/ui/pages/transfer_page.dart';
import 'package:artos/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrent()),
        ),
        BlocProvider(
          create: (context) =>  UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            appBarTheme: AppBarTheme(
              backgroundColor: lightBackgroundColor,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: blackColor),
              titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            )),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/top-up': (context) => const TopUpPage(),
          '/top-up-success': (context) => const TopUpSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
