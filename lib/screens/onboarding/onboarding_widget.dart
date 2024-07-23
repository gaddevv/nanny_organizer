import 'package:flutter/material.dart';
import 'package:nanny_organizer/components/custom_button.dart';
import 'package:nanny_organizer/components/style.dart';
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
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(114, 110, 255, 1),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(188, 188, 227, 1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      blurRadius: 5,
                      color: Color.fromRGBO(160, 175, 175, 0.25),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        title,
                        style: onboardingTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
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
                              style: onboardingText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
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
                              style: onboardingText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          pushPage(context, Screens());
                        },
                        height: 40,
                        child: Text(
                          'Пропустить',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Prata',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          pushPage(context, nextScreen);
                        },
                        height: 40,
                        color: Color.fromRGBO(88, 255, 227, 1),
                        borderRadius: BorderRadius.circular(16),
                        child: Text(
                          'Продолжить',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Prata'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () => launchURL(uri: 'https://flutter.dev'),
                    child: Text(
                      'Условия использования ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(188, 188, 227, 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(88, 255, 227, 1),
                    ),
                    width: 1,
                    height: 15,
                  ),
                  RawMaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () => launchURL(uri: 'https://dart.dev'),
                    child: Text(
                      'Политика конфиденциальности',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(188, 188, 227, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
