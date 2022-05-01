import 'Utilities.dart';

class PlainText {
  late String __text;
  final int block_size = 64;
  late int __num_of_blocks;
  List<String> __blocks = [];

  PlainText(String text) {
    this.__text = text;
    // each letter to its ascii -> each ascii to its 8 bits binary
    __setBlocks(Utilities.text2bin(this.__text, 8));
  }

  void __setBlocks(String bin_str) {
    this.__num_of_blocks = (bin_str.length / block_size).round();
    bin_str = bin_str.padRight(__num_of_blocks * block_size, '0');
    this.__blocks = Utilities.bin2Lists(bin_str, block_size)
        .map((list) => list.join())
        .toList();
  }

  String getText() {
    return this.__text;
  }

  List getBlocks() {
    return this.__blocks;
  }
}
