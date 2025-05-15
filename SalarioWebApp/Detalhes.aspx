<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="SalarioWebApp.Detalhes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalhes do Salário</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            padding: 30px;
        }

        .container {
            background-color: white;
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 8px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .info {
            margin-bottom: 15px;
            font-size: 16px;
        }

        .botao {
            display: inline-block;
            background-color: #0066cc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            margin-right: 10px;
            cursor: pointer;
        }

        .voltar {
            background-color: #999;
        }
    </style>
</head>
<body>
    <a href="Logout.aspx" style="float: right; color: white; background: #dc3545; padding: 8px 14px; border-radius: 5px; text-decoration: none;">Sair
    </a>

    <form id="form1" runat="server">
        <div class="container">
            <h2>Detalhes do Salário da Pessoa</h2>

            <div class="info">
                <asp:Label ID="lblNome" runat="server" Font-Bold="True" Font-Size="Large" />
            </div>
            <div class="info">
                <asp:Label ID="lblSalarioBruto" runat="server" />
            </div>
            <div class="info">
                <asp:Label ID="lblDescontos" runat="server" />
            </div>
            <div class="info">
                <asp:Label ID="lblSalarioLiquido" runat="server" />
            </div>

            <asp:Button ID="btnRecalcular" runat="server" CssClass="botao" Text="Recalcular Salário" OnClick="btnRecalcular_Click" />
            <asp:HyperLink ID="lnkVoltar" runat="server" NavigateUrl="Default.aspx" CssClass="botao voltar" Text="← Voltar para a lista" />
        </div>
    </form>
</body>
</html>
