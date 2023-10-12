import 'package:flutter_test/flutter_test.dart';
import 'package:gojek_duplicates/utils/string.dart';

void main() {
  group('Rupiah formatter test', () {
    test('value 2 digit', () {
      final amount = 100.formatRupiah();
      expect(amount, 'Rp 100');
    });

    test('value 3 digit', () {
      final amount = 1000.formatRupiah();
      expect(amount, 'Rp 1.000');
    });

    test('value 6 digit', () {
      final amount = 1000000.formatRupiah();
      expect(amount, 'Rp 1.000.000');
    });
  });
}
