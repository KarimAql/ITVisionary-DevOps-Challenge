"""
Simple Flask web application for AWS DevOps Challenge demonstration.
"""
import os
from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def index():
    return jsonify(
        {
            "status": "ok",
            "message": "AWS DevOps Challenge - IT Visionary Task",
            "environment": os.environ.get("APP_ENV", "production"),
        }
    )


@app.route("/health")
def health():
    """Health check endpoint used by ALB target group."""
    return jsonify({"status": "healthy"}), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
