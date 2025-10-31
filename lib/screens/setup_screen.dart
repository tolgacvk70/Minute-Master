import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      HapticFeedback.mediumImpact();
    }
  }

  void _removePlayer(int index) {
    setState(() {
      _players.removeAt(index);
    });
    HapticFeedback.lightImpact();
  }

  void _startGame() {
    if (_players.length >= 2) {
      HapticFeedback.heavyImpact();
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF007AFF), Color(0xFF40E0D0)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: widget.onBackPressed,
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Spacer(),
                    const Text(
                      'Wer spielt mit?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Input Section
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  autofocus: true,
                                  maxLength: 20,
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) => _addPlayer(),
                                  decoration: const InputDecoration(
                                    hintText: 'Spielername',
                                    border: InputBorder.none,
                                    counterText: '',
                                  ),
                                ),
                              ),
                              Material(
                                color: const Color(0xFFFFD60A),
                                shape: const CircleBorder(),
                                child: InkWell(
                                  onTap: _addPlayer,
                                  child: const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 30),
                        
                        // Players List
                        if (_players.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(40),
                            child: Text(
                              'Füge Spieler hinzu\n(Mindestens 2)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          )
                        else
                          ...(_players.asMap().entries.map((entry) {
                            final index = entry.key;
                            final player = entry.value;
                            final colors = [
                              const Color(0xFFFF3B30),
                              const Color(0xFF007AFF),
                              const Color(0xFFFFD60A),
                              const Color(0xFF40E0D0),
                              const Color(0xFFC77DFF),
                            ];
                            
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: colors[index % colors.length],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: colors[index % colors.length].withOpacity(0.5),
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white.withOpacity(0.3),
                                    child: Text(
                                      player.substring(0, 1).toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      player,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _removePlayer(index),
                                    icon: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          }).toList()),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Start Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _players.length >= 2 ? _startGame : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _players.length >= 2
                              ? const Color(0xFFFFD60A)
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                        ),
                        child: const Text(
                          'Los geht\'s!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

