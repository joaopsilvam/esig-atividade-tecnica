using System;
using System.Data;
using System.Threading.Tasks;
using Oracle.ManagedDataAccess.Client;

namespace SalarioWebApp
{
    public partial class Detalhes : System.Web.UI.Page
    {
        string connString = "User Id=joaopsilvam;Password=123456;Data Source=localhost:1521/XEPDB1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int pessoaId = int.Parse(Request.QueryString["id"]);
                    CarregarSalario(pessoaId);
                }
            }
        }

        private void CarregarSalario(int pessoaId)
        {
            using (var conn = new OracleConnection(connString))
            {
                conn.Open();
                var query = @"
                    SELECT p.nome, ps.salario_bruto, ps.descontos, ps.salario_liquido
                    FROM pessoa p
                    JOIN pessoa_salario ps ON p.id = ps.pessoa_id
                    WHERE p.id = :id";

                using (var cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.Add(new OracleParameter("id", pessoaId));
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblNome.Text = "Nome: " + reader["nome"].ToString();
                            lblSalarioBruto.Text = "Salário Bruto: R$ " + Convert.ToDecimal(reader["salario_bruto"]).ToString("N2");
                            lblDescontos.Text = "Descontos: R$ " + Convert.ToDecimal(reader["descontos"]).ToString("N2");
                            lblSalarioLiquido.Text = "Salário Líquido: R$ " + Convert.ToDecimal(reader["salario_liquido"]).ToString("N2");
                        }
                        else
                        {
                            lblNome.Text = "Pessoa não encontrada.";
                        }
                    }
                }
            }
        }

        protected async void btnRecalcular_Click(object sender, EventArgs e)
        {
            await Task.Run(() =>
            {
                using (var conn = new OracleConnection(connString))
                {
                    conn.Open();
                    using (var cmd = new OracleCommand("CALCULAR_SALARIOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                    }
                }
            });

            int pessoaId = int.Parse(Request.QueryString["id"]);
            CarregarSalario(pessoaId);
        }


    }
}
