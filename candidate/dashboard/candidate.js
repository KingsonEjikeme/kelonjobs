function renderSignin(){
    $('#signin').removeClass('d-none',1000);
    $('#signup').addClass('d-none',1000);
}
function renderSignup(){
    $('#signin').addClass('d-none',1000);
    $('#signup').removeClass('d-none',1000);
}
function signinCandidate(){
    let email = $('#signin-email').val();
    let password = $('#signin-password').val();
    $.post("/moonhub/moonhub.php?request=signinCandidate",{
        signinEmail:email,
        signinPassword:password,
        action: "signinCandidate"
    }, function(data, status){
        console.log(data); //check
        var message = JSON.parse(data).message;
        console.log(message);
        if(message){
            console.log(message);
            window.location.href = "/moonhub/candidate/dashboard/cd_dashboard.html";
        }
    })
}
function registerCandidate(){
    let firstname = $('#firstname').val();
    let lastname = $('#lastname').val();
    let email = $('#email').val();
    let password = $('#password').val();
    let phone = $('#phone').val();
    let job_title = $('#job-title').val();
    let city = $('#city').val();
    let state = $('#state').val();
    let profileSummary = $('#profile-summary').val();
    $.post("/moonhub/moonhub.php?request=registerCandidate", {
        firstname:firstname,
        lastname:lastname,
        email:email,
        password:password,
        phone:phone,
        job_title:job_title,
        city:city,
        state:state,
        profileSummary:profileSummary,
        action:"registerCandidate"
    }, function(data, status){
        let message = JSON.parse(data).message;
        console.log(message);
        if(message){
            console.log("Yessssssssss");
            alert("Registration successful!\nProceed to Login.");
            setTimeout(()=>{
                // window.location.href="/moonhub/moonhub.html";
                renderSignin();
            },1000)
        }else{
            alert("Invalid Email or Password");
            console.log(message);
        }

    })
}
function displayJobDetail(param){
    let job_id = $(param).find('input').val()
    // console.log(job_id);
    let xhttp = new XMLHttpRequest();
    xhttp.onload = function(){
        let details = JSON.parse(this.response).message;
        $('#d_company').text(details.company_name);
        $('#d_type').text(details.type);
        $('#d_salary').text(details.salary);
        $('#d_posted').text(details.date_posted);
        $('#d_requirements').text(details.details);
        $('#d_deadline').text(details.application_deadline);
        $('#d_location').text(details.location);
        $('#d_title').text(details.job_title);
        
    };
    xhttp.open('GET', '../../moonhub.php?request=jobs&job_id='+job_id);
    xhttp.send();

}
function signout() {
    let xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
      window.location.href = "/moonhub/moonhub.html";
    };
    xhttp.open("GET", "../../../moonhub.php?request=signout");
    xhttp.send();
  }
  function listJobElements(Jobs) {
    var jobElement = ``;
    console.log('3'); //check
    Jobs.forEach(job => {
        jobElement += `<div
        class="border p-2 job bg-light my-1 rounded shadow single-job"
        onclick="displayJobDetail(this)"
      >
        <input class="d-none" value="${job.job_id}"/>
        <p class="fw-bold my-0">${job.job_title}</p>
        <p class="muted my-0">${job.type}</p>
        <div
          class="single-job-footer d-flex justify-content-between mt-2"
        >
          <div
            class="single-job-salary bg-warning bg-opacity-25 rounded px-1"
          >
            ${job.salary}
          </div>
          <div
            class="single-job-date bg-warning bg-opacity-25 rounded px-1"
          >
            ${job.date_posted}
          </div>
        </div>
      </div>
        `;
    });
    $('.single-job-container').append(jobElement);
    
}
function slideRight(){
    console.log("Hi");
    $('#sliding').slideRight();
  }
var editProfileState = true;
function editProfile(){

    $("#edit-profile").text(editProfile?'Save Changes':'Edit Profile');
    
    if(editProfileState){
        $("#profile-email").html("<input value="+$("#profile-email").text()+">").addClass("input");
    $("#profile-phone").html("<input value="+$("#profile-phone").text()+">").addClass("input");
    $("#profile-address").html("<input value="+$("#profile-address").text()+">").addClass("input");
    $("#profile-industry").html("<input value="+$("#profile-industry").text()+">").addClass("input");
    editProfileState= !editProfileState;
    }
    
}

$(function(){
    console.log("First check");
    // Jobs List Element Function
    
    
    // Fetch Jobs from the database
   
    
        let xhttp = new XMLHttpRequest();
        xhttp.onload = function(){
            console.log("1"); //check
            console.log(this.response);
            let employerJobs = JSON.parse(this.response).message ;
            listJobElements(employerJobs);
            // listJobElements();
            
        };
        xhttp.open('GET', '../../moonhub.php?request=candidatejobs');
        xhttp.send();
   
    

    // Fetch Applications from the database
    let xhttp1 = new XMLHttpRequest();
    xhttp1.onload = function(){
        console.log("Hi"); //check
    };
    xhttp1.open('GET', '../../moonhub.php?request=candidateapplications');
    xhttp1.send();

    //  Fetch profile
    let xhttp3 = new XMLHttpRequest();
    xhttp3.onload = function(){
 
        let profile = JSON.parse(this.response).message;
        console.log(profile);
        let firstname = profile.firstname;
        let fullname = profile.firstname +" "+ profile.lastname;
        let email = profile.email;
        let phone = profile.phone;
        let address = profile.state;
        let industry = profile.industry;
        let company = profile.company_name;
        $('#user').text(firstname);
        $("#profile-fullname").text(fullname);
        $("#profile-email").text(email);
        $("#profile-phone").text(phone);
        $("#profile-address").text(address);
        $("#profile-industry").text(industry);
        $("#profile-company").text(company);
        console.log($("#profile-email").html());
    };
    xhttp3.open('GET', '../../moonhub.php?request=candidateprofile');
    xhttp3.send();



































 });