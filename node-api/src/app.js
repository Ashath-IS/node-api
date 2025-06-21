import express from 'express';
import usersRouter from './routes/users.js';
import cors from 'cors';

const app = express();
app.use(cors());
app.use(express.json());

app.use('/', usersRouter);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
