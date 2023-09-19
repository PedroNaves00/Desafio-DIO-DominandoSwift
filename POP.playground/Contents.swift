import UIKit
import Dispatch

// Protocolo para representar informações pessoais de um funcionário
protocol InformacoesPessoais {
    var nome: String { get }
    var idade: Int { get }
    var cpf: String { get }
}

// Protocolo para representar o trabalho de um funcionário
protocol Trabalho {
    func realizarTarefa()
}

// Protocolo para representar a remuneração de um funcionário
protocol Remuneracao {
    var salario: Double { get }
}

// Struct para representar um funcionário com informações pessoais
struct FuncionarioComInformacoes: InformacoesPessoais {
    let nome: String
    let idade: Int
    let cpf: String
}

// Struct para representar um funcionário com trabalho
struct FuncionarioComTrabalho: Trabalho {
    func realizarTarefa() {
        print("Realizando tarefas de um funcionário.")
    }
}

// Struct para representar um funcionário com remuneração
struct FuncionarioComRemuneracao: Remuneracao {
    var salario: Double
    
    init(salario: Double) {
        self.salario = salario
    }
}

// Struct que adota múltiplos protocolos para representar um funcionário completo
struct Funcionario: InformacoesPessoais, Trabalho, Remuneracao {
    let nome: String
    let idade: Int
    let cpf: String
    let salario: Double
    var departamento: Departamento
    
    func realizarTarefa() {
        print("\(nome) está realizando suas tarefas como funcionário.")
    }
}

// Enum para representar os departamentos da empresa
enum Departamento {
    case vendas, suporte, desenvolvimento, administrativo
}

let funcionarioJoao = Funcionario(nome: "João", idade: 30, cpf: "123456789", salario: 25000, departamento: .vendas)

if funcionarioJoao.idade >= 18 {
    print("\(funcionarioJoao.nome) é maior de idade.")
} else {
    print("\(funcionarioJoao.nome) é menor de idade.")
}

// Exemplo de coleção de funcionários
var listaFuncionarios: [Funcionario] = []
listaFuncionarios.append(funcionarioJoao)


// Exemplo de função e closure
func calcularBonus(salario: Double, closure: (Double) -> Double) -> Double {
    let bonus = closure(salario)
    return salario + bonus
}

let bonusAniversario: (Double) -> Double = { salario in
    return salario * 0.1 // 10% de bônus de aniversário
}

let salarioFinal = calcularBonus(salario: funcionarioJoao.salario, closure: bonusAniversario)
print("\(funcionarioJoao.nome) recebe um salário de R$ \(funcionarioJoao.salario) e um bônus de R$ \(salarioFinal - funcionarioJoao.salario) devido ao aniversário.")


let queue = DispatchQueue(label: "minhaFila")
queue.async {
    // Simulando uma operação demorada
    sleep(2)
    print("Informações de \(funcionarioJoao.nome) foram buscadas.")
}

print("Aguarde enquanto as informações de \(funcionarioJoao.nome) são buscadas em segundo plano...")
