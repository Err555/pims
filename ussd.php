<?php
include './config.php';
$phone = $_POST['phoneNumber'];
$session = $_POST['sessionId'];
$service = $_POST['serviceCode'];
$text = $_POST['text'];
$password = $_POST['password'];
$response = '';

if ($text == "") {
    $response = "CON Karibu PIMS, pata kujua kuhusu mafao yako\n1. Mafao\n2.taarifa muhimu\n3.Michango\n3. kurudi nyuma";
    //inatakiwa aingize password kwanza kabla ya kuendelea na mambo mengine, hapa sasa ndo msala unapoanzia
} else if ($text == "1") {
    $response .= "CON Mafao";
} else if ($text == "2") {
    $sql = $con->query("SELECT * FROM contributions, users WHERE contributions.user_id = users.id");
    if (mysqli_num_rows($sql) > 0) {
        $count = 0;
        while ($row = mysqli_fetch_assoc($sql)) {
            $count++;
            $response .= $count . ". Month: " . $row['month_paid'] . " Year: " . $row['year_paid'] . " Amount: " . $row['amount_paid'] . "\n";
        }
    } else {
        $response .= "Huna michango yeyote kwa sasa";
    }
} else if ($text == "3") {
    $response .= "CON Taarifa muhimu";
} else if ($text == "4") {
    $response .= "CON kurudi nyuma";
}


echo $response;
