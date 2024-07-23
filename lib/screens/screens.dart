import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanny_organizer/globals.dart';
import 'package:nanny_organizer/screens/diary.dart';
import 'package:nanny_organizer/screens/home.dart';
import 'package:nanny_organizer/screens/schedule.dart';
import 'package:nanny_organizer/screens/settings.dart';
import 'package:nanny_organizer/screens/situations.dart';
import 'package:nanny_organizer/screens/views/add_schedule.dart';

class Screens extends StatefulWidget {
  Screens({
    super.key,
  });

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;
  String title = 'Главная';
  activeScreen(int index) {
    setState(() {
      currentIndex = index;
      if (index == 0) title = 'Главная';
      if (index == 1) {
        title = 'Расписание';
      }
      if (index == 2) title = 'Дневник Прогресса';
      if (index == 3) title = 'Тревожные Ситуации';
      if (index == 4) title = 'Настройки';
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    List<Widget> screens = [
      HomeScreen(),
      ScheduleScreen(),
      DiaryScreen(),
      SituationsScreen(),
      SettingsScreen(),
    ];
    return Stack(
      children: [
        Image.asset(
          'assets/images/launch.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: SafeArea(
              child: Container(
                height: 100,
                width: width - 100,
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.spaceBetween,
                  spacing: width - (width / 2 + 55),
                  children: [
                    Text(
                      title,
                      maxLines: null,
                      style: TextStyle(
                        color: Color(0XFF726EFF),
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    if (currentIndex == 1)
                      IconButton(
                        onPressed: () {
                          pushPage(context, AddSchedule());
                        },
                        icon: SvgPicture.asset('assets/icons/schedule-icon.svg'),
                      ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 80,
            child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: activeScreen,
                selectedItemColor: Color(0XFF07C6AC),
                showUnselectedLabels: false,
                selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/navigation-bar/home.svg'),
                      label: 'Главная',
                      activeIcon: SvgPicture.asset('assets/icons/navigation-bar/home.svg',
                          colorFilter: ColorFilter.mode(Color(0XFF07C6AC), BlendMode.srcIn))),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/navigation-bar/schedule.svg'),
                      label: 'Расписание',
                      activeIcon: SvgPicture.asset('assets/icons/navigation-bar/schedule.svg',
                          colorFilter: ColorFilter.mode(Color(0XFF07C6AC), BlendMode.srcIn))),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/navigation-bar/diary.svg'),
                      label: 'Дневник',
                      activeIcon: SvgPicture.asset('assets/icons/navigation-bar/diary.svg',
                          colorFilter: ColorFilter.mode(Color(0XFF07C6AC), BlendMode.srcIn))),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/navigation-bar/situations.svg'),
                      label: 'Ситуации',
                      activeIcon: SvgPicture.asset('assets/icons/navigation-bar/situations.svg',
                          colorFilter: ColorFilter.mode(Color(0XFF07C6AC), BlendMode.srcIn))),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/navigation-bar/settings.svg'),
                      label: 'Настройки',
                      activeIcon: SvgPicture.asset('assets/icons/navigation-bar/settings.svg',
                          colorFilter: ColorFilter.mode(Color(0XFF07C6AC), BlendMode.srcIn))),
                ]),
          ),
          body: Center(child: screens[currentIndex]),
        ),
      ],
    );
  }
}
