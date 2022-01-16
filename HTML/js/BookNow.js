topbtnn = document.getElementById("topbtn");
window.onscroll = function () {
  scrollFunction();
};
function scrollFunction() {
  if (
    document.body.scrollTop > 150 ||
    document.documentElement.scrollTop > 150
  ) {
    topbtnn.style.display = "block";
  } else {
    topbtnn.style.display = "none";
  }
}
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

const serv = `
<span class="posttitle">Enter Your Postal Code</span>
<form >
    <div class="servform">
        <input type="text" placeholder="Postal Code" class="postaltext">
        <button type="submit" class="checkpostal">Check Availability</button>
    </div>
</form>
`;
const ins = document.querySelector(".contenthere");
const bookser = document.getElementById("service");
bookser.addEventListener("click", function () {
  ins.innerHTML = serv;
});
window.addEventListener("load", function () {
  ins.innerHTML = serv;
});

const sche = `
<div class="d-flex scheque">
<div class="sche1">
    <span class="posttitle">When do you need the cleaner?</span>
    <div class="d-flex when">
        <div class="d-flex daterect">
            <img src="img/img-BookNow/calendar-book-service.png" class="cal">
            <span class="cs-date">31/03/2018</span>
        </div>
        <div>
            <select title="Time" class="timerect">
                <option value="">8:00 </option>
                <option value="A">8:30</option>
                <option value="B">9:00</option>
                <option value="C">9:30</option>
            </select>
        </div>
    </div>
</div>
<div class="">
    <span class="posttitle">When do you need the cleaner?</span>

    <div>
        <select title="Time" class="timerect">
            <option value="">3.0 Hrs </option>
            <option value="A">4.0 Hrs</option>
            <option value="B">5.0 Hrs</option>
            <option value="C">6.0 Hrs</option>
        </select>
    </div>
</div>
</div>


<div class="divider3"></div>

<span class="posttitle">Extra Services</span>

<div class=" d-flex justify-content-between es row">


<div class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-4">
    <div class="esellipse">
        <img src="img/img-Prices/firstimg.png" srcset="img/img-Prices/firstimg.png 2x,
                        img/img-Prices/firstimg.png 3x" class="esimg">
    </div>

    <span class="esinside">
        Inside cabinets
    </span>
</div>

<div class="d-flex flex-column align-items-center es1 col-lg-2 col-md-4">
    <div class="esellipse">
        <img src="img/img-Prices/secondimg.png" srcset="img/img-Prices/secondimg.png 2x,
                        img/img-Prices/secondimg.png 3x" class="esimg">
    </div>

    <span class="esinside">
        Inside fridge
    </span>
</div>

<div class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-4">
    <div class="esellipse">
        <img src="img/img-Prices/thirdimg.png" srcset="img/img-Prices/thirdimg.png 2x,
                        img/img-Prices/thirdimg.png 3x" class="esimg">
    </div>

    <span class="esinside">
        Inside oven
    </span>
</div>

<div class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-6">
    <div class="esellipse">
        <img src="img/img-Prices/fourthimg.png" srcset="img/img-Prices/fourthimg.png 2x,
                    img/img-Prices/fourthimg.png 3x" class="esimg">
    </div>

    <span class="esinside">
        Laundry wash & dry
</div>

<div class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-6">
    <div class="esellipse">
        <img src="img/img-Prices/fifthimg.png" srcset="img/img-Prices/fifthimg.png 2x,
                    img/img-Prices/fifthimg.png 3x" class="esimg">
    </div>

    <span class="esinside">
        Interior windows
    </span>
</div>

</div>

<div class="divider3"></div>

<span class="posttitle">Comments</span>

<form>
<input type="text" placeholder="Comments" class="comments">

<div>
    <input type="checkbox" id="petsathome" />
    <label for="petsathome" class="pets">I have pets at home</label>
</div>
</form>

<div class="divider3"></div>

<div class="cbtn">
<button class="schecontinue">Continue</button>
</div>
 `;
const booksche = document.getElementById("schedule");
booksche.addEventListener("click", function () {
ins.innerHTML = sche;
});

const detail = `
<form>
    <span class="posttitle">Enter your contact details, so we can serve you in better
        way!</span>

    <div>
        <ul class="address-picker">
            <li>
                <label>
                    <input formcontrolname="address" name="address" type="radio">
                    <span class="address-block">
                        <b> Address</b>: Second Street 23, Bonn 53225 <br>
                    </span>
                    <span>
                        <b>Phone number</b>: 9988556644<br>
                    </span>
                    <span class="radio-pointer"></span>
                </label>
            </li>
            <li>
                <label>
                    <input formcontrolname="address" name="address" type="radio">
                    <span class="address-block">
                        <b> Address</b>: Test 65, Bonn 53225<br>
                    </span>
                    <span>
                        <b>Phone number</b>: 9988556644<br>
                    </span>
                    <span class="radio-pointer"></span>
                </label>
            </li>
        </ul>
    </div>

    <input type="button" value="+ Add new Address" class="addbtn">

    <div>
        <input type="checkbox" id="invoice" />
        <label for="invoice" class="invoice">Send invoice on this address</label>
    </div>

    <div class="divider3"></div>

    <div class="cbtn">
        <button class="schecontinue">Continue</button>
    </div>

</form>
 `;
const bookdetail = document.getElementById("details");
bookdetail.addEventListener("click", function () {
ins.innerHTML = detail;
});

const payment = `
<form>
    <span class="posttitle">Pay securely with Helperland payment gateway!</span>
    <div>
        <span class="pcodetitle">Promo code (optional)</span>
        <div>
            <input type="text" placeholder="Promo code (optional)" class="pcode">
            <button class="apply">Apply</button>
        </div>
    </div>

    <div class="divider3"></div>
    <div class="d-flex booklabel">
        <input type="checkbox" id="payment" />
        <label for="payment" class="bookpayment">I accepted terms and conditions, the
            cancellation policy and the privacy policy.
        </label>
    </div>
    <div class="divider3"></div>
    <div class="cbtn">
        <button class="bookbtn">Complete Booking</button>
    </div>

</form>
 `;
const bookpayment = document.getElementById("payment");
bookpayment.addEventListener("click", function () {
ins.innerHTML = payment;
});


// function changeimg(){
//     var simg = document.querySelector('#servimg');
//     if(simg.src="img/img-BookNow/setup-service.png")
//     {
//         simg.src="img/img-BookNow/setup-service-white.png";
//     }
//     else{
//         simg.src="img/img-BookNow/setup-service.png";
//     }
// }