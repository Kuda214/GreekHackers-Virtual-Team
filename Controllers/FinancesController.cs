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

    public class FinancesController : ApiController
    {
        [HttpGet]
        [Route("api/Finances/getFinances")]
        public List<FinancialDocument> getFinances()
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                db.Configuration.ProxyCreationEnabled = false;
                return db.FinancialDocuments.ToList();
            }
        }//Get List of Quotations

        //Get Quotations by ID
        [HttpGet]
        [Route("api/Finances/getFinancesByID")]
        public HttpResponseMessage getFinancesByID(int id)
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                try
                {
                    db.Configuration.ProxyCreationEnabled = false;
                    //Checking if whether the product record exists or not
                    var getRecord = db.FinancialDocuments.Where(m => m.FinanceID == id).FirstOrDefault();
                    if (getRecord != null)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, getRecord);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Financial Document with the ID = " + id.ToString() + " cannot be found");
                    }
                }
                catch (Exception err)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, err);
                }
            }
        }

        //Create Finacial Documents
        [HttpPost]
        [Route("api/Finances/SaveFile")]
        public HttpResponseMessage SaveFile([FromBody] FinancialDocument FinancesData)
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
            db.FinancialDocuments.Add(FinancesData);
            db.SaveChanges();
            return Request.CreateResponse(HttpStatusCode.OK);
        }
        [HttpPost]
        [Route("api/Finances/AddFinance")]
        public HttpResponseMessage AddFinance()
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
                FinancialDocument FinanceItem = new FinancialDocument()
                {
                    DocumentTitle = httpRequest["DocumentTitle"],
                    DocumentDescription = httpRequest["DocumentDescription"],
                    //D = DateTime.Now,
                    //Quantity = Convert.ToInt32(httpRequest["Quantity"]),
                    //Unit_Cost = Convert.ToDecimal(httpRequest["Unit_Cost"]),
                    //Amount = Convert.ToDecimal(httpRequest["Amount"]),
                    //Total_Amount = Convert.ToDecimal(httpRequest["Total_Amount"]),
                    ImageName = Imagename,
                    ImagePath = filepath,


                };
                db.FinancialDocuments.Add(FinanceItem);
                db.SaveChanges();

            }
            return Request.CreateResponse(HttpStatusCode.Created);
        }
        [HttpPut]
        [Route("api/Finances/editFinances")]
        public HttpResponseMessage editFinaces()
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                var httpRequest = HttpContext.Current.Request;
                int id = Convert.ToInt32(httpRequest["id"]);
                var checkRecord = db.FinancialDocuments.Where(xx => xx.FinanceID == id).FirstOrDefault(); ;
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
                    checkRecord.DocumentTitle = httpRequest["DocumentTitle"];
                    checkRecord.DocumentDescription = httpRequest["DocumentDescription"];
                    //checkRecord.Date_Created = DateTime.Now;
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


        //Delete Invoices
        [HttpDelete]
        [Route("api/Finances/deleteFinances")]
        public HttpResponseMessage deleteFinances(int id)
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                try
                {
                    db.Configuration.ProxyCreationEnabled = false;
                    //Checking if whether the quotes exists before deleting it
                    var getRecord = db.FinancialDocuments.Where(m => m.FinanceID == id).FirstOrDefault();
                    if (getRecord != null)
                    {
                        db.FinancialDocuments.Remove(db.FinancialDocuments.Where(m => m.FinanceID == id).FirstOrDefault());
                        db.SaveChanges();
                        return Request.CreateResponse(HttpStatusCode.OK);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Financial Document with the ID = " + id.ToString() + " cannot be found");
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
