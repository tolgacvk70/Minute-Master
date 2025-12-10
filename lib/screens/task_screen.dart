import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/game_state.dart';
import '../models/tasks_data.dart';
import '../design_system.dart';

class TaskScreen extends StatefulWidget {
  final GameState gameState;
  final VoidCallback onTaskComplete;

  const TaskScreen({
    super.key,
    required this.gameState,
    required this.onTaskComplete,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with TickerProviderStateMixin {
  late AnimationController _timerController;
  late AnimationController _pulseController;
  Timer? _countdownTimer;
  int _secondsRemaining = 60;
  bool _isRunning = false;
  String? _currentTask;

  @override
  void initState() {
    super.initState();
    _timerController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
    
    _currentTask = TasksData.getRandomTask();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _timerController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_isRunning) return;
    
    setState(() {
      _isRunning = true;
      _secondsRemaining = 60;
    });
    
    HapticFeedback.heavyImpact();
    
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsRemaining--;
      });
      
      if (_secondsRemaining <= 5) {
        HapticFeedback.lightImpact();
      }
      
      if (_secondsRemaining <= 0) {
        timer.cancel();
        _timerController.reset();
        HapticFeedback.heavyImpact();
        SystemSound.play(SystemSoundType.alert);
        _finishTask();
      }
    });
  }

  void _finishTask() {
    Future.delayed(const Duration(seconds: 1), () {
      widget.onTaskComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = _secondsRemaining / 60.0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Player Badge
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                    border: Border.all(
                      color: AppColors.accentPrimary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.accentPrimary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            widget.gameState.getCurrentPlayerName()[0].toUpperCase(),
                            style: AppTypography.titleMedium.copyWith(
                              color: AppColors.accentPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'Du bist dran, ${widget.gameState.getCurrentPlayerName()}',
                        style: AppTypography.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Task Card
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  final scale = _isRunning && _secondsRemaining <= 10
                      ? 1.0 + (_pulseController.value * 0.05)
                      : 1.0;

                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        borderRadius: BorderRadius.circular(AppBorders.radiusXl),
                        border: Border.all(
                          color: AppColors.divider,
                          width: 1,
                        ),
                        boxShadow: [
                          AppShadows.cardMedium,
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.xs,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentPrimary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppBorders.radiusMd),
                            ),
                            child: Text(
                              'AUFGABE',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.accentPrimary,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            _currentTask ?? 'Aufgabe lädt...',
                            textAlign: TextAlign.center,
                            style: AppTypography.headlineSmall.copyWith(
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const Spacer(flex: 2),

              // Timer Circle
              SizedBox(
                width: 240,
                height: 240,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer glow ring
                    Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            (_isRunning && _secondsRemaining <= 10)
                                ? AppColors.warning.withOpacity(0.3)
                                : AppColors.accentPrimary.withOpacity(0.2),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    // Background Circle
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundSecondary,
                        border: Border.all(
                          color: AppColors.divider,
                          width: 2,
                        ),
                      ),
                    ),

                    // Progress Ring
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 6,
                        backgroundColor: AppColors.backgroundTertiary,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _secondsRemaining <= 10
                              ? AppColors.warning
                              : _secondsRemaining <= 30
                                  ? AppColors.accentSecondary
                                  : AppColors.accentPrimary,
                        ),
                      ),
                    ),

                    // Center Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Timer Number
                        AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            final scale = (_isRunning && _secondsRemaining <= 10)
                                ? 1.0 + (_pulseController.value * 0.1)
                                : 1.0;

                            return Transform.scale(
                              scale: scale,
                              child: Text(
                                '$_secondsRemaining',
                                style: AppTypography.displaySmall.copyWith(
                                  color: _secondsRemaining <= 10
                                      ? AppColors.warning
                                      : AppColors.textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),

                        // Label
                        Text(
                          'Sekunden',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              // Start Button
              if (!_isRunning)
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundSecondary,
                        border: Border.all(
                          color: AppColors.accentPrimary.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentPrimary.withOpacity(
                              0.2 + (_pulseController.value * 0.1),
                            ),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _startTimer,
                          customBorder: const CircleBorder(),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow,
                              size: 60,
                              color: AppColors.accentPrimary,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: AppSpacing.xxxl),
            ],
          ),
        ),
      ),
    );
  }
}

