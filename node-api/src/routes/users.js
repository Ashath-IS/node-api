import express from 'express';
import { db } from '../db.js';
import axios from 'axios';

const router = express.Router();

router.get('/fromDb', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM users');
    res.json({ users: rows });
  } catch (err) {
    console.error('Error fetching users:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.get('/', async (req, res) => {
  res.json({ message: 'Hello from node api server' });
});

router.get('/users', async (req, res)=> {
    const users = await axios.get('https://dummyjson.com/users')
    const result = await users.data.users
    res.json(result)
})

export default router;
