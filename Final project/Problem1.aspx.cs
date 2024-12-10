using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_project
{
    public partial class Problem1 : System.Web.UI.Page
    {
        private const string CorrectSolution = @"
    public int calculate(string s) {
    Stack<int> stack = new Stack<int>();
    int number = 0, result = 0, sign = 1;

    for (int i = 0; i < s.Length; i++) {
        char c = s[i];
        if (char.IsDigit(c)) {
            number = number * 10 + (c - '0');
        } else if (c == '+') {
            result += sign * number;
            number = 0;
            sign = 1;
        } else if (c == '-') {
            result += sign * number;
            number = 0;
            sign = -1;
        } else if (c == '(') {
            stack.Push(result);
            stack.Push(sign);
            result = 0;
            sign = 1;
        } else if (c == ')') {
            result += sign * number;
            number = 0;
            result *= stack.Pop();
            result += stack.Pop();
        }
        }
        result += sign * number;
        return result;
        }";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CalculatorSection.Attributes["style"] = "visibility: hidden;"; // Ensure calculator is hidden initially
                CodeCheckLiteral.Text = "";
                CalculatorResultLiteral.Text = "";
            }
        }

        protected void CheckCodeButton_Click(object sender, EventArgs e)
        {
            string userCode = Server.HtmlDecode(UserCodeTextBox.Text.Trim());

            if (string.IsNullOrEmpty(userCode))
            {
                CodeCheckLiteral.Text = "<span style='color: red;'>Please write your solution.</span>";
                return;
            }

            if (NormalizeSolution(userCode).Equals(NormalizeSolution(CorrectSolution), StringComparison.OrdinalIgnoreCase))
            {
                CodeCheckLiteral.Text = "<span style='color: green;'>Correct! Enter an expression below.</span>";
                CalculatorSection.Attributes["style"] = "visibility: visible;"; // Show calculator
            }
            else
            {
                CodeCheckLiteral.Text = "<span style='color: red;'>Incorrect Solution. Try again.</span>";
            }
        }

        protected void RunButton_Click(object sender, EventArgs e)
        {
            string expression = ExpressionTextBox.Text.Trim();

            if (string.IsNullOrEmpty(expression))
            {
                CalculatorResultLiteral.Text = "<span style='color: red;'>Please enter a valid expression.</span>";
                return;
            }

            try
            {
                double result = EvaluateExpression(expression);
                CalculatorResultLiteral.Text = $"<span style='color: green;'>Result: {result}</span>";
            }
            catch (Exception ex)
            {
                CalculatorResultLiteral.Text = $"<span style='color: red;'>Error: {ex.Message}</span>";
            }
        }

        private double EvaluateExpression(string expression)
        {
            DataTable table = new DataTable();
            return Convert.ToDouble(table.Compute(expression, string.Empty));
        }

        private string NormalizeSolution(string solution)
        {
            return solution.Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("\n", "");
        }
    }
}