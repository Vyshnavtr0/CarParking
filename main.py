from flask import*
import mysql.connector 
from flask import Flask, render_template, redirect, request, session
from flask_session import Session
import os
import requests
import pymysql
import datetime
app = Flask(__name__)

@app.route('/check' , methods = ['POST'])
def check():
    current_time = datetime.datetime.now()
    # data = request.json
    distance = 1*1000
    speed = 70*0.27



    sec = current_time.second
    minute = current_time.minute
    print(minute)
    state = ""
    # change_time = 60 - sec
    # change_time = 16
    if 60 - sec != 0:
        change_time = 60 - sec
    else:
        change_time = 0.1
    if minute == 0 :
        state = "green"
    elif minute % 2 == 0:
        state = "green"
    else:
        state = "red"
    print(state)

    if state == "green":
        speed = distance/ (change_time - 6) +1
        if speed > 80:
            speed = (distance/(change_time+60))*3.6

            return jsonify({"speed" : speed})

        else:
            return jsonify({"speed" : speed})


    elif state == "red":
        
        
        speed = (distance/(change_time+60))*3.6
        print(" speed is " , speed)
        if speed <= 80:



            return jsonify({"speed" : speed})
        else:
            speed = (distance/(change_time+120))*3.6
            if speed <= 80:

                return jsonify({"speed" : speed})
            elif speed > 80:
                return jsonify("U trapped mf")
            
        
        


    return jsonify("")


@app.route('/spots' , methods = ['POST'])
def spots():
    links = [["https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car6_r31c1h.jpg", "lulu tvm", "25"], ["https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car1_mele5o.jpg", "aakulam tourist village" , "27" ], ["https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car4_wn7z1q.jpg" , "Museum" , "18"], ["https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car2_vw15gg.jpg ","kedaram" , "14"] ,  ["https://res.cloudinary.com/dbsojp5dm/image/upload/v1695809968/pxfuel-min_oyalqq.jpg", "mar baselious" , "22"]]
    return(jsonify(links))


if __name__ == "__main__":
    
    
    app.run(debug = True , port = 5000)
