class ListUtils {
  static Map<T, int> differentValuesCountMap<T>(List<T> list) {
    Map<T, int> map = {};

    for (var element in list) {
      if (map[element] == null) {
        map[element] = 1;
      } else {
        var currentValue = map[element];
        map[element] = currentValue! + 1;
      }
    }

    return map;
  }

  static Map<K, List<V>> groupByField<K, V>(List<V> list, K Function(V item) selector) {
    Map<K, List<V>> map = {};

    for (final item in list) {
      K field = selector(item);

      if (map[field] == null) {
        map[field] = [];
      }

      map[field]!.add(item);
    }

    return map;
  }
}
