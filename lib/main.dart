import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/start_screen.dart';
import 'screens/setup_screen.dart';
import 'screens/task_screen.dart';
import 'screens/rating_screen.dart';
import 'screens/score_screen.dart';
import 'screens/winner_screen.dart';
import 'models/game_state.dart';
import 'models/tasks_data.dart';
import 'utils/audio_manager.dart';
import 'utils/haptic_feedback.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MinuteMasterApp());
}

class MinuteMasterApp extends StatelessWidget {
  const MinuteMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minute Meister',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF3B30),
          primary: const Color(0xFFFF3B30),
          secondary: const Color(0xFFFFD60A),
          tertiary: const Color(0xFF007AFF),
        ),
      ),
      home: const GameHome(),
    );
  }
}

class GameHome extends StatefulWidget {
  const GameHome({super.key});

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  GameState gameState = GameState();
  String currentScreen = 'start';

  void _changeScreen(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void _startGame(List<String> players) {
    gameState = GameState(
      players: players,
      rounds: players.length * 2,
    );
    gameState.startNextRound();
    _changeScreen('task');
  }

  void _nextRound() {
    if (gameState.isGameOver()) {
      _changeScreen('winner');
    } else {
      gameState.startNextRound();
      _changeScreen('task');
    }
  }

  void _finishRating(int rating) {
    gameState.addScore(gameState.currentPlayerIndex, rating);
    _changeScreen('score');
  }

  @override
  Widget build(BuildContext context) {
    switch (currentScreen) {
      case 'start':
        return StartScreen(
          onStartPressed: () => _changeScreen('setup'),
        );
      case 'setup':
        return SetupScreen(
          onStartGame: _startGame,
          onBackPressed: () => _changeScreen('start'),
        );
      case 'task':
        return TaskScreen(
          gameState: gameState,
          onTaskComplete: () => _changeScreen('rating'),
        );
      case 'rating':
        return RatingScreen(
          gameState: gameState,
          onRatingComplete: _finishRating,
        );
      case 'score':
        return ScoreScreen(
          gameState: gameState,
          onNextRound: _nextRound,
        );
      case 'winner':
        return WinnerScreen(
          gameState: gameState,
          onNewGame: () {
            _changeScreen('start');
          },
          onGoHome: () => _changeScreen('start'),
        );
      default:
        return StartScreen(
          onStartPressed: () => _changeScreen('setup'),
        );
    }
  }
}

