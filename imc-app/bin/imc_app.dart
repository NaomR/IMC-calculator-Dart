import 'dart:convert';
import 'dart:io';
import 'package:imc_app/classes/Pessoa.dart';

void main(List<String> arguments) {
  var nome = lerConsole("Digite seu Nome:");
  print(nome);

  var peso = lerConsole("Digite seu peso:");
  print(peso);
  dynamic pesoConvertido = double.tryParse(peso.toString()) ?? 'valor inválido';
  if (pesoConvertido == 'valor inválido') {
    print('peso inválido, operaçao cancelada');
    exit(0);
  }
  var altura = lerConsole("Digite sua Altura");
  print(altura);
  dynamic alturaConvertida =
      double.tryParse(altura.toString()) ?? 'valor inválido';
  String altM = alturaConvertida.toString().substring(0, 1);
  String altCm = alturaConvertida.toString().substring(1, 3);
  double alturaReal = double.parse('$altM.$altCm');

  if (alturaConvertida == 'valor inválido') {
    print('altura inválida, operaçao cancelada');
    exit(0);
  }

  Pessoa p1 = Pessoa(nome.toString(), pesoConvertido, alturaReal);
  print(p1.calculoIMC());
}

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}
