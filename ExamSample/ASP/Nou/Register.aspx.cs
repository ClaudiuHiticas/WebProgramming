using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace Nou
{

    public partial class Register : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(@"Data Source=localhost;port=3306;Initial Catalog=web;User Id=root;password=''");


        private Boolean existsUser(String username)
        {
            MySqlCommand cmd = new MySqlCommand("Select Count(*)  from users where username ='" + username + "'", con);
            MySqlDataReader sReader = null;
            Int32 numberOfRows = 0;
            try
            {
                con.Open();
                sReader = cmd.ExecuteReader();

                while (sReader.Read())
                {
                    if (!(sReader.IsDBNull(0)))
                    {
                        numberOfRows = Convert.ToInt32(sReader[0]);
                        if (numberOfRows > 0)
                        {
                            return true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                con.Close();
            }
            return false;
        }

        protected void registerBtn(object sneder, EventArgs e)
        {
            String nameV = text1.Text;
            String passV = text2.Text;

            if (existsUser(nameV))
            {
                Label2.Text = "This username already exist!";
                //Response.Redirect("Register.aspx");
                text1.Text = string.Empty;
                text2.Text = string.Empty;
                return;
            }

            con.Open();

            MySqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.Parameters.AddWithValue("@name", nameV);
            cmd2.Parameters.AddWithValue("@pass", passV);

            String sql = "insert into users (username, password) values(@name, @pass)";
            cmd2.CommandText = sql;
            cmd2.ExecuteNonQuery();
            text1.Text = string.Empty;
            text2.Text = string.Empty;

            con.Close();
            Label2.Text = "Registered succesfuly!";

            //Response.Redirect("Default.aspx");
        }
    }
}
