from datetime import datetime
import os
import platform
import socket

from flask import Flask, jsonify, render_template

app = Flask(__name__)


@app.route("/")
def inicio():
    return render_template("index.html")


@app.route("/api/estado")
def estado():
    return jsonify(
        {
            "estado": "Activo",
            "servicio": "Aplicación Flask",
            "servidor": socket.gethostname(),
            "sistema": platform.system(),
            "python": platform.python_version(),
            "entorno": os.getenv("ENTORNO", "Contenedor Docker local"),
            "fecha_hora": datetime.now().strftime("%d/%m/%Y %H:%M:%S"),
        }
    )


@app.route("/health")
def health():
    return jsonify({"status": "ok"}), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)