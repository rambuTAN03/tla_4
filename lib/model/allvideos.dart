class AllVideos {
  String name;
  int turns;

  AllVideos(this.name, this.turns);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'turns': turns,
    };
  }

  @override
  String toString() => "$name Turns: $turns";
}
