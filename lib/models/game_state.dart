class GameState {
  List<String> players;
  Map<int, int> scores;
  int currentRound;
  int totalRounds;
  int currentPlayerIndex;
  String? currentTask;

  GameState({
    List<String>? players,
    int rounds = 10,
  })  : players = players ?? [],
        scores = {},
        currentRound = 0,
        totalRounds = rounds,
        currentPlayerIndex = 0,
        currentTask = null;

  void startNextRound() {
    currentRound++;
    // Select random player
    currentPlayerIndex = DateTime.now().millisecondsSinceEpoch % players.length;
  }

  String getCurrentPlayerName() {
    if (players.isEmpty) return 'Spieler';
    return players[currentPlayerIndex];
  }

  void addScore(int playerIndex, int points) {
    scores[playerIndex] = (scores[playerIndex] ?? 0) + points;
  }

  int getPlayerScore(int playerIndex) {
    return scores[playerIndex] ?? 0;
  }

  List<MapEntry<int, int>> getSortedScores() {
    return scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
  }

  bool isGameOver() {
    return currentRound >= totalRounds;
  }

  String? getWinner() {
    if (scores.isEmpty) return null;
    final sorted = getSortedScores();
    if (sorted.isNotEmpty) {
      return players[sorted.first.key];
    }
    return null;
  }
}

