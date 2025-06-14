const express = require('express');
const router = express.Router();
const Lesson = require('../models/Lesson');

// GET all lessons
router.get('/', async (req, res) => {
  try {
    const lessons = await Lesson.find();
    res.json(lessons.map(l => l.title));
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// POST new lesson
router.post('/', async (req, res) => {
  const lesson = new Lesson({ title: req.body.title });
  try {
    const newLesson = await lesson.save();
    res.status(201).json(newLesson);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
