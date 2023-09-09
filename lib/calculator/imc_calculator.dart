class ImcCalculator {
  double calcularImc(double peso, double altura) {
    return peso / (altura * altura);
  }

  String classificarImc(double imc) {
    if (imc < 18.6) {
      return 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 18.6 && imc < 24.9) {
      return 'Peso Ideal (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 24.9 && imc < 29.9) {
      return 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 29.9 && imc < 34.9) {
      return 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 34.9 && imc < 39.9) {
      return 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 40) {
      return 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
    }
    return 'Indefinido';
  }
}