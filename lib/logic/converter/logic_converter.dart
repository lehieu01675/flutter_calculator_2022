class LogicCovert {
  static String inputToDecimal(String inputNumber, int id) {
    int? decimalNumber = int.tryParse(inputNumber, radix: id);
    if (inputNumber.isEmpty) return 'Lỗi';
    return decimalNumber.toString();
  }

  static String decimalToAnother(String inputNumber, int id) {
    int? decimalNumber = int.tryParse(inputNumber);
    if (inputNumber.isEmpty) {
      return 'Lỗi';
    } else {
      String outputNumer = decimalNumber!.toRadixString(id);
      return outputNumer;
    }
  }

  static String convertNumber(String number, int targetBase, int inputId) {
    if (number.isEmpty) return 'Lỗi';
    int decimal = int.parse(number, radix: inputId);
    return decimal.toRadixString(targetBase);
  }
}
