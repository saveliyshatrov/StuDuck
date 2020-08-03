from flask import jsonify, make_response
from flask import Flask


app = Flask(__name__)

@app.route('/<nameofactivity>')
def summary(nameofactivity):
    d = {
        "films": [
            {
                "url": "https://images.unsplash.com/photo-1542204637-e67bc7d41e48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80",
                "text": "Some label"
            },
            {
                "url":"https://images.unsplash.com/photo-1520828954822-4aa221e867aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80",
                "text": "Some label"
            },
            {
                "url": "https://images.unsplash.com/photo-1560354508-468e7201bbc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2094&q=80",
                "text": "Some label"
            },
        ],
    }
    return make_response(jsonify(d), 200)

app.run(debug = True, host="0.0.0.0", port=2000) 