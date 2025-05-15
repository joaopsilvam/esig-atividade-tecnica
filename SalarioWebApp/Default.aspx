<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SalarioWebApp._Default" %>

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

        .tabela-container {
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

        .botao-detalhe {
            background-color: #28a745;
            padding: 6px 10px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }

            .botao-detalhe:hover {
                background-color: #218838;
            }
    </style>
</head>
<body>
    <a href="Logout.aspx" style="float: right; color: white; background: #dc3545; padding: 8px 14px; border-radius: 5px; text-decoration: none;">Sair
    </a>

    <form id="form1" runat="server">
        <h2>Listagem de Pessoas, Cargos e Salários</h2>
        <div style="margin-bottom: 20px;">
            <a href="RelatorioSalariosPage.aspx"
                style="background-color: #0066cc; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold;">📄 Ver Relatório de Salários
            </a>
        </div>

        <div class="tabela-container">
            <asp:GridView ID="gridPessoas" runat="server" CssClass="grid" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                    <asp:BoundField DataField="cargo" HeaderText="Cargo" />
                    <asp:BoundField DataField="salario_liquido" HeaderText="Salário Líquido" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Ações">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkDetalhes" runat="server"
                                Text="Ver Detalhes"
                                NavigateUrl='<%# Eval("id", "Detalhes.aspx?id={0}") %>'
                                CssClass="botao-detalhe" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
