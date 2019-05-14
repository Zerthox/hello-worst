import "dart:io";

import "package:hello_worst/random_string.dart";

final generator = RandomString(min: 32, max: 126);

void main() {

  // Set delay
  const delay = Duration(milliseconds: 10);
  
  // Call randomPrint
  randomPrint("Hello World!", delay);
}

/// Generates and prints a random string until it equals [goal].
/// 
/// Starts with a random string and replaces substrings starting from the left. Prints every step to console.
/// 
/// The optional parameter [delay] is the amount of time between two console outputs and defaults to `10ms`.
/// 
/// [goal] may not contain characters outside of the character code range `32` to `126`.
void randomPrint(String goal, [Duration delay = const Duration(milliseconds: 10)]) {

  // Iterate over characters in goal string
  for (var char in goal.codeUnits) {

    // Check if character code is outside of the permitted character code range
    assert(char >= 32 && char <= 126, "Goal '$goal' contains a character outside of the permitted character code range (32 - 126): ${String.fromCharCode(char)}");
  }

  // Generate the initial random string
  var random = generator.nextString(goal.length);

  // Print the initial random string
  print(random);

  // Create counter
  var n = 1;

  // Sleep
  sleep(delay);

  // Iterate over characters in goal string
  for (var i = 0; i < goal.length; i++) {

    while (goal[i] != random[i]) {

      // Replace right substring of the random string with a new random substring
      random = random.replaceRange(i, random.length, generator.nextString(random.length - i));

      // Print the new random string
      print(random);

      // Increase counter
      n++;

      // Sleep
      sleep(delay);
    }
  }

  // Print the amount of generated strings
  print("Terminated with result '$random' after $n generated strings.");
}