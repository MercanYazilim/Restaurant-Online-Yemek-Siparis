﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Yonetici_Slider : System.Web.UI.Page
{
    SqlConnection _cnn;
    SqlCommand _cmd;
    Data _clsData = new Data();
    private string Baglan = ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    DataTable _dtYemek;
    DataTable _dtYemekResim;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _fnc_Yemek();
            _fnc_SliderList();
        }
        try
        {
            if (Request.QueryString["Sil"].ToString() != "")
            {
                _clsData._fncVeriGetir("DELETE FROM Slider WHERE SliderID=" + Request.QueryString["Sil"].ToString());
                _fnc_SliderList();
            }
        }
        catch (Exception)
        {

        }
    }
    private void _fnc_Yemek()
    {
        try
        {
            _dtYemek = _clsData._fncVeriGetir("select * from Yemek");
            ListBox1.DataSource = _dtYemek;
            ListBox1.DataValueField = "YemekID";
            ListBox1.DataTextField = "YemekAdi";
            ListBox1.DataBind();
        }
        catch (Exception)
        {
            
        }

    }
    private void _fnc_SliderList()
    {
        try
        {
            _lstSliderList.DataSource = _clsData._fncVeriGetir("SELECT  dbo.Yemek.YemekAdi, dbo.Yemek.Resim, dbo.Slider.SliderID FROM  dbo.Slider INNER JOIN dbo.Yemek ON dbo.Slider.YemekID = dbo.Yemek.YemekID");
            _lstSliderList.DataBind();
        }
        catch (Exception)
        {
            
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            _dtYemekResim = _clsData._fncVeriGetir("select * from Yemek where YemekID=" + ListBox1.SelectedValue.ToString());
            Image1.ImageUrl = "../" + _dtYemekResim.Rows[0]["Resim"].ToString();
        }
        catch (Exception)
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            _cnn = new SqlConnection(Baglan);
            _cnn.Open();
            _cmd = new SqlCommand("INSERT INTO Slider (YemekID) VALUES (@YemekID)", _cnn);
            _cmd.Parameters.AddWithValue("YemekID", Convert.ToInt32(ListBox1.SelectedValue));
            _cmd.ExecuteNonQuery();
            _cmd.Dispose();
            _cnn.Close();
            _lblKayit.Text = "Yemek Başarıyla Kayıt Edildi.";
            _fnc_SliderList();
        }
        catch (Exception)
        {

        }
    }
}