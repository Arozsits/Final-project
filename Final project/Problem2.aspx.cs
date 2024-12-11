using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_project
{
    public partial class Problem2 : System.Web.UI.Page
    {
        private const string CorrectSolution = @"
        public int ShortestImpossibleSequence(int[] rolls, int k)
        {
            int subsequenceCount = 0;
            HashSet<int> seenNumbers = new HashSet<int>();

            foreach (int roll in rolls)
            {
                seenNumbers.Add(roll);

                if (seenNumbers.Count == k)
                {
                    subsequenceCount++;
                    seenNumbers.Clear();
                }
            }

            return subsequenceCount + 1;
        }";

        protected void CheckCodeButton_Click(object sender, EventArgs e)
        {
            string userCode = UserCodeTextBox.Text.Trim();

            if (string.IsNullOrEmpty(userCode))
            {
                CodeCheckLiteral.Text = "<span style='color: red;'>Please write your solution.</span>";
                return;
            }

            if (NormalizeCode(userCode).Equals(NormalizeCode(CorrectSolution), StringComparison.OrdinalIgnoreCase))
            {
                CodeCheckLiteral.Text = "<span style='color: green;'>Correct! You can now test your code with inputs below.</span>";
                CalculatorSection.Style["display"] = "block";
            }
            else
            {
                CodeCheckLiteral.Text = "<span style='color: red;'>Incorrect Solution. Please try again.</span>";
            }
        }

        protected void RunButton_Click(object sender, EventArgs e)
        {
            string rollsInput = RollsInputTextBox.Text.Trim();
            string kInput = KInputTextBox.Text.Trim();

            if (string.IsNullOrEmpty(rollsInput) || string.IsNullOrEmpty(kInput))
            {
                CalculatorResultLiteral.Text = "<span style='color: red;'>Please provide valid input for rolls and k.</span>";
                return;
            }

            try
            {
                int[] rolls = Array.ConvertAll(rollsInput.Split(','), int.Parse);
                int k = int.Parse(kInput);
                int result = ShortestImpossibleSequence(rolls, k);

                CalculatorResultLiteral.Text = $"<span style='color: green;'>Shortest Impossible Sequence Length: {result}</span>";
            }
            catch (Exception ex)
            {
                CalculatorResultLiteral.Text = $"<span style='color: red;'>Error: {ex.Message}</span>";
            }
        }

        private int ShortestImpossibleSequence(int[] rolls, int k)
        {
            int subsequenceCount = 0;
            HashSet<int> seenNumbers = new HashSet<int>();

            foreach (var roll in rolls)
            {
                seenNumbers.Add(roll);

                if (seenNumbers.Count == k)
                {
                    subsequenceCount++;
                    seenNumbers.Clear();
                }
            }

            return subsequenceCount + 1;
        }

        private string NormalizeCode(string code)
        {
            return code.Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("\n", "");
        }
    }
}