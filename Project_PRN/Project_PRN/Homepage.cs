using Project_PRN.DataAccess;
using System.Data;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Project_PRN
{
    public partial class Homepage : Form
    {
        private readonly TrangTinTucContext _context = new();
        private string username = "";

        public Homepage(string admin)
        {
            InitializeComponent();
            username = admin;

            if (admin != new NewDAO().GetEmailDefault())
            {
                txtID.Enabled = true;
                cbCategory.Enabled = true;
                txtTitle.Enabled = true;
                txtContent.Enabled = true;
                btnEdit.Enabled = true;
                btnRefresh.Enabled = true;
                btnDelete.Enabled = true;
                btnAdd.Enabled = true;
            }

        }

        private void Homepage_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

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
                                            AuthorId = n.AuthorId,
                                            Title = n.Title,
                                            Body = n.Body,
                                            Category = c.Title,
                                        }).ToList();
            txtID.Enabled = false;
            cbCategory.DataSource = _context.Categories.Select(m => m.Title).Distinct().ToList();
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0 || e.ColumnIndex < 0) return;
            if (dataGridView1.SelectedCells.Count > 0)
            {
                int selectedrowindex = dataGridView1.SelectedCells[0].RowIndex;
                DataGridViewRow selectedRow = dataGridView1.Rows[selectedrowindex];
                string cellValue = Convert.ToString(selectedRow.Cells["NewsId"].Value);
                string cellValue1 = Convert.ToString(selectedRow.Cells["Category"].Value);
                if (!string.IsNullOrEmpty(cellValue))
                {
                    {
                        int newId = Convert.ToInt32(cellValue);
                        //int caID = Convert.ToInt32(cellValue1);
                        News news = _context.News.SingleOrDefault(x => x.NewsId == newId);
                        Category ca = _context.Categories.SingleOrDefault(x => x.Title == cellValue1);
                        txtID.Text = news.NewsId.ToString();
                        txtTitle.Text = news.Title;
                        txtContent.Text = news.Body;
                        pictureBox1.Text = news.Picture;
                        cbCategory.SelectedItem = ca.Title;
                        //cbCategory.SelectedItem = _context.Categories.SingleOrDefault(x => x.Title == cellValue1);
                    }
                }
            }
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

            _context.SaveChanges();
            LoadData();
            AddFrom add = new AddFrom(username)
            {
                Text = "Add News"
            };
            if (add.ShowDialog() == DialogResult.OK)
            {
                LoadData();
            }

        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            cbCategory.SelectedItem = 0;
            txtTitle.Text = "";
            txtContent.Text = "";


        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            string title = txtTitle.Text;
            string categoryTitle = cbCategory.SelectedItem.ToString();

            News news = _context.News.SingleOrDefault(x => x.NewsId == id);
            Category category = _context.Categories.SingleOrDefault(x => x.Title == categoryTitle);

            if (news != null && category != null)
            {
                // Cập nhật tiêu đề và nội dung tin tức
                news.Title = title;
                news.Body = txtContent.Text;

                // Cập nhật danh mục cho tin tức
                news.CategoryId = category.CategoryId;

                _context.SaveChanges();

                LoadData();

                MessageBox.Show("Cập nhật tin tức thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Lỗi: Không tìm thấy tin tức hoặc danh mục!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void btnDelete_Click(object sender, EventArgs e)
        {
            var employee = _context.News.Find(int.Parse(txtID.Text));
            if (employee != null)
            {
                try
                {
                    _context.News.Remove(employee);
                    _context.SaveChanges();
                    LoadData();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Delete a member");
                }
            }
        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
        //    string selectedValue = cbCategory.SelectedItem.ToString();
        //    List<News> newsList = _context.News.Where(n => n.Category.Title == selectedValue).ToList();
        //    dataGridView1.DataSource = newsList;
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void txtContent_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
