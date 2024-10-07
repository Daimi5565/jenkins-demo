const express = require('express');
const app = express();
const port = 8081;  // Change port to 8081

app.get('/', (req, res) => {
  res.send('Hello, Jenkins! Running on port 8081');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
