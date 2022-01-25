import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

class MockApi extends Mock {

  set postJson(String json){
    jsonData = jsonData + json;

  }
}

String jsonData = ''' 
{
    "questionario": [
        {
            "id": 1,
            "titulo": "Preferências pessoais",
            "questoes": [
                {
                    "id": 1,
                    "titulo": "Livro favorito",
                    "descricao": "Qual é o livro que você mais gostou até hoje?"
                },
                {
                    "id": 2,
                    "titulo": "Filme favorito",
                    "descricao": "Qual é o filme que você mais gostou até hoje?"
                }
            ]
        },
        {
            "id": 2,
            "titulo": "Preferências  de hobbies",
            "questoes": [
                {
                    "id": 1,
                    "titulo": "Esporte",
                    "descricao": "Qual é o Esporte que você mais gostou até hoje?"
                },
                {
                    "id": 2,
                    "titulo": "Esporte favorito ",
                    "descricao": "Qual é o Esporte que você mais praticou até hoje?"
                }
            ]
        },
        {
            "id": 3,
            "titulo": "Preferências  de games",
            "questoes": [
                {
                    "id": 1,
                    "titulo": "Jogo Favorito",
                    "descricao": "Qual é o jogo que você mais gostou até hoje?"
                },
                {
                    "id": 2,
                    "titulo": "Mais jogado",
                    "descricao": "Qual é o jogo que você mais jogou até hoje?"
                }
            ]
        },
        {
            "id": 4,
            "titulo": "Preferências  de de viagem",
            "questoes": [
                {
                    "id": 1,
                    "titulo": "Onde mais gostou de visitar",
                    "descricao": "Qual é o lugar que você mais gostou até hoje?"
                },
                {
                    "id": 2,
                    "titulo": "Qual lugar mais visitado",
                    "descricao": "Qual é o lugar que você mais visitou até hoje?"
                }
            ]
        },
        {
            "id": 5,
            "titulo": "Preferências  de Restaurante",
            "questoes": [
                {
                    "id": 1,
                    "titulo": "Restaurante",
                    "descricao": "Qual é o Restaurante que você mais gostou até hoje?"
                },
                {
                    "id": 2,
                    "titulo": "Restaurante",
                    "descricao": "Qual é o Restaurante que você mais foi até hoje?"
                }
            ]
        },
        {
            "id": 6,
            "titulo": "Preferências  de músicas",
            "questoes": [
                {
                    "id": 1,
                    "titulo": "músicas",
                    "descricao": "Qual é o música que você mais gostou até hoje?"
                },
                {
                    "id": 2,
                    "titulo": "músicas",
                    "descricao": "Qual é o música que você mais escutou até hoje?"
                }
            ]
        }
    ]
}
''';
