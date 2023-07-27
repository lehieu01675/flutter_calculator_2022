class LogicResistor {
  static String measure = 'Ω';
  static fourColor(int c1, int c2, int c3, int c4) {
    measure = 'Ω';
    double result = ((c1 * 10 + c2) * setMultiplier(c3)).toDouble();
    if (result >= 1000000) {
      result /= 1000000;
      measure = 'MΩ';
    } else if (result >= 1000) {
      result /= 1000;
      measure = 'kΩ';
    }

    return '$result $measure ±${setDungSai(c4)}%';
  }

  static fiveColor(int c1, int c2, int c3, int c4, int c5) {
    measure = 'Ω';
    double result = ((c1 * 100 + c2 * 10 + c3) * setMultiplier(c4)).toDouble();
    if (result >= 1000000) {
      result /= 1000000;
      measure = 'MΩ';
    } else if (result >= 1000) {
      result /= 1000;
      measure = 'kΩ';
    }

    return '${result.toStringAsFixed(2)} $measure ±${setDungSai(c5)}%';
  }

  static setMultiplier(int input) {
    switch (input) {
      case 0:
        return 0.01;
      case 1:
        return 0.1;
      case 2:
        return 1;
      case 3:
        return 10;
      case 4:
        return 100;
      case 5:
        return 1000;
      case 6:
        return 10000;
      case 7:
        return 100000;
      case 8:
        return 1000000;
      case 9:
        return 10000000;

      default:
        return 0;
    }
  }

  static setDungSai(int value) {
    switch (value) {
      case 0:
        return 10;
      case 1:
        return 5;
      case 2:
        return 1;
      case 3:
        return 2;
      case 4:
        return 0.5;
      case 5:
        return 0.25;
      case 6:
        return 0.1;
      case 7:
        return 0;
      default:
        return 0;
    }
  }
}
