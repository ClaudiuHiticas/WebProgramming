using System;
using System.Web;
using System.Web.UI;
using System.Data;
using MySql.Data.MySqlClient;

namespace Nou
{

    public partial class home : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(@"Data Source=localhost;port=3306;Initial Catalog=web;User Id=root;password=''");

        String table;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void LogoutClick(object sneder, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void LoadTabData(object sneder, EventArgs e)
        {
            this.showFiles();
        }

        private void showFiles()
        {
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from multimedia";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            table = "";
            table += "<table border='1'>";
            table += "<tr><th>Id</th><th>Title</th><th>Type</th><th>Genre</th><th>Path</th></tr>";
            foreach (DataRow dr in dt.Rows)
            {
                table += "<tr>";
                table += "<td>" + dr["id"];
                table += "<td>" + dr["title"];
                table += "<td>" + dr["type"];
                table += "<td>" + dr["genre"];
                table += "<td>" + dr["path"];
            }

            table += "</table>";
            placeholder1.Controls.Add(new LiteralControl { Text = table });
            con.Close();

        }

        protected void addFileFunc(object sneder, EventArgs e)
        {
            String titleV = title.Text;
            String typeV = type.Text;
            String genreV = genre.Text;
            String pathV = path.Text;
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@title", titleV);
            cmd.Parameters.AddWithValue("@type", typeV);
            cmd.Parameters.AddWithValue("@genre", genreV);
            cmd.Parameters.AddWithValue("@path", pathV);
            string sql = "insert into `multimedia` (`title`, `type`, `genre`, `path`) values (@title, @type, @genre, @path)";

            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            type.Text = string.Empty;
            title.Text = string.Empty;
            genre.Text = string.Empty;
            path.Text = string.Empty;

            con.Close();
            this.showFiles();
        }

        protected void editFileFunc(object sneder, EventArgs e)
        {
            String idV = eid.Text;
            String titleV = etitle.Text;
            String typeV = etype.Text;
            String genreV = egenre.Text;
            String pathV = epath.Text;
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", idV);
            cmd.Parameters.AddWithValue("@title", titleV);
            cmd.Parameters.AddWithValue("@type", typeV);
            cmd.Parameters.AddWithValue("@genre", genreV);
            cmd.Parameters.AddWithValue("@path", pathV);
            string sql = "UPDATE multimedia " +
                         "SET title = @title, type = @type, genre = @genre, path = @path " +
                         "WHERE id = @id";

            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            eid.Text = string.Empty;
            etype.Text = string.Empty;
            etitle.Text = string.Empty;
            egenre.Text = string.Empty;
            epath.Text = string.Empty;

            con.Close();
            this.showFiles();
        }


        protected void deleteFileFunc(object sneder, EventArgs e)
        {
            String fileIdV = fileID.Text;
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from multimedia where id=" + fileIdV;
            cmd.ExecuteNonQuery();
            con.Close();
            fileID.Text = string.Empty;
            this.showFiles();
        }

        protected void filterFunc(object sneder, EventArgs e)
        {
            //Console.WriteLine("0");
         
            String genreFilterV = genreFilter.Text;
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@genreFilter", genreFilterV);
            //Console.WriteLine("1")
            string sql = "SELECT * FROM multimedia WHERE genre=@genreFilter";
            cmd.CommandText = sql;
            //Console.WriteLine("2");
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            table = "";
            table += "<table border='1'>";
            table += "<tr><th>Id</th><th>Title</th><th>Type</th><th>Genre</th><th>Path</th></tr>";
            foreach (DataRow dr in dt.Rows)
            {
                table += "<tr>";
                table += "<td>" + dr["id"];
                table += "<td>" + dr["title"];
                table += "<td>" + dr["type"];
                table += "<td>" + dr["genre"];
                table += "<td>" + dr["path"];
            }
            table += "</table>";
            placeholder2.Controls.Add(new LiteralControl { Text = table });
            con.Close();

        }

        private void hideAll()
        {
            addFile.Visible = false;
            deleteFile.Visible = false;
            editFile.Visible = false;
            filterForm.Visible = false;
        }
        

    }



}