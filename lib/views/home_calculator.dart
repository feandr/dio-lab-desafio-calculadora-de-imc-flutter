import 'package:flutter/material.dart';
import 'package:imc_calculator/calculator/imc_calculator.dart';
import 'package:imc_calculator/config_fields/weight_control.dart';
import 'package:imc_calculator/widgets/custom_app_bar.dart';

import 'package:imc_calculator/widgets/custom_calculate.dart';
import 'package:imc_calculator/widgets/custom_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _info = "Informe seus dados.";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserInput userInput = UserInput();
  ImcCalculator imcCalculator = ImcCalculator();

  void _resetFields() {
    userInput.pesoController.text = '';
    userInput.alturaController.text = '';
    setState(() {
      _info = "Informe seus dados.";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(userInput.pesoController.text);
      double altura = double.parse(userInput.alturaController.text) / 100;
      double imc = imcCalculator.calcularImc(peso, altura);
      String imcClassificacao = imcCalculator.classificarImc(imc);
      setState(() {
        _info = imcClassificacao;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onReset: _resetFields),
      backgroundColor: const Color.fromARGB(255, 42, 49, 50),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 90, // Largura desejada do ícone redondo
                  height: 90, // Altura desejada do ícone redondo
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(colors: [
                      Color.fromARGB(255, 118, 246, 191),
                      Color.fromARGB(255, 73, 237, 48),
                      Color.fromARGB(255, 46, 159, 114),
                    ]),
                    shape: BoxShape.circle,
                    color: Colors.green, // Cor de fundo do ícone
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person_3_sharp, // Ícone desejado
                      color: Colors.white, // Cor do ícone
                      size: 65, // Tamanho do ícone
                    ),
                  ),
                ),
              ),
              CustomTextField(
                controller: userInput.pesoController,
                label: "Peso (kg)",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu Peso!";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                controller: userInput.alturaController,
                label: "Altura (CM)",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua Altura!";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              CustomCalculateButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calcular();
                  }
                },
              ),
              Text(
                _info,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
