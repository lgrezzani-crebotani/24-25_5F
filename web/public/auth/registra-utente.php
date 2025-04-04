<?php
require_once '../dbconn.php';

$email = $_POST['email'];
$name = $_POST['name'];
$surname = $_POST['surname'];
$password = $_POST['password'];

// TODO verificare che la password sia lunga almeno 8 caratteri
if (strlen($password) < 8) {
    $msg = urlencode("La password deve avere almeno 8 caratteri");
    header("Location: registrazione.php?error=$msg");
    return;
}

// verificare che la password contenga solo caratteri alfanumerici o trattini (- o _)
if (!preg_match("/^[a-zA-Z0-9\-\_]+$/", $password)) {
    $msg = urlencode("La password puo' contenere solo lettere, numeri o trattini");
    header("Location: registrazione.php?error=$msg");
    return;
}

// verificare che l'email sia formattata correttamente
$email_regex = "/^[^@]+@[^@]+\.[^@]+$/";
// la regex di una mail e' piu' complicata di cosi' https://emailregex.com/
if (!preg_match($email_regex, $email)) {
    $msg = urlencode("Email non formattata correttamente");
    header("Location: registrazione.php?error=$msg");
    return;
}


// Calcolo l'hash della password inserita
$hash = password_hash($password, PASSWORD_DEFAULT);

$conn = getDbConnection('auth');
$sql = "INSERT INTO users SET email=?, password_hash=?, name=?, surname=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssss", $email, $hash, $name, $surname);
try {
    $stmt->execute();
    // se l'utente e' stato inserito nel db torno alla pagina principale
    header('Location: index.php');
}
catch (Exception $e) {
    // altrimenti ricarico il form di registrazione con un messaggio di errore
    $msg = urlencode("Impossibile creare l'utente con i dati inseriti");
    header("Location: registrazione.php?error=$msg");
}

?>

