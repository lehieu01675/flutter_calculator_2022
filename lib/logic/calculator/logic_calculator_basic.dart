

class LogicCalculator {
  static String add(String result, double numOne, double numTwo) {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  static String sub(String result, double numOne, double numTwo) {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  static String mul(String result, double numOne, double numTwo) {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  static String div(String result, double numOne, double numTwo) {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  static String divRemainder(String result, double numOne, double numTwo) {
    int s1 = numOne.toInt();
    int s2 = numTwo.toInt();
    if (s1 == numOne && s2 == numTwo) {
      result = (numOne % numTwo).toString();
      numOne = double.parse(result);
      return doesContainDecimal(result);
    } else {
      return 'Lỗi';
    }
  }

  static String doesContainDecimal(dynamic result) {
    if (result.toString().length > 16) {
      result = result.toString().substring(0, 16);
    }

    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  
}
