enum PokemonType {
  normal._('normal'),
  fighting._('fighting'),
  flying._('flying'),
  poison._('poison'),
  ground._('ground'),
  rock._('rock'),
  bug._('bug'),
  ghost._('ghost'),
  steel._('steel'),
  fire._('fire'),
  water._('water'),
  grass._('grass'),
  electric._('electric'),
  psychic._('psychic'),
  ice._('ice'),
  dragon._('dragon'),
  dark._('dark'),
  fairy._('fairy'),
  unknown._('unknown'),
  shadow._('shadow');

  final String _name;

  const PokemonType._(String name) : _name = name;

  factory PokemonType.fromName(String name) {
    switch (name) {
      case 'normal':
        return PokemonType.normal;
      case 'fighting':
        return PokemonType.fighting;
      case 'flying':
        return PokemonType.flying;
      case 'poison':
        return PokemonType.poison;
      case 'ground':
        return PokemonType.ground;
      case 'rock':
        return PokemonType.rock;
      case 'bug':
        return PokemonType.bug;
      case 'ghost':
        return PokemonType.ghost;
      case 'steel':
        return PokemonType.steel;
      case 'fire':
        return PokemonType.fire;
      case 'water':
        return PokemonType.water;
      case 'grass':
        return PokemonType.grass;
      case 'electric':
        return PokemonType.electric;
      case 'psychic':
        return PokemonType.psychic;
      case 'ice':
        return PokemonType.ice;
      case 'dragon':
        return PokemonType.dragon;
      case 'dark':
        return PokemonType.dark;
      case 'fairy':
        return PokemonType.fairy;
      case 'shadow':
        return PokemonType.shadow;
      case 'unknown':
      default:
        return PokemonType.unknown;
    }
  }

  String get name => _name;

  String toShortString() => toString().split('.').last;
}
