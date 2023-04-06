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
using News = Project_PRN.DataAccess.News;

namespace Project_PRN
{
    public partial class Detail : Form
    {
        private readonly DataAccess.TrangTinTucContext _context = new();
        int id = 0;
        public Detail(int tid)
        {
            id = tid;
            InitializeComponent();
        }
        private void LoadData()
        {

            News news = _context.News.SingleOrDefault(x => x.NewsId == id);
            txtTitle.Text = news.Title;
            txtContent.Text = news.Body;
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Detail_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        }
    }

