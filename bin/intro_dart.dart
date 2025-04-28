import 'dart:io';

void main() {
  /* Suposto ChatBot 
    print("Olá, me chamo Dart. Qual o seu nome?");
    String? nome = stdin.readLineSync();
    print("Muito prazer, $nome. E qual sua Idade?");
    String? idade = stdin.readLineSync();
    print("Então, você se chama $nome e possui $idade anos de idade."); 
  */

  /* print("Digite o Primeiro Número: ");
  var numeroUm = stdin.readLineSync();
  log("Sistema Recebeu primeiro valor.");
  print("Digite o Segundo Número: ");
  log("Sistema Recebeu segundo" 
  "valor.");
  var numeroDois = stdin.readLineSync();
  print("A Soma dos Número é igual a ${numeroUm! + numeroDois!}"); */

  List<String> notas = <String>[];

  menu(notas);
}

void menu(List<String> notas) {
  int comando = int.parse(getComando());

  while (comando != 3) {
    switch (comando) {
      case 1:
        adicionarNotas(notas);
        comando = 0;
        break;
      case 2:
        listarNotas(notas);
        comando = 0;
        break;
      default:
        comando = int.parse(getComando());
        break;
    }
  }

  print("Até mais!");
}

void adicionarNotas(List<String> notasAtuais) {
  String? nota = getInput("Escreva uma Nota:");

  if (nota == null || nota.isEmpty) {
    print("Não é Possível adicionar Nota Vazia.");
    getComando();
  } else {
    notasAtuais.add(nota);
    print("Nota Adicionada com sucesso: $nota");
  }
}

void listarNotas(List<String> notas) {
  for (var nota in notas) {
    print(nota);
  }
}

String getComando() {
  List<String> comandos = ["1", "2", "3"];
  String? entrada = getInput(
    "Digite a Opção:\n1 - Adicionar Nota;\n2 - Listar Notas;\n3 - Sair.",
  );

  if (entrada == null || !comandos.contains(entrada)) {
    print("Operação Inválida!");
    getComando();
  }

  return entrada!;
}

String? getInput(String mensagemTela) {
  print("");
  print(mensagemTela);
  print("");
  return stdin.readLineSync();
}
