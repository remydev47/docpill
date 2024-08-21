import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/src/doctors/views/doctors_page.dart';
import 'package:docpill/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:docpill/src/history/views/history_page.dart';
import 'package:docpill/src/home/views/homescreen.dart';
import 'package:docpill/src/pharmacy/views/pharmacy_page.dart';
import 'package:docpill/src/profile/views/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Entrypoint extends StatelessWidget {
  Entrypoint({super.key});

  List<Widget> pageList = [
    const Homescreen(),
    const DoctorsPage(),
    const PharmacyPage(),
    const HistoryPage(),
    const Profilescreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data:
                      Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    backgroundColor: Kolors.kOffWhite,
                    showSelectedLabels: true,
                    selectedLabelStyle:
                        appStyle(9, Kolors.kDark, FontWeight.w500),
                    showUnselectedLabels: false,
                    currentIndex: tabIndexNotifier.index,
                    selectedItemColor: Kolors.kDark,
                    unselectedItemColor: Kolors.kGrayLight,
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.black26),
                    onTap: (i) {
                      tabIndexNotifier.setIndex(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          MaterialIcons.home_filled,
                          color: Kolors.kPrimaryLight,
                          size: 26,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          MaterialCommunityIcons.calendar,
                          color: Kolors.kPrimaryLight,
                          size: 34,
                        ),
                        label: 'Booking',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          MaterialCommunityIcons.stethoscope,
                          color: Kolors.kPrimary,
                          size: 26,
                        ),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          MaterialIcons.receipt_long,
                          color: Kolors.kPrimaryLight,
                          size: 26,
                        ),
                        label: 'History',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          EvilIcons.user,
                          color: Kolors.kPrimaryLight,
                          size: 34,
                        ),
                        label: 'Home',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
