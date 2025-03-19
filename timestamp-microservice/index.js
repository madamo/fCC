// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({optionsSuccessStatus: 200}));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


// your first API endpoint... 
app.get("/api/hello", function (req, res) {
  res.json({greeting: 'butt'});
});

app.get("/api/:date?", (req, res) => {
  if (!req.params.date) {
    let timeNow = new Date()
    res.json({
      unix: timeNow.getTime(),
      utc: timeNow.toString()
    })
  } else {
    // check if input is date string or epoch
    const regex = /^\d+$/
    console.log(regex.test(req.params.date))
    const timeInput = regex.test(req.params.date) ? new Date(parseInt(req.params.date)) : new Date(req.params.date)
    // check if input is a valid date or epoch
      if (isNaN(timeInput.getTime())) {
      // if not, return an { error: "Invalid date" } object
        res.json( { error: "Invalid date" })
      } else {
        console.log(timeInput.getTime())
        //const epoch = timeInput.getTime()
        //const utc = timeInput.toString()
        
        res.json({
          unix: timeInput.getTime(),
          utc: timeInput.toUTCString()
        })
      }


  }

})



// Listen on port set in environment variable or default to 3000
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});


/*
1. You should provide your own project, not the example URL.
Waiting: 2. A request to /api/:date? with a valid date should return a JSON object with a unix key that is a Unix timestamp of the input date in milliseconds (as type Number)
Waiting: 3. A request to /api/:date? with a valid date should return a JSON object with a utc key that is a string of the input date in the format: Thu, 01 Jan 1970 00:00:00 GMT
Waiting: 4. A request to /api/1451001600000 should return { unix: 1451001600000, utc: "Fri, 25 Dec 2015 00:00:00 GMT" }
Waiting: 5. Your project can handle dates that can be successfully parsed by new Date(date_string)
Waiting: 6. If the input date string is invalid, the API returns an object having the structure { error : "Invalid Date" }
Waiting: 7. An empty date parameter should return the current time in a JSON object with a unix key
Waiting: 8. An empty date parameter should return the current time in a JSON object with a utc key
*/