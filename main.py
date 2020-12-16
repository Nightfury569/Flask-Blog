from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
# from FlaskSQLAlchemySession import *



with open('config.json','r') as c:
    params = json.load(c)["params"]

local_server = True

app = Flask(__name__)
app.secret_key='Super-secret'



if local_server :
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]

else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]



db = SQLAlchemy(app)

class info(db.Model):
    __tablename__="info"
    person_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20),nullable=False)
    email = db.Column(db.String(50), unique=True, nullable=False)
    phone_num = db.Column(db.String(20), unique=True, nullable=False)
    datetime = db.Column(db.String(20), unique=True, nullable=True)

class Comments(db.Model):
    __tablename__="feed"
    feedback_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20),nullable=False)
    feedback = db.Column(db.String(100), nullable=True)


class Login(db.Model):
    __tablename__="login"
    id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(15),nullable=False)
    password = db.Column(db.String(20), nullable=False)
    name = db.Column(db.String(20), nullable=False)

class Post(db.Model):
    __tablename__="post"
    sl_num = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20),nullable=False)
    title = db.Column(db.String(20), nullable=False)
    slug = db.Column(db.String(20), nullable=False)
    subheading = db.Column(db.String(25), nullable=False)
    content= db.Column(db.String(200), nullable=False)
    date = db.Column(db.String(20), nullable=True)
    img2 = db.Column(db.String(500), nullable=True)
    n = db.Column(db.Integer)


@app.route('/login',methods = ['GET','POST'])
def login():
    if 'user' in session and session['user']==params["username"]:
        posts= Post.query.filter_by().all()

        return render_template('admin.html',params=params,posts=posts)

    if request.method=='POST':
        user_name = request.form.get('user_name')
        password = request.form.get('password')
        if user_name == "Pain" and password == "Pch619" :
            session['user']=user_name
            posts = Post.query.filter_by(name=Login.name).all()
            return render_template('admin.html', params=params, posts=posts)

    else:
        return render_template('Login.html',params=params)




@app.route('/signup',methods = ['GET','POST'])
def signup():
    if request.method == 'POST':
       user_name = request.form.get('user_name')
       password = request.form.get('password')
       name = request.form.get('name')
       entry = Login(user_name=user_name,password=password,name=name)
       db.session.add(entry)
       db.session.commit()
    return render_template('Sign_up.html',params=params)








@app.route('/',methods = ['GET','POST'])
def first():
    if request.method == 'POST':
       user_feedback = request.form.get('user_feedback')
       name = request.form.get('name')
       entry = Comments(name=name,feedback=user_feedback)
       db.session.add(entry)
       db.session.commit()
    return render_template('index.html',params=params)





@app.route('/dashboard/<string:name>')
def admin(name):
    posts=Post.query.filter_by(name=name).all()
    return render_template('admin.html',params=params,posts=posts)


@app.route('/edit/<int:sl_num>', methods = ['POST','GET'])
def edit(sl_num):

    post = db.session.query(Post).filter_by(sl_num=sl_num).first()
    if request.method == 'POST':
        post.title = request.form.get('title')
        post.subheading = request.form.get('subheading')
        post.content = request.form.get('content')
        post.img2 = request.form.get('img2')
        post.date = datetime.now()

        db.session.commit()
        #return redirect('/edit/'+sl_num)
    posts = Post.query.filter_by(sl_num=sl_num).all()
    return render_template('edit.html', params=params,posts=posts)


@app.route('/delete/<int:sl_num>', methods = ['POST','GET'])
def delete(sl_num):

    post = Post.query.filter_by(sl_num=sl_num).first()
    db.session.delete(post)
    db.session.commit()
    posts = Post.query.filter_by(sl_num=sl_num).all()
    return render_template('delete.html', params=params, posts=posts)



@app.route('/about.html')
def about():
    return render_template('about.html',params=params)

@app.route('/contact.html', methods = ['GET','POST'])
def contact():
    if request.method == 'POST':
        #ADD ENTRY TO THE DATABASE#
       name =request.form.get('name')
       email =request.form.get('email')
       phone  =request.form.get('phone')

       entry = info(name = name , email = email, phone_num = phone,datetime = datetime.now())
       db.session.add(entry)
       db.session.commit()

    return render_template('contact.html',params=params)


@app.route('/post.html')
def post():
    return render_template('post.html',params=params)



@app.route('/post.html/all/', methods=['GET', 'POST'])
def post_by_user():
        if request.method == 'POST':
            name = request.form.get('name')
            title = request.form.get('title')
            subheading = request.form.get('subheading')
            content = request.form.get('content')
            img2 = request.form.get('img2')

            entry = Post(name=name, title=title, slug=name, subheading=subheading, content=content, date=datetime.now(), img2=img2)
            db.session.add(entry)
            db.session.commit()
        posts = Post.query.all()
        return render_template('post_by_user.html', params=params,posts=posts)

@app.route('/post.html/all/<int:n>/', methods=['GET', 'POST'])
def post_per_page(n):
        if request.method == 'POST':
            name = request.form.get('name')
            title = request.form.get('title')
            subheading = request.form.get('subheading')
            content = request.form.get('content')
            img2 = request.form.get('img2')

            entry = Post(name=name, title=title, slug=name, subheading=subheading, content=content, date=datetime.now(), img2=img2)
            db.session.add(entry)
            db.session.commit()
        posts = Post.query.filter_by().all()[(params['num_of_posts']*(n-1)):(params['num_of_posts']*n)]
        return render_template('post_by_user.html', params=params,posts=posts)



@app.route('/post.html/<string:name>/', methods=['GET'])
def post_individual(name):
    posts = Post.query.filter_by(name=name).all()
    return render_template('individual_post.html', params=params, posts=posts)



if __name__ == "__main__":
 app.run(debug = True)

