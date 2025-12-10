import 'package:flutter/material.dart';
import '../design_system.dart';

class SetupScreen extends StatefulWidget {
  final Function(List<String>) onStartGame;
  final VoidCallback onBackPressed;

  const SetupScreen({
    super.key,
    required this.onStartGame,
    required this.onBackPressed,
  });

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _players = [];

  void _addPlayer() {
    final name = _controller.text.trim();
    if (name.isNotEmpty && !_players.contains(name)) {
      setState(() {
        _players.add(name);
        _controller.clear();
      });
    }
  }

  void _removePlayer(int index) {
    setState(() {
      _players.removeAt(index);
    });
  }

  void _startGame() {
    if (_players.length >= 2) {
      widget.onStartGame(_players);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
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
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: widget.onBackPressed,
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.textPrimary,
                        size: 24,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.backgroundTertiary,
                        padding: const EdgeInsets.all(AppSpacing.sm),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        'Wer spielt mit?',
                        style: AppTypography.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xl),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Input Section
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary,
                          borderRadius: BorderRadius.circular(AppBorders.radiusLg),
                          border: Border.all(
                            color: AppColors.border,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _controller,
                          autofocus: true,
                          maxLength: 20,
                          textInputAction: TextInputAction.done,
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Spielername eingeben...',
                            hintStyle: AppTypography.bodyLarge.copyWith(
                              color: AppColors.textTertiary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(AppSpacing.md),
                            counterText: '',
                            suffixIcon: IconButton(
                              onPressed: _addPlayer,
                              icon: Icon(
                                Icons.add,
                                color: AppColors.accentPrimary,
                                size: 24,
                              ),
                            ),
                          ),
                          onSubmitted: (_) => _addPlayer(),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // Players Count
                      if (_players.isNotEmpty) ...[
                        Text(
                          'Spieler (${_players.length})',
                          style: AppTypography.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.md),
                      ],

                      // Players Display
                      _players.isEmpty
                          ? Container(
                              padding: const EdgeInsets.all(AppSpacing.xl),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundTertiary,
                                borderRadius: BorderRadius.circular(AppBorders.radiusLg),
                                border: Border.all(
                                  color: AppColors.divider,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.people_outline,
                                    color: AppColors.textTertiary,
                                    size: 24,
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Expanded(
                                    child: Text(
                                      'Füge Spieler hinzu, um zu starten',
                                      style: AppTypography.bodyMedium.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: AppSpacing.md,
                                mainAxisSpacing: AppSpacing.md,
                                childAspectRatio: 1.1,
                              ),
                              itemCount: _players.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(AppSpacing.md),
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundSecondary,
                                    borderRadius: BorderRadius.circular(AppBorders.radiusLg),
                                    border: Border.all(
                                      color: AppColors.divider,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.accentPrimary.withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            _players[index][0].toUpperCase(),
                                            style: AppTypography.titleMedium.copyWith(
                                              color: AppColors.accentPrimary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: AppSpacing.sm),
                                      Text(
                                        _players[index],
                                        style: AppTypography.bodyMedium,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: AppSpacing.sm),
                                      IconButton(
                                        onPressed: () => _removePlayer(index),
                                        icon: Icon(
                                          Icons.close,
                                          color: AppColors.textTertiary,
                                          size: 20,
                                        ),
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                      if (_players.length < 2 && _players.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.lg),
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppBorders.radiusMd),
                              border: Border.all(
                                color: AppColors.warning.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: AppColors.warning,
                                  size: 20,
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Text(
                                  'Mindestens 2 Spieler erforderlich',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.warning,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      const SizedBox(height: AppSpacing.xxxl),
                    ],
                  ),
                ),
              ),

              // Start Button
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _players.length >= 2 ? _startGame : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _players.length >= 2
                          ? AppColors.accentPrimary
                          : AppColors.backgroundTertiary,
                      foregroundColor: _players.length >= 2
                          ? AppColors.textPrimary
                          : AppColors.textTertiary,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.lg,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                      ),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    child: Text(
                      'Los geht\'s!',
                      style: AppTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
