import 'package:flutter/material.dart';

class SetValueResistor {
  static setValue(String? value) {
    switch (value) {
      case 'Đen (0)':
        return 0;
      case 'Nâu (1)':
        return 1;
      case 'Đỏ (2)':
        return 2;
      case 'Cam (3)':
        return 3;
      case 'Vàng (4)':
        return 4;
      case 'Lục (5)':
        return 5;
      case 'Lam (6)':
        return 6;
      case 'Tím (7)':
        return 7;
      case 'Xám (8)':
        return 8;
      case 'Trắng (9)':
        return 9;
      default:
        return 0;
    }
  }

  static setColorOfContainerForColorButton(String? value) {
    switch (value) {
      case 'Đen (0)':
        return Colors.black;
      case 'Nâu (1)':
        return Colors.brown;
      case 'Đỏ (2)':
        return Colors.red;
      case 'Cam (3)':
        return Colors.orange;
      case 'Vàng (4)':
        return Colors.yellow;
      case 'Lục (5)':
        return Colors.green;
      case 'Lam (6)':
        return Colors.blue;
      case 'Tím (7)':
        return Colors.purple;
      case 'Xám (8)':
        return Colors.grey;
      case 'Trắng (9)':
        return Colors.white;
      default:
        return Colors.transparent;
    }
  }

  static setColorOfContainerForMulti(String? value) {
    switch (value) {
      case 'Bạc (0.01Ω)':
        return const Color(0xFFC0C0C0);
      case 'Vàng kim (0.1Ω)':
        return const Color(0xffFFD700);
      case 'Đen (1Ω)':
        return Colors.black;
      case 'Nâu (10Ω)':
        return Colors.brown;
      case 'Đỏ (100Ω)':
        return Colors.red;
      case 'Cam (1kΩ)':
        return Colors.orange;
      case 'Vàng (10kΩ)':
        return Colors.yellow;
      case 'Lục (100kΩ)':
        return Colors.green;
      case 'Lam (1MΩ)':
        return Colors.blue;
      case 'Tím (10MΩ)':
        return Colors.purple;
      default:
        return Colors.transparent;
    }
  }

  static setColorOfContainerForDungSai(String? value) {
    switch (value) {
      case 'Bạc (± 10%)':
        return const Color(0xFFC0C0C0);
      case 'Vàng kim (± 5%)':
        return const Color(0xffFFD700);
      case 'Nâu (± 1%)':
        return Colors.brown;
      case 'Đỏ (± 2%)':
        return Colors.red;
      case 'Lục (± 0.5%)':
        return Colors.green;
      case 'Lam (± 0.25%)':
        return Colors.blue;
      case 'Tím (± 0.1%)':
        return Colors.purple;
      default:
        return Colors.transparent;
    }
  }

  static setMultiplier(String? value) {
    switch (value) {
      case 'Bạc (0.01Ω)':
        return 0;
      case 'Vàng kim (0.1Ω)':
        return 1;
      case 'Đen (1Ω)':
        return 2;
      case 'Nâu (10Ω)':
        return 3;
      case 'Đỏ (100Ω)':
        return 4;
      case 'Cam (1kΩ)':
        return 5;
      case 'Vàng (10kΩ)':
        return 6;
      case 'Lục (100kΩ)':
        return 7;
      case 'Lam (1MΩ)':
        return 8;
      case 'Tím (10MΩ)':
        return 9;
      default:
        return 0;
    }
  }

  static setDungSai(String? value) {
    switch (value) {
      case 'Bạc (± 10%)':
        return 0;
      case 'Vàng kim (± 5%)':
        return 1;
      case 'Nâu (± 1%)':
        return 2;
      case 'Đỏ (± 2%)':
        return 3;
      case 'Lục (± 0.5%)':
        return 4;
      case 'Lam (± 0.25%)':
        return 5;
      case 'Tím (± 0.1%)':
        return 6;
      case 'Màu':
        return 7;
      default:
        return 7;
    }
  }

  static setColorOfContainerForPPM(String? value) {
    switch (value) {
      case 'Nâu (100 ppm)':
        return Colors.brown;
      case 'Đỏ (50 ppm)':
        return Colors.red;
      case 'Cam (15 ppm)':
        return Colors.orange;
      case 'Vàng (25 ppm)':
        return Colors.yellow;

      default:
        return Colors.transparent;
    }
  }

  static setPPM(String? value) {
    switch (value) {
      case 'Nâu (100 ppm)':
        return '100 pm';
      case 'Đỏ (50 ppm)':
        return '50 pm';
      case 'Cam (15 ppm)':
        return '15 pm';
      case 'Vàng (25 ppm)':
        return '25 pm';
      default:
        return '';
    }
  }
}
