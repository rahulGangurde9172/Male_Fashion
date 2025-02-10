<%@ Page Title="Fashion Blog" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Blogs.aspx.cs" Inherits="MELEFASHION.Pages.Blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/style.css" rel="stylesheet" />
    <style>
        .breadcrumb-blog {
    position: relative;
    text-align: center;
    color: white;
}

.breadcrumb-img {
    width: 100%;
    height: 300px; /* Adjust height as needed */
    object-fit: cover;
    filter: brightness(50%); /* Darkens the image for better text visibility */
}

.breadcrumb-title {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 36px;
    font-weight: bold;
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Section -->
   <section class="breadcrumb-blog">
    <div class="container text-center position-relative">
        <img src="images/breadcrumb-bg.jpg" alt="Men's Fashion Trends" class="img-fluid breadcrumb-img">
        <h2 class="breadcrumb-title text-uppercase">Our Fashion Blog</h2>
    </div>
</section>


    <!-- Blog Section -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <!-- Blog Items (9 Items) -->
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-1.jpg" alt="Men's Fashion Trends" class=" img-fluid">
                        </div>
                        <div class="blog__item__text ">
                            <span  ><img src="images/icon/calendar.png" alt=""> 16 February 2024</span>
                            <h5>Latest Men's Fashion Trends</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-2.jpg" alt="Best Suit Styles" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 21 February 2024</span>
                            <h5>Best Suit Styles for 2024</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-3.jpg" alt="Sunglasses for Men" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 28 February 2024</span>
                            <h5>The Best Sunglasses for Men</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-4.jpg" alt="Men's Accessories" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 16 March 2024</span>
                            <h5>Top Men's Accessories to Own</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-5.jpg" alt="Wedding Suit Guide" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 21 March 2024</span>
                            <h5>The Ultimate Wedding Suit Guide</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-6.jpg" alt="Men's Footwear" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 28 March 2024</span>
                            <h5>Best Shoes for Every Occasion</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-7.jpg" alt="Summer Fashion" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 16 April 2024</span>
                            <h5>How to Style for Summer 2024</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-8.jpg" alt="Grooming Tips" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 21 April 2024</span>
                            <h5>Essential Grooming Tips for Men</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="images/blog-9.jpg" alt="Streetwear Guide" class="img-fluid">
                        </div>
                        <div class="blog__item__text">
                            <span><img src="images/icon/calendar.png" alt=""> 28 April 2024</span>
                            <h5>Streetwear Trends You Need</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
