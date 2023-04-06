using System;
using System.Collections.Generic;

namespace Project_PRN.DataAccess;

public partial class News
{
    public int NewsId { get; set; }

    public int CategoryId { get; set; }

    public int AuthorId { get; set; }

    public string Title { get; set; } = null!;

    public string Body { get; set; } = null!;

    public string? Picture { get; set; }

    public DateTime Date { get; set; }

    public int? Views { get; set; }

    public virtual Category Category { get; set; } = null!;
}
