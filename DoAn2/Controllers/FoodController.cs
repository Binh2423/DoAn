﻿using Microsoft.AspNetCore.Mvc;

namespace DoAn2.Controllers
{
    public class FoodController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}