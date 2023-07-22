from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/v1/hello')
def hello():
    return jsonify({'message': 'Hello World'})

if __name__ == '__main__':
    app.run(host='0.0.0.0')
