import 'package:bloc_base/homepage.dart';
import 'package:bloc_base/screen/auth/account_screen/member_screen.dart';
import 'package:bloc_base/screen/auth/history_screen/history_screen.dart';
import 'package:bloc_base/screen/cart/confirm_screen/confirm_screen.dart';
import 'package:bloc_base/screen/auth/login_screen/login_screen.dart';
import 'package:bloc_base/screen/home/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../screen/auth/my_ratting_screen/my_ratting_screen.dart';
import '../screen/auth/profile_screen/password_screen.dart';
import '../screen/auth/setting_screen/setting_screen.dart';
import '../screen/cart/cart_screen/cart_screen.dart';
import '../screen/cart/confirm_success_screen/confirm_success_screen.dart';
import '../screen/cart/booking_code_screen/booking_code_screen.dart';
import '../screen/cart/no_connect_screen/no_connect_screen.dart';
import '../screen/cart/payment_screen/payment_screen.dart';
import '../screen/cart/success_screen/success_screen.dart';
import '../screen/auth/booked_package_screen/booked_package_screen.dart';
import '../screen/auth/register_member_sreen/register_member_sreen.dart';
import '../screen/auth/forget_password_screen/forget_password_screen.dart';
import '../screen/auth/frequently_asked_questions/frequently_asked_questions.dart';
import '../screen/auth/introduce_screen/introduce_screen.dart';
import '../screen/auth/profile_screen/profile_screen.dart';
import '../screen/auth/signup_screen/signup_screen.dart';
import '../screen/auth/favourite_screen/view/favourite_screen.dart';
import '../screen/home/home_screen/home_screen.dart';
import '../screen/search/info_service/info_service.dart';
import '../screen/search/info_spa_screen/info_spa_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    switch (settings.name) {
      case RouterName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    switch (settings.name) {
      case RouterName.confirmScreen:
        return MaterialPageRoute(builder: (context) => const ConfirmScreen());
    }
    switch (settings.name) {
      case RouterName.simpleBarcodeScannerPage:
        return MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage());
    }
    switch (settings.name) {
      case RouterName.notifyScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
    }
    switch (settings.name) {
      case RouterName.infoSpaScreen:
        return MaterialPageRoute(builder: (context) => const InfoSpaScreen());
    }
    switch (settings.name) {
      case RouterName.infoService:
        return MaterialPageRoute(builder: (context) => const InfoService());
    }
    switch (settings.name) {
      case RouterName.myHomePage:
        return MaterialPageRoute(builder: (context) => MyHomePage());
    }
    switch (settings.name) {
      case RouterName.paymentScreen:
        return MaterialPageRoute(builder: (context) => const PaymentScreen());
    }
    switch (settings.name) {
      case RouterName.successScreen:
        return MaterialPageRoute(builder: (context) => const SuccessScreen());
    }
    switch (settings.name) {
      case RouterName.bookingCodeScreen:
        return MaterialPageRoute(
            builder: (context) => const BookingCodeScreen());
    }
    switch (settings.name) {
      case RouterName.registerMemberScreen:
        return MaterialPageRoute(
            builder: (context) => const RegisterMemberScreen());
    }
    switch (settings.name) {
      case RouterName.bookedPackageScreen:
        return MaterialPageRoute(
            builder: (context) => const BookedPackageScreen());
    }

    switch (settings.name) {
      case RouterName.favouriteScreen:
        return MaterialPageRoute(builder: (context) => const FavouriteScreen());
    }
    switch (settings.name) {
      case RouterName.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
    }
    switch (settings.name) {
      case RouterName.confirmSuccesScreen:
        return MaterialPageRoute(
            builder: (context) => const ConfirmSuccesScreen());
    }
    switch (settings.name) {
      case RouterName.introduceScreen:
        return MaterialPageRoute(builder: (context) => const IntroduceScreen());
    }
    switch (settings.name) {
      case RouterName.frequentlyQuestionScreen:
        return MaterialPageRoute(
            builder: (context) => const FrequentlyQuestionsScreen());
    }
    switch (settings.name) {
      case RouterName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
    }
    switch (settings.name) {
      case RouterName.forgetPassScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgetPassScreen());
    }
    switch (settings.name) {
      case RouterName.noConnectScreen:
        return MaterialPageRoute(builder: (context) => const NoConnectScreen());
    }
    switch (settings.name) {
      case RouterName.gioHangScreen:
        return MaterialPageRoute(builder: (context) => const GioHangScreen());
    }

    switch (settings.name) {
      case RouterName.historyScreen:
        return MaterialPageRoute(builder: (context) => const HistoryScreen());
    }

    switch (settings.name) {
      case RouterName.passworkScreen:
        return MaterialPageRoute(builder: (context) => const PassworkScreen());
    }
    switch (settings.name) {
      case RouterName.settingScreen:
        return MaterialPageRoute(builder: (context) => const SettingScreen());
    }
    switch (settings.name) {
      case RouterName.rattingScreen:
        return MaterialPageRoute(builder: (context) => const RattingScreen());
    }
    switch (settings.name) {
      case RouterName.memberScreen:
        return MaterialPageRoute(builder: (context) => const MemberScreen());
    }

    return null;
  }
}

class RouterName {
  static const homeScreen = "/homeScreen";
  static const loginScreen = "/loginScreen";
  static const confirmScreen = "/confirmScreen";
  static const simpleBarcodeScannerPage = "/simpleBarcodeScannerPage";
  static const notifyScreen = "/notifyScreen";
  static const infoSpaScreen = "/infoSpaScreen";
  static const infoService = "/infoService";
  static const myHomePage = "/myHomePage";
  static const paymentScreen = "/paymentScreen";
  static const successScreen = "/successScreen";
  static const bookingCodeScreen = "/bookingCodeScreen";
  static const registerMemberScreen = "/registerMemberScreen";
  static const bookedPackageScreen = "/bookedPackageScreen";
  static const favouriteScreen = "/favouriteScreen";
  static const profileScreen = "/profileScreen";
  static const confirmSuccesScreen = "/confirmSuccesScreen";
  static const introduceScreen = "/introduceScreen";
  static const frequentlyQuestionScreen = "/frequentlyQuestionsScreen";
  static const signUpScreen = "/signUpScreen";
  static const forgetPassScreen = "/forgetPassScreen";
  static const noConnectScreen = "/noConnectScreen";
  static const gioHangScreen = "/gioHangScreen";
  static const historyScreen = "/historyScreen";
  static const passworkScreen = "/passworkScreen";
  static const settingScreen = "/deleteScreen";
  static const rattingScreen = "/rattingScreen";
  static const memberScreen = "/memberScreen";
}
