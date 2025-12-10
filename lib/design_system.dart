import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ============================================================================
// DESIGN SYSTEM - MINUTE MASTER
// ============================================================================

// ============================================================================
// COLORS
// ============================================================================

class AppColors {
  // Primary Background (Deep Dark Blue)
  static const Color backgroundPrimary = Color(0xFF0A0B1E);

  // Secondary Backgrounds (Cards, Panels)
  static const Color backgroundSecondary = Color(0xFF11152A);
  static const Color backgroundTertiary = Color(0xFF1A1F3A);
  static const Color backgroundOverlay = Color(0xCC0A0B1E); // 80% opacity

  // Primary Accent (Electric Cyan)
  static const Color accentPrimary = Color(0xFF00D4FF);
  static const Color accentPrimaryLight = Color(0xFF33E0FF);
  static const Color accentPrimaryDark = Color(0xFF00A8CC);

  // Secondary Accent (Electric Purple)
  static const Color accentSecondary = Color(0xFF9D4EDD);
  static const Color accentSecondaryLight = Color(0xFFB077F3);

  // Neutral Colors (Text & UI)
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textTertiary = Color(0xFF808080);
  static const Color textDisabled = Color(0xFF4D4D4D);

  // Status Colors (Subtle)
  static const Color success = Color(0xFF00C853);
  static const Color successLight = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);

  // Dividers & Borders
  static const Color divider = Color(0xFF2A2D4A);
  static const Color border = Color(0xFF2A2D4A);
  static const Color borderFocus = accentPrimary;

  // Timer Colors
  static const Color timerActive = accentPrimary;
  static const Color timerInactive = Color(0xFF404040);
  static const Color timerWarning = warning;

  // Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A0B1E),
      Color(0xFF0F1125),
      Color(0xFF0A0B1E),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      accentPrimary,
      accentPrimaryLight,
    ],
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x3300D4FF), // accentPrimary with 20% opacity
      Color(0x1100D4FF), // accentPrimary with 7% opacity
    ],
  );
}

// ============================================================================
// TYPOGRAPHY
// ============================================================================

class AppTypography {
  // Font Family
  static TextStyle get inter => GoogleFonts.inter();

  // Display Styles (Large Headlines)
  static TextStyle displayLarge = inter.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.02,
    color: AppColors.textPrimary,
  );

  static TextStyle displayMedium = inter.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.01,
    color: AppColors.textPrimary,
  );

  static TextStyle displaySmall = inter.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  // Headline Styles
  static TextStyle headlineLarge = inter.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMedium = inter.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineSmall = inter.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: AppColors.textPrimary,
  );

  // Title Styles
  static TextStyle titleLarge = inter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = inter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  static TextStyle titleSmall = inter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  // Body Styles
  static TextStyle bodyLarge = inter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = inter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySmall = inter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  // Label Styles
  static TextStyle labelLarge = inter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static TextStyle labelMedium = inter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static TextStyle labelSmall = inter.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textTertiary,
  );
}

// ============================================================================
// SPACING & DIMENSIONS
// ============================================================================

class AppSpacing {
  // Base unit (8px grid)
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  // Screen margins
  static const double screenMargin = lg; // 24px
  static const double screenMarginMobile = md; // 16px
}

// ============================================================================
// BORDERS & SHADOWS
// ============================================================================

class AppBorders {
  // Corner Radius
  static const double radiusNone = 0;
  static const double radiusSm = 4;
  static const double radiusMd = 8;
  static const double radiusLg = 12;
  static const double radiusXl = 16;
  static const double radiusXxl = 24;
  static const double radiusFull = 9999;

  // Border Width
  static const double widthThin = 1;
  static const double widthMedium = 2;
  static const double widthThick = 4;

  // Border Styles
  static BoxBorder borderThin = Border.all(
    color: AppColors.border,
    width: widthThin,
  );

  static BoxBorder borderFocus = Border.all(
    color: AppColors.borderFocus,
    width: widthThin,
  );
}

class AppShadows {
  // Card Shadows
  static const BoxShadow cardLow = BoxShadow(
    color: Color(0x1A000000), // 10% opacity black
    offset: Offset(0, 2),
    blurRadius: 4,
  );

  static const BoxShadow cardMedium = BoxShadow(
    color: Color(0x26000000), // 15% opacity black
    offset: Offset(0, 4),
    blurRadius: 8,
  );

  static const BoxShadow cardHigh = BoxShadow(
    color: Color(0x33000000), // 20% opacity black
    offset: Offset(0, 8),
    blurRadius: 16,
  );

  // Glow Effects
  static BoxShadow glowAccent = BoxShadow(
    color: AppColors.accentPrimary.withOpacity(0.3),
    offset: Offset(0, 0),
    blurRadius: 12,
    spreadRadius: 2,
  );

  static BoxShadow glowSubtle = BoxShadow(
    color: AppColors.accentPrimary.withOpacity(0.1),
    offset: Offset(0, 0),
    blurRadius: 20,
    spreadRadius: 4,
  );
}

// ============================================================================
// MOTION & ANIMATION
// ============================================================================

class AppMotion {
  // Duration
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);

  // Curves
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve elasticOut = Curves.elasticOut;

  // Scale Factors
  static const double scalePressed = 0.98;
  static const double scaleHover = 1.02;
  static const double scaleActive = 1.05;
}

// ============================================================================
// COMPONENT THEMES
// ============================================================================

class AppComponentThemes {
  // Button Themes
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accentPrimary,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorders.radiusLg),
      ),
      textStyle: AppTypography.labelLarge,
    ),
  );

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.accentPrimary,
      side: BorderSide(color: AppColors.accentPrimary, width: 1),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorders.radiusLg),
      ),
      textStyle: AppTypography.labelLarge,
    ),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.textSecondary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      textStyle: AppTypography.labelMedium,
    ),
  );

  // Card Theme
  static CardThemeData cardTheme = const CardThemeData(
    color: AppColors.backgroundSecondary,
    elevation: 0,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    margin: EdgeInsets.zero,
  );

  // Input Decoration Theme
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundTertiary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorders.radiusMd),
      borderSide: BorderSide(color: AppColors.border, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorders.radiusMd),
      borderSide: BorderSide(color: AppColors.border, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorders.radiusMd),
      borderSide: BorderSide(color: AppColors.accentPrimary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorders.radiusMd),
      borderSide: BorderSide(color: AppColors.error, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorders.radiusMd),
      borderSide: BorderSide(color: AppColors.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.md,
    ),
    labelStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.textSecondary,
    ),
    hintStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.textTertiary,
    ),
    errorStyle: AppTypography.labelSmall.copyWith(
      color: AppColors.error,
    ),
  );
}

// ============================================================================
// COMPLETE THEME
// ============================================================================

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,

    // Colors
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.accentPrimary,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.accentSecondary,
      onSecondary: AppColors.textPrimary,
      error: AppColors.error,
      onError: AppColors.textPrimary,
      surface: AppColors.backgroundSecondary,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.backgroundTertiary,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.border,
      outlineVariant: AppColors.divider,
    ),

    // Typography
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.labelSmall,
    ),

    // Component Themes
    elevatedButtonTheme: AppComponentThemes.elevatedButtonTheme,
    outlinedButtonTheme: AppComponentThemes.outlinedButtonTheme,
    textButtonTheme: AppComponentThemes.textButtonTheme,
    cardTheme: AppComponentThemes.cardTheme,
    inputDecorationTheme: AppComponentThemes.inputDecorationTheme,

    // Scaffold
    scaffoldBackgroundColor: AppColors.backgroundPrimary,

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundPrimary,
      elevation: 0,
      shadowColor: Colors.transparent,
      titleTextStyle: AppTypography.headlineMedium,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),

    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundSecondary,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppBorders.radiusXl),
        ),
      ),
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundSecondary,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorders.radiusLg),
      ),
    ),

    // Divider
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: AppSpacing.md,
    ),

    // Progress Indicator
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.accentPrimary,
      linearTrackColor: AppColors.backgroundTertiary,
      circularTrackColor: AppColors.backgroundTertiary,
    ),

    // Slider
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.accentPrimary,
      inactiveTrackColor: AppColors.backgroundTertiary,
      thumbColor: AppColors.accentPrimary,
      overlayColor: AppColors.accentPrimary.withOpacity(0.1),
      valueIndicatorColor: AppColors.backgroundSecondary,
      valueIndicatorTextStyle: AppTypography.labelSmall.copyWith(
        color: AppColors.textPrimary,
      ),
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accentPrimary;
        }
        return AppColors.textTertiary;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accentPrimary.withOpacity(0.3);
        }
        return AppColors.backgroundTertiary;
      }),
    ),

    // Checkbox
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accentPrimary;
        }
        return AppColors.backgroundTertiary;
      }),
      checkColor: WidgetStateProperty.all(AppColors.textPrimary),
      side: BorderSide(color: AppColors.border, width: 1),
    ),

    // Radio
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accentPrimary;
        }
        return AppColors.textTertiary;
      }),
    ),
  );
}
