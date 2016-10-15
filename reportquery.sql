SELECT ost_ticket.ticket_id, subject, firstname, status ost_ticket.created, priority FROM osticket.ost_ticket INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id ORDER BY created DESC

-- get ticket of status open
SELECT ost_ticket.ticket_id, subject, firstname, state, ost_ticket.created, priority
FROM osticket.ost_ticket
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id = osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id = osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id = osticket.ost_ticket_status.id
WHERE osticket.ost_ticket.status_id =1


--get ticket of status open with from name
SELECT ost_ticket.ticket_id, subject, firstname, state, osticket.ost_user.name, ost_ticket.created, priority
FROM osticket.ost_ticket
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id = osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id = osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id = osticket.ost_ticket_status.id
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id = osticket.ost_user.id
WHERE osticket.ost_ticket.status_id =1


--get ticket of status open with from name with correct alignment
SELECT ost_ticket.ticket_id, osticket.ost_user.name, subject, firstname, state, ost_ticket.created, priority
FROM osticket.ost_ticket
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id = osticket.ost_ticket__cdata.ticket_id
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id = osticket.ost_user.id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id = osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id = osticket.ost_ticket_status.id
WHERE osticket.ost_ticket.status_id =1

--get ticket of status open with from name with correct alignment with status 1,6,7
SELECT ost_ticket.ticket_id,ost_ticket.created,osticket.ost_user.name, subject, firstname, osticket.ost_ticket_status.name,priority 
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id 
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id=osticket.ost_user.id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
WHERE osticket.ost_ticket.status_id in (1,6,7)

SELECT ost1_ticket.ticket_id,ost1_ticket.created,ostticket.ost1_user.name AS ReceivedFrom, subject, firstname AS AssignedTo, ostticket.ost1_ticket_status.name AS Status,priority 
FROM ostticket.ost1_ticket 
INNER JOIN ostticket.ost1_ticket__cdata ON ostticket.ost1_ticket.ticket_id=ostticket.ost1_ticket__cdata.ticket_id 
LEFT JOIN ostticket.ost_user ON ostticket.ost1_ticket.user_id=ostticket.ost_user.id 
LEFT OUTER JOIN ostticket.ost_staff ON ostticket.ost1_ticket.staff_id=ostticket.ost1_staff.staff_id 
LEFT JOIN ostticket.ost1_ticket_status ON ostticket.ost1_ticket.status_id=ostticket.ost1_ticket_status.id  
WHERE ostticket.ost1_ticket.status_id in (1,6,7)


--get ticket of status open with from name with correct alignment with status 1,6,7 with Alias name
SELECT ost_ticket.ticket_id,ost_ticket.created,osticket.ost_user.name AS ReceivedFrom, subject, firstname AS AssignedTo, osticket.ost_ticket_status.name AS Status,priority 
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id 
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id=osticket.ost_user.id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
WHERE osticket.ost_ticket.status_id in (1,6,7)


--group
SELECT ost_ticket.ticket_id, firstname AS AssignedTo, COUNT(priority) AS NumberOfTickets
FROM (osticket.ost_ticket
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
WHERE osticket.ost_ticket.status_id in (1,6,7)

GROUP BY firstname,priority



SELECT  firstname AS AssignedTo,priority, COUNT(priority) AS NumberOfTickets
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
GROUP BY priority,firstname

SELECT  firstname AS AssignedTo,priority, COUNT(priority) AS NumberOfTickets,osticket.ost_ticket_status.name AS TStatus
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id 
WHERE osticket.ost_ticket.status_id in (1,6,7)
GROUP BY priority,firstname


--group by priority,user - opentickes
SELECT  firstname AS AssignedTo,priority, COUNT(priority) AS NumberOfTickets osticket.ost_ticket_status.name AS 
STATUS
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id 
WHERE osticket.ost_ticket.status_id in (1,6,7)
GROUP BY priority,firstname,STATUS

--department open tickets
SELECT dept_name, priority, COUNT(priority) AS NumberOfTickets, osticket.ost_ticket_status.name AS 
STATUS
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT JOIN osticket.ost_department ON osticket.ost_ticket.dept_id=osticket.ost_department.dept_id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id 
WHERE osticket.ost_ticket.status_id in (1,6,7)
GROUP BY dept_name,STATUS,priority

--resolved/closed by user
SELECT firstname AS AssignedTo, osticket.ost_ticket_status.name AS Status,COUNT(Status) As total, priority 
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id 
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id=osticket.ost_user.id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
WHERE osticket.ost_ticket.status_id in (2,3)
GROUP BY STATUS,firstname

--resolved/closed by dept
SELECT dept_name, osticket.ost_ticket_status.name AS Status,COUNT(Status) As total, priority 
FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT JOIN osticket.ost_department ON osticket.ost_ticket.dept_id=osticket.ost_department.dept_id 
LEFT JOIN osticket.ost_user ON osticket.ost_ticket.user_id=osticket.ost_user.id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
LEFT JOIN osticket.ost_ticket_status ON osticket.ost_ticket.status_id=osticket.ost_ticket_status.id  
WHERE osticket.ost_ticket.status_id in (2,3)
GROUP BY dept_name,STATUS

--Total overdue
Select Count(isoverdue) As overduecount from ost_ticket where status_id in(1,6,7)


--overdue group by user,priority
SELECT firstname AS AssignedTo,Count(isoverdue) As overduecount,priority FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
WHERE osticket.ost_ticket.status_id in (1,6,7)GROUP BY firstname

--overdue group by user,priority,dept
SELECT firstname AS AssignedTo,dept_name,Count(isoverdue) As overduecount,priority FROM osticket.ost_ticket 
INNER JOIN osticket.ost_ticket__cdata ON osticket.ost_ticket.ticket_id=osticket.ost_ticket__cdata.ticket_id
LEFT JOIN osticket.ost_department ON osticket.ost_ticket.dept_id=osticket.ost_department.dept_id 
LEFT OUTER JOIN osticket.ost_staff ON osticket.ost_ticket.staff_id=osticket.ost_staff.staff_id 
WHERE osticket.ost_ticket.status_id in (1,6,7)GROUP BY dept_name,priority,firstname