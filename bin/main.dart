import "dart:io";

import "package:hello_worst/random_string.dart";

final generator = RandomString(min: 32, max: 126);

void main() {

  // Ask for confirmation before running
  print("This program (literally) takes decades to terminate, are you sure you want to run this? [Y/N]");

  // Await input
  final input = stdin.readLineSync().toLowerCase();

  // Check input
  if (input == "y" || input == "yes") {

    // Print response
    print("You better be prepared to force quit this. Here we go...");

    // Sleep
    sleep(Duration(seconds: 2));

    // Define goal string
    final goal = "Hello World!";

    // Generate the initial random string
    var random = generator.nextString(goal.length);

    // Print the initial random string
    print(random);

    // Create counter
    var n = 1;

    // Loop while goal is not reached
    while (random != goal) {

      // Generate a new random string
      random = generator.nextString(goal.length);

      // Print the new random string
      print(random);

      // Increase counter
      n++;
    }

    // Print the amount of generated strings
    print("Terminated with result '$random' after $n generated strings.");
  }
  else if (input == "n" || input == "no") {

    // Print response
    print("Good decision!");
  }
  else {

    // Print response
    print("How hard can it be to write 'y' or 'n'? Let's try that again.");

    main();
  }
}
