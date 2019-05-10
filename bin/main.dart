import "dart:io";

import "../lib/random_string.dart";

final generator = RandomString();

void main() {

  // Set delay
  const delay = Duration(milliseconds: 10);

  // Call randomHello function
  randomHello(delay);
}

/// Genereates and prints a random string until it equals `"Hello World!"`.
/// 
/// Starts with a random 12 character long string and replaces substrings starting from the left. Prints every step to console.
/// 
/// The optional parameter [delay] is the amount of time between two console outputs and defaults to `10ms`.
/// 
/// The optional parameter [goal] is used to override `"Hello World!"` as goal string.
void randomHello([Duration delay = const Duration(milliseconds: 10), String goal = "Hello World!"]) {

  // Generate the intial random string
  var random = generator.nextString(goal.length);

  // Print the initial random string
  print(random);

  // Sleep
  sleep(delay);

  // Iterate over characters in goal string
  for (var i = 0; i < goal.length; i++) {

    while (goal[i] != random[i]) {

      // Replace right substring of the random string with a new random substring
      random = random.replaceRange(i, random.length, generator.nextString(random.length - i));

      // Print the new random string
      print(random);

      // Sleep
      sleep(delay);
    }
  }
}

/// Generates and prints a random string until it equals `"Hello World!"`.
/// 
/// Starts with a 12 character long random string and regenerates the whole string until it equals `"Hello World!"`.
/// 
/// The optional parameter [delay] is the amount of time between two console outputs and defaults to `10ms`.
/// 
/// The optional parameter [goal] is used to override `"Hello World!"` as goal string.
void fullyRandomHello([Duration delay = const Duration(milliseconds: 10), String goal = "Hello World!"]) {

  // Generate the initial random string
  var random = generator.nextString(goal.length);

  // Print the initial random string
  print(random);

  // Sleep
  sleep(delay);

  // Loop while "goal is not reached
  while (random != goal) {

    // Generate a new random string
    random = generator.nextString(goal.length);

    // Print the new random string
    print(random);

    // Sleep
    sleep(delay);
  }
}