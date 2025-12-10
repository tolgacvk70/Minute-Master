import 'package:flutter/material.dart';
import '../design_system.dart';

class StartScreen extends StatefulWidget {
  final VoidCallback onStartPressed;

  const StartScreen({
    super.key,
    required this.onStartPressed,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    // Subtle fade-in animation
    _fadeController = AnimationController(
      duration: AppMotion.normal,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    // Subtle glow pulsing for CTA button
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Start animations
    _fadeController.forward();
    _glowController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // Logo/Icon area - subtle geometric element
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundTertiary,
                      borderRadius: BorderRadius.circular(AppBorders.radiusLg),
                      border: Border.all(
                        color: AppColors.accentPrimary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.timer,
                      size: 40,
                      color: AppColors.accentPrimary,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Main Title
                  Text(
                    'MINUTE\nMASTER',
                    textAlign: TextAlign.center,
                    style: AppTypography.displayLarge.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.1,
                      letterSpacing: -1.0,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Subtitle
                  Text(
                    'Das Partyspiel für nur ein Handy',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  // Subtle description
                  Text(
                    '60 Sekunden. Eine Aufgabe.\n100% Chaos.',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textTertiary,
                      height: 1.5,
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Primary CTA Button with subtle glow animation
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                          boxShadow: [
                            AppShadows.glowSubtle.copyWith(
                              color: AppColors.accentPrimary.withOpacity(
                                0.2 + (_glowAnimation.value * 0.3),
                              ),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: widget.onStartPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentPrimary,
                            foregroundColor: AppColors.textPrimary,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xl,
                              vertical: AppSpacing.lg,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                            ),
                            minimumSize: const Size(double.infinity, 56),
                          ),
                          child: Text(
                            'Spiel starten',
                            style: AppTypography.labelLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Secondary actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to rules
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.sm,
                          ),
                        ),
                        child: Text(
                          'Anleitung',
                          style: AppTypography.labelMedium,
                        ),
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.textTertiary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to settings
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.sm,
                          ),
                        ),
                        child: Text(
                          'Einstellungen',
                          style: AppTypography.labelMedium,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
