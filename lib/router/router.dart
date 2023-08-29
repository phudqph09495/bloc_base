import 'package:bloc_base/homepage.dart';
import 'package:bloc_base/model/model_local.dart';
import 'package:bloc_base/screen/auth/account_screen/member_screen.dart';
import 'package:bloc_base/screen/auth/history_screen/history_screen.dart';
import 'package:bloc_base/screen/auth/profile_screen/re_password_screen.dart';
import 'package:bloc_base/screen/auth/sale_screen/sale_menber_screen.dart';
import 'package:bloc_base/screen/cart/confirm_screen/confirm_screen.dart';
import 'package:bloc_base/screen/home/home_screen/home_screen%20copy.dart';
import 'package:bloc_base/screen/home/notification_screen/notification_screen.dart';
import 'package:bloc_base/screen/search/search_tab_screen/view/search_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../screen/auth/my_ratting_screen/my_ratting_screen.dart';
import '../screen/auth/my_ratting_screen/rate_ser_screen.dart';
import '../screen/auth/profile_screen/password_screen.dart';
import '../screen/auth/setting_screen/setting_screen.dart';
import '../screen/auth/ttHT/ttht_screen.dart';
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
import '../screen/auth/favourite_screen/view/favourite_screen.dart';
import '../screen/home/home_screen/home_screen.dart';
import '../screen/login/login_screen/pages/auth_page.dart';
import '../screen/login/login_screen/pages/login_screen.dart';
import '../screen/login/login_screen/pages/otp_screen.dart';
import '../screen/login/login_screen/pages/phone_number_sign_up.dart';
import '../screen/login/signup_screen/page/signup_screen.dart';
import '../screen/search/info_service/info_service.dart';
import '../screen/search/info_spa_screen/info_spa_screen.dart';

class RouterName {
  static const authScreen = "/authScreen";
  static const homeScreen = "/homeScreen";
  static const loginScreen = "/loginScreen";
  static const confirmPhoneNumberScreen = '/confirmPhoneNumberScreen';
  static const confirmOTPScreen = '/confirmOTPScreen';
  static const confirmScreen = "/confirmScreen";
  static const simpleBarcodeScannerPage = "/simpleBarcodeScannerPage";
  static const notifyScreen = "/notifyScreen";
  static const infoSpaScreen = "/infoSpaScreen";
  static const infoService = "/infoService";
  static const myHomePage = "myHomePage";
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
  static const rateSer = "/rateSerScreen";
  static const memberScreen = "/memberScreen";
  static const homeScreenTest = "/homeScreenTest";
  static const rePassworkScreen = "/rePassworkScreen";
  static const ttHTScreen = "/TTHTScreen";
  static const saleMenberScreen = "/saleMenberScreen";
  static const searchTabScreen = '/searchTabScreen';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouterName.searchTabScreen:
        return MaterialPageRoute(builder: (context) => const SearchTabScreen());
      case RouterName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouterName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouterName.confirmScreen:
        return MaterialPageRoute(builder: (context) => const ConfirmScreen());
      case RouterName.simpleBarcodeScannerPage:
        return MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage());
      case RouterName.notifyScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case RouterName.infoSpaScreen:
        return MaterialPageRoute(builder: (context) => const InfoSpaScreen());
      case RouterName.infoService:
        return MaterialPageRoute(builder: (context) => const InfoService());
      case RouterName.myHomePage:
         if(args is int){
           return MaterialPageRoute(builder: (context) => MyHomePage( selectedIndex: args,));
         }
         break;
      case RouterName.paymentScreen:
        return MaterialPageRoute(builder: (context) => const PaymentScreen());
      case RouterName.successScreen:
        return MaterialPageRoute(builder: (context) => const SuccessScreen());
      case RouterName.bookingCodeScreen:
        return MaterialPageRoute(
            builder: (context) => const BookingCodeScreen());
      case RouterName.registerMemberScreen:
        return MaterialPageRoute(
            builder: (context) => const RegisterMemberScreen());
      case RouterName.bookedPackageScreen:
        return MaterialPageRoute(
            builder: (context) => const BookedPackageScreen());
      case RouterName.favouriteScreen:
        return MaterialPageRoute(builder: (context) => const FavouriteScreen());
      case RouterName.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case RouterName.confirmSuccesScreen:
        return MaterialPageRoute(
            builder: (context) => const ConfirmSuccesScreen());
      case RouterName.introduceScreen:
        return MaterialPageRoute(builder: (context) => const IntroduceScreen());
      case RouterName.frequentlyQuestionScreen:
        return MaterialPageRoute(
            builder: (context) => const FrequentlyQuestionsScreen());
      case RouterName.signUpScreen:
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => SignUpScreen(numberPhone: args));
        }
        break;
      case RouterName.forgetPassScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgetPassScreen());
      case RouterName.noConnectScreen:
        return MaterialPageRoute(builder: (context) => const NoConnectScreen());
      case RouterName.gioHangScreen:
        return MaterialPageRoute(builder: (context) => const GioHangScreen());
      case RouterName.historyScreen:
        return MaterialPageRoute(builder: (context) => const HistoryScreen());
      case RouterName.passworkScreen:
        return MaterialPageRoute(builder: (context) => const PassworkScreen());
      case RouterName.ttHTScreen:
        return MaterialPageRoute(builder: (context) => const TTHTScreen());
      case RouterName.settingScreen:
        return MaterialPageRoute(builder: (context) => const SettingScreen());
      case RouterName.rattingScreen:
        return MaterialPageRoute(builder: (context) => const RattingScreen());
      case RouterName.rateSer:
        return MaterialPageRoute(builder: (context) => const DanhGiaDVSCreen());
      case RouterName.memberScreen:
        if (args is BunldData) {
          return MaterialPageRoute(
              builder: (context) => MemberScreen(data: args));
        }
        break;
      case RouterName.homeScreenTest:
        return MaterialPageRoute(builder: (context) => const HomeScreenTest());
      case RouterName.rePassworkScreen:
        return MaterialPageRoute(
            builder: (context) => const RePassworkScreen());
      case RouterName.saleMenberScreen:
        return MaterialPageRoute(
            builder: (context) => const SaleMenberScreen());
      case RouterName.authScreen:
        return MaterialPageRoute(builder: (context) => const AuthPage());
      case RouterName.confirmPhoneNumberScreen:
        return MaterialPageRoute(
            builder: (context) => const PhoneNumberSignUp());
      case RouterName.confirmOTPScreen:
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => OTPScreen(numberPhone: args));
        }
        break;
    }
    return MaterialPageRoute(builder: (_)=> NoConnectScreen());
  }
}
