import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gachi/pages/userAdd/userAdd.dart';
import 'package:image_picker/image_picker.dart';

String warning = "값이 입력되지 않았어요!";


class userAddForm extends StatefulWidget {
  userAddForm(this.pageNum, this.title, this.text, this.hint, this.limit, this.next);
  final double pageNum;
  final String title;
  final String text;
  final String hint;
  final int limit;
  var next;


  @override
  State<userAddForm> createState() => _userAddFormState();
}

class _userAddFormState extends State<userAddForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }


  @override

  void dispose() {
    _textEditingController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }

  Widget build(BuildContext context) {
    double pageNum = widget.pageNum;
    String title = widget.title;
    String text = widget.text;
    String hint = widget.hint;
    int limit = widget.limit;
    var next = widget.next;


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded),),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pageNum == 4 ?
                  Column(
                    children: [
                      _image != null
                      ? Container(
                        width: 300,
                        height: 300,
                        child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
                      )
                          : Container(
                      width: 300,
                      height: 300,
                      color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFEF8C00),
                                  elevation: 0
                              ),

                              onPressed: () {
                                getImage(ImageSource.camera); //getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
                              },
                              child: Text("카메라"),
                            ),
                            SizedBox(width: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFEF8C00),
                                  elevation: 0
                              ),
                              onPressed: () {
                                getImage(ImageSource.gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                              },
                              child: Text("갤러리"),
                            ),
                        ],
                      ),
                    ],
                  )
                  : Form(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      onSaved: (value){
                        setState((){
                          value = value as String;
                        });
                      },
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return '값을 입력해주세요';
                        }
                        return null;
                      },
                      maxLength: limit,
                      obscureText: pageNum != 2 ? false : true,
                      decoration: InputDecoration(hintText: hint),),
                  ),
                  Text(text),
                  const SizedBox(height: 20,),
                  pageNum != 2 ? const SizedBox(height: 0,) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        maxLength: limit,
                        obscureText: true,
                        decoration: InputDecoration(hintText: hint),),
                      const Text('비밀번호를 다시 입력해주세요'),
                      const SizedBox(height: 30,)
                    ],
                  ),
                  pageNum == 1 ? Row(children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFEF8C00),
                            elevation: 0
                        ),
                        onPressed: (){

                    }, child: const Text('중복확인')),
                    const SizedBox(width: 30,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFEF8C00),
                            elevation: 0
                        ),
                        onPressed: (){
                          if (_formKey.currentState != null) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                            }
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> next));
                        },

                        child: const Text('다음')),
                  ],) :
                  ElevatedButton(
                    onPressed: (){

                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                        }
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> next));

                    },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEF8C00),
                        elevation: 0
                      ),
                      child: pageNum == 4 ? const Text('완료') : const Text('다음')),
                ],
              )
          ),
          const SizedBox(
            height: 0,
          ),
          const SizedBox(
            height: 0,
          ),
        ],
      ),
    );
  }
}
