using Microsoft.EntityFrameworkCore;
using Project_PRN.DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics.Metrics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace Project_PRN
{
    public partial class AddFrom : Form
    {
        string username = "";
        private readonly TrangTinTucContext _context = new();

        public AddFrom(string admin)
        {
            InitializeComponent();
            username = admin;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            string category = cbCategory.SelectedItem.ToString();
            string author = cbAuthor.SelectedItem.ToString();
            DateTime currentDate = DateTime.Now;
            int categoryId = _context.Categories.FirstOrDefault(c => c.Title == category)?.CategoryId ?? 0;
            int authorid = _context.Users.SingleOrDefault(a => a.Fullname == author)?.UserId ?? 0;
            News news = new()
            {
                CategoryId = categoryId,
                AuthorId = authorid,
                Title = txtTitle.Text,
                Body = txtContent.Text,
                Date = currentDate
            };
            //Employees.Add(employee);
            _context.Add(news);
            _context.SaveChanges();
            MessageBox.Show("Thêm mới thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            this.Close();

        }
    
       

        private void AddFrom_Load(object sender, EventArgs e)
        {
            
                LoadCategoryList();
                LoadAuthor();
            
        }

        //private void AddFrom_Load(object sender, EventArgs e)
        //{

        //}
 

   
        private void LoadCategoryList()
        {
            List<string> categories = _context.Categories.Select(m => m.Title).Distinct().ToList();
            cbCategory.DataSource = categories;
        }
        private void LoadAuthor()
        {
            List<User> authors = _context.Users.Where(m => m.Power == 2).ToList();
            cbAuthor.DataSource = authors;
            cbAuthor.DisplayMember = "fullname"; // Chọn trường Name làm giá trị hiển thị trong ComboBox
            cbAuthor.ValueMember = "UserId"; // Chọn trường UserId làm giá trị được chọn trong ComboBox
        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
       


        }

        private void cbAuthor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Cancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
