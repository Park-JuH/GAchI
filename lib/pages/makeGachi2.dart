import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/button.dart';
import '../components/texts.dart';
import 'package:gachi/pages/userAdd/gachiForm.dart';
/*    <모집자 페이지>
      가치만들기(생성)  페이지에 필요한 전반적인 화면을 관리하는 파일
*       1. 첫번째 화면 : Select_Datail(화면)
*       2. 두번째 화면 :  Select_Category(화면), buildSlider(위젯)
*       3. 세번째 화면 : Last_Step(화면)
*
* */

// 첫번째 가치만들기 페이지  : 가치 카테고리 선택!

class Select_Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '카테고리 선택',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.postTitleTextStyle,
                        ),
                        Text(
                          '어떤 가치를 만들 것입니까?',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.postSubTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: categoriesButtons(context,
                        onRadioButtonChanged: (category) {
                      print(category);
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 두번째 가치 페이지 - 성별, 사람 수 선택
class Select_Detail extends StatefulWidget {
  @override
  _Select_DetailState createState() => _Select_DetailState();
}

class _Select_DetailState extends State<Select_Detail> {
  @override
  Widget build(BuildContext context) {
    FormData formData = Provider.of<FormData>(context);
    return Container(
      alignment: Alignment.center,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '성별/인원 선택',
              textAlign: TextAlign.center,
              style: AppTextStyles.postTitleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '누구와 함께 가치를 만들 것입니까?',
              textAlign: TextAlign.center,
              style: AppTextStyles.postSubTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              value: formData.selectedGender,
              items: formData.genders.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                formData.updateSelectedGender(newValue!);
              },
              decoration: InputDecoration(
                labelText: "성별 선택",
                labelStyle: TextStyle(color: Colors.green),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            (formData.selectedGender == '혼성') ? buildSlider() : buildSlider(1),
          ],
        ),
      ),
    );
  }

  Widget buildSlider([int numberOfSliders = 2]) {
    FormData formData = Provider.of<FormData>(context);
    double value1 = formData.sliderValue1;
    double value2 = formData.sliderValue2;
    double maxValue = 10 - value1; // sliderValue1에 따라 maxValue를 계산

    return Column(
      children: List.generate(
        numberOfSliders,
            (index) =>
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.green,
                    inactiveTrackColor: Colors.green.withOpacity(0.5),
                    thumbColor: Colors.green,
                  ),
                  child: Slider(
                    value: index == 0 ? value1 : value2,
                    onChanged: (double value) {
                      setState(() {
                        if (index == 0) {
                          value1 = value;
                          maxValue =
                              10 - value1; // sliderValue1 변경에 따라 maxValue 재계산
                          if (value2 > maxValue) {
                            // sliderValue1에 의해 maxValue보다 sliderValue2가 큰 경우
                            value2 = maxValue;
                            formData.sliderValue2 = value2;
                          }
                        } else {
                          value2 = value;
                        }

                        formData.sliderValue1 = value1;
                        formData.sliderValue2 = value2;
                      });
                    },
                    min: 0,
                    max: index == 0 ? 10 : (maxValue >= 0 ? maxValue : 0),
 // index에 따라 max 값을 설정
                  ),
                ),
                Text(
                  (numberOfSliders == 2)
                      ? '${index == 0 ? "남자" : "여자"} 수: ${index == 0 ? value1
                      .toStringAsFixed(0) : value2.toStringAsFixed(0)}'
                      : '사람 수: ${value1.toStringAsFixed(0)}',
                ),
              ],
            ),
      ).toList(),
    );
  }
}

// 세번째 가치만들기 페이지 : 제목, 내용 입력
class Last_Step extends StatefulWidget {
  @override
  _Last_StepState createState() => _Last_StepState();
}

class _Last_StepState extends State<Last_Step> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FormData formData = Provider.of<FormData>(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '가치 시작!',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.postTitleTextStyle,
                    ),
                    const Text(
                      '함께 만들어가봐요.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.postSubTextStyle,
                    ),
                    TextField(
                      controller: titleController,
                      onChanged: (newTitle) {
                        formData.updateTitle(newTitle);
                      },
                      decoration: InputDecoration(
                        labelText: '제목 입력',
                      ),
                    ),
                    TextField(
                      controller: bodyController,
                      onChanged: (newBody) {
                        formData.updateBody(newBody);
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: '본문 입력',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
