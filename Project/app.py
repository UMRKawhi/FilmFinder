from FilmFinder import app, db

if __name__ == '__main__':
    app.debug = True
    # if the address has been used, change the parameter in the app.run()
    # port='a random number' until it works
    # app.run(port=5454)
    app.run()
