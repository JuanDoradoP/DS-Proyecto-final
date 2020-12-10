from flask import Flask
helloworld = Flask(__name__)
@helloworld.route("/")
def run():
    return "{\"message\":\"Gracias training kubernetes, calvo, paz, lerma :)\"}"

@helloworld.route("/health")
def healthy():
        return "{\"message\":\"Healthy\"}", 200

if __name__ == "__main__":
    helloworld.run(host="0.0.0.0", port=int("5000"))
