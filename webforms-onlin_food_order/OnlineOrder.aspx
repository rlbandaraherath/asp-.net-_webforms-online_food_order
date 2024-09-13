<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineOrder.aspx.cs" Inherits="webforms_onlin_food_order.OnlineOrder" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="header" style="width: 100%; background-color: aqua; color: red; font-family: Lucida Handwriting;">
            <h1 class="" style="text-align: center; padding:20px;">GFC Foods Online Order</h1>
        </div>


        <div class="newnavbar">

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">Menu</a>--%>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#">Rice & Curry</a></li>
                            <li><a href="#">Chicken</a></li>
                            <li><a href="#">Burgers</a></li>
                            <li><a href="#">Short Eats</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>



        <br />
        <div class="row    maincontent">

            <div class="col-lg-8  row  ">
                <%-- line1--%>
                <div class="row" style="margin: auto;">


                    <div class="col-lg-3" style="border: 2px solid black; border-radius: 5px; margin: 20px; padding: 10px;">                        sd

                    </div>


                    <div class="col-lg-3" style="border: 2px solid black; border-radius: 5px; margin: 20px; padding: 10px;">
                        sd

                    </div>


                    <div class="col-lg-3" style="border: 2px solid  black; border-radius: 5px; margin: 20px; padding: 10px;">
                        dd

                    </div>

                </div>
                <%-- line1    end--%>
            </div>





            <div class="col-lg-3   foodcart" style="border: 5px double black; border-radius: 10px; margin: 5px; padding: 5px;">
                <h3 style="text-align: center;">Food Cart  </h3>
                <br />
                <h4>Items</h4>



                <div class="gridview">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped">
                        <Columns>

                            <asp:BoundField DataField="item_name" HeaderText="Item Name" />
                            <asp:BoundField DataField="item_amount" HeaderText="Quantity" />
                            <asp:BoundField DataField="item_total" HeaderText="Sub Total" />
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
                <%--   total--%>
                <div class="row">
                    <div class="col-lg-4">

                        <asp:Label ID="lbltotal" runat="server" CssClass="form-label text-primary">
                          Total (RS) 
                        </asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:TextBox ID="txttotal" runat="server" ReadOnly="true" CssClass="form-control" />
                    </div>
                </div>
                <br />
                <br />
                <br />
                <%--   deliveryaddress--%>
                <div class="deliveryaddress">
                    <asp:Label ID="lbladdress" runat="server" CssClass="form-label text-primary">
                     Delivery Address
                    </asp:Label>
                    <asp:TextBox ID="txtdeliveryaddress" runat="server" TextMode="MultiLine" Height="100" Width="100%" CssClass="form-control"></asp:TextBox>
                </div>
                <br />

                <%--  phoneno--%>
                <div class="row">
                    <div class="col-lg-4">

                        <asp:Label ID="lblphoneno" runat="server" CssClass="form-label text-primary">
                          PhoneNo- 
                        </asp:Label>
                    </div>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txttelephone" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <br />
                <%-- payment method--%>
                <div class="">

                    <asp:Label ID="lblpaymentmethod" runat="server" CssClass="form-label text-primary">
                         Please Select Payment Method- 
                    </asp:Label>
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="payment-options">
                        <asp:ListItem Value="1">Cash on Delivery</asp:ListItem>
                        <asp:ListItem Value="2">Online Payment</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
                <br />

                <%--  enter location--%>

                <div>

                    <asp:Label ID="lbllocation" runat="server" CssClass="form-label text-primary">
                        Please Enter Your Location
                    </asp:Label>
                    <%--  enter map here--%>

                    <p>map still loading    </p>
                </div>
                <br />
                <%--   submit button here--%>
                <div class="" style="margin-left: 100px;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
                </div>

                <br />

            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            // On button click
            $('#<%= btnSubmit.ClientID %>').click(function (e) {
                var totalValue = $('#<%= txttotal.ClientID %>').val();  // Get value of txttotal
                var deliveryAddress = $('#<%= txtdeliveryaddress.ClientID %>').val();  // Get value of txtdeliveryaddress
                var paymentMethodSelected = $('input[name="<%= rblPaymentMethod.UniqueID %>"]:checked').val();  // Check if payment method is selected

                // Check if txttotal is empty
                if (totalValue === "") {
                    alert("Please select a food item.");
                    e.preventDefault();  // Prevent form submission
                    return;  // Stop further checks
                }

                // Check if txtdeliveryaddress is empty
                if (deliveryAddress.trim() === "") {
                    alert("Delivery address cannot be empty.");
                    e.preventDefault();
                    return;
                }

                // Check if any payment method is selected
                if (typeof paymentMethodSelected === 'undefined') {
                    alert("Please select a payment method.");
                    e.preventDefault();
                    return;
                }
            });
        });
</script>









</asp:Content>
