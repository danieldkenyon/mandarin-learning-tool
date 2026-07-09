# 汉语 · Mandarin Learning Tool

A self-contained web app for learning Mandarin Chinese. No build step, no dependencies — just one HTML file.

## Features

- **Daily lessons** — the whole vocab pool (100 HSK-1-level words) becomes a day-by-day curriculum: 5 new words per day for 20 days, then automatic review days. Each day has 4 tasks — study the words, pass a mini-quiz (80%+), pronounce 3 words at 60%+, and type the pinyin (with tones) for 3 words. A new day unlocks each calendar day, and you can set your **exam date** for a countdown.
- **Speaking practice with grading** — tap 🎤 Record & grade: your voice is recorded (replayable, so you can compare with the native audio) while the browser's Chinese speech recognizer (`SpeechRecognition`, `zh-CN`) transcribes you. Your attempt is scored against the target characters with per-character right/wrong highlighting and a best-score history per word. Chrome/Edge recommended; needs mic + internet.
- **Pinyin typing** — see the characters, type the pinyin with tone numbers (你好 → `ni3 hao3`; neutral tone = 5 or 0, `v` = ü). Right sounds + right tones = 100%, right sounds but wrong/missing tones = 50%.
- **Lessons** — 10 topic decks (Greetings, Numbers, Family, Food & Drink, Days & Time, Useful Phrases, Pronouns, Verbs, Adjectives, Places) with Hanzi, Pinyin and English.
- **Pinyin with tone colors** — each syllable is colored by its tone (red = 1st, teal = 2nd, blue = 3rd, purple = 4th, grey = neutral).
- **Pronunciation** — tap 🔊 on any word to hear it spoken via your browser's Web Speech API (best in Chrome/Edge; Safari also works).
- **Flashcards** — shuffle any lesson into a flip-card deck.
- **Quiz** — 10-question multiple-choice, character → meaning, with audio.
- **Progress tracker** — words learned, lessons completed, daily lessons done, words pronounced at 80%+, pinyin typed at 100%, daily streak and best quiz score. Saved in your browser (`localStorage`), no account required.

> **Pronunciation grading note:** the recognizer transcribes what it hears into characters, so a wrong tone that changes the word will show up as a missed character — but it is not a strict per-tone grader. Treat scores as directional feedback and compare your recording against the 🔊 native audio for tone detail.

## Run it locally

It's a static site, so any static server works. Easiest with Python:

```bash
cd mandarin
python3 -m http.server 4599
```

Then open <http://localhost:4599>.

Or just double-click `index.html` to open it in your browser (audio and progress still work).

## Put it on GitHub + host it free (GitHub Pages)

1. Create a repo on GitHub (e.g. `mandarin-tool`).
2. From this folder:
   ```bash
   cd mandarin
   git init
   git add .
   git commit -m "Mandarin learning tool"
   git branch -M main
   git remote add origin https://github.com/<your-username>/mandarin-tool.git
   git push -u origin main
   ```
3. On GitHub: **Settings → Pages → Source: Deploy from a branch → main / root → Save**.
4. Your app goes live at `https://<your-username>.github.io/mandarin-tool/` in a minute or two.

> Note: this folder currently lives inside your existing "Workout Tracker" repo. If you'd rather keep the Mandarin tool as its own project, copy the `mandarin/` folder somewhere new and run the steps above there.

## Add your own vocabulary

All content lives in the `LESSONS` array near the top of the `<script>` in `index.html`. Each word is:

```js
{ hz: "你好", py: "nǐ hǎo", t: [3,3], en: "Hello" }
```

- `hz` — the characters
- `py` — Pinyin with tone marks (space-separated syllables color correctly)
- `t` — tone number per syllable, for coloring
- `en` — English meaning

Add a new object to any lesson's `words`, or add a whole new lesson object, and it shows up everywhere automatically.
