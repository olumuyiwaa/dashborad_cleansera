import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/menu_app_controller.dart';
import '../responsive.dart';

class Header extends StatefulWidget {
  final String title;

  final ValueChanged<int> onItemTapped;
  final ValueChanged<String> onTitleTapped;
  const Header({
    Key? key,
    required this.title,
    required this.onItemTapped,
    required this.onTitleTapped,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(
                "assets/icons/${widget.title.toLowerCase()}.svg",
                color: Colors.grey,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        if (!Responsive.isMobile(context)) SizedBox(width: 12),
        Expanded(child: SearchField()),
        SizedBox(
          width: defaultPadding,
        ),
        profileCard(context)
      ],
    );
  }

  Widget profileCard(BuildContext context) {
    return PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'administration') {
            widget.onItemTapped(5);
            widget.onTitleTapped("Administration");
          } else if (value == 'logout') {
            Navigator.pop(context);
          }
        },
        offset: const Offset(0, 48),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'administration',
                child: Row(spacing: 8, children: [
                  SvgPicture.asset(
                    "assets/icons/administration.svg",
                    color: Colors.black,
                  ),
                  Text('Administration')
                ]),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ],
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/administration.svg",
                color: Colors.black,
              ),
              if (!Responsive.isMobile(context))
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: Text("United Cleaning Service"),
                ),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ));
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
