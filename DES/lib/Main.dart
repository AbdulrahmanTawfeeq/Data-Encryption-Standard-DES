import 'DES.dart';
import 'Utilities.dart';

void main(List<String> args) {
  DES des = new DES();
  List<String> encyptedBlocks = des.encrypt("Hello World", "AABB09182736CCDD");
  print(encyptedBlocks);

  // d1a87d37f5b6bfe1	51fcc0ce15d3de21
  print(des.getEncryptedText());
}
