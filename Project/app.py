from FilmFinder import app, db

if __name__ == '__main__':
    app.debug=True
    # the port number is default to 5000
    # If 5000 has already been used
    # please change to app.run(port= XXXX), XXXX is a random Four digits。For example, 5454
    # app.run(port=5454)
    app.run()
