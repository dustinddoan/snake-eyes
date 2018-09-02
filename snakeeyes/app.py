from flask import Flask


def create_app():
    """
    Create a Flask application using the app factory pattern.

    :return: Flask app
    """
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_object('config.settings')
    app.config.from_pyfile('settings.py', silent=True)

    @app.route('/')
    def index():
        """
        Render a Hello World response.

        :return: Flask response
        """
        return 'Hello World! I am Dustin. I work very hard'
    if __name__ == "__main__":
        app.run(debug=True, host='0.0.0.0')
    
    return app
