import './request_service.dart';

const apiKey =
    '295afd9ee5c39b526a53792b4b560c574d6a8548146b0355d219b579cdde3390';
const baseUrl = 'http://api.olhovivo.sptrans.com.br/v2.1';
Map<String, String> headers = {};

class SpTrans {
  Map<String, String> endpoints = {
    'autenticar': '${baseUrl}/Login/Autenticar?token=${apiKey}',
    'linhaSentido': '${baseUrl}/Linha/BuscarLinhaSentido',
    'buscarParada': '${baseUrl}/Parada/Buscar'
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
  }

  Future getParadas(String busca) async {
    // pontos de parada da cidade de São Paulo
    var url = '${endpoints["buscarParada"]}?termosBusca=${busca}';
    var response = await RequestService.get(url: url, headers: headers);
    print(response.body);
  }

  // nao alterados

//   Future getParadasPorLinha() async {
//     // Realiza uma busca por todos os pontos de parada atendidos por uma determinada linha.
//     var url = Uri.parse(
//         '${baseUrl}/Parada/BuscarParadasPorLinha?codigoLinha={codigoLinha}');
//     var response = await http.get(url);
//     print(response.body);
//     // return response.body;
//   }

//   Future getPosicaoTodasLinhas() async {
//     //retornar a posição exata de cada veículo de qualquer linha de ônibus
//     var url = Uri.parse('${baseUrl}/Posicao');
//     var response = await http.get(url);
//     print(response.body);
//     // return response.body;
//   }

//   Future getPosicaoLinha() async {
//     //Retorna uma lista com todos os veículos de uma determinada linha com suas devidas posições
//     var url = Uri.parse('${baseUrl}/Posicao/Linha?codigoLinha=8000');
//     var response = await http.get(url);
//     print(response.body);
//     // return response.body;
//   }

//   Future getPrevisaoLinhaNoPonto() async {
//     //Retorna uma lista com a previsão de chegada dos veículos da linha informada que atende ao ponto de parada informado.
//     var url = Uri.parse(
//         '${baseUrl}/Previsao?codigoParada={codigoParada}&codigoLinha={codigoLinha}');
//     var response = await http.get(url);
//     print(response.body);
//     // return response.body;
//   }

//   Future getPrevisaoTodasLinhasNoPonto() async {
//     //Retorna uma lista com a previsão de chegada dos veículos de cada uma das linhas que atendem ao ponto de parada informado.
//     var url =
//         Uri.parse('${baseUrl}/Previsao/Parada?codigoParada={codigoParada}');
//     var response = await http.get(url);
//     print(response.body);
//     // return response.body;
//   }
// }
}
