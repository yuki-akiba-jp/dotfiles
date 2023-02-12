version: "3.9"
services:
  server:
    build: ./backend
    ports:
      - "3001:5000"
    volumes:
      - ./backend:/app
    environment:
      FLASK_ENV: development
  web:
    build: ./frontend
    ports:
      - "3000:3000"
    volumes:
      - ./frontend:/user/src/app
    entrypoint:
      - sh
    command:
      - -c
      - |
        cd /user/src/app
        [ -f ~/.exec-once ] || {
          npm install && touch ~/.exec-once
        }
        npm start
    depends_on:
      - server
    # environment:
    #   - CHOKIDAR_USEPOLLING=true
