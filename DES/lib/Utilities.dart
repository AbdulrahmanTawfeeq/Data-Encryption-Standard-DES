class Utilities {
  static String hex2bin(String hex, int padLeft) {
    return BigInt.parse(hex, radix: 16).toRadixString(2).padLeft(padLeft, '0');
  }

  static String ascii2bin(int ascii, int padLeft) {
    return ascii.toRadixString(2).padLeft(padLeft, '0');
  }

  static String text2bin(String text, int padLeft) {
    return text.codeUnits.map((ascii) => ascii2bin(ascii, padLeft)).join();
  }

  static String bin2hex(String bin, int padLeft) {
    return BigInt.parse(bin, radix: 2)
        .toRadixString(16)
        .toUpperCase()
        .padLeft(padLeft, '0');
  }

  static int hex2ascii(String hex) {
    return int.parse(hex, radix: 16);
  }

  static String hex2text(String hex) {
    return String.fromCharCode(hex2ascii(hex));
  }

  static List<List<String>> str2Lists(String bin, int length) {
    List<List<String>> list = [];
    int start = 0;
    int end = length;
    for (var i = 0; i < bin.length / length; i++) {
      list.add(bin.substring(start, end).split(""));
      start += length;
      end += length;
    }
    return list;
  }

  static List<String> xor(List<String> list1, List<String> list2) {
    List<String> result = [];
    for (var i = 0; i < list1.length; i++) {
      result.add((int.parse(list1[i]) ^ int.parse(list2[i])).toString());
    }
    return result;
  }

  static String permute(String input, List table) {
    String permuted = "";
    // In dart, the index is from `0`
    table = table.map((e) => e - 1).toList();
    for (var i = 0; i < table.length; i++) {
      permuted += input[table[i]];
    }
    return permuted;
  }
}
