using System;
using Oracle.ManagedDataAccess.Client;

namespace SalarioWebApp
{
    public partial class PessoaFormulario : System.Web.UI.Page
    {
        string connString = "User Id=joaopsilvam;Password=123456;Data Source=localhost:1521/XEPDB1";
        int pessoaId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_id"] == null)
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                CarregarCargos();

                if (int.TryParse(Request.QueryString["id"], out pessoaId))
                {
                    lblTitulo.Text = "Edição de Pessoa";
                    CarregarPessoa(pessoaId);
                }
                else
                {
                    lblTitulo.Text = "Cadastro de Pessoa";
                }
            }
        }


        private void CarregarPessoa(int id)
        {
            using (var conn = new OracleConnection(connString))
            {
                conn.Open();
                string sql = "SELECT nome, email, cidade, cargo_id FROM pessoa WHERE id = :id";
                using (var cmd = new OracleCommand(sql, conn))
                {
                    cmd.Parameters.Add(new OracleParameter("id", id));
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtNome.Text = reader["nome"].ToString();
                            txtEmail.Text = reader["email"].ToString();
                            txtCidade.Text = reader["cidade"].ToString();
                            ddlCargo.SelectedValue = reader["cargo_id"].ToString();
                        }
                        else
                        {
                            Response.Redirect("PessoaListagem.aspx");
                        }
                    }
                }
            }
        }

        private void CarregarCargos()
        {
            using (var conn = new OracleConnection(connString))
            {
                conn.Open();
                string query = "SELECT id, nome FROM cargo ORDER BY nome";
                using (var cmd = new OracleCommand(query, conn))
                using (var reader = cmd.ExecuteReader())
                {
                    ddlCargo.Items.Clear();
                    while (reader.Read())
                    {
                        ddlCargo.Items.Add(new System.Web.UI.WebControls.ListItem(
                            reader["nome"].ToString(),
                            reader["id"].ToString()
                        ));
                    }
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            bool edicao = int.TryParse(Request.QueryString["id"], out pessoaId);

            using (var conn = new OracleConnection(connString))
            {
                conn.Open();

                if (edicao)
                {
                    string update = @"UPDATE pessoa SET nome = :nome, email = :email, cidade = :cidade, cargo_id = :cargo_id WHERE id = :id";
                    using (var cmd = new OracleCommand(update, conn))
                    {
                        cmd.Parameters.Add("nome", txtNome.Text);
                        cmd.Parameters.Add("email", txtEmail.Text);
                        cmd.Parameters.Add("cidade", txtCidade.Text);
                        cmd.Parameters.Add("cargo_id", ddlCargo.SelectedValue);
                        cmd.Parameters.Add("id", pessoaId);
                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "<script>alert('Pessoa atualizada com sucesso.');window.location='PessoaListagem.aspx';</script>");
                }
                else
                {
                    string insert = @"INSERT INTO pessoa (id, nome, email, cidade, cargo_id) VALUES (pessoa_seq.NEXTVAL, :nome, :email, :cidade, :cargo_id)";
                    using (var cmd = new OracleCommand(insert, conn))
                    {
                        cmd.Parameters.Add("nome", txtNome.Text);
                        cmd.Parameters.Add("email", txtEmail.Text);
                        cmd.Parameters.Add("cidade", txtCidade.Text);
                        cmd.Parameters.Add("cargo_id", ddlCargo.SelectedValue);
                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", "<script>alert('Pessoa adicionada com sucesso.');window.location='PessoaListagem.aspx';</script>");
                }
            }
        }
    }
}
