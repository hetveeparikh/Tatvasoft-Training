function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

$(document).ready(function () {
    $('#addresstable').DataTable({
        "dom": '<"top">rt<"bottom"lip><"clear">',responsive:true,"aaSorting": [],
        columnDefs: [{
            orderable: false,
            targets: 4
        }]
    });
});

const pass = `
<span class="setpass">Old Password</span>
<input type="text" placeholder="Current Password" class="passbox">
<span class="setpass">New Password</span>
<input type="text" placeholder="Password" class="passbox">
<span class="setpass">Confirm Password</span>
<input type="text" placeholder="Confirm Password" class="passbox">
 `;
const ins = document.querySelector(".settingshere");
const setpass = document.getElementById("settingspassword");
setpass.addEventListener("click", function () {
  ins.innerHTML = pass;
});


const add = `
<div class="row">
    <div class="col-lg-12">
        <table class="table display nowrap" id="addresstable" colspacing="0" style="width: 100%;">
            <thead>
                <tr>
                    <th class="text-center">Invoicing</th>
                    <th>Addresses</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center">
                        <div class="radio">
                            <label>
                                <input type="radio">
                                <span></span>
                            </label>
                        </div>
                    </td>
                    <td class="address">
                        <p><b>Address:</b> Second street 23, 53225 Bonn</p>
                        <p><b>Phone number:</b>9988556644</p>
                    </td>
                    <td class="text-center actions">
                        <a title="Edit"><i style='font-size:24px' class='fas'>&#xf044;</i></a>
                        <a title="Delete"><i style='font-size:24px' class='far'>&#xf2ed;</i></a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
 `;
const setadd = document.getElementById("settingsaddress");
setadd.addEventListener("click", function () {
  ins.innerHTML = add;
});


const mydetails = `
<form class="detailsform row">
<div class="col-sm-4">
    <label>First Name</label>
    <input type="text" placeholder="First Name" class="setinput">
</div>
<div class="col-sm-4">
    <label>Last Name</label>
    <input type="text" placeholder="Last Name" class="setinput">
</div>
<div class="col-sm-4">
    <label>Email Address</label>
    <input type="text" placeholder="Email Address" disabled class="setinput">
</div>
<div class="col-sm-4">
    <label>Mobile Number</label>
    <div class="d-flex">
        <span class="d-flex align-items-center numset">+49</span>
        <input type="text" placeholder="Mobile number" class="setinput">
    </div>
</div>
<div class="col-sm-8">
    <label>Date of birth</label>
    <div>
        <select class="bdayset">
            <option value>Day</option>
            <option value="1">01</option>
            <option value="2">02</option>
            <option value="3">03</option>
            <option value="4">04</option>
            <option value="5">05</option>
            <option value="6">06</option>
            <option value="7">07</option>
            <option value="8">08</option>
            <option value="9">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
        </select>
        <select class="bdayset">
            <option value>Month</option>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
        </select>
        <select class="bdayset">
            <option value>Year</option>
            <option value="2012">2012</option>
            <option value="2">2011</option>
            <option value="3">2010</option>
            <option value="4">2009</option>
            <option value="5">2008</option>
            <option value="6">2007</option>
            <option value="7">2006</option>
            <option value="8">2005</option>
            <option value="9">2004</option>
            <option value="">2003</option>
            <option value="">2002</option>
            <option value="">2001</option>
            <option value="">2000</option>
            <option value="">1999</option>
            <option value="">1998</option>
            <option value="">1997</option>
            <option value="">1996</option>
            <option value="">1995</option>
            <option value="">1994</option>
            <option value="">1993</option>
            <option value="">1992</option>
            <option value="">1991</option>
            <option value="">1990</option>
            <option value="">1989</option>
            <option value="">1988</option>
            <option value="">1987</option>
            <option value="">1986</option>
            <option value="">1985</option>
            <option value="">1984</option>
            <option value="">1983</option>
            <option value="">1982</option>
        </select>
    </div>
</div>
</form>
<div class="divider"></div>
<div class="detailsform">
<label>My Preferred Language</label>
<select disabled class="bdayset">
    <option>English</option>
</select>
</div>
<button class="savedetails">Save</button>
 `;
const setdetails = document.getElementById("settingsdetails");
setdetails.addEventListener("click", function () {
  ins.innerHTML = mydetails;
});

window.addEventListener("load", function () {
    ins.innerHTML = mydetails;
});