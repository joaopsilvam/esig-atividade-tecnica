# 💼 Sistema de Cálculo de Salários – ASP.NET WebForms + Oracle + Crystal Reports

Este projeto é parte de um desafio técnico para a vaga de Pessoa Desenvolvedora .NET, com o objetivo de desenvolver uma aplicação web que calcula salários com base em regras armazenadas no banco de dados Oracle, exibindo os resultados por meio de uma interface ASP.NET WebForms e relatórios em Crystal Reports.

---

## ✅ Funcionalidades Implementadas

- [x] Cadastro, edição, exclusão e listagem de pessoas
- [x] Associação de cargos e vencimentos
- [x] Cálculo de salários no Oracle por `Procedure`
- [x] Tela inicial com listagem de pessoas, cargos e salários líquidos
- [x] Tela detalhada com salário bruto, descontos e salário líquido
- [x] Tela de relatório gerado com Crystal Reports
- [x] Login e logout com controle de sessão
- [x] Estilização personalizada com CSS
- [x] Mensagens de feedback visuais (sucesso/erro)
- [x] Organização por páginas separadas (WebForms)

---

## 🛠️ Tecnologias Utilizadas

- ASP.NET WebForms (.NET Framework 4.7.2)
- Oracle Database 21c XE
- Oracle Managed Data Access (`Oracle.ManagedDataAccess`)
- Crystal Reports Developer Edition for Visual Studio
- HTML5 + CSS3 (custom UI)
- ADO.NET

---

## 📁 Estrutura de Telas

| Página                     | Descrição                                      |
|----------------------------|-----------------------------------------------|
| `Login.aspx`               | Tela de autenticação                         |
| `Default.aspx`             | Listagem de pessoas e salários líquidos      |
| `Detalhes.aspx`            | Visualização de salário bruto e descontos    |
| `PessoaCadastro.aspx`      | Cadastro e edição de pessoa                  |
| `RelatorioSalariosPage.aspx` | Relatório com todos os salários via Crystal Reports |
| `Logout.aspx`              | Encerrar sessão                              |

---

## ⚙️ Requisitos para execução local

1. **Visual Studio 2019/2022**
   - Com suporte para ASP.NET WebForms
2. **Oracle Database XE** (21c ou compatível)
3. **Oracle ManagedDataAccess Client**
4. **Crystal Reports Developer Edition para Visual Studio**
   - [Baixar aqui](https://www.crystalreports.com/download/)
   - **Instale também o Visual C++ 2013 Redistributable (x64)**

---

## 🚀 Como Executar Localmente

1. **Clone ou extraia o projeto:**

```bash
git clone https://github.com/joaopsilvam/esig-atividade-tecnica
```

2. **Abra no Visual Studio**

3. **Configure o banco Oracle:**
   - Crie o usuário: `joaopsilvam`
   - Execute os scripts de criação de tabelas e `procedure` disponíveis
   - Atualize a string de conexão do banco nas páginas:

```csharp
string connString = "User Id=joaopsilvam;Password=123456;Data Source=localhost:1521/XEPDB1";
```

4. **Compile e execute o projeto (F5)**

5. **Acesse pela URL padrão:**
   - `http://localhost:xxxxx/Login.aspx`

---

## 🧪 Usuário de Teste

- **Login:** admin  
- **Senha:** 123456  

---

## 📊 Observações

- Os cálculos de salário são feitos via `Procedure` no Oracle
- O relatório é alimentado por `DataTable` no código, evitando conexão direta do `.rpt` com o banco
- O projeto foi organizado em camadas simples, separando UI, lógica de cálculo e persistência

---

## 📩 Dúvidas ou sugestões?

Entre em contato pelo GitHub ou envie um e-mail para `joaopsilvam88@gmail.com`.
