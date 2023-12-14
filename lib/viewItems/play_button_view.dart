import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';

class playButtonView extends StatelessWidget {
  const playButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.play_circle_fill,
      color: PLAY_BUTTON_COLOR,
      size: 50,);
  }
}