const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const lessonRoutes = require('./routes/lesson');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/lessons', lessonRoutes);

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('MongoDB connected');
    app.listen(process.env.PORT, () =>
      console.log(`Server running on port ${process.env.PORT}`)
    );
  })
  .catch((err) => console.error(err));
