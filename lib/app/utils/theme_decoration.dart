import 'package:flutter/material.dart';
import 'package:starting_slicing/app/constants/export.dart';

// Custom page transition with no animation
PageRouteBuilder noTransitionPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(seconds: 0),
  );
}

ThemeData themeDataDecoration() {
  return ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: NoTransitionBuilder(),
        TargetPlatform.iOS: NoTransitionBuilder(),
      },
    ),
    //Global font family
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      error: AppColor.error,
    ),
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.primary;
        }
        return Colors.white;
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.white;
      }),
      side: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.5);
        }
        return BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.5);
      }),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.bold(fontSize: 20, color: Colors.black),
    ),
    fontFamily: 'Inter',
    primaryColor: AppColor.primary,
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      headerBackgroundColor: AppColor.primary,
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.primary;
        }
        return Colors.white;
      }),
      // cancelButtonStyle: ButtonStyle(
      //   textStyle: WidgetStateProperty.all(
      //     AppTextStyle.regular(fontSize: 16, color: Colors.white),
      //   ),
      // ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        labelStyle: AppTextStyle.regular(
          fontSize: AppFontSize.h5,
          color: Colors.black.withOpacity(0.7),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
      ),
      headerHelpStyle: AppTextStyle.regular(
        fontSize: AppFontSize.h5,
        color: Colors.white,
      ),
      headerHeadlineStyle: AppTextStyle.bold(
        fontSize: AppFontSize.h5,
        color: Colors.white,
      ),
      dayStyle: AppTextStyle.regular(
        fontSize: AppFontSize.h5,
        color: Colors.black,
      ),
      weekdayStyle: AppTextStyle.bold(
        fontSize: AppFontSize.h5,
        color: Colors.white,
      ),
      yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.primary;
        }
        return Colors.white;
      }),
      // cancelButtonStyle: cancelButtonStyle,
      // confirmButtonStyle: confirmButtonStyle,
      // todayStyle: AppTextStyle.regular(fontSize: 14, color: Colors.black),
      // weekendStyle: AppTextStyle.regular(fontSize: 14, color: Colors.red),
    ),
  );
}

// import 'package:flutter/material.dart';

ButtonStyle cancelButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.white, // For cancel button, typically red

  textStyle: AppTextStyle.regular(
    fontSize: 16,
    color: Colors.white,
  ), // White text on red background
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);

ButtonStyle confirmButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.green, // For confirm button, typically green
  textStyle: AppTextStyle.regular(
    fontSize: 16,
    color: Colors.white,
  ), // White text on green background
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);

class NoTransitionBuilder extends PageTransitionsBuilder {
  const NoTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
