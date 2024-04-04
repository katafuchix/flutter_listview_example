import 'package:flutter/material.dart';
import 'colors.dart';
import 'my_platform.dart';

enum TextWight { SMALL, NORMAL, LARGE }

extension _TextWightExt on TextWight {
  FontWeight get value {
    switch (this) {
      case TextWight.SMALL:
        return FontWeight.w200;
      case TextWight.NORMAL:
        return FontWeight.normal;
      case TextWight.LARGE:
        return FontWeight.bold;
      default:
        throw StateError('error');
    }
  }
}

enum TextHeight { SMALL, STANDARD, LARGE }

extension _TextHeightExt on TextHeight {
  double get value {
    switch (this) {
      case TextHeight.SMALL:
        return 0.8;
      case TextHeight.STANDARD:
        return 1.0;
      case TextHeight.LARGE:
        return 1.8;
      default:
        throw StateError('error');
    }
  }
}

enum TextSize {
  VERY_SMALL,
  SMALL,
  MEDIUM,
  LARGE,
  VERY_LARGE,
  HUGE,
  VERY_HUGE,
}

extension _TextSizeExt on TextSize {
  double get value {
    switch (this) {
      case TextSize.VERY_SMALL:
        return 8;
      case TextSize.SMALL:
        return 10;
      case TextSize.MEDIUM:
        return 12;
      case TextSize.LARGE:
        return 14;
      case TextSize.VERY_LARGE:
        return 18;
      case TextSize.HUGE:
        return 24;
      case TextSize.VERY_HUGE:
        return 32;
      default:
        throw StateError('error');
    }
  }
}


// 見出しやタイトルに使う
// 1画面に数個まで
Widget buildH3Text(String text,
    {int maxLines = 5,
      //TextColors colors = TextColors.PRIMARY_TEXT,
      Color color = Colors.white,
      TextAlign? textAlign,
      TextHeight? height,
      TextDecoration? decoration}) =>
    _buildBaseText(text,
        maxLines: maxLines,
        color: color,
        textAlign: textAlign,
        fontSize: TextSize.VERY_LARGE,
        weight: TextWight.NORMAL,
        decoration: decoration);


Widget _buildBaseText(String text,
    {int maxLines = 5,
      //TextColors colors = TextColors.PRIMARY_TEXT,
      Color color = Colors.white,
      TextAlign? textAlign,
      TextSize fontSize = TextSize.MEDIUM,
      TextWight weight = TextWight.NORMAL,
      TextHeight? height,
      TextDecoration? decoration}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: createAppTextStyle(
        color: color,
        fontSize: fontSize,
        height: height,
        weight: weight,
        decoration: decoration),
  );
}

TextStyle createAppTextStyle(
    {int maxLines = 5,
      //TextColors colors = TextColors.PRIMARY_TEXT,
      Color color = Colors.white,
      TextAlign? textAlign,
      TextSize fontSize = TextSize.MEDIUM,
      TextWight weight = TextWight.NORMAL,
      TextHeight? height,
      TextDecoration? decoration}) {
  String? fontFamily;
  if (MyPlatform.isAndroid) {
    // 試験的に導入
    fontFamily = 'NotoSansJP-Regular';
  }
  return TextStyle(
      color: color,
      fontSize: fontSize.value,
      height: height?.value,
      fontWeight: weight.value,
      fontFamily: fontFamily,
      decoration: decoration);
}
