library random_string;

import "dart:math";

/// A random String generator.
class RandomString {

  /// Private random number generator
	Random _random;

  /// Private minimum characters code
  int _min;

  /// Private maximum characters code
  int _max;

  /// Creates a new random String Generator.
  /// 
  /// The optional parameters [min] and [max] are used to set the default minimum and maximum character codes.
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
  /// The optional parameters [min] and [max] are used to limit the range of the generated character codes.
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
    return String.fromCharCode(min + _random.nextInt(max - min));
  }

  /// Generates a random String with the passed [length].
  /// 
  /// The optional parameters [min] and [max] limit the range of the characters in the generated String.
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
    return String.fromCharCodes((List<int>(length)..fillRange(0, length)).map((e) {
      return min + _random.nextInt(max - min);
    }));
  }
}