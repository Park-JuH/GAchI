import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
/*
*     사용자가 가치를 만드는 동안 유저가 선택하거나 입력한 정보를 추적하고 저장하는 역할의 코드입니다.
*
*
* */
class FormData extends ChangeNotifier {
  String selectedGender = '상관없음';
  List<String> genders = ['여자', '남자', '상관없음', '혼성'];
  double sliderValue1 = 0.0;
  double sliderValue2 = 0.0;
  String category = '';
  String title = '';
  String body = '';

  //
  void updateSelectedGender(String newSelectedGender) {
    selectedGender = newSelectedGender;
    notifyListeners();
  }
  void updateSliderValue1(double newSliderValue1) {
    sliderValue1 = newSliderValue1;
    notifyListeners();
  }

  void updateSliderValue2(double newSliderValue2) {
    sliderValue2 = newSliderValue2;
    notifyListeners();
  }
  void updateCategory(String newCategory) {
    category = newCategory;
    notifyListeners();
  }

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void updateBody(String newBody) {
    body = newBody;
    notifyListeners();
  }
}
