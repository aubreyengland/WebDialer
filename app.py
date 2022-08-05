import os

from flask import Flask 

app = Flask(__name__)

@app.route('/')
def main():
    target = os.environ.get('TARGET', 'Health')
    return 'Welcome to Premier{}!\n'.format(target)

if __name__ == "__main__";
    app.run(debug=True,host='0.0.0.0',port=int(os.envoron.get('PORT',8080)))