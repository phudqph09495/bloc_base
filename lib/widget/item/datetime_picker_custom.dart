//
//
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//
// class CustomPicker extends CommonPickerModel {
//   CustomPicker({required DateTime currentTime, LocaleType? locale}) : super(locale: locale) {
//     this.currentTime = currentTime ?? DateTime.now();
//   }
//   String yearDigits(int value) {
//     return '$value';
//   }
//
//   String monthDigits(int value) {
//     return 'Tháng $value';
//   }
//
//   @override
//   String leftStringAtIndex(int index) {
//     return index >= DateTime.now().year - 100 &&
//         index <= DateTime.now().year - 18
//         ? '$index'
//         : null;
//   }
//
//   @override
//   String middleStringAtIndex(int index) {
//     return index <= 12 && index >= 1 ? monthDigits(index) : null;
//   }
//
//   @override
//   String rightStringAtIndex(int index) {
//     return null;
//   }
//   @override
//   String? rightStringAtIndex(int index) {
//     if (index >= 0 && index < 60) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   List<int> layoutProportions() {
//     return [1, 2, 1];
//   }
//
//   @override
//   DateTime finalTime() {
//     return currentTime.isUtc
//         ? DateTime.utc(currentTime.day, currentTime.month, currentTime.year,
//         this.currentLeftIndex(), this.currentMiddleIndex(), this.currentRightIndex())
//         : DateTime(currentTime.day, currentTime.month, currentTime.year, this.currentLeftIndex(),
//         this.currentMiddleIndex(), this.currentRightIndex());
//   }
//
// }