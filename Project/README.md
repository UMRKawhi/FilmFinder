# chongchongchong Team - FilmFinder
## Use cloud database
### 1. Google Cloud
The ip address of Google Cloud is 34.87.235.63 <br>Download the code from github, it will connect to the google cloud database by default.

### 2. AWS EC2

The ip address of AWS EC2 is 18.220.148.52 <br>

Since AWS EC2 is in the United States, the response time between website operations is relatively long. Please use it when google cloud is not available.

### 3. How to switch cloud database?

The connection to the database is set in the code __init__.py file. 

![image-20201116222103006](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116222103006.png)

    # google cloud database
    
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:FilmFinder123,.@34.87.235.63:3306/film"
    
    # AWS EC2
    
    # app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:FilmFinder123,.@18.220.148.52:3306/film"

The uncomment code is to connect to google cloud by default. The code which below the comment (# AWS EC2) is the setting which connect to the AWS EC2. If google cloud database cannot be used, please comment out the code and remove the # sign in the part of AWS EC2 code. The code shows as below:

    # google cloud database
    
    # app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:FilmFinder123,.@34.87.235.63:3306/film"
    
    # AWS EC2
    
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:FilmFinder123,.@18.220.148.52:3306/film"


## Running Program on CSE machine

### 1. Download the code from github

click https://github.com/unsw-cse-capstone-project/capstone-project-comp9900-h18a-chongchongchong.git to download the code.

![image-20201116222726276](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116222726276.png)

Click the link to jump to the github page of chongchongchong. The page is shown in the figure above. Click the green code button and select download zip.

![image-20201116222742614](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116222742614.png)

### 2. Find the folder and unzip

Find the directory where the compressed package is located, right-click and click Extract here.

![image-20201116222819439](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116222819439.png)



### 3. Install the necessary libraries

Use the cd command to enter the project folder, the path is shown below:

    cd Project

![image-20201116222936068](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116222936068.png)

    pip3 install -r requirements.txt

![image-20201116222943807](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116222943807.png)

After successful installation, you can see the following information on the command line:

![image-20201116223038079](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116223038079.png)

### 4. Starting program

    python3 app.py

Point your web browser to http://localhost:5000/

When you browsing the FilmFinder, you can register your own account by clicking the register button at the top right or you can directly login in to the existing account. The username and password are shown in the table below:

![image-20201116223142518](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116223142518.png)

If you want to go to the admin system, you should enter **127.0.0.1:5000/admin** in the address column. The account name and password to access the admin page are as the table below. 

![image-20201116223208466](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116223208466.png)

From there you can see all the information of movies, genres and directors. You can also add or modify them yourself.

## Common problems and solutions

### 1. The library installation failed because of the backward pip version

Use the command 

    python3 -m pip install pip –upgrade 

to update the pip version, and then use the installation command.

### 2. OSError: [Errno 98] Address already in use

Because flask comes with its own server, and the default port is 5000. If the previous program is not suspended, port 5000 will be continuously occupied. Therefore, you may get this error message when starting the program.

There are two solutions to fix this problem:

·     **Kill the process using the command line**

First use lsof -i:5000 on the command line to view the usage of port 5000. If port 5000 is occupied, you can see its process information. As shown below. Select one of the PIDs, 46671 or 46674, and enter kill + PID on the command line. For example, kill 46671 or kill 46674. After performing the above operations, you can kill the previous process, and then use python3 app.py to start the program.

![image-20201116223838402](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116223838402.png)

**Warning Warning Warning**!!! In extremely special circumstances, it will be found that there is no process information, but the port is still occupied. In this case, please see the second measure.

·     **Change program port parameters**

In the case that the first method fails, you can enter the program folder, find app.py and click to enter. In the fifth line of the program, in the parentheses of app.run(), add the port parameter. The computer's 1024-49151 ports are dynamic ports, so you can choose one at random and fill in it. The example here uses port 5454. Save after modification.

![image-20201116223913982](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20201116223913982.png)

Use python3 app.py to start the program. If successful, the program will start on port 5454. Therefore, the address in the browser will also become 127.0.0.1/5454. If the address is still occupied, repeat the above operation until a free port is found.