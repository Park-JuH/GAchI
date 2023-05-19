import 'package:flutter/cupertino.dart';

import 'colors.dart';

// text 디자인 관리하는 코드 !
class AppTextStyles {
  static const TextStyle mainStyle = TextStyle(
    fontSize: 19.0,
    color: AppColors.textColor,     // black
    fontWeight: FontWeight.w100,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 15.0,
    color: AppColors.textColor,
  );
  static const TextStyle sub1Style = TextStyle(
    fontSize: 15.0,
    color: AppColors.textColor,
  );

  static const TextStyle stateTextStyle = TextStyle(
    fontSize: 15.0,
    color:AppColors.stateText
  );

}
