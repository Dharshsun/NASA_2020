using FUEGO.Models;
using FUEGO.Models.db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FUEGO.Controllers
{
    public class AccountController : Controller
    {
        assignmentDbEntities context = new assignmentDbEntities();


        [HttpGet]
        public ActionResult Login()
        {
            var model = new LoginVM();

            if (TempData["loginFailed"] != null)
                ViewBag.loginFailed = TempData["loginFailed"] as string;

            return View(model);
        }

        [HttpPost]
        public ActionResult Login(LoginVM model)
        {
            var userExists = context.tbl_auth.Any(x => x.email.Equals(model.email) && x.password.Equals(model.password));

            if (userExists)
            {
                TempData["loginSuccess"] = "User logged in successfully";
                return RedirectToAction("Index", "Home");
            }

            else
                TempData["loginFailed"] = "Invalid email / password";

            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult Register()
        {
            var model = new RegisterVM();

            if (TempData["passwordNotMatch"] != null)
                ViewBag.passwordNotMatch = TempData["passwordNotMatch"] as string;

            if (TempData["userAlreadyRegister"] != null)
                ViewBag.userAlreadyRegister = TempData["userAlreadyRegister"] as string;

            return View(model);
        }

        [HttpPost]
        public ActionResult Register(RegisterVM model)
        {
            if (!model.password.Equals(model.confirmPassword))
            {
                TempData["passwordNotMatch"] = "Password and confirm password do not match";
                return RedirectToAction("Register");
            }

            var userAlreadyRegister = context.tbl_auth.Any(x => x.email.Equals(model.email));

            if (!userAlreadyRegister)
            {
                context.tbl_auth.Add(new tbl_auth
                {
                    email = model.email,
                    password = model.password
                });

                context.SaveChanges();

                TempData["userRegisterSuccess"] = "User registered successfully";

                return RedirectToAction("Index", "Home");
            }
            else
            {
                TempData["userAlreadyRegister"] = "User with that email already exists, please use another one";
            }

            return RedirectToAction("Register");
        }
    }
}