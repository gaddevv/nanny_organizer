import 'package:flutter/material.dart';
import 'package:nanny_organizer/components/custom_button.dart';
import 'package:nanny_organizer/globals.dart';
import 'package:nanny_organizer/screens/screens.dart';

// ignore: must_be_immutable
class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String textOne;
  final String textTwo;
  final Widget nextScreen;
  bool? finish;
  OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.textOne,
    required this.textTwo,
    this.finish = false,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xFF726FFF),
      child: Padding(
        padding: EdgeInsets.only(top: 60, left: 35, right: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset('$image'),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(color: Color(0xFFBCBCE3), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    Text(
                      title,
                      style: TextStyle(color: Color(0XFF726EFF), fontSize: 28, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 7, left: 10),
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                            ),
                            Expanded(
                              child: Text(
                                textOne,
                                style: TextStyle(color: Color(0XFF0C1654), fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Roboto'),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 7, left: 10),
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                            ),
                            Expanded(
                              child: Text(
                                textTwo,
                                style: TextStyle(color: Color(0XFF0C1654), fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Roboto'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              finish!
                  ? Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          onPressed: () {
                            pushPage(context, Screens());
                          },
                          color: Color(0XFF58FFE3),
                          borderRadius: BorderRadius.circular(16),
                          child: Text(
                            'Начать',
                            style: TextStyle(color: Color(0XFF0C1654), fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                          ),
                        )),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          onPressed: () {
                            pushPage(context, Screens());
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Text(
                            'Пропустить',
                            style: TextStyle(color: Color(0XFF0C1654), fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                          ),
                        )),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Expanded(
                            child: CustomButton(
                          onPressed: () {
                            pushPage(context, nextScreen);
                          },
                          color: Color(0XFF58FFE3),
                          borderRadius: BorderRadius.circular(16),
                          child: Text(
                            'Продолжить',
                            style: TextStyle(color: Color(0XFF0C1654), fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                          ),
                        )),
                      ],
                    ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Условия использования',
                      style: TextStyle(color: Color(0XFFBCBCE3), fontSize: 10, fontWeight: FontWeight.w300, fontFamily: 'Roboto'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      color: Color(0XFF58FFE3),
                      height: 12,
                      width: 1,
                    ),
                    Text(
                      'Политика конфиденциальности',
                      style: TextStyle(color: Color(0XFFBCBCE3), fontSize: 10, fontWeight: FontWeight.w300, fontFamily: 'Roboto'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
