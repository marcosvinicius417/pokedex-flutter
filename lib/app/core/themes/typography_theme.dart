import 'package:flutter/material.dart';

class TypographyTheme {
  static const String primaryFont = 'NunitoSans';
}

BuildContext? buildContext;

void setBuildContext(BuildContext context) {
  buildContext = context;
}

TextStyle loginTitle = const TextStyle(
  fontSize: 30,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle h2 = const TextStyle(
  fontSize: 20,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle h3 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle h4 = const TextStyle(
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle h5 = const TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle h6 = const TextStyle(
  fontSize: 14,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle regular = const TextStyle(
  fontSize: 13,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle semiBold = const TextStyle(
  fontSize: 15,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle hintText = const TextStyle(
  fontSize: 12,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontFamily: TypographyTheme.primaryFont,
);

TextStyle labelText = const TextStyle(
  fontSize: 15,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontFamily: TypographyTheme.primaryFont,
);
