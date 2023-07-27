class LogicHexAndRGB {
  static RGB hexToRgb(String hex) {
    hex = hex.replaceFirst('#', '');
    int val = int.parse(hex, radix: 16);
    int r = (val >> 16) & 0xff;
    int g = (val >> 8) & 0xff;
    int b = val & 0xff;
    return RGB(r, g, b);
  }

  static String rgbToHex(RGB rgb) {
    int r = rgb.r;
    int g = rgb.g;
    int b = rgb.b;
    return '#${r.toRadixString(16).padLeft(2, '0').toUpperCase()}${g.toRadixString(16).padLeft(2, '0').toUpperCase()}${b.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }
}

class RGB {
  int r;
  int g;
  int b;
  RGB(this.r, this.g, this.b);
}
