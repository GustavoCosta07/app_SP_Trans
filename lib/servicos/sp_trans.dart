import 'dart:convert';
import './request_service.dart';

const apiKey =
    '295afd9ee5c39b526a53792b4b560c574d6a8548146b0355d219b579cdde3390';
const baseUrl = 'http://api.olhovivo.sptrans.com.br/v2.1';
Map<String, String> headers = {};

class SpTrans {
  Map<String, String> endpoints = {
    'autenticar': '${baseUrl}/Login/Autenticar?token=${apiKey}',
    'linhaSentido': '${baseUrl}/Linha/BuscarLinhaSentido',
    'buscarParada': '${baseUrl}/Parada/Buscar',
    'buscarTodasPosicoes': '${baseUrl}/Posicao'
  };

  Future autenticar() async {
    var response = await RequestService.post(url: endpoints['autenticar']);
    headers['cookie'] = response.headers['set-cookie'];
    print(response.body);
  }

  Future getLinhaSentido(String busca, String sentido) async {
    //Realiza uma busca das linhas do sistema com base no sentido informado
    String url =
        '${endpoints["linhaSentido"]}?termosBusca=${busca}&sentido=${sentido}';
    var response = await RequestService.get(url: url, headers: headers);
    print(response.body);
    return (json.decode(response.body));
  }

  // Future getParadas(String busca) async {
  //   // pontos de parada da cidade de São Paulo
  //   var url = '${endpoints["buscarParada"]}?termosBusca=${busca}';
  //   var response = await RequestService.get(url: url, headers: headers);
  //   print(response.body);
  // }

  // Future getPosicaoTodasLinhas() async {
  //   //retornar a posição exata de cada veículo de qualquer linha de ônibus
  //   var url = '${endpoints["buscarTodasPosicoes"]}';
  //   var response = await RequestService.get(url: url, headers: headers);
  //   return (json.decode(response.body));
  // }
}
