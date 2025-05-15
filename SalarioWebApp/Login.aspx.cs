using System;
using Oracle.ManagedDataAccess.Client;

namespace SalarioWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        string connString = "User Id=joaopsilvam;Password=123456;Data Source=localhost:1521/XEPDB1";

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            using (var conn = new OracleConnection(connString))
            {
                conn.Open();
                string sql = "SELECT id FROM usuario WHERE login = :login AND senha = :senha";

                using (var cmd = new OracleCommand(sql, conn))
                {
                    cmd.Parameters.Add(new OracleParameter("login", txtLogin.Text));
                    cmd.Parameters.Add(new OracleParameter("senha", txtSenha.Text));

                    var result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        Session["usuario_id"] = result.ToString();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblErro.Text = "Usuário ou senha inválidos.";
                    }
                }
            }
        }
    }
}
