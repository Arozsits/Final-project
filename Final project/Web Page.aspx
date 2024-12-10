<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Web Page.aspx.cs" Inherits="Final_project.Web_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LeetCode Homepage</title>

    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #ffffff;
        }

        .container {
            display: flex;
            flex-direction: row;
            margin: 20px;
        }
        /* Sidebar Styling */
        .sidebar {
            width: 20%;
            background-color: #1c1c1c;
            padding: 10px;
            margin-right: 10px;
            border-radius: 8px;
        }
        /* Main Content Styling */
        .main-content {
            flex: 1;
            background-color: #1c1c1c;
            padding: 10px;
            border-radius: 8px;
        }
        /* Problem List Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #2a2a2a;
        }
        /* Trending Companies Styling */
        .companies {
            background-color: #1c1c1c;
            padding: 10px;
            margin-left: 10px;
            border-radius: 8px;
        }

        /* Calendar Styling */
        .calendar-day {
            color: white; /* Set text color to white */
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <!-- Left Sidebar -->
            <div class="sidebar">
                <h3>Calendar</h3>
                <asp:Calendar ID="CalendarControl" runat="server" OnDayRender="CalendarControl_DayRender" />
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <h2>Problem List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Difficulty</th>
                            <th>Acceptance</th>
                        </tr>

                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><a href="Problem1.aspx">Basic Calculator</a></td>
                            <td>Hard</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="Problem2.aspx">Add Two Numbers</a></td>
                            <td>Hard</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="Problem3.aspx">Longest Substring Without Repeating Characters</a></td>
                            <td>Hard</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><a href="Problem4.aspx">Two Sum</a></td>
                            <td>Hard</td>
                        </tr>
                    </tbody>

                </table>
            </div>

            <!-- Right Sidebar -->
            <div class="companies">
                <h3>Trending Companies</h3>
                <ul>
                    <!-- Dynamic Data for Companies -->
                    <asp:Repeater ID="CompaniesRepeater" runat="server">
                        <ItemTemplate>
                            <li><%# Eval("CompanyName") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>

    </form>
</body>
</html>
