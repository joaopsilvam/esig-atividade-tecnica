<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SalarioWebApp.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
            padding: 60px;
        }

        .login-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 400px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .login-box h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .botao {
            width: 100%;
            padding: 10px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .erro {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h2>Login</h2>

            <asp:Label ID="lblErro" runat="server" CssClass="erro" />
            <div class="form-group">
                <label>Usuário</label>
                <asp:TextBox ID="txtLogin" runat="server" />
            </div>

            <div class="form-group">
                <label>Senha</label>
                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" />
            </div>

            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="botao" OnClick="btnEntrar_Click" />
        </div>
    </form>
</body>
</html>
