<!DOCTYPE html>
<html>
<head>
    <title>SMS Sender</title>
</head>
<body>

<h2>Send SMS</h2>

<form method="POST" action="send_sms.php">
    <label>Phone Number:</label><br>
    <input type="text" name="to" required><br><br>

    <label>Message:</label><br>
    <textarea name="message" required></textarea><br><br>

    <button type="submit">Send SMS</button>
</form>

</body>
</html>
