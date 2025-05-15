<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RelatorioSalariosPage.aspx.cs" Inherits="SalarioWebApp.RelatorioSalariosPage" %>
<%@ Register Assembly="CrystalDecisions.Web" Namespace="CrystalDecisions.Web" TagPrefix="cr" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Relatório de Salários</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2 style="font-family:Arial; color:#333;">Relatório de Salários</h2>
        <asp:Label ID="lblDebug" runat="server" ForeColor="Red" />
        <cr:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </form>
</body>
</html>
