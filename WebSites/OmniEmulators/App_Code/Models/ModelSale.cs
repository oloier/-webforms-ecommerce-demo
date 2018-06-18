namespace OmniModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Data;
    using System.Text;
    using System.IO;

    [Table("Sale")]
    public partial class Sale
    {
        public int saleid { get; set; }

        public int custid { get; set; }

        public decimal total { get; set; }

        public string cartcontents { get; set; }

        public string HtmlCart
        {
            get
            {
                return DatatableToHtml(cartcontents);
            }
        }

        // Credit to Sumon Banerjee via
        // https://stackoverflow.com/questions/19682996/datatable-to-html-table
        public static string DatatableToHtml(string datatableXml)
        {
            // Load in our order XML into new Datatable
            StringReader reader = new StringReader(datatableXml);
            DataTable dt = new DataTable();
            dt.ReadXml(reader);

            // Convert to HTML for displaying in admin
            if (dt.Rows.Count == 0) return ""; // enter code here

            StringBuilder builder = new StringBuilder();
            builder.Append("<table class='table'>");
            builder.Append("<tr>");
            foreach (DataColumn c in dt.Columns)
            {
                builder.Append("<th>");
                builder.Append(c.ColumnName);
                builder.Append("</th>");
            }
            builder.Append("</tr>");
            foreach (DataRow r in dt.Rows)
            {
                builder.Append("<tr>");
                foreach (DataColumn c in dt.Columns)
                {
                    builder.Append("<td>");
                    builder.Append(r[c.ColumnName]);
                    builder.Append("</td>");
                }
                builder.Append("</tr>");
            }
            builder.Append("</table>");

            return builder.ToString();
        }
    }

}
