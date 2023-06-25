part of 'cart_screen.dart';

extension CartScreenExtension on _GioHangScreenState {
  int calculatorPrice(List<ModelCart> listCart, int sum) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].value == true) {
        print("calculatePrice");
        sum = sum + listCart[i].gia * listCart[i].soLuong;
      }
    }
    return sum;
  }

  int calculatorUserPick(List<ModelCart> listCart, int number) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].value == true) {
        number++;
      }
    }
    return number;
  }

// Sử dụng tính tổng tất cả sp
  int calculatorTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < listSpa.length; i++) {
      if (listSpa[i].isChoose) {
        if (listSpa[i].listService != null) {
          totalPrice = calculatorPrice(listSpa[i].listService!, totalPrice);
          print(totalPrice.toString());
        }
        if (listSpa[i].listPacket != null) {
          totalPrice = calculatorPrice(listSpa[i].listPacket!, totalPrice);
          print(totalPrice.toString());
        }
      }
    }
    return totalPrice;
  }

  int calculatorTotalSelect() {
    totalServiceSelect = 0;
    for (int i = 0; i < listSpa.length; i++) {
      if (listSpa[i].isChoose) {
        if (listSpa[i].listService != null) {
          totalServiceSelect =
              calculatorUserPick(listSpa[i].listService!, totalServiceSelect);
        }
        if (listSpa[i].listPacket != null) {
          totalServiceSelect =
              calculatorUserPick(listSpa[i].listPacket!, totalServiceSelect);
        }
      }
    }
    return totalServiceSelect;
  }

//Sử dụng cho checkbox ngoài cùng tickall
  tickAllService(SpaService spaService) {
    if (spaService.isChoose) {
      if (spaService.listService != null) {
        for (ModelCart service in spaService.listService!) {
          service.value = true;
        }
      }
    } else {
      if (spaService.listService != null) {
        for (ModelCart service in spaService.listService!) {
          service.value = false;
        }
      }
    }
  }

  tickAllPackget(SpaService spaService) {
    if (spaService.isChoose) {
      if (spaService.listPacket != null) {
        for (ModelCart package in spaService.listPacket!) {
          package.value = true;
        }
      }
    } else {
      if (spaService.listPacket != null) {
        for (ModelCart package in spaService.listPacket!) {
          package.value = false;
        }
      }
    }
  }
}
