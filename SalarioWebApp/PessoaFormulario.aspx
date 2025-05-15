<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PessoaFormulario.aspx.cs" Inherits="SalarioWebApp.PessoaFormulario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%: Page.Title %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            padding: 30px;
        }

        .form-container {
            background-color: white;
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 8px;
            max-width: 500px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .botao {
            background-color: #0066cc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .voltar {
            background-color: #999;
            margin-left: 10px;
        }

        .dropdown {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <a href="Logout.aspx" style="float: right; color: white; background: #dc3545; padding: 8px 14px; border-radius: 5px; text-decoration: none;">Sair
    </a>

    <form id="form1" runat="server">
        <div class="form-container">
            <h2>
                <asp:Label ID="lblTitulo" runat="server" Text="Cadastro de Pessoa" /></h2>

            <div class="form-group">
                <label>Nome</label>
                <asp:TextBox ID="txtNome" runat="server" />
            </div>

            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
            </div>

            <div class="form-group">
                <label>Cidade</label>
                <asp:TextBox ID="txtCidade" runat="server" />
            </div>

            <div class="form-group">
                <label>Cargo</label>
                <asp:DropDownList ID="ddlCargo" runat="server" CssClass="dropdown" />
            </div>

            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="botao" OnClick="btnSalvar_Click" />
            <asp:HyperLink ID="lnkVoltar" runat="server" NavigateUrl="PessoaListagem.aspx" CssClass="botao voltar" Text="← Voltar" />
        </div>
    </form>
</body>
</html>
