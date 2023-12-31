import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';

class GradientView extends StatelessWidget {
  const GradientView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration : const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                HOME_SCREEN_BACKGROUND_COLOR
              ]
          ),
        )
    );
  }
}
