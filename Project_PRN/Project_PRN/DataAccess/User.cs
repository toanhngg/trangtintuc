﻿using System;
using System.Collections.Generic;

namespace Project_PRN.DataAccess;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int Power { get; set; }

    public string? Fullname { get; set; }

    public string? Address { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }
}
