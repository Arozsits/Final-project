using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_project
{
    public partial class Web_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CalendarControl_DayRender(object sender, DayRenderEventArgs e)
        {
            // Apply white text color to all calendar days
            e.Cell.ForeColor = System.Drawing.Color.White;

            // Optional: Add custom styles to the background or other properties
            e.Cell.BackColor = System.Drawing.Color.FromArgb(28, 28, 28); // Dark background
        }
    }

}