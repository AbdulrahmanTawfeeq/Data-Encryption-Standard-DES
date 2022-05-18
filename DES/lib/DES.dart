import 'Keys.dart';
import 'PlainText.dart';
import 'Utilities.dart';

class DES {
  final List<int> __IP = [ 58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4, 62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8, 57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7];
  final List<int> __EXP = [ 32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9, 8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17, 16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25, 24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1];
  final List<int> __SHR = [ 16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10, 2, 8, 24, 14, 32, 27, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25];
  final List<int> __FP = [40,	8,	48,	16,	56,	24,	64,	32, 39,	7,	47,	15,	55,	23,	63,	31, 38,	6,	46,	14,	54,	22,	62,	30, 37,	5,	45,	13,	53,	21,	61,	29, 36,	4,	44,	12,	52,	20,	60,	28, 35,	3,	43,	11,	51,	19,	59,	27, 34,	2,	42,	10,	50,	18,	58,	26, 33,	1,	41,	9,	49,	17,	57,	25];
  List<String> __encHexBlocks = [];
  List<String> __decHexBlocks = [];
  final List<List<List<int>>> S_BOXS = [
    [
      [14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7],
      [0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8],
      [4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0],
      [15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13]
    ],
    [
      [15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10],
      [3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5],
      [0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15],
      [13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9]
    ],
    [
      [10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8],
      [13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1],
      [13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7],
      [1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12]
    ],
    [
      [7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15],
      [13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9],
      [10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4],
      [3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14]
    ],
    [
      [2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9],
      [14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6],
      [4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14],
      [11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3]
    ],
    [
      [12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11],
      [10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8],
      [9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6],
      [4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13]
    ],
    [
      [4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1],
      [13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6],
      [1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2],
      [6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12]
    ],
    [
      [13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7],
      [1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2],
      [7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8],
      [2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11]
    ]
  ];

  late PlainText plainText;
  late Keys keys;
  static final String ENCRYPT = "ENCRYPT";
  static final String DECRYPT = "DECRYPT";

  DES() {}

  List<String>? process(String text, String key, String type) {
    plainText = new PlainText(text);
    keys = new Keys(key);
    if (type == DES.ENCRYPT) {
      __encHexBlocks = [];
    }else if (type == DES.DECRYPT) {
      __decHexBlocks = [];
      keys.setKeys(keys.getKeys().reversed.toList().cast<String>());
    }
    for (String block_64 in plainText.getBlocks()) {
      String bin_64 = Utilities.permute(block_64, __IP); // initial permutation
      List L_R = Utilities.str2Lists(bin_64, (bin_64.length / 2).round());
      List<String> R16_L16 = __round(L_R[0], L_R[1], 0);
      bin_64 = Utilities.permute(R16_L16.join(""), __FP); // final permutation
      
      if (type == DES.ENCRYPT) {
        __encHexBlocks.add(Utilities.bin2hex(bin_64, 16));
      }else if (type == DES.DECRYPT) {
        __decHexBlocks.add(Utilities.bin2hex(bin_64, 16));
      }
    }
    return type == DES.ENCRYPT ? getEncHexBlocks() : type == DES.DECRYPT ? getDecHexBlocks(): null;
  }

  List<String> __round(List<String> L, List<String> R, int round){
    if (round == 16) {
      return R + L;
    }
    List<String> key_48 = Utilities.hex2bin(keys.getKeys()[round], 48).split("");
    round++;
    return __round(R, Utilities.xor(L, __f(R, key_48).split("")), round);  
  }

  String __f(List<String> R_32, List<String> key_48) {
    List<String> R_48 = Utilities.permute(R_32.join(), __EXP).split(""); // Expanding Right one to 48 bit
    String xor_48 = Utilities.xor(R_48, key_48).join();
    String shrinked_32 = "";
    int index = 0;
    for (List _6bits in Utilities.str2Lists(xor_48, 6)) {
      int row = int.parse(_6bits.removeAt(0) + _6bits.removeLast(), radix: 2);
      int col = int.parse(_6bits.join(), radix: 2);
      shrinked_32 += S_BOXS[index][row][col].toRadixString(2).padLeft(4, '0');
      index++;
    }
    return Utilities.permute(shrinked_32, __SHR);
  }

  List<String> getEncHexBlocks() {
    return __encHexBlocks;
  }

  String getEncryptedText() {
    return Utilities.str2Lists(getEncHexBlocks().join(), 2).map((list) => Utilities.hex2text(list.join())).join();
  }

  List<String> getDecHexBlocks() {
    return __decHexBlocks;
  }

  String getDecryptedText() {
    return Utilities.str2Lists(getDecHexBlocks().join(), 2).map((list) => Utilities.hex2text(list.join())).join();
  }
}
