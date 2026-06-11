const express = require('express');

const app = express();

const PORT = 3000;

app.get('/', (req, res) => {

  res.json({

    message: 'Ultimate Cloud Platform Backend Running',

    status: 'success',

    timestamp: new Date(),

    platform: 'AWS EKS'
  });
});

app.get('/health', (req, res) => {

  res.status(200).send('OK');
});

app.listen(PORT, () => {

  console.log(`Backend running on port ${PORT}`);
});