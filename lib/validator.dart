class ValidatorApp {
  static checkNull({String? text,String? code}) {
    if (text == "null" || text == null || text == "") {
      return code=='en' ? "Please fill all required fields." : "Không bỏ trống";
    } else {
      return null;
    }
  }

  static checkPass({String? text, String? text2, bool confirm = false,String? code}) {
    RegExp isPass = RegExp(
        "^(?=.{8,}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*");
    if (text == "null" || text == null || text == "") {
      return "Không bỏ trống";
    } else if (text != text2 && confirm) {
      return "Mật khẩu không khớp";
    } else {
      return null;
    }
  }

  static checkEmail({
    String? text,
  }) {
    var isEmail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (text == "null" || text == null || text == "") {
      return "Không bỏ trống";
    } else if (!isEmail.hasMatch(text)) {
      return "Email không đúng định dạng";
    } else {
      return null;
    }
  }

  static checkPhone({
    String? text,
  }) {
    if (text == "null" || text == null || text == "") {
      return "Không bỏ trống";
    } else if (text.length != 10 || !text.startsWith("0")) {
      return "Số điện thoại không đúng định dạng";
    } else {
      return null;
    }
  }
}
