using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using OmniModels;

public partial class SiteMaster : MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected Customer Customer { get; set; }

    protected void Page_Init(object sender, EventArgs e)
    {
        Page.Title += " | OmniEmulators";

        // Basic reports
        if (Request.QueryString["report"] != null)
        {
            report.Visible = true;
            report.InnerText = Request.QueryString["report"];
        }

        //
        // NOPENOPENOPENOPENOPE just ends in redirect loops. The admin subfolder is hard to narrow down.
        //
        //// Setup administrator login checks
        //string CurrentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
        //bool AdminPageRedirectOk = false;
        //if (CurrentUrl.IndexOf("/Admin/Default", StringComparison.CurrentCulture) < 0)
        //{
        //    AdminPageRedirectOk = true;
        //}
        //// Always check for login and administrator priveleges
        //bool IsAdmin = false;
        //if (Session["Customer"] != null)
        //{
        //    Customer = (Customer)Session["customer"];
        //    if (Customer.custadmin)
        //    {
        //        IsAdmin = true;
        //    }
        //}
        //// If they're not logged in or not admin and we're not on the login page, push them there
        //if (!IsAdmin && AdminPageRedirectOk)
        //{
        //    Response.Redirect("/Admin?report=Only administrators are allowed access to the administration panel");
        //}
        if (Session["Customer"] != null)
        {
            Customer = (Customer)Session["customer"];
            loggedInAs.Visible = true;
        } else
        {
            logoutLink.Visible = false;
        }


        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LogOut(object sender, EventArgs e)
    {
        Session["customer"] = null;
        Response.Redirect("/?report=You are now logged out.");
    }
}
