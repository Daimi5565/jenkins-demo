const express = require('express');
const app = express();
const port = 8081;  // Change port to 8081

app.get('/', (req, res) => {
  res.send('Hello, Jenkins! Running on port 8081');
});

// Change this line:
app.listen(port, '0.0.0.0', () => {
  console.log(`App listening at http://0.0.0.0:${port}`);
});
