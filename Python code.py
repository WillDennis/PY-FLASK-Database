#Author : William Dennis - 100157542
#Version : 1.0
#Date : 08/05/18

#import statements for programs
import psycopg2
import psycopg2.extras
from flask import Flask, render_template, request
from datetime import datetime

app = Flask(__name__) 

#Standard method to get connection to database for each query
def getConn():
#reading in password from .txt file
    pwFile = open("pw.txt","r")
    pw = pwFile.read()
    pwFile.close()
#connections for both UEA lab Computers and Personal Laptop
    #Personal
    connStr=("host='localhost' dbname='postgres' user='postgres' password='dbpassword'")
    #Uni Labs
    #connStr=("host='cmpstudb-01.cmp.uea.ac.uk' dbname='efg16jmu' user='efg16jmu' password=" +pw)
    conn=psycopg2.connect(connStr)
    return conn

#Default App.Route to return to main page when called
@app.route('/')
def index():
    return render_template('index.html')
    
#Method 1 - To add a new customer
@app.route( '/addCustomer', methods =['POST'])
def addCustomer():
    #try loop for method
    try:    
        #get connection to database
        conn = None
        conn = getConn()
        cur = conn.cursor()
        cur.execute('SET search_path TO public')
        
        #receive values from HTML page form
        customerid = int(request.form['customerid'])
        name = request.form['name']
        email = request.form['email']
        
        #Execute SQL query 
        cur.execute('INSERT INTO Customer(CustomerID, name , email) VALUES (%s, %s, %s)', \
        [customerid, name, email])
        #commit query
        conn.commit()
        #render webpage with success message
        return render_template('index.html', msg1 = 'Customer Record Added')
        
        #Exception with error message for unsuccessful query
    except Exception as e:
        return render_template('index.html', msg1 = 'Customer Record NOT Added ', error1=e)

    #close connection
    finally:
        if conn:
            conn.close()
            
#Method 2 - Create a new support Ticket
@app.route( '/createSupportTicket', methods =['POST'])
def createSupportTicket():
    #receive values from HTML page form
    ticketid = request.form['ticketid']
    problem = request.form['problem']
    status = request.form ['status']
    priority = request.form['priority']
    loggedtime = request.form['loggedtime']
    customerid = request.form['customerid']
    productid = request.form['productid']
    #try loop for method
    try:
        conn = None
        conn=getConn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SET search_path TO public')

        #Execute SQL query 
        cur.execute('INSERT INTO Ticket(Ticketid, Problem, Status, Priority, Loggedtime, Customerid, Productid)\
                    VALUES(%s, %s, %s, %s, %s, %s, %s)',\
                    [ticketid, problem, status, priority, loggedtime, customerid, productid])
        conn.commit()
        
        cur.execute('SELECT * FROM Ticket WHERE TicketID = %s',[ticketid])
        
        rows = cur.fetchall()
        if rows:
        #render webpage with success message
            return render_template('createSupportTicket.html', rows = rows, ticketid = ticketid)
        else:
        #render webpage with message that no data was found in database
            return render_template('index.html', msg2 = 'No data found')
        #Exception with error message for unsuccessful query
    except Exception as e:
        return render_template('index.html', msg2 = 'Support Ticket NOT Added', error2=e)


    finally:
        if conn:
            conn.close()


#3 - Update ticketupdate
@app.route( '/updateTicket' , methods = ['POST'])
def updateTicket():
    #receive values from HTML page form
    ticketupdateid = request.form['ticketupdateid']
    message = request.form['message']
    updatetime = request.form['updatetime']
    ticketid = request.form['ticketid']
    staffid = request.form['staffid']
    #try loop for method
    try:
        conn = None
        conn=getConn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SET search_path TO public')

        #Execute SQL query 
        cur.execute('INSERT INTO TicketUpdate(Ticketupdateid, Message, Updatetime, Ticketid, Staffid)\
                    VALUES (%s, %s, %s, %s, %s)',\
                    [ticketupdateid, message, updatetime, ticketid, staffid])
        #commit query to connection
        conn.commit()
        #render webpage with success message
        return render_template('index.html', msg3 = 'Ticket Updated')
     #Exception with error message for unsuccessful query   
    except Exception as e:
        return render_template('index.html', msg3 = 'Update Error', error3=e)

    #close connection to database
    finally:
        if conn:
            conn.close()


#4 - List all open tickets
@app.route( '/listOpen', methods =['POST' ])
def listOpen():
    #try loop for method
    try:
        #Connect to database
        conn = None
        conn=getConn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SET search_path TO public')
        
        #Execute SQL query to SELECT info needed from database where Status = open
        cur.execute('SELECT DISTINCT Ticket.TicketID, Problem, Status, Priority, Loggedtime, Customerid, Productid FROM TicketUpdate \
        RIGHT JOIN Ticket ON Ticket.TicketID = TicketUpdate.TicketID WHERE Status = %s', ['open'])
        
        #return rows from HTML DOC
        rows = cur.fetchall()
        if rows:
            #Successful output return 
            return render_template('listOpen.html', rows = rows)
        else:
            #Condition if no data found
            return render_template('index.html', msg4 = 'No data found')
    #Exception with error message for unsuccessful query    
    except Exception as e:
        return render_template('index.html', msg4 = 'Data Not Retrieved', error4=e)

    #close connection to database
    finally:
        if conn:
            conn.close()
            
#5 - Change status of ticket to Closed
@app.route( '/changeStatus', methods =['POST'])
def changeStatus():
    #receive value from HTML page form
    ticketid = request.form['ticketid']
    #try loop for method
    try:
        #get connection to database using getConn() method
        conn = None
        conn = getConn()
        cur = conn.cursor()
        cur.execute('SET search_path TO public')
        
        #Execute SQL query 
        cur.execute('UPDATE Ticket SET Status = %s \
                    WHERE Ticketid = %s',\
                    ['closed',ticketid])
        conn.commit()
        #render webpage with success message
        return render_template('index.html', msg5 = 'Ticket Status set to closed')
    #Exception with error message for unsuccessful query    
    except Exception as e:
        return render_template('index.html', msg5 = 'Ticket Status NOT set to closed ', error5=e)

    #close connection
    finally:
        if conn:
            conn.close()
            
    

#6 - Ticket infomation request
@app.route( '/listTickets', methods =['POST'])
def listTickets():
    #receive value from HTML page form
    ticketid = request.form['ticketid']
    #try loop for method
    try:
        #open connection to database
        conn = None
        conn = getConn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SET search_path TO public')
        
        #Execute SQL query 
        cur.execute('SELECT Ticket.TicketID, Problem, Customer.Name, Message, Staff.Name, UpdateTime FROM Ticket, TicketUpdate, Customer, Staff\
                    WHERE TicketUpdate.StaffID = Staff.StaffID \
                    AND Customer.CustomerID = Ticket.CustomerID \
                    AND Ticket.TicketID = TicketUpdate.TicketID \
                    AND Ticket.TicketID = %s ORDER BY UpdateTime', [ticketid])
        #return rows from HTML DOC
        rows = cur.fetchall()
        if rows:
            #Successful output return 
            return render_template('listTickets.html', rows = rows, ticketid = ticketid)
        else:
            #output if not data found in database
            return render_template('index.html', msg6 = 'No data found')
    #Exception with error message for unsuccessful query   
    except Exception as e:
        return render_template('index.html', msg6 = 'List Failure', error6=e)

    #close connection
    finally:
        if conn:
            conn.close()

#7 - Report for closed tickets with times and update numbers
@app.route( '/statusClosed', methods =['GET' , 'POST'])
def statusClosed():
    #try loop for method
    try:
        #open connection
        conn = None
        conn = getConn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SET search_path TO public')
        
        #Execute SQL query 
        cur.execute('CREATE OR REPLACE VIEW times (Ticket_ID, minUpdateTime, maxUpdateTime) AS \
                    SELECT Ticket.TicketID, MIN(UpdateTime), MAX(UpdateTime) FROM Ticket, TicketUpdate \
                    WHERE Ticket.TicketID = TicketUpdate.TicketID \
                    GROUP BY Ticket.TicketID;')

        cur.execute('CREATE OR REPLACE VIEW output (TicketID, Status, ElaspedTime, TotalTime , NumUpdates) AS \
                    SELECT Ticket.TicketID, Status , SUM(minUpdateTime-LoggedTime), SUM(maxUpdateTime-LoggedTime), COUNT(TicketUpdate.TicketID) FROM Ticket, TicketUpdate, times \
                    WHERE Ticket.TicketID = TicketUpdate.TicketID AND Ticket.TicketID = times.Ticket_ID AND Ticket.Status = %s\
                    GROUP BY Ticket.TicketID ',['closed'])
        conn.commit()
        #SELECT query to produce output to statusClosed HTML doc
        cur.execute('SELECT * FROM output')
        #get rows from SELECT query above
        rows = cur.fetchall()
        if rows: 
            #Successful output
            return render_template('statusClosed.html', rows = rows)
            #output if no data found in database
        else:
           return render_template('index.html', msg7 = 'No data found')
    #Exception with error message for unsuccessful query    
    except Exception as e:
        return render_template('index.html', msg7 = 'Report Creation Error', error7=e)

    #close connection
    finally:
        if conn:
            conn.close()
        
#8 - removing a customer 
@app.route( '/removeCustomer', methods =['GET' , 'POST'])
def removeCustomer():
    #receive value from HTML page form
    customerid = request.form['customerid']
    #try loop for method
    try:
        #open connection to database
        conn = None
        conn = getConn()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SET search_path TO public')
        
        #Execute SQL query 
        cur.execute ('DELETE FROM Customer WHERE CustomerID = %s', [customerid])
        conn.commit()
        ##Successful output return 
        return render_template('index.html', msg8 = 'Customer Data deleted')
    #Exception with error message for unsuccessful query    
    except Exception as e:
        return render_template('index.html', msg8 = 'Customer NOT Deleted', error8=e)

    #close connection
    finally:
        if conn:
            conn.close()
            
if __name__ == '__main__':
    app.run(debug = True) 
