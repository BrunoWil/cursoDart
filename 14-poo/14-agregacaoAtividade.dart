import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  //Adicionado
  String get nome => _nome;
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
  //Adicionado
  String get nome => _nome;
  List<Dependente> get dependentes => _dependentes;
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

//Pesquisado
  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((funcionario) => {
        'nome': funcionario.nome,
        'dependentes': funcionario.dependentes.map((dependente) => dependente.nome).toList(),
        }).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes 👌
  var dependentes_1 = Dependente("Bruno");
  var dependentes_2 = Dependente("João");
  var dependentes_3 = Dependente("Maria");
  var dependentes_4 = Dependente("José");
  var dependentes_5 = Dependente("Gabriel");
  // 2. Criar varios objetos Funcionario👌
  // 3. Associar os Dependentes criados aos respectivos funcionarios 👌

  var funcionario_1 = Funcionario("Gorge", [dependentes_1, dependentes_2]);
  var funcionario_2 = Funcionario("Alisson", [dependentes_3, dependentes_4]);
  var funcionario_3 = Funcionario("Joel", [dependentes_5]);

  // 4. Criar uma lista de Funcionarios

  var funcionarios = [funcionario_1, funcionario_2, funcionario_3];

  /* 5. criar um objeto Equipe Projeto 
  chamando o metodo contrutor que dá nome ao projeto e
   insere uma coleção de funcionario 👌 */
  var equipeProjeto = EquipeProjeto('MeuProjeto', funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto. 👌
  var equipeProjetoJson = jsonEncode(equipeProjeto.toJson());
  print(equipeProjetoJson);
}
