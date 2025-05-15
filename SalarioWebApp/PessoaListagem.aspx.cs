using System;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace SalarioWebApp
{
    public partial class PessoaListagem : System.Web.UI.Page
    {
        string connString = "User Id=joaopsilvam;Password=123456;Data Source=localhost:1521/XEPDB1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_id"] == null)
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                CarregarPessoas();
            }
        }

        private void CarregarPessoas()
        {
            using (var conn = new OracleConnection(connString))
            {
                conn.Open();
                string query = "SELECT id, nome, email, cidade FROM pessoa ORDER BY id";
                using (var cmd = new OracleCommand(query, conn))
                using (var adapter = new OracleDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gridPessoas.DataSource = dt;
                    gridPessoas.DataBind();
                }
            }
        }

        protected void gridPessoas_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            if (e.CommandName == "Editar")
            {
                Response.Redirect("PessoaFormulario.aspx?id=" + id);
            }
            else if (e.CommandName == "Excluir")
            {
                using (var conn = new OracleConnection(connString))
                {
                    conn.Open();
                    var delete = "DELETE FROM pessoa WHERE id = :id";
                    using (var cmd = new OracleCommand(delete, conn))
                    {
                        cmd.Parameters.Add(new OracleParameter("id", id));
                        cmd.ExecuteNonQuery();
                    }
                }

                string script = "<script>alert('Pessoa excluída com sucesso.');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "alerta", script);
                CarregarPessoas();
            }

        }
    }
}
