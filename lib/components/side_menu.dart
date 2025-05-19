import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SideMenu extends StatelessWidget {
  final int pageIndex;
  final ValueChanged<int> onItemTapped;
  final ValueChanged<String> onTitleTapped;

  const SideMenu({
    super.key,
    required this.pageIndex,
    required this.onItemTapped,
    required this.onTitleTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: secondaryColor,
        child: Stack(
          children: [
            ListView(
              children: [
                DrawerHeader(
                  child: Image.asset("assets/images/logo.webp"),
                ),
                DrawerListTile(
                  title: "Dashboard",
                  svgSrc: "assets/icons/dashboard.svg",
                  press: () {
                    onItemTapped(0);
                    onTitleTapped("Dashboard"); // Pass the title when tapped
                  },
                  isActive: pageIndex == 0,
                ),
                DrawerListTile(
                  title: "People",
                  svgSrc: "assets/icons/people.svg",
                  press: () {
                    onItemTapped(1);
                    onTitleTapped("People");
                  },
                  isActive: pageIndex == 1,
                ),
                DrawerListTile(
                  title: "Task",
                  svgSrc: "assets/icons/assignment.svg",
                  press: () {
                    onItemTapped(2);
                    onTitleTapped("Task");
                  },
                  isActive: pageIndex == 2,
                ),
                DrawerListTile(
                  title: "Calendar",
                  svgSrc: "assets/icons/calendar.svg",
                  press: () {
                    onItemTapped(3);
                    onTitleTapped("Calendar");
                  },
                  isActive: pageIndex == 3,
                ),
                DrawerListTile(
                  title: "Reports",
                  svgSrc: "assets/icons/reports.svg",
                  press: () {
                    onItemTapped(4);
                    onTitleTapped("Reports");
                  },
                  isActive: pageIndex == 4,
                ),
                DrawerListTile(
                  title: "Chat",
                  svgSrc: "assets/icons/chat.svg",
                  press: () {
                    onItemTapped(5);
                    onTitleTapped("Chat");
                  },
                  isActive: pageIndex == 5,
                ),
                DrawerListTile(
                  title: "Administration",
                  svgSrc: "assets/icons/administration.svg",
                  press: () {
                    onItemTapped(6);
                    onTitleTapped("Administration");
                  },
                  isActive: pageIndex == 6,
                ),
                DrawerListTile(
                  title: "Help",
                  svgSrc: "assets/icons/help.svg",
                  press: () {
                    onItemTapped(7);
                    onTitleTapped("Help");
                  },
                  isActive: pageIndex == 7,
                ),
                SizedBox(
                  height: 110,
                )
              ],
            ),
            Positioned(
                bottom: 12,
                left: 10,
                right: 10,
                child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                          )
                        ]),
                    child: Row(
                      spacing: 8,
                      children: [
                        Image.asset(
                          "assets/images/logo.webp",
                          height: 52,
                        ),
                        Column(
                          children: [
                            Text(
                              "Cleansera 1.0",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Premium",
                            )
                          ],
                        ),
                      ],
                    )))
          ],
        ));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isActive,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: isActive ? Color(0XFF2F80ED).withOpacity(0.2) : null,
        onTap: press,
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: ColorFilter.mode(
              isActive ? Colors.blue : Colors.black54, BlendMode.srcIn),
          height: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
