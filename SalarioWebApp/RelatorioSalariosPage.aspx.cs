using System;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using CrystalDecisions.CrystalReports.Engine;

namespace SalarioWebApp
{
    public partial class RelatorioSalariosPage : System.Web.UI.Page
    {
        string connString = "User Id=joaopsilvam;Password=123456;Data Source=localhost:1521/XEPDB1";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblDebug.Text = "✅ Iniciando carregamento...<br/>";

                var rpt = new ReportDocument();
                string path = Server.MapPath("~/RelatorioSalarios.rpt");
                lblDebug.Text += $"📂 Caminho usado: {path}<br/>";

                if (!System.IO.File.Exists(path))
                {
                    lblDebug.Text += "❌ Arquivo .rpt NÃO encontrado no caminho.";
                    return;
                }

                rpt.Load(path);
                var dados = ObterDados();
                lblDebug.Text += $"✅ {dados.Rows.Count} registro(s) encontrados.<br/>";

                rpt.SetDataSource(dados);
                CrystalReportViewer1.ReportSource = rpt;
            }
            catch (Exception ex)
            {
                lblDebug.Text += "<br><b>❌ Erro:</b><br><pre>" + ex.ToString() + "</pre>";
            }
        }


        private DataTable ObterDados()
        {
            var dt = new DataTable();
            using (var conn = new OracleConnection(connString))
            {
                conn.Open();
                string sql = @"
                    SELECT 
                        p.nome AS nome_pessoa,
                        c.nome AS nome_cargo,
                        ps.salario_bruto,
                        ps.descontos,
                        ps.salario_liquido
                    FROM pessoa p
                    JOIN cargo c ON p.cargo_id = c.id
                    JOIN pessoa_salario ps ON p.id = ps.pessoa_id
                    ORDER BY p.nome";

                using (var cmd = new OracleCommand(sql, conn))
                using (var da = new OracleDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
            return dt;
        }
    }
}
