import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:confetti/confetti.dart';
import '../models/game_state.dart';

class WinnerScreen extends StatefulWidget {
  final GameState gameState;
  final VoidCallback onNewGame;
  final VoidCallback onGoHome;

  const WinnerScreen({
    super.key,
    required this.gameState,
    required this.onNewGame,
    required this.onGoHome,
  });

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen>
    with TickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _bounceController;
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
    
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    
    _rotateController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    
    HapticFeedback.heavyImpact();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _bounceController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final winner = widget.gameState.getWinner() ?? 'Niemand';
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFD60A), Color(0xFFFF3B30)],
          ),
        ),
        child: Stack(
          children: [
            // Confetti
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi / 2,
                maxBlastForce: 5,
                minBlastForce: 2,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.1,
              ),
            ),
            
            // Main Content
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    
                    // Crown
                    AnimatedBuilder(
                      animation: _bounceController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, -20 * _bounceController.value),
                          child: child,
                        );
                      },
                      child: const Text(
                        '👑',
                        style: TextStyle(fontSize: 120),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    const Text(
                      'ist der',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    Text(
                      winner,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Text(
                      'MINUTE MEISTER!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(flex: 3),
                    
                    // Buttons
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                HapticFeedback.heavyImpact();
                                widget.onNewGame();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF007AFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 10,
                              ),
                              child: const Text(
                                'Neue Runde',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                widget.onGoHome();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 10,
                              ),
                              child: const Text(
                                'Nach Hause',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF007AFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

