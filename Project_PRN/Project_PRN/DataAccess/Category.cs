using System;
using System.Collections.Generic;

namespace Project_PRN.DataAccess;

public partial class Category
{
    public int CategoryId { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<News> News { get; } = new List<News>();
}
