import 'DES.dart';
import 'Keys.dart';
import 'PlainText.dart';

void main(List<String> args) {
  DES des = new DES();
  des.encrypt("Hello!!!", "AABB09182736CCDD");
}
