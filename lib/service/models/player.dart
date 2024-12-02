class Player {
  String name;
  int turns;

  Player(this.name, this.turns);

  @override
  String toString() => "$name Turns: $turns";
}
