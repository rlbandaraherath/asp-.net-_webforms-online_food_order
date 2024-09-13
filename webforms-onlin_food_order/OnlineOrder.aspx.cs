using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webforms_onlin_food_order
{
    public partial class OnlineOrder : System.Web.UI.Page
    {

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["conn1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            LoadTotal();
        }

        protected void LoadData()
        {

            string Query = "select item_name,item_amount,item_total from temp_cart";


            SqlConnection con = new SqlConnection(ConnectionString);

            con.Open();

            SqlCommand cmd = new SqlCommand(Query, con);

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            adapter.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();


            con.Close();

        }

        protected void LoadTotal()
        {

            string query = "select SUM(item_total) as total from temp_cart";

            SqlConnection con = new SqlConnection(ConnectionString);

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {

                txttotal.Text = reader["total"].ToString();

            }


            con.Close();


        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //take data from temporary table

                string query1 = "select * from temp_cart ";

                SqlConnection conn = new SqlConnection(ConnectionString);

                SqlCommand cmd1 = new SqlCommand(query1, conn);

                conn.Open();

                SqlDataReader reader = cmd1.ExecuteReader();

                reader.Read();


                string item_code = reader["item_code"].ToString();
                string item_name = reader["item_name"].ToString();
                string Item_amount = reader["item_amount"].ToString();
                string item_total = reader["item_total"].ToString();


                conn.Close();

                //string query2 = "select SUM(item_total) as total from temp_cart";

                //SqlCommand cmd2 = new SqlCommand(query2, conn);

                //conn.Open();

                //SqlDataReader reader2 = cmd1.ExecuteReader();

                // reader2.Read();

                //    string total = reader2["total"].ToString();



                //conn.Close();



                string delivery_address = txtdeliveryaddress.Text.ToString();
                string phoneno = txttelephone.Text.ToString();
                string paymentmethod = rblPaymentMethod.SelectedItem.Text.ToString();
                string total = txttotal.Text.ToString();

                string query3 = "Insert  Into pending_order (item_code,item_name,item_amount,item_total,total,delivery_address,phone,payment_method)  Values ('" + item_code + "','" + item_name + "','" + Item_amount + "','" + item_total + "','" + total + "','" + delivery_address + "','" + phoneno + "','" + paymentmethod + "')";

                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query3, con))
                    {
                        cmd.ExecuteNonQuery();
                    }



                }
                clearcart();

            }
            catch (Exception Ex)
            {

            }
        }

        protected void clearcart()
        {

            string query4 = "delete from temp_cart";
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand(query4, con);
                // cmd1.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                DataTable tab1 = new DataTable();

                adapter.Fill(tab1);

                GridView1.DataSource = tab1;
                GridView1.DataBind();
            }




            txtdeliveryaddress.Text = "";
            txttelephone.Text = "";
            rblPaymentMethod.ClearSelection();
            txttotal.Text = "";

            //still need to clear gridview fields

        }

    }
}