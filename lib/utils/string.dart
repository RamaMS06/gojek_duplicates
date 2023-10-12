extension FormatCurrency on int {
  String formatRupiah() {
    const currencySymbol = 'Rp';
    final parts = toString().split('.');
    final numberPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    final formattedValue = '$currencySymbol $numberPart';
    return parts.length == 2 ? '$formattedValue.${parts[1]}' : formattedValue;
  }
}
