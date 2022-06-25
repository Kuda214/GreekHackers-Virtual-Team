using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using GeekHackers_WebAPI.Models;

namespace GeekHackers_WebAPI.Controllers
{
    [Route("api/[Controller]/[Action]")]

    public class InvoiceController : ApiController
    {
        [HttpGet]
        [Route("api/Invoice/getInvoices")]
        public List<Invoice> getInvoices()
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                db.Configuration.ProxyCreationEnabled = false;
                return db.Invoices.ToList();
            }
        }//Get List of Quotations

        //Get Quotations by ID
        [HttpGet]
        [Route("api/Invoices/getInvoicesByID")]
        public HttpResponseMessage getInvoicesByID(int id)
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                try
                {
                    db.Configuration.ProxyCreationEnabled = false;
                    //Checking if whether the product record exists or not
                    var getRecord = db.Invoices.Where(m => m.InvoiceID == id).FirstOrDefault();
                    if (getRecord != null)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, getRecord);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Quotation with the ID = " + id.ToString() + " cannot be found");
                    }
                }
                catch (Exception err)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, err);
                }
            }
        }

        //Create Quotations
        [HttpPost]
        [Route("api/Invoice/SaveFile")]
        public HttpResponseMessage SaveFile([FromBody] Invoice InvoiceData)
        {
            //Create HTTP Response
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);
            //Checking if whether the request contains a file
            if (HttpContext.Current.Request.Files.Count == 0)
            {
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            }

            //Read the file data from the Request.Form collection
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];


            //Convert the file data to byte array
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(postedFile.InputStream))
            {
                bytes = br.ReadBytes(postedFile.ContentLength);
            }
            //Inserting the file to the database table 
            SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities();
            db.Invoices.Add(InvoiceData);
            db.SaveChanges();
            return Request.CreateResponse(HttpStatusCode.OK);
        }
        [HttpPost]
        [Route("api/Invoice/AddInvoice")]
        public HttpResponseMessage AddInvoice()
        {
            string Imagename = null;
            var httpRequest = HttpContext.Current.Request;
            var postedFile = httpRequest.Files["Image"];
            Imagename = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(15).ToArray()).Replace(" ", "-");
            Imagename = Imagename + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
            var filepath = HttpContext.Current.Server.MapPath("~/Image/" + Imagename);
            postedFile.SaveAs(filepath);

            //Saving to database
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                Invoice InvoiceItem = new Invoice()
                {
                    Description = httpRequest["Description"],
                    CompanyName = httpRequest["CompanyName"],
                    Date_Created = DateTime.Now,
                    Quantity = Convert.ToInt32(httpRequest["Quantity"]),
                    Unit_Cost = Convert.ToDecimal(httpRequest["Unit_Cost"]),
                    Amount = Convert.ToDecimal(httpRequest["Amount"]),
                    Total_Amount = Convert.ToDecimal(httpRequest["Total_Amount"]),
                    ImageName = Imagename,
                    ImagePath = filepath,


                };
                db.Invoices.Add(InvoiceItem);
                db.SaveChanges();

            }
            return Request.CreateResponse(HttpStatusCode.Created);
        }
        [HttpPut]
        [Route("api/Invoice/editInvoice")]
        public HttpResponseMessage editInvoice()
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                var httpRequest = HttpContext.Current.Request;
                int id = Convert.ToInt32(httpRequest["id"]);
                var checkRecord = db.Invoices.Where(xx => xx.InvoiceID == id).FirstOrDefault(); ;
                if (checkRecord != null)
                {
                    string imageName = null;
                    //Upload image
                    var postedFile = httpRequest.Files["Image"];
                    //Creatig custom fileName
                    imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray()).Replace(" ", "-");
                    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
                    var filePath = HttpContext.Current.Server.MapPath("~/Image/" + imageName);
                    postedFile.SaveAs(filePath);

                    //Editing product data
                    checkRecord.Description = httpRequest["Description"];
                    checkRecord.CompanyName = httpRequest["CompanyName"];
                    checkRecord.Date_Created = DateTime.Now;
                    checkRecord.ImageName = imageName;

                    checkRecord.ImagePath = filePath;

                    //Save changes to the database
                    db.SaveChanges();

                    return Request.CreateResponse(HttpStatusCode.Created);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Record not found");
                }
            }


        }


        //Delete Quotations
        [HttpDelete]
        [Route("api/Invoice/deleteInvoice")]
        public HttpResponseMessage deleteInvoice(int id)
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                try
                {
                    db.Configuration.ProxyCreationEnabled = false;
                    //Checking if whether the quotes exists before deleting it
                    var getRecord = db.Invoices.Where(m => m.InvoiceID == id).FirstOrDefault();
                    if (getRecord != null)
                    {
                        db.Invoices.Remove(db.Invoices.Where(m => m.InvoiceID == id).FirstOrDefault());
                        db.SaveChanges();
                        return Request.CreateResponse(HttpStatusCode.OK);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Invoice with the ID = " + id.ToString() + " cannot be found");
                    }
                }
                catch (Exception err)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, err);
                }
            }



        }
    }
}
