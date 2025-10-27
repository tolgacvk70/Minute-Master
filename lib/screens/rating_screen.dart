import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/game_state.dart';

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
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF007AFF), Color(0xFF40E0D0)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                FadeTransition(
                  opacity: _controller,
                  child: Container(
                    width: 120,
                    height: 120,
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
                    child: Center(
                      child: Text(
                        playerName.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF007AFF),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                FadeTransition(
                  opacity: _controller,
                  child: Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                const SizedBox(height: 10),
                
                FadeTransition(
                  opacity: _controller,
                  child: const Text(
                    'Wie war die Leistung?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ),
                
                const SizedBox(height: 50),
                
                // Rating Buttons
                FadeTransition(
                  opacity: _controller,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final rating = index + 1;
                      final isSelected = _selectedRating == rating;
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () => _giveRating(rating),
                          child: Transform.scale(
                            scale: isSelected ? 1.2 : 1.0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : Colors.white70,
                                shape: BoxShape.circle,
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 20,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: const Text(
                                '⭐',
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

