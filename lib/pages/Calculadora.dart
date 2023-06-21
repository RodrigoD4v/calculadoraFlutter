import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  @override
  String numero = '0';

  double primeiroNumero = 0.0;
  String operaco = '';

  void caucular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;

          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
            //double numeroDouble = double.parse(numero);
            //numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;

      case '-':
      case '/':
      case 'x':
      case '+':
        operaco = tecla;
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;

        if (operaco == '/') {
          if (double.parse(numero) * 1 == 0) {
            print('ERRO: divisão por 0');
            return;
          }
        }

        if (operaco == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }
        if (operaco == '-') {
          resultado = primeiroNumero - double.parse(numero);
        }
        if (operaco == '/') {
          resultado = primeiroNumero / double.parse(numero);
        }
        if (operaco == 'x') {
          resultado = primeiroNumero * double.parse(numero);
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }

        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      case '<=':
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
        });

        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Calculadora'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                numero,
                style: TextStyle(fontSize: 70),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => caucular('AC'),
                child: Text(
                  'AC',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Text('  '),
              Text('  '),
              GestureDetector(
                //trocar por img
                onTap: () => caucular('<='),
                child: Image.asset(
                  'assets/images/backspace.png',
                  width: 65,
                  height: 70,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => caucular('7'),
                child: Text(
                  '7',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('8'),
                child: Text(
                  '8',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('9'),
                child: Text(
                  '9',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('/'),
                child: Text(
                  '/',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => caucular('4'),
                child: Text(
                  '4',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('5'),
                child: Text(
                  '5',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('6'),
                child: Text(
                  '6',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('x'),
                child: Text(
                  'x',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => caucular('1'),
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('2'),
                child: Text(
                  '2',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('3'),
                child: Text(
                  '3',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('-'),
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => caucular('0'),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular(','),
                child: Text(
                  ',',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('='),
                child: Text(
                  '=',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              GestureDetector(
                onTap: () => caucular('+'),
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
          Text('Coluna 6')
        ],
      ),
    );
  }
}