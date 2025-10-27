import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/game_state.dart';
import '../models/tasks_data.dart';

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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _secondsRemaining > 20
                ? [const Color(0xFFFFD60A), const Color(0xFFFF3B30)]
                : [const Color(0xFFFF3B30), const Color(0xFFC77DFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Player Badge
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Text(
                    widget.gameState.getCurrentPlayerName(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Task Card
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _isRunning && _secondsRemaining <= 10
                        ? 1.0 + (_pulseController.value * 0.1)
                        : 1.0,
                    child: child,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'AUFGABE',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF007AFF),
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _currentTask ?? 'Aufgabe lädt...',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const Spacer(flex: 2),
              
              // Timer Circle
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background Circle
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 20,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    // Center Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_secondsRemaining',
                          style: const TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Sekunden',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
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
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _startTimer,
                      customBorder: const CircleBorder(),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: Color(0xFF007AFF),
                        ),
                      ),
                    ),
                  ),
                ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

