import 'package:mastermind/models/player.dart';
import 'package:riverpod/riverpod.dart';

class PlayerService {
  final Ref container;
  final List<Player> _player = [];

  PlayerService(this.container);

  void addPlayer(String name, int turns) {
    final newPlayer = Player(name, turns);
    _player.add(newPlayer);
    _player.sort((a, b) => a.turns.compareTo(b.turns));
  }

  void viewPlayers() {
    int place = 0;
    for (var player in _player) {
      place++;
      if (place > 10) {
        break;
      }
      print("$place. $player");
    }
  }

  List<Player> get players => _player;
}
