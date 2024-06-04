String convertToPascalCase(String input) {
  List<String> words = input.split(' ');
  String result = '';
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      result += word[0].toUpperCase() + word.substring(1).toLowerCase();
      if (i < words.length - 1) {
        result += ' ';
      }
    }
  }
  return result;
}

String convertAndSplitToPascalCase(String input) {
  List<String> words = input.split(' ');
  String result = '';
  String firstLine = '';
  String secondLine = '';

  if (words.length == 2) {
    firstLine = words[0];
    secondLine = words[1];
  } else {
    firstLine = input;
  }

  firstLine = convertToPascalCase(firstLine);
  if (secondLine.isNotEmpty) {
    secondLine = convertToPascalCase(secondLine);
  }

  result = firstLine + '\n' + secondLine;
  return result.trim(); // Trim any leading/trailing whitespace
}
