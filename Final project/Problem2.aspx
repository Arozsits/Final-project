<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Problem2.aspx.cs" Inherits="Final_project.Problem2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shortest Impossible Sequence of Rolls</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: white;
            margin: 0;
            padding: 20px;
        }

        .container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .description, .code-input, .calculator {
            background-color: #1c1c1c;
            padding: 20px;
            border-radius: 10px;
        }

        .textbox {
            width: 100%;
            height: 150px;
            font-family: Consolas, monospace;
            font-size: 14px;
            background-color: #333;
            color: white;
            border: 1px solid #555;
            border-radius: 5px;
            padding: 10px;
        }

        .button {
            background-color: #61dafb;
            color: #121212;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #4aa3d8;
        }

        .output {
            margin-top: 10px;
            font-size: 18px;
        }

        .calculator {
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Problem Description Section -->
            <div class="description">
                <h1>2350. Shortest Impossible Sequence of Rolls</h1>
                <p>
                    You are given an integer array <code>rolls</code> of length <code>n</code> and an integer <code>k</code>. 
                    You roll a <code>k</code>-sided dice numbered from <code>1</code> to <code>k</code>, <code>n</code> times, where the result of the <code>i<sup>th</sup></code> roll is <code>rolls[i]</code>.
                </p>
                <p>
                    Return the length of the <strong>shortest sequence of rolls</strong> so that there’s no such subsequence in <code>rolls</code>.
                </p>

                <h2>Examples</h2>
                <pre>
Example 1:
Input: rolls = [4,2,1,2,3,3,2,4,1], k = 4
Output: 3

Example 2:
Input: rolls = [1,1,2,2], k = 2
Output: 2

Example 3:
Input: rolls = [1,1,3,3,2,2,2,3,3], k = 4
Output: 1
                </pre>

                <h2>Constraints</h2>
                <ul>
                    <li><code>n == rolls.length</code></li>
                    <li><code>1 <= n <= 10<sup>5</sup></code></li>
                    <li><code>1 <= k <= 10<sup>5</sup></code></li>
                    <li><code>1 <= rolls[i] <= k</code></li>
                </ul>
            </div>

            <!-- Code Validation Section -->
            <div class="code-input">
                <h2>Write Your Code Solution</h2>
                <asp:TextBox ID="UserCodeTextBox" runat="server" TextMode="MultiLine" CssClass="textbox" Placeholder="Write your solution here..."></asp:TextBox>
                <asp:Button ID="CheckCodeButton" runat="server" Text="Check Solution" CssClass="button" OnClick="CheckCodeButton_Click" />
                <div class="output">
                    <asp:Literal ID="CodeCheckLiteral" runat="server"></asp:Literal>
                </div>
            </div>

            <!-- Calculator Section -->
            <div id="CalculatorSection" runat="server" class="calculator" style="display:none;">
                <h2>Calculate the Shortest Impossible Sequence</h2>
                <asp:TextBox ID="RollsInputTextBox" runat="server" CssClass="textbox" Placeholder="Enter rolls array (e.g., 4,2,1,2,3,3,2,4,1)"></asp:TextBox>
                <asp:TextBox ID="KInputTextBox" runat="server" CssClass="textbox" Placeholder="Enter value of k"></asp:TextBox>
                <asp:Button ID="RunButton" runat="server" Text="Run" CssClass="button" OnClick="RunButton_Click" />
                <div class="calc-output">
                    <asp:Literal ID="CalculatorResultLiteral" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </form>
</body>
</html>






<!-- SOLUTION 

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
}




INPUT TO TEST

Rolls = 4,2,1,2,3,3,2,4,1


K = 4
-->