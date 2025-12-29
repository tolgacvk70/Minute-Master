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
  late PageController _gameController;
  double _currentPage = 0;

  final List<_GameMode> _gameModes = const [
    _GameMode(
      title: 'Chaos Challenge',
      subtitle: '60 Sekunden | Schnellstart',
      description: 'Zieht zufällige Aufgaben für den maximalen Party-Modus.',
      icon: Icons.bolt,
      gradient: [
        Color(0xFF00D4FF),
        Color(0xFF1AC8FF),
      ],
    ),
    _GameMode(
      title: 'Story Mode',
      subtitle: 'Neue Aufgaben | Kampagne',
      description: 'Spielt thematische Runden mit wachsenden Challenges.',
      icon: Icons.auto_awesome,
      gradient: [
        Color(0xFF9D4EDD),
        Color(0xFF6C63FF),
      ],
    ),
  ];

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

    _gameController = PageController(viewportFraction: 0.85)
      ..addListener(() {
        setState(() {
          _currentPage = _gameController.page ?? 0;
        });
      });

    // Start animations
    _fadeController.forward();
    _glowController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _glowController.dispose();
    _gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -120,
              right: -60,
              child: _GradientBlob(
                size: 220,
                colors: [
                  AppColors.accentPrimary.withOpacity(0.25),
                  AppColors.accentSecondary.withOpacity(0.15),
                ],
              ),
            ),
            Positioned(
              bottom: -80,
              left: -40,
              child: _GradientBlob(
                size: 180,
                colors: [
                  AppColors.accentSecondary.withOpacity(0.25),
                  AppColors.accentPrimary.withOpacity(0.15),
                ],
              ),
            ),
            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.xxxl),
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                          border: Border.all(
                            color: AppColors.accentPrimary.withOpacity(0.3),
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.backgroundSecondary,
                              AppColors.backgroundTertiary,
                            ],
                          ),
                          boxShadow: [
                            AppShadows.glowSubtle.copyWith(
                              color: AppColors.accentPrimary.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.hourglass_bottom_rounded,
                          size: 42,
                          color: AppColors.accentPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        'Minute Master',
                        textAlign: TextAlign.center,
                        style: AppTypography.displayLarge.copyWith(
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'Das Partyspiel für nur ein Handy',
                        textAlign: TextAlign.center,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        '60 Sekunden. Eine Aufgabe. 100% Chaos.',
                        textAlign: TextAlign.center,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: AppSpacing.md,
                        runSpacing: AppSpacing.sm,
                        children: const [
                          _FeatureChip(label: 'Keine Vorbereitung'),
                          _FeatureChip(label: 'Sofort loslegen'),
                          _FeatureChip(label: 'Offline spielbar'),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Wählt euren Modus',
                          style: AppTypography.titleLarge,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 230,
                        child: PageView.builder(
                          controller: _gameController,
                          itemCount: _gameModes.length,
                          itemBuilder: (context, index) {
                            final game = _gameModes[index];
                            final isActive = (_currentPage - index).abs() < 0.5;

                            return AnimatedContainer(
                              duration: AppMotion.normal,
                              margin: EdgeInsets.symmetric(
                                horizontal: isActive ? AppSpacing.sm : AppSpacing.md,
                                vertical: isActive ? AppSpacing.sm : AppSpacing.lg,
                              ),
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: game.gradient,
                                ),
                                boxShadow: [
                                  AppShadows.glowSubtle.copyWith(
                                    color: game.gradient.first.withOpacity(0.35),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    game.icon,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  const Spacer(),
                                  Text(
                                    game.title,
                                    style: AppTypography.headlineLarge.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.sm),
                                  Text(
                                    game.subtitle,
                                    style: AppTypography.bodySmall.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.md),
                                  Text(
                                    game.description,
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _gameModes.length,
                          (index) {
                            final isActive = (_currentPage - index).abs() < 0.5;
                            return AnimatedContainer(
                              duration: AppMotion.fast,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 6,
                              width: isActive ? 28 : 12,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.accentPrimary
                                    : AppColors.textTertiary,
                                borderRadius: BorderRadius.circular(999),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxxl),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.xl,
                                  vertical: AppSpacing.lg,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                                ),
                                minimumSize: const Size(double.infinity, 60),
                              ),
                              child: Text(
                                'Spiel starten',
                                style: AppTypography.labelLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // TODO: Navigate to rules
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                            ),
                            child: Text(
                              'Anleitung',
                              style: AppTypography.labelMedium,
                            ),
                          ),
                          Container(
                            width: 4,
                            height: 4,
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.textTertiary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: Navigate to settings
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                            ),
                            child: Text(
                              'Einstellungen',
                              style: AppTypography.labelMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xxxl),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String label;

  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorders.radiusXl),
        color: AppColors.backgroundSecondary.withOpacity(0.7),
        border: Border.all(color: AppColors.border.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: AppSpacing.xs),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentPrimary,
            ),
          ),
          Text(
            label,
            style: AppTypography.labelMedium,
          ),
        ],
      ),
    );
  }
}

class _GradientBlob extends StatelessWidget {
  final double size;
  final List<Color> colors;

  const _GradientBlob({
    required this.size,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.first.withOpacity(0.4),
            blurRadius: 80,
            spreadRadius: 20,
          ),
        ],
      ),
    );
  }
}

class _GameMode {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<Color> gradient;

  const _GameMode({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.gradient,
  });
}
