const mongoose = require('mongoose');
if (process.env.NODE_ENV !== 'production') {
  require('dotenv').config();
}

const connectDB = async () => {
  var loginData = '';
  if (process.env.DB_USER && process.env.DB_PASSWORD) {
    loginData = process.env.DB_USER + ':' + process.env.DB_PASSWORD + '@';
  }
  try {
    mongoose.connect(`mongodb://${loginData}${DB_HOST}:${DB_PORT}/${DB_NAME}`, {
      useNewUrlParser: true,
      useCreateIndex: true,
      useUnifiedTopology: true,
      useFindAndModify: false,
    });
    console.log('MongoDB connected');
  } catch (err) {
    console.error(err.message);
    process.exit(1);
  }
};

module.exports = connectDB;
