<?php

$hostname= "localhost";
$username="root";
$password = "";
$dbname = "osticket";


$dbconnect = mysqli_connect($hostname,$username,$password,$dbname) OR DIE ("Could not connect to database, ERROR:".mysqli_connect_error());

echo "You are connected to" $dbname ."Database";


$query = "SELECT ost_ticket.ticket_id,ost_ticket.created,osticket.ost_user.name AS ReceivedFrom, subject, firstname AS AssignedTo, osticket.ost_ticket_status.name AS Status,priority 
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id 
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id=osticket.ost_user.id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
WHERE osticket.ost_ticket.status_id in (1,6,7)";




?>