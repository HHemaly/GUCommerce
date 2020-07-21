using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class VendorHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoToVendorEdit(object sender, EventArgs e)
        {
            Response.Redirect("VendorEdit.aspx", true);
        }

        protected void GoToExpiredOffers(object sender, EventArgs e)
        {
            Response.Redirect("ExpiredOffers.aspx", true);
        }

        protected void GoToApplyOffer(object sender, EventArgs e)
        {
            Response.Redirect("ApplyOffer.aspx", true);
        }

        protected void GoToPost(object sender, EventArgs e)
        {
            Response.Redirect("Post.aspx", true);
        }

        protected void GoToViewProducts(object sender, EventArgs e)
        {
            Response.Redirect("ViewProducts.aspx", true);
        }

        protected void GoToPostOffer(object sender, EventArgs e)
        {
            Response.Redirect("PostOffer.aspx", true);
        }
    }
}
