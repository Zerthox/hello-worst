library random_string;

import "dart:math";

/// A generator of random String values.
class RandomString {

  /// Private random number generator
  Random _random;

  /// Private minimum character code
  int _min;

  /// Private maximum character code
  int _max;

  /// Creates a new random String Generator.
  /// 
  /// The optional parameters [min] and [max] are used to set the default minimum and maximum character codes.
  /// The default minimum and maximum character codes are `32` and `126`.
  /// 
  /// The optional named parameter [seed] is used to initialize the internal random number generator.
  RandomString({int min = 32, int max = 126, int seed}) {

    // Assert min is not bigger than max
    assert(min <= max);

    // Save private min and max values
    _min = min;
    _max = max;

    // Create private random number generator
    _random = Random(seed);
  }

  /// Generates a random character.
  /// 
  /// The optional parameters [min] and [max] override the range of the generated character codes.
  String nextChar({int min, int max}) {

    // Use private min and max values if no custom values have been passed
    if (min == null) {
      min = _min;
    }
    if (max == null) {
      max = _max;
    }

    // Assert min is not bigger than max
    assert(min <= max);

    // Generate random character within allowed range
    return String.fromCharCode(min + _random.nextInt(max + 1 - min));
  }

  /// Generates a random String with the passed [length].
  /// 
  /// The optional parameters [min] and [max] override the range of the characters in the generated string.
  String nextString(int length, {int min, int max}) {

    // Use private min and max values if no custom values have been passed
    if (min == null) {
      min = _min;
    }
    if (max == null) {
      max = _max;
    }

    // Assert min is not bigger than max
    assert(min <= max);

    // Return String from List of random character codes
    return String.fromCharCodes(List<int>.generate(length, (e) => min + _random.nextInt(max + 1 - min)));
  }
}