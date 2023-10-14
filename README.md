 # Pyramids_task

## Setting Up the Project

### Configure virtual environment
- Create virtual enviroment (env) => move to it source env/bin/activate
- Install dependencies from requiremnets.txt into the created virtual enviroment (pip install -r requirements. txt)

### Configure MYSQL database
- Using root user, create a database called pyramidsdatabase hosted on the localhost.
- In pyramids/pyramids/settings.py line 113, add the mysql password
- In  pyramids/ directory, run "python manage.py makemigrations" and then "python manage.py migrate"

### Run the server
- In pyramids/ directory, run "python manage.py runserver"
- Create a super user using "python manage.py createsuperuser"
- Check django admin dashboard => http://127.0.0.1:8000/admin

## Features

### Project 
- A blog REST API using Django Framework
- Authantication is done using JWT

### Registeration
- Register Endpoint =(post request)=> http://127.0.0.1:8000/user/register/
Example:-
```
    {
    "username" : "user",
    "email":"user@gmail.com",
    "password":"Test@pass123",
    "confirm_password":"Test@pass123",
    "firstname":"user1",
    "lastname":"user2"
    }
````
- Please use a valid mail to get the email activation mail
- Email activation (mail shoul be activated before using)

### Login
- Login Endpoint =(post request)=> http://127.0.0.1:8000/user/login/
Example :-
```
    {
      "email":"user@gmail.com",
      "password":"Test@pass123"
    }
````
- After the Login, Use the access key to authnticated the user thus you will have access to home and to posts
- In the JWT, the access key expire after 10 mins that is when we have to refresh the token using the refresh token in the refresh token.
- password is encrypted.

### Refresh Token
-  Refresh Token Endpoint =(post request)=> http://127.0.0.1:8000/user/token/refresh/
```
    {
       "refresh": ""
    }
````

- Which will generate new access and refresh keys used to re-authenticate

### Logout 
- Logout Endpoint =(post request)=> http://127.0.0.1:8000/user/logout/  
```
    {
       "refresh": ""
    }
````
### Home 
- Home Endpoint =(get request)=> http://127.0.0.1:8000/user/home/
- It's used to test the authunticated user.

### List Posts
- List Post =(get request)=> http://127.0.0.1:8000/post/

### Create Post
- Create Post Endpoint =(post request)=> http://127.0.0.1:8000/post/create/
- Only authunticated users can Create Post.
example :-
```
 {
  "title" : "title for post one",
  "content":" content for post 1"
}
````
- The authunticated users is set to be the author of the post.

### Update Post
- Update Post Endpoint =(put request)=> http://127.0.0.1:8000/post/update/post_id.
- Only authunticated post authors can update Post.
example :-
```
 {
  "title" : "title for post one"

}
```

### Delete Post
- Update Post Endpoint =(delete request)=> http://127.0.0.1:8000/post/delete/post_id.
- Only authunticated post authors can delete Post.

