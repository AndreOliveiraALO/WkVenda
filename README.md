
# WkVenda - Sistema de Vendas
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/AndreOliveiraALO/dslist/blob/main/LICENSE)

> Sistema desenvolvido como parte de um desafio técnico para vaga de **Desenvolvedor Pleno/Sênior** na empresa **WK**, utilizando **Delphi 11 Alexandria**, com arquitetura **MVC** e foco em boas práticas como **SOLID**, **Clean Code** e **design patterns** aplicados. O projeto foi bem recebido pela banca técnica da empresa, que elogiou sua organização, estrutura e clareza de implementação.
>
> 🎯 **Objetivo deste repositório:**
>
> * Servir como **portfólio profissional** para processos seletivos;
> * Atuar como **documentação técnica** de referência para consultas futuras;
> * Ser um **material de aprendizado** para desenvolvedores Delphi.
---

## 🧱 Arquitetura do Projeto (Padrão MVC)

Inspirado no padrão Model-View-Controller, com separação clara entre responsabilidades:

```text
+----------------+       +-------------------+       +----------------+
|     GUI        | <---> |    Controlador    | <---> |   Domínio      |
| (Formulários)  |       | (Regra de Negócio)|       | (Entidades e   |
|                |       |                   |       |   Validadores) |
+----------------+       +-------------------+       +----------------+
                                                        |
                                                        v
                                                +------------------+
                                                |   Repositório    |
                                                | (Persistência)   |
                                                +------------------+
```

Cada entidade principal (`Cliente`, `Produto`, `Pedido`, `PedidoProduto`) possui sua própria divisão em camadas

```
WkVenda
├── Cliente
│   ├── Controlador
│   ├── Dominio
│   ├── GUI
│   └── Repositorio
├── Pedido
│   ├── Controlador
│   ├── Dominio
│   ├── GUI
│   └── Repositorio
├── PedidoProduto
│   ├── Controlador
│   ├── Dominio
│   └── Repositorio
├── Produto
│   ├── Controlador
│   ├── Dominio
│   ├── GUI
│   └── Repositorio
└── Util
    ├── Enumerados
    ├── ConexaoBanco
    └── ConsultaPadraoGUI.pas
```

* **GUI:** formulários visuais (VCL);
* **Controlador:** lógica de controle da aplicação;
* **Domínio:** regras de negócio e entidades;
* **Repositório:** acesso a dados e persistência (FireDAC).

---

## 🧪 Funcionalidades Implementadas

### 👤 Cliente

* Listagem e busca por nome;
  
![Consultar Cliente](https://github.com/AndreOliveiraALO/Projetos/blob/main/Imagens/WkVenda/ClienteConsulta.png)
  

### 📦 Produto

* Listagem e busca por descrição;
  
![Consultar Produto](https://github.com/AndreOliveiraALO/Projetos/blob/main/Imagens/WkVenda/ProdutoConsulta.png)

### 📑 Pedido

* Criação de pedidos associando cliente e múltiplos produtos
* Cadastro de itens com quantidade, valor unitário e valor total do item.
* Cálculo automático do valor total do pedido

![Criação de Pedido](https://github.com/AndreOliveiraALO/Projetos/blob/main/Imagens/WkVenda/Pedido.png)
  
* Consulta Pedido

![Consultar Pedido](https://github.com/AndreOliveiraALO/Projetos/blob/main/Imagens/WkVenda/PedidoConsulta.png)

* Cancelar pedido

![Cancelar Pedido](https://github.com/AndreOliveiraALO/Projetos/blob/main/Imagens/WkVenda/PedidoCancelar.png)

---

## 🧠 Boas Práticas Aplicadas

* ✅ **Princípios SOLID**:

  * `S` - Cada classe tem uma única responsabilidade
  * `O` - É possível estender comportamentos sem modificar código base
  * `L`, `I`, `D` - Cumprimento por meio de interfaces e injeção indireta

* ✅ **Clean Code**:

  * Métodos pequenos e coesos
  * Nomes autoexplicativos
  * Separação clara de responsabilidades por unidade

* ✅ **Design Patterns**:

  * `Singleton`: Gerência única de conexão com banco (`TConexaoBanco`)
  * `Repository`: Isolamento da lógica de persistência por entidade
  * `DTO-like`: Passagem de dados entre camadas

---

## 🗂️ Modelo Entidade Relacionamento - MER

![Modelo Conceitual](https://github.com/AndreOliveiraALO/Projetos/blob/main/Imagens/WkVenda/MER_ModeloEntidadeRelacionamento.png)

---

## 📥 Instruções para Importação do Banco de Dados

1. Crie um novo banco no seu SGBD, ex: `WkVenda`
2. Execute o arquivo `wk_venda_dump.sql`
3. Verifique se as tabelas foram criadas corretamente
4. Banco pronto para uso

---

## ⚙️ Configuração do Arquivo .ini `config.ini`

Arquivo essencial para parametrização da conexão.

```ini
[BD]
DriverID=MySQL
Server=localhost
Database=WkVenda
User_Name=root
Password=suasenha
Port=3306
```

> O arquivo `.ini` deve estar na mesma pasta do executável. A classe `TConexaoBanco` se encarrega de fazer a leitura automática do arquivo .ini.
---

## ✨ Considerações Finais

Este projeto representa um exemplo sólido de aplicação prática de princípios modernos de desenvolvimento em Delphi, utilizando arquitetura organizada e técnicas que facilitam testes, manutenção e escalabilidade. É ideal para desenvolvedores que buscam entender como aplicar MVC, SOLID e padrões de projeto em Delphi VCL.

---

## 👨‍💼 Autor

[![LinkedIn](https://img.shields.io/badge/-André%20Luiz%20de%20Oliveira-blue?style=flat-square\&logo=linkedin\&logoColor=white\&link=https://www.linkedin.com/in/andre-oliveira-a9a4281b0/)](https://www.linkedin.com/in/andre-oliveira-a9a4281b0/)


