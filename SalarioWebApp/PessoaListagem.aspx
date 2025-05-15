<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PessoaListagem.aspx.cs" Inherits="SalarioWebApp.PessoaListagem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Listagem de Pessoas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            padding: 30px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .container {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

            .grid th {
                background-color: #0066cc;
                color: white;
                padding: 10px;
                text-align: left;
            }

            .grid td {
                padding: 10px;
                border-bottom: 1px solid #eee;
            }

            .grid tr:nth-child(even) {
                background-color: #f9f9f9;
            }

        .btn {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            color: white;
            font-size: 14px;
            margin-right: 6px;
        }

        .btn-editar {
            background-color: #28a745;
        }

        .btn-excluir {
            background-color: #dc3545;
        }

        .btn-novo {
            background-color: #0066cc;
        }
    </style>
</head>
<body>
    <a href="Logout.aspx" style="float: right; color: white; background: #dc3545; padding: 8px 14px; border-radius: 5px; text-decoration: none;">Sair
    </a>

    <form id="form1" runat="server">
        <h2>Listagem de Pessoas</h2>
        <a class="btn btn-novo" href="PessoaFormulario.aspx">+ Nova Pessoa</a>
        <div class="container">
            <asp:GridView ID="gridPessoas" runat="server" AutoGenerateColumns="False" CssClass="grid" OnRowCommand="gridPessoas_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="cidade" HeaderText="Cidade" />
                    <asp:TemplateField HeaderText="Ações">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-editar">Editar</asp:LinkButton>
                            <asp:LinkButton ID="btnExcluir" runat="server" CommandName="Excluir" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-excluir">Excluir</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
