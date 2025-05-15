using System;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace SalarioWebApp
{
    public partial class _Default : System.Web.UI.Page
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
                var query = @"
            SELECT 
                p.id,
                p.nome,
                c.nome AS cargo,
                ps.salario_liquido
            FROM pessoa p
            JOIN cargo c ON p.cargo_id = c.id
            JOIN pessoa_salario ps ON p.id = ps.pessoa_id
            ORDER BY p.id";

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
    }
}
