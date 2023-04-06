using Microsoft.EntityFrameworkCore;
using Project_PRN.DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Trang_Tin_News.Models;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using TrangTinTucContext = Project_PRN.DataAccess.TrangTinTucContext;

namespace Project_PRN
{
    public partial class ViewReader : Form
    {
        private readonly DataAccess.TrangTinTucContext _context = new();

        public ViewReader()
        {
            InitializeComponent();
        }
        private void LoadData()
        {
            TrangTinTucContext _context = new TrangTinTucContext();

            dataGridView1.DataSource = (from c in _context.Categories
                                        join n in _context.News
                                        on c.CategoryId equals n.CategoryId
                                        select new
                                        {

                                            NewsId = n.NewsId,
                                            Title = n.Title,
                                            Body = n.Body,
                                            Category = c.Title,
                                        }).ToList();
            txtID.Enabled = false;
            cbCategory.DataSource = _context.Categories.Select(m => m.Title).Distinct().ToList();
            List<DataAccess.User> authors = _context.Users.Where(m => m.Power == 2).ToList();
            cbAuthor.DataSource = authors;
            cbAuthor.DisplayMember = "fullname"; // Chọn trường Name làm giá trị hiển thị trong ComboBox
            cbAuthor.ValueMember = "UserId"; // Chọn trường UserId làm giá trị được chọn trong ComboBox
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }



        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                int newsId = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["NewsId"].Value);
                string categoryTitle = Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells["Category"].Value);

                DataAccess.News news = _context.News.SingleOrDefault(x => x.NewsId == newsId);
                DataAccess.Category category = _context.Categories.SingleOrDefault(x => x.Title == categoryTitle);

                if (news != null && category != null) // Kiểm tra xem có lấy được dữ liệu hay không
                {
                    txtID.Text = news.NewsId.ToString();
                    cbCategory.SelectedItem = category;
                }
                else
                {
                    MessageBox.Show("Không tìm thấy dữ liệu cho hàng đã chọn!");
                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                int newsId = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["NewsId"].Value);
                string categoryTitle = Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells["Category"].Value);

                DataAccess.News news = _context.News.SingleOrDefault(x => x.NewsId == newsId);
                DataAccess.Category category = _context.Categories.SingleOrDefault(x => x.Title == categoryTitle);

                if (news != null && category != null) // Kiểm tra xem có lấy được dữ liệu hay không
                {
                    txtID.Text = news.NewsId.ToString();
                    cbCategory.SelectedItem = category;
                }
                else
                {
                    MessageBox.Show("Không tìm thấy dữ liệu cho hàng đã chọn!");
                }
            }
        
        
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void txtDate_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }
    

        private void ViewReader_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void cbAuthor_SelectedIndexChanged(object sender, EventArgs e)
        {

            LoadData();
        }

        private void btDetail_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            (new Detail(id)).Show();
        }

        private void label2_Click(object sender, EventArgs e)
        {
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            //string text = textBox1.Text;
            //dataGridView1.Rows.Clear();
            //List<News> listnew = _context.News.W
                }
    }
}
