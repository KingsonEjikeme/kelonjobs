<?php
session_start();

$errors = [];
$data = [];
$database = "kelon";
$username = "root";
$password = "";
$host = "localhost";

$connection = mysqli_connect($host, $username, $password, $database);

if ($_GET['request'] == 'signin') {

    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_GET['email'];
        $password = $_GET['password'];
        // $pass = md5($password);
        $pass = $password;
        $query = "SELECT * FROM `recruiters` WHERE `email` = '$email' AND `password` = '$pass'";
        $result = mysqli_query($connection, $query);
        $id_query = "SELECT `recruiter_id` from `recruiters` where `email` = '$email'";
        $id_result = mysqli_query($connection, $id_query);

        $records = [];

        if (mysqli_num_rows($result) > 0) {
            $records = [];
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $records[] = $row;
                }
                $id_row = mysqli_fetch_assoc($result);
                $data["checkrow"] = $id_row;
                $data["status"] = true;
                $data["message"] = $records;
            }

            $data["status"] = true;
            $data["message"] = $records[0];
            // $data["message"] = "Login successful";
            // session_start();

            $_SESSION['email'] = $email;
            $_SESSION['user'] = $records[0];
            $data["user"] = $_SESSION['user'];
        } else {
            $data["message"] = "Invalid email or password";
        }
    }
} else if ($_GET['request'] == 'signup') {
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_GET['email'];
        $password = $_GET['password'];
        $phone = $_GET['phone'];
        $pass = $password;
        $query = "INSERT INTO `recruiters`(`email`,`phone`,`password`) VALUES ('${email}','${phone}','${pass}')";
        $result = mysqli_query($connection, $query);
        $id_query = "SELECT `recruiter_id` from `recruiters` where `email` = '$email'";
        $id_result = mysqli_query($connection, $id_query);
        $id_row = mysqli_fetch_assoc($result);
        $data["checkrow"] = $id_row;
        // -----------------------------------
        $data["status"] = true;
        // $data["message"] = $records;
        $data["message"] = "Registration successful";
        // session_start();
        $_SESSION['email'] = $email;
        $data["user"] = $_SESSION['user'];
    }
} else if ($_GET['request'] == 'profile') {
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_SESSION['email'];
        $query = "SELECT * FROM `recruiters` WHERE `email`='$email'";
        $result = mysqli_query($connection, $query);
        $records = [];
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $records[] = $row;
            }
            $data["status"] = true;
            $data["message"] = $records[0];
        }
    }
} else if ($_GET['request'] == 'signout') {
    unset($_SESSION['candidate_id']);
} else if ($_GET['request'] == 'candidatesignin') {
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_GET['email'];
        $password = $_GET['password'];
        // $pass = md5($password);
        $pass = $password;
        $query = "SELECT * FROM `candidates` WHERE `email` = '$email' AND `password` = '$pass'";
        $result = mysqli_query($connection, $query);
        $records = [];

        if (mysqli_num_rows($result) > 0) {
            $records = [];
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $records[] = $row;
                }
                $data["status"] = true;
                $data["message"] = $records;
            }

            $data["status"] = true;
            $data["message"] = $records[0];

            $_SESSION['email'] = $email;
            $_SESSION['user'] = $records[0];
            $data["user"] = $_SESSION['user'];
        } else {
            $data["message"] = "Invalid email or password";
        }
    }
} else if ($_GET['request'] == 'candidatesignup') {
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_GET['email'];
        $password = $_GET['password'];
        $phone = $_GET['phone'];
        $pass = $password;
        $query = "INSERT INTO `candidates`(`email`,`phone`,`password`) VALUES ('${email}','${phone}','${pass}')";
        $result = mysqli_query($connection, $query);

        // -----------------------------------
        $data["status"] = true;
        // $data["message"] = $records;
        $data["message"] = "Registration successful";
        // session_start();
        // $_SESSION['email'] = "hello test";
        $data["user"] = $_SESSION['user'];
    }
} else if ($_GET['request'] == 'jobs') {
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else 
        if ($_GET['job_id'] !== "") {
        $job_id = $_GET['job_id'];
        $query = "SELECT * FROM `jobs` where `job_id` = '$job_id'";
        $result = mysqli_query($connection, $query);
        $records = [];
        if (mysqli_num_rows($result) > 0) {
            $records = mysqli_fetch_assoc($result);
        }
        $data["status"] = true;
        $data["message"] = $records;
    } else {
        $query = 'SELECT * FROM `jobs`';
        $result = mysqli_query($connection, $query);
        $records = [];

        if (mysqli_num_rows($result) > 0) {
            // $records = mysqli_fetch_all($records);
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $records[] = $row;
                }
                $data["status"] = true;
                $data["message"] = $records;
            }

            $data["status"] = true;
            $data["message"] = $records;
        }
    }
} else if ($_GET['request'] == 'employerjobs') {
    // $_SESSION['recruiter_id'] = 1;
    $recruiter_id = $_SESSION['recruiter_id'];
    // echo $recruiter_id;
    // echo $_SESSION;
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $query = "SELECT * FROM `jobs` where `recruiter_id`='$recruiter_id'";
        $result = mysqli_query($connection, $query);
        $records = [];

        if (mysqli_num_rows($result) > 0) {
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $records[] = $row;
                }
                $data["status"] = true;
                $data["message"] = $records[0];
            }

            $data["status"] = true;
            $data["message"] = $records;
        }
    }
} else if ($_GET['request'] == 'employerprofile') {
    $recruiter_id = $_SESSION['recruiter_id'];
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $query = "SELECT * FROM `recruiters` where `recruiter_id`='$recruiter_id'";
        $result = mysqli_query($connection, $query);
        $records = [];
        if (mysqli_num_rows($result) > 0) {
            $records = mysqli_fetch_assoc($result);
            $data["status"] = true;
            $data["message"] = $records;
        } else {
            $data["status"] = false;
            $data["message"] = 'Record not found';
        }
    }
} else if (isset($_POST['action'])) {
    if ($_POST['action'] == 'registerEmployer') {
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $email = $_POST['email'];
        $pass = $_POST['password'];
        $phone = $_POST['phone'];
        $company_name = $_POST['company_name'];
        $city = $_POST['city'];
        $state = $_POST['state'];
        $industry = $_POST['industry'];

        $query = "INSERT INTO `recruiters` (`firstname`, `lastname`, `email`, `password`, `phone`, `company_name`, `city`, `state`, `industry`) VALUES ('$firstname', '$lastname', '$email', '$pass', '$phone', '$company_name', '$city', '$state', '$industry')";
        $result = mysqli_query($connection, $query);
        $data['message'] = $result;
    } else if ($_POST['action'] == 'signinEmployer') {
        $email = $_POST['signinEmail'];
        $pass = $_POST['signinPassword'];
        $signinquery = "SELECT * from `recruiters` WHERE `email`='$email' and `password`='$pass'";


        if (!$connection) {
            die("Connection failed: " . mysqli_connect_error());
        } else {

            $query = "SELECT * FROM `recruiters` WHERE `email` = '$email' AND `password` = '$pass'";
            $result = mysqli_query($connection, $query);
            $records = [];

            if (mysqli_num_rows($result) > 0) {
                $records = [];
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $records = $row;
                    }

                    $_SESSION['recruiter_id'] = $records['recruiter_id'];
                    $data["status"] = true;
                    $data["message"] = $records;
                }
            }

            $data["status"] = true;
            $data["message"] = $records;
        }
    } else if ($_POST['action'] == 'createJob') {
        // Values

        $jobTitle = $_POST['jobTitle'];
        $jobSalary = $_POST['jobSalary'];
        $jobType = $_POST['jobType'];
        $jobLocation = $_POST['jobLocation'];
        $companyName = $_POST['companyName'];
        $inputDetails = $_POST['inputDetails'];
        $deadline = $_POST['deadline'];
        $recruiter_id = $_SESSION['recruiter_id'];
        $date_posted = $_POST['date_posted'];
        $empty = NULL;

        $query = "INSERT INTO `jobs` (`job_title`, `salary`, `type`, `location`, `company_name`, `details`, `requirements`, `application_deadline`, `recruiter_id`, `date_posted`) VALUES ('$jobTitle', '$jobSalary', '$jobType', '$jobLocation', '$companyName', '$inputDetails', 'NULL', '$deadline', '$recruiter_id', 'current_timestamp()')";
        // echo 'alert("Hello")';

        if (!$connection) {
            die("Connection failed: " . mysqli_connect_error());
        } else {
            $result = mysqli_query($connection, $query);

            if ($result) {
                $data['message'] = $result;
            } else {
                $data['message'] = $result;
            }
        }
    } else if ($_POST['action'] == 'registerCandidate') {
        // Values
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $email = $_POST['email'];
        $pass = $_POST['password'];
        $phone = $_POST['phone'];
        $job_title = $_POST['job_title'];
        $city = $_POST['city'];
        $state = $_POST['state'];
        $profileSummary = $_POST['profileSummary'];

        $connection = mysqli_connect($host, $username, $password, $database);
        $query = "INSERT INTO `candidates` (`firstname`, `lastname`, `email`, `password`, `phone`, `job_title`, `city`, `state`, `summary`) VALUES ('$firstname', '$lastname', '$email', '$pass', '$phone', '$job_title', '$city', '$state', '$profileSummary')";
        $result = mysqli_query($connection, $query);
        $data['message'] = $result;
    } else if ($_POST['action'] == 'signinCandidate') {
        // Values

        $email = $_POST['signinEmail'];
        $pass = $_POST['signinPassword'];

        $connection = mysqli_connect($host, $username, $password, $database);
        $signinquery = "SELECT * from `recruiters` WHERE `email`='$email' and `password`='$pass'";
        // echo 'alert("Hello")';

        if (!$connection) {
            die("Connection failed: " . mysqli_connect_error());
        } else {

            $query = "SELECT * FROM `candidates` WHERE `email` = '$email' AND `password` = '$pass'";
            $result = mysqli_query($connection, $query);


            $records = [];

            if (mysqli_num_rows($result) > 0) {
                $records = [];
                if (mysqli_num_rows($result) > 0) {
                    $records = mysqli_fetch_assoc($result);
                    $_SESSION['candidate_id'] = $records['id'];

                    $data["status"] = true;
                    $data["message"] = $records;
                }
            }
            $data["status"] = true;
            $data["message"] = $records;
        }
    }
} else if ($_GET['request'] == 'candidatejobs') {
    $query = "SELECT * FROM `jobs`";
    $result = mysqli_query($connection, $query);
    $records = [];
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $records[] = $row;
        }
    }
    $data['message'] = $records;
} else if ($_GET['request'] == 'candidateprofile') {
    $candidate_id = $_SESSION['candidate_id'];

    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $query = "SELECT * FROM `candidates` where `id`='$candidate_id'";
        $result = mysqli_query($connection, $query);
        $records = [];
        if (mysqli_num_rows($result) > 0) {
            $records = mysqli_fetch_assoc($result);
            $data["status"] = true;
            $data["message"] = $records;
        } else {
            $data["status"] = false;
            $data["message"] = 'Record not found';
        }
    }
}

echo json_encode($data);
exit();
