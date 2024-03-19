# filmoteca

Aplicativo para apresentar listas de filmes de acordo com o site https://www.themoviedb.org/, tendo suporte para Android, IOS e Web.

## Getting Started

## Run the project
 - Para rodar o projeto, é necessário ter o Flutter instalado, você pode seguir os passos em https://docs.flutter.dev/get-started/install.
 - Após a instalação do flutter, primeiro rode o comando `flutter pug get` na pasta do projeto.
 - Em seguida altere a chave de acesso para a API do The Movie DB no arquivo `lib/config.dart`. Então rode o comando `flutter run` para rodar o projeto.

## Before commit guide
1. Rode o comando `flutter pub run build_runner build --delete-conflicting-outputs` para gerar os arquivos do MobX;
2. Rode o comando  `dart analyze` para analizar erros e avisos;
3. Rode o comando  `dart format -l 120 .` para formatar o código;
4. Rode o comando  `flutter test` para verificar se todos os testes estão passando;

# Tests

### Integration Tests
- Para rodar os testes de integração, use o seguinte guia:
  - Altere a chave de acesso para a API do The Movie DB no arquivo `lib/config.dart`;
  - Rode o comando `flutter test integration_test` em seu IDE;

### Unit Tests
- Para rodar os testes unitários rode o comdando `flutter test test/main.dart` na pasta do projeto.