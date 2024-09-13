<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Promotions.aspx.cs" Inherits="webforms_onlin_food_order._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="topic01   row">
            <h1 class="topic01">GFC Seasonal Promotions </h1>
        </div>
        <hr/>

        <div class="header02   row">
            <h2 class="topic02">30% Discount on All Below Items </h2>
        </div>
        <hr/>
        <br/>   <br/>   <br/>   


        <%--  crousal starts from here--%>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="path/to/img1.jpg" class="img-responsive" alt="Image 1" width="300" height="300">
        </div>

        <div class="item">
            <img src="path/to/img2.jpg" class="img-responsive" alt="Image 2"  width="300" height="300">
        </div>

        <div class="item">
            <img src="path/to/img3.jpg" class="img-responsive" alt="Image 3"   width="300" height="300">
        </div>

        <div class="item">
            <img src="path/to/img4.jpg" class="img-responsive" alt="Image 4"   width="30" height="300">
        </div>

        <div class="item">
            <img src="path/to/img5.jpg" class="img-responsive" alt="Image 5"  width="300" height="300">
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

    </div>

</asp:Content>
