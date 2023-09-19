import UIKit

class Funcionario {
    let nome: String
    let idade: Int
    let cpf: String

    // Funções e Closures
    let salario = { (horasTrabalhadas: Int, valorPorHora: Double) -> Double in
        return Double(horasTrabalhadas) * valorPorHora
    }
    
    init(nome: String, idade: Int, cpf: String) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
    }
    
    // Controle de Fluxo
    func trabalhar() {
        let salario = { (horasTrabalhadas: Int, valorPorHora: Double) -> Double in
            return Double(horasTrabalhadas) * valorPorHora
        }
        
        if idade >= 18 {
            print("\(nome) está apto para trabalhar.")
        } else {
            print("\(nome) é menor de idade e não pode trabalhar ainda.")
        }
    }
}

// Herança e polimorfismo
class Gerente: Funcionario {
    var departamento: String
    
    init(nome: String, idade: Int, cpf: String, departamento: String) {
        self.departamento = departamento
        super.init(nome: nome, idade: idade, cpf: cpf)
    }
    
    
    override func trabalhar() {
        // Implementação personalizada do método trabalhar para gerentes
        print("\(nome) está gerenciando o departamento \(departamento).")
    }
    
    func realizarReuniao() {
        print("\(nome) está conduzindo uma reunião do departamento \(departamento).")
    }
    
}

//Coleções
var listaFuncionarios: [Funcionario] = []
listaFuncionarios.append(Funcionario(nome: "João", idade: 25, cpf: "123456789"))
listaFuncionarios.append(Gerente(nome: "Maria", idade: 30, cpf: "987654321", departamento: "Armazem"))

let salarioJoao = listaFuncionarios[0].salario(50, 100)

// Enums e Struct
enum Departamento {
    case vendas, suporte, desenvolvimento, administrativo
}

struct InformacoesAdicionais {
    var salario: Double
    var cargo: String
}

//Concorrencia 
let queue = DispatchQueue(label: "minhaFila")
queue.async {
    // Código para buscar informações do funcionário em segundo plano
    let dadosFuncionario = buscarDadosDoServidor()
    // Atualizar a interface do usuário com os dados do funcionário
    DispatchQueue.main.async {
        self.mostrarDadosDoFuncionario(dadosFuncionario)
    }
}

// Desconsiderar erros do compilador, pois as funçoes foram criadas apenas como exemplo de uma aplicaçao fictícia
