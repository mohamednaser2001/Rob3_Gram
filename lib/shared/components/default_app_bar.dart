import 'package:flutter/material.dart';

import '../constants.dart';


class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{

  DefaultAppBar({Key? key,}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[800],
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset('$imagePath/logo_no.png'),
      ),
    );
  }



  @override
  final Size preferredSize;
}