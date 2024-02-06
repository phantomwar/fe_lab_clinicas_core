import 'package:flutter/material.dart';

class AppCustomAppBar extends AppBar {
  AppCustomAppBar({
    super.key,
    super.actions,
  }) : super(
          toolbarHeight: 72,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 1),
                blurRadius: 4,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 64),
              child: Image.asset('assets/images/logo_horizontal.png'),
            ),
          ),
        );
}
