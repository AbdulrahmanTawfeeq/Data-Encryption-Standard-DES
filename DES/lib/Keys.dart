import 'Utilities.dart';

class Keys {
  final List __PC1 = [57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36, 63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4];
  final List __PC2 = [14,	17,	11,	24,	1, 5, 3, 28, 15, 6, 21, 10, 23,	19,	12,	4, 26, 8, 16,	7, 27, 20, 13, 2, 41, 52,	31,	37,	47,	55, 30,	40,	51,	45,	33,	48,44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32];
  final List shift_values = [1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1];
  List<String> __keys = [];
  
  Keys(String hex_16) {
    String bin_64 = Utilities.hex2bin(hex_16, 64);
    String bin_56 = Utilities.permute(bin_64, __PC1);

    List L_R = Utilities.str2Lists(bin_56, (bin_56.length/2).round());

    __generator(L_R[0], L_R[1], 0);
  }

  void __generator(List L, List R, int round) {
    if (round == 16) {
      return;
    }
    List L_ = __left_shift(L, shift_values[round]); 
    List R_ = __left_shift(R, shift_values[round]); 
    String bin_48 = Utilities.permute((L_ + R_).join(), __PC2);
    this.__keys.add(Utilities.bin2hex(bin_48, (bin_48.length/4).round()));
    round++;
    __generator(L_, R_, round);
  }

  List __left_shift(List list, int shift_value){
    for (var i = 0; i < shift_value; i++) {
      list.add(list.removeAt(0));
    }
    return list;
  }

  List getKeys(){
    return this.__keys;
  }

  void setKeys(List<String> keys){
    this.__keys = keys;
  }

  @override
  String toString() {
    return super.toString();
  }
}
