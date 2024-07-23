import 'package:flutter/material.dart';
import 'package:nanny_organizer/screens/onboarding/onboarding_widget.dart';
import 'package:nanny_organizer/screens/screens.dart';

class OnboardingStep1 extends StatelessWidget {
  const OnboardingStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        image: 'assets/images/onboarding/onboarding1.png',
        title: 'Расписание',
        textOne: 'Создавайте и отслеживайте расписания детей на каждый день.',
        textTwo: 'Добавляйте события, не пропускайте важные дела и контролируйте процент их выполнения',
        nextScreen: OnboardingStep2(),
      ),
    );
  }
}

class OnboardingStep2 extends StatelessWidget {
  const OnboardingStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        image: 'assets/images/onboarding/onboarding2.png',
        title: 'Дневник Прогресса',
        textOne: 'Ведите записи о поведении,\nэмоциональном состоянии и\nдостижениях каждого ребенка.',
        textTwo: 'Добавляйте комментарии и заметки о наблюдениях и прогрессе.',
        nextScreen: OnboardingStep3(),
      ),
    );
  }
}

class OnboardingStep3 extends StatelessWidget {
  const OnboardingStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        image: 'assets/images/onboarding/onboarding3.png',
        title: 'Тревожные Ситуации',
        textOne: 'Добавляйте собственные инструкций или используйте имеющиеся',
        textTwo: 'Записывайте необходимые контакты экстренных случаев.',
        finish: true,
        nextScreen: Screens(),
      ),
    );
  }
}
