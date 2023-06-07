import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

Widget itemLoadMore({
  bool length = false,
  bool hasMore = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      length
          ? "Đã tải hết danh sách"
          : hasMore
              ? "Đang tải..."
              : "",
      textAlign: TextAlign.center,
      style: StyleApp.textStyle400(),
    ),
  );
}

Widget itemListEmpty() {
  return Center(
    child: Text(
      "Danh sách trống",
      textAlign: TextAlign.center,
      style: StyleApp.textStyle400(),
    ),
  );
}
