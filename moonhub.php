<?php
session_start();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$errors = [];
$data = [];
if ($_GET['request'] == 'signin') {
    $database = "kelon";
    $username = "root";
    $password = "";
    $host = "localhost";

    $connection = mysqli_connect($host, $username, $password, $database);
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_GET['email'];
        $password = $_GET['password'];
        $pass = md5($password);
        $query = "SELECT * FROM `recruiters` WHERE `email` = '$email' AND `password` = '$pass'";
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
    $database = "kelon";
    $username = "root";
    $password = "";
    $host = "localhost";

    $connection = mysqli_connect($host, $username, $password, $database);
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        $email = $_GET['email'];
        $password = $_GET['password'];
        $phone = $_GET['phone'];
        $pass = md5($password);
        $query = "INSERT INTO `recruiters`(`email`,`phone`,`password`) VALUES ('${email}','${phone}','${pass}')";
        $result = mysqli_query($connection, $query);

        // -----------------------------------
        $data["status"] = true;
        // $data["message"] = $records;
        $data["message"] = "Registration successful";
        session_start();
        // $_SESSION['email'] = "hello test";
        $data["user"] = $_SESSION['user'];
    }
} else if ($_GET['request'] == 'profile') {
    $database = "kelon";
    $username = "root";
    $password = "";
    $host = "localhost";

    $connection = mysqli_connect($host, $username, $password, $database);
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
            // $data["message"] = $email;
        }
    }
    // if (!$connection) {
    //     die("Connection failed: " . mysqli_connect_error());
    // } else {
    //     $email = $_SESSION['email'];
    //     $query = "SELECT * FROM `recruiters` WHERE `email` = '$email'";
    //     $result = mysqli_query($connection, $query);
    //     // $records = [];

    //     if (mysqli_num_rows($result) > 0) {
    //         $records = [];
    //         if (mysqli_num_rows($result) > 0) {
    //             while ($row = mysqli_fetch_assoc($result)) {
    //                 $records[] = $row;
    //             }
    //             $data["status"] = true;
    //             $data["message"] = $records;
    //         }

    //         $data["status"] = true;
    //         $data["message"] = $records[0];
    //         // $data["message"] = "Login successful";
    //         // session_start();
    //         $_SESSION['user'] = $records[0];
    //         $data["user"] = $_SESSION['user'];
    //     }
    // $profile = $_SESSION['user'];
    // $query = "SELECT * FROM `recruiters` WHERE `email` = '$profile'";
    // $result = mysqli_query($connection, $query);
    // $records = mysqli_fetch_assoc($result);
    // $data["status"] = true;
    // $data["message"] = $records;

    // $data["message"] = $_SESSION['user'];
}

echo json_encode($data);
exit();
