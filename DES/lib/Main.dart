import 'DES.dart';

void main(List<String> args) {
  DES des = new DES();
  List<String> encyptedBlocks = des.encrypt("Hello World", "AABB09182736CCDD");
  print(encyptedBlocks);
  print(des.getEncryptedText());
}
