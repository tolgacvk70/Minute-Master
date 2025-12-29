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
    final canStart = _players.length >= 2;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -60,
                right: -20,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.cardGlowGradient,
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                left: -40,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.heroGradient,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3300D4FF),
                        blurRadius: 60,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.md,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: widget.onBackPressed,
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.surfaceMuted,
                            padding: const EdgeInsets.all(AppSpacing.sm),
                          ),
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Vorbereitung',
                          style: AppTypography.titleMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppBorders.radiusFull),
                            color: AppColors.surfaceMuted,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flash_on,
                                color: AppColors.accentPrimary,
                                size: 16,
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                'Schritt 1 / 3',
                                style: AppTypography.labelMedium.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppBorders.radiusXxl),
                              gradient: AppColors.heroGradient,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.accentSecondary.withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wer spielt heute?',
                                  style: AppTypography.displaySmall,
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  'Füge alle Namen hinzu, damit Minute Master die Runden automatisch verteilt.',
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.textPrimary.withOpacity(0.9),
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.md),
                                Wrap(
                                  spacing: AppSpacing.sm,
                                  runSpacing: AppSpacing.sm,
                                  children: const [
                                    _TipChip(label: 'Mind. 2 Spieler'),
                                    _TipChip(label: 'Namen max. 20 Zeichen'),
                                    _TipChip(label: 'Offline speicherbar'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xxl),
                          Text(
                            'Spielerliste',
                            style: AppTypography.titleLarge,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                              color: AppColors.backgroundSecondary.withOpacity(0.9),
                              border: Border.all(
                                color: AppColors.surfaceMuted,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    autofocus: true,
                                    maxLength: 20,
                                    style: AppTypography.bodyLarge,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      hintText: 'Spielername eingeben...',
                                      hintStyle: AppTypography.bodyLarge.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: AppSpacing.md,
                                        vertical: AppSpacing.md,
                                      ),
                                    ),
                                    onSubmitted: (_) => _addPlayer(),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(AppSpacing.xs),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppBorders.radiusLg),
                                    gradient: AppColors.accentGradient,
                                  ),
                                  child: IconButton(
                                    onPressed: _addPlayer,
                                    icon: const Icon(Icons.add),
                                    color: AppColors.backgroundPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Wrap(
                            spacing: AppSpacing.sm,
                            children: [
                              _SuggestedNameChip(label: 'Lena', onTap: () {
                                _controller.text = 'Lena';
                              }),
                              _SuggestedNameChip(label: 'Max', onTap: () {
                                _controller.text = 'Max';
                              }),
                              _SuggestedNameChip(label: 'Rafi', onTap: () {
                                _controller.text = 'Rafi';
                              }),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          AnimatedSwitcher(
                            duration: AppMotion.normal,
                            child: _players.isEmpty
                                ? Container(
                                    key: const ValueKey('placeholder'),
                                    padding: const EdgeInsets.all(AppSpacing.lg),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                                      color: AppColors.backgroundTertiary.withOpacity(0.8),
                                      border: Border.all(color: AppColors.surfaceMuted),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.group_add,
                                          color: AppColors.textTertiary,
                                        ),
                                        const SizedBox(width: AppSpacing.md),
                                        Expanded(
                                          child: Text(
                                            'Noch keine Spieler.\nFüge mindestens zwei Personen hinzu, um loszulegen.',
                                            style: AppTypography.bodyMedium.copyWith(
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : GridView.builder(
                                    key: const ValueKey('grid'),
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
                                      return _PlayerCard(
                                        name: _players[index],
                                        onRemove: () => _removePlayer(index),
                                      );
                                    },
                                  ),
                          ),
                          if (!canStart && _players.isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.lg),
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppBorders.radiusLg),
                                color: AppColors.warning.withOpacity(0.1),
                                border: Border.all(
                                  color: AppColors.warning.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColors.warning,
                                  ),
                                  const SizedBox(width: AppSpacing.sm),
                                  Expanded(
                                    child: Text(
                                      'Mindestens zwei Spieler erforderlich',
                                      style: AppTypography.bodySmall.copyWith(
                                        color: AppColors.warning,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          const SizedBox(height: AppSpacing.xxxl),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${_players.length} Spieler bereit',
                                style: AppTypography.titleMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.md,
                                vertical: AppSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppBorders.radiusFull),
                                color: AppColors.backgroundSecondary,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    canStart ? Icons.check_circle : Icons.hourglass_bottom,
                                    color: canStart
                                        ? AppColors.accentPrimary
                                        : AppColors.textTertiary,
                                    size: 18,
                                  ),
                                  const SizedBox(width: AppSpacing.xs),
                                  Text(
                                    canStart ? 'Bereit' : 'Noch nicht bereit',
                                    style: AppTypography.labelMedium.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: canStart ? _startGame : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: canStart
                                  ? AppColors.accentPrimary
                                  : AppColors.backgroundTertiary,
                              foregroundColor: AppColors.textPrimary,
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.lg,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppBorders.radiusXxl),
                              ),
                            ),
                            child: Text(
                              'Weiter zur Aufgabe',
                              style: AppTypography.labelLarge.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayerCard extends StatelessWidget {
  final String name;
  final VoidCallback onRemove;

  const _PlayerCard({
    required this.name,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppMotion.normal,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorders.radiusXl),
        color: AppColors.backgroundSecondary.withOpacity(0.9),
        border: Border.all(color: AppColors.surfaceGlare),
        boxShadow: const [AppShadows.cardLow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.accentGradient,
            ),
            child: Center(
              child: Text(
                name[0].toUpperCase(),
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.backgroundPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            name,
            style: AppTypography.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.sm),
          TextButton(
            onPressed: onRemove,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 24),
            ),
            child: Text(
              'Entfernen',
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestedNameChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SuggestedNameChip({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorders.radiusFull),
          color: AppColors.surfaceMuted,
          border: Border.all(color: AppColors.surfaceGlare),
        ),
        child: Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _TipChip extends StatelessWidget {
  final String label;

  const _TipChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorders.radiusFull),
        color: AppColors.surfaceGlare,
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
