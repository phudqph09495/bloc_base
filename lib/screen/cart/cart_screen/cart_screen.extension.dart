part of 'cart_screen.dart';

extension CartScreenExtension on _GioHangScreenState {
  int calculatePrice(List<ModelCart> listCart, int sum) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].value == true) {
        sum = sum + listCart[i].gia * listCart[i].soLuong;
      }
    }
    return sum;
  }

  int calculateUserPickService(List<ModelCart> listCart, int number) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].value == true) {
        numberServiceHasPick++;
      }
    }
    return numberServiceHasPick;
  }
}
