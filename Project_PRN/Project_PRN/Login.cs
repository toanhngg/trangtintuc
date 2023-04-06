using Project_PRN.DataAccess;
using System.Diagnostics;
using System.Net;
using System.Text;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Project_PRN
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }


        private void Login_Load(object sender, EventArgs e)
        {
            Text = "Login";
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                NewDAO userRepository = new NewDAO();
                User user = userRepository.GetUser(username, password);
            if (user.Power == 2 || user.Power == 0)
            {
                // Cho phép truy cập các chức năng chỉ dành cho Admin
                (new Homepage(username)).Show();
            }
            else if (user.Power == 1)
            {
                (new ViewReader()).Show();

                // Cho phép truy cập các chức năng chỉ dành cho User
            }
            else
            {
                // Không đủ quyền để truy cập vào chức năng này
                MessageBox.Show("Account not exist");
            }



            //if (user != null)
            //    {    
            //        (new Homepage(username)).Show();
            //    } else MessageBox.Show("Account not exist");
        }

        private void folderBrowserDialog1_HelpRequest(object sender, EventArgs e)
        {

        }
    }
    }
