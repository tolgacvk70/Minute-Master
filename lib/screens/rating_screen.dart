import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/game_state.dart';
import '../design_system.dart';

class RatingScreen extends StatefulWidget {
  final GameState gameState;
  final Function(int) onRatingComplete;

  const RatingScreen({
    super.key,
    required this.gameState,
    required this.onRatingComplete,
  });

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen>
    with SingleTickerProviderStateMixin {
  int? _selectedRating;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _giveRating(int rating) {
    HapticFeedback.mediumImpact();
    setState(() {
      _selectedRating = rating;
    });
    
    Future.delayed(const Duration(milliseconds: 500), () {
      widget.onRatingComplete(rating);
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerName = widget.gameState.getCurrentPlayerName();
    final ratingOptions = [
      (score: 1, emoji: '😴', title: 'Aufwärmen', detail: 'Noch nicht ganz drin'),
      (score: 2, emoji: '🙂', title: 'Solide', detail: 'Da geht noch was'),
      (score: 3, emoji: '🔥', title: 'Gut', detail: 'Richtig warmgelaufen'),
      (score: 4, emoji: '🚀', title: 'Mega', detail: 'Publikumsliebling'),
      (score: 5, emoji: '👑', title: 'Legendär', detail: 'Unvergesslich gut'),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Wie stark war die Performance?',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  playerName,
                  style: AppTypography.displayMedium.copyWith(
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                FadeTransition(
                  opacity: _controller,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.accentPrimary,
                          AppColors.accentSecondary,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentPrimary.withOpacity(0.35),
                          blurRadius: 24,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundSecondary,
                        border: Border.all(
                          color: AppColors.accentPrimary.withOpacity(0.4),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          playerName.substring(0, 1).toUpperCase(),
                          style: AppTypography.displayLarge.copyWith(
                            color: AppColors.accentPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Expanded(
                  child: FadeTransition(
                    opacity: _controller,
                    child: Wrap(
                      spacing: AppSpacing.md,
                      runSpacing: AppSpacing.md,
                      alignment: WrapAlignment.center,
                      children: ratingOptions.map((option) {
                        final isSelected = _selectedRating == option.score;

                        return GestureDetector(
                          onTap: () => _giveRating(option.score),
                          child: AnimatedContainer(
                            duration: AppMotion.normal,
                            curve: AppMotion.easeInOut,
                            width: 120,
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppBorders.radiusLg),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.accentPrimary
                                    : AppColors.divider,
                              ),
                              boxShadow: isSelected
                                  ? [AppShadows.glowSubtle]
                                  : const [AppShadows.cardLow],
                              gradient: isSelected
                                  ? AppColors.accentGradient
                                  : null,
                              color: isSelected
                                  ? null
                                  : AppColors.backgroundSecondary,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  option.emoji,
                                  style: const TextStyle(fontSize: 30),
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  option.title,
                                  style: AppTypography.titleSmall.copyWith(
                                    color: isSelected
                                        ? AppColors.backgroundPrimary
                                        : AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  option.detail,
                                  textAlign: TextAlign.center,
                                  style: AppTypography.labelSmall.copyWith(
                                    color: isSelected
                                        ? AppColors.backgroundPrimary
                                            .withOpacity(0.8)
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: AppMotion.normal,
                  child: _selectedRating == null
                      ? Text(
                          'Tippe auf eine Karte, um zu bewerten',
                          key: const ValueKey('hint'),
                          style: AppTypography.bodySmall,
                        )
                      : Row(
                          key: const ValueKey('rated'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: AppColors.accentPrimary,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              'Wird gespeichert...',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

