import 'package:flutter/material.dart';
import 'package:meuapp/map.page.dart';
import './servicos/sp_trans.dart';

SpTrans spTrans = SpTrans();

void main() async {
  await spTrans.autenticar();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int codigoDirecao = 1;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          title: Container(
            height: 38,
            child: const BusComponent(),
          ),
        ),
        body: const MapPage(),
      ),
    );
  }
}

class BusComponent extends StatefulWidget {
  const BusComponent({Key? key}) : super(key: key);

  @override
  State<BusComponent> createState() => _BusComponentState();
}

class _BusComponentState extends State<BusComponent> {
  int codigoDirecao = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 2,
          child: BusSearch(requestCodigoAtualizado: requestCodigoAtualizado),
        ),
        Flexible(
          child: DirectionBus(atualizaCodigoDirecao: atualizaCodigoDirecao),
        ),
      ],
    );
  }

  void atualizaCodigoDirecao(int codigo) {
    setState(() {
      codigoDirecao = codigo;
    });
  }

  void requestCodigoAtualizado(String value) async {
    print(codigoDirecao);
    print(value);
    if (value.isNotEmpty && value.length > 3) {
      await spTrans.getLinhaSentido(value, codigoDirecao.toString());
    }
  }
}

class BusSearch extends StatefulWidget {
  // const BusSearch({Key? key}) : super(key: key);
  Function requestCodigoAtualizado;
  BusSearch({Key? key, required this.requestCodigoAtualizado})
      : super(key: key);

  @override
  State<BusSearch> createState() => _BusSearchState();
}

class _BusSearchState extends State<BusSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onSubmitted: (value) {
        widget.requestCodigoAtualizado(value);
      },
      style: TextStyle(
        color: Colors.grey.shade500,
      ),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.bus_alert_sharp,
            color: Colors.grey.shade500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          hintText: 'Linha de ônibus'),
    );
  }
}

class DirectionBus extends StatefulWidget {
  Function atualizaCodigoDirecao;
  DirectionBus({Key? key, required this.atualizaCodigoDirecao})
      : super(key: key);

  @override
  State<DirectionBus> createState() => _DirectionBusState();
}

class _DirectionBusState extends State<DirectionBus> {
  int codigoDirecao = 1;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.white,
      value: codigoDirecao,
      style: TextStyle(color: Colors.grey.shade500),
      onChanged: (value) {
        FocusScope.of(context).requestFocus(FocusNode());
        widget.atualizaCodigoDirecao(value);

        setState(() {
          codigoDirecao = int.parse(value.toString());
        });
      },
      items: <DropdownMenuItem<int>>[
        DropdownMenuItem(
          child: Text('Ida'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Volta'),
          value: 2,
        ),
      ],
    );
  }
}
