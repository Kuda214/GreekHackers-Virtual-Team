using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web.Http;
using GeekHackers_WebAPI.Models;
using GeekHackers_WebAPI.ViewModels;

namespace GeekHackers_WebAPI.Controllers
{
    [Route("api/[Controller]/[Action]")]

    public class UserController : ApiController
    {

        [HttpPost]
        [Route("api/User/Login")]
        public dynamic Login([FromBody] LoginVM loginData)
        {
            using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
            {
                var hashPassword = this.ComputeSha256Hash(loginData.password);
                db.Configuration.ProxyCreationEnabled = false;
                var query = db.Users.Where(xx => xx.Email_Address.ToUpper() == loginData.Email_Address.ToUpper()).Where(xx => xx.Password == hashPassword).FirstOrDefault();
                if (query != null)
                {
                    return query;
                }
                else
                {
                    return NotFound();
                }
            }
        }
        //Function for Hashing
        public string ComputeSha256Hash(string rawData)
        {
            //Create a SHA256
            using (SHA256 sha256Hash = SHA256.Create())
            {
                //Compute hash - returns bytes array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                //Convert the bytes array to string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        //Get User by Email
        [HttpPost]
        public HttpResponseMessage getUser([FromBody] ResetVM data)
        {
            try
            {
                using (SMME_Hackathon2022Entities db = new SMME_Hackathon2022Entities())
                {
                    db.Configuration.ProxyCreationEnabled = false;
                    //Checking if whether the user role record is found or not
                    var getRecord = db.Users.Where(mm => mm.Email_Address.ToLower() == data.Email_Address.ToLower()).FirstOrDefault();
                    if (getRecord != null)
                    {
                        //code for resting password
                        MailMessage mail = new System.Net.Mail.MailMessage();
                        mail.To.Add(data.Email_Address.ToString());
                        mail.From = new MailAddress("geekstech133@gmail.com", "Reset Password", System.Text.Encoding.UTF8);
                        mail.Subject = "This mail is sent from GeeksHackers Website";
                        mail.SubjectEncoding = System.Text.Encoding.UTF8;
                        mail.Body = "Copy this link(http://localhost:4200/reset) on your website to reset your password...";
                        mail.BodyEncoding = System.Text.Encoding.UTF8;
                        mail.IsBodyHtml = true;
                        mail.Priority = MailPriority.High;
                        SmtpClient client = new SmtpClient();
                        client.Credentials = new System.Net.NetworkCredential("geekstech133@gmail.com", "Geeks2");
                        client.Port = 587;
                        client.Host = "smtp.gmail.com";
                        client.EnableSsl = true;
                        try
                        {
                            client.Send(mail);

                        }
                        catch (Exception ex)
                        {
                            Exception ex2 = ex;
                            string errorMessage = string.Empty;
                            while (ex2 != null)
                            {
                                errorMessage += ex2.ToString();
                                ex2 = ex2.InnerException;
                            }

                        }



                        return Request.CreateResponse(HttpStatusCode.OK, getRecord);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User with the Email Address = " + data.Email_Address + " cannot be found");
                    }

                }
            }
            catch (Exception err)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, err);
            }
        }
    }   
}
