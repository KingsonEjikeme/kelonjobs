function createJob(){
    let jobTitle = $('#jobTitle').val();
    let jobSalary = $('#inputSalary').val();
    let jobType = $('#inputType').val();
    let jobLocation = $('#inputLocation').val();
    let companyName = $('#inputCompany').val();
    let inputDetails = $('#inputDetails').val();
    let deadline = $('#inputDeadline').val();

    if(jobTitle !="" && jobSalary !="" && jobType !="" && jobLocation != "" && companyName != "" && inputDetails != "" && deadline != ""){
//access database
$.post("/moonhub/moonhub.php?request=createJob",{
    jobTitle: jobTitle,
    jobSalary: jobSalary,
    jobType: jobType,
    jobLocation: jobLocation,
    companyName: companyName,
    inputDetails: inputDetails,
    deadline: deadline,
    action: "createJob"
},(data,status)=>{
    let result = JSON.parse(data);
    console.log(result);
    fetchJobs();
    // console.log("This: "+ JSON.parse(this));
})
    }else{
        alert("Complete form");
    }

    


    //...
    console.log(jobTitle);
    console.log(jobSalary);
    console.log(jobType);
    console.log(jobLocation);
    console.log(companyName);
    console.log(inputDetails);
    console.log(deadline);
}
function renderSignin(){
    $('#signin').removeClass('d-none',1000);
    $('#signup').addClass('d-none',1000);
}
function renderSignup(){
    $('#signin').addClass('d-none',1000);
    $('#signup').removeClass('d-none',1000);
}
function signinEmployer(){
    let email = $('#signin-email').val();
    let password = $('#signin-password').val();
    $.post("../../moonhub.php?request=signinEmployer",{
        signinEmail:email,
        signinPassword:password,
        action: "signinEmployer"
    }, function(data, status){
        console.log(data); //check
        var message = JSON.parse(data).message.recruiter_id;
      
        if(message){
            console.log(message);
            window.location.href = "/moonhub/employer/dashboard/em_dashboard.html";
        }
    })
}
function registerEmployer(){
    let firstname = $('#firstname').val();
    let lastname = $('#lastname').val();
    let email = $('#email').val();
    let password = $('#password').val();
    let phone = $('#phone').val();
    let company_name = $('#company_name').val();
    let city = $('#city').val();
    let state = $('#state').val();
    let industry = $('#industry').val();
    $.post("/moonhub/moonhub.php?request=registerEmployer", {
        firstname:firstname,
        lastname:lastname,
        email:email,
        password:password,
        phone:phone,
        company_name:company_name,
        city:city,
        state:state,
        industry:industry,
        action:"registerEmployer"
    }, function(data, status){
        let message = JSON.parse(data).message;
        console.log(message);
        if(message){
            console.log("Yessssssssss");
            alert("Registration successful!\nProceed to Login.");
            setTimeout(()=>{
                // window.location.href="/moonhub/moonhub.html";
                renderSignin();
            },2000)
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
      window.location.href = "/moonhub";
    };
    xhttp.open("GET", "../../../moonhub.php?request=signout");
    xhttp.send();
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

$(document).ready(function(){
    // Jobs List Element Function
    function listJobElements(employerJobs) {
        var jobElement = ``;

        employerJobs.forEach(job => {
            jobElement += `<div
            class="border p-2 job bg-light my-1 rounded shadow single-job"
            onclick="displayJobDetail(this)"
          >
            <input class="d-none" value="${job.job_id}"/>
            <p class="fw-bold fs-5 my-0">${job.job_title}</p>
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
    
    // Fetch Jobs from the database
   
    
        let xhttp = new XMLHttpRequest();
        xhttp.onload = function(){
            console.log(this);
            let employerJobs = JSON.parse(this.response).message ;
            console.log(employerJobs);
            listJobElements(employerJobs);
            
        };
        xhttp.open('GET', '../../moonhub.php?request=employerjobs');
        xhttp.send();
   
    

    // Fetch Applications from the database
    let xhttp1 = new XMLHttpRequest();
    xhttp1.onload = function(){
        console.log("2");
    };
    xhttp1.open('GET', '../../moonhub.php?request=employerapplications');
    xhttp1.send();

    // Fetch Tasks from the database
    // let xhttp2 = new XMLHttpRequest();
    // xhttp2.onload = function(){
    //     console.log(this);
    // };
    // xhttp2.open('GET', '../../moonhub.php?request=employertask');
    // xhttp2.send();

    // Fetch Profile from the database
    let xhttp3 = new XMLHttpRequest();
    xhttp3.onload = function(){
        console.log(this);
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
    xhttp3.open('GET', '../../moonhub.php?request=employerprofile');
    xhttp3.send();

    // Handle Signout


































 });