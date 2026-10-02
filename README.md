# GoSchool talks

Slide decks from GoSchool talks, served by GitHub Pages at
https://goschool-ai.github.io/talks/

Each talk is a self-contained folder: `index.html`, its `assets/`, and a PDF.

## Add or update a talk

```sh
scripts/publish.sh <deck.html> <slug> [deck.pdf]
```

The script copies the deck to `<slug>/index.html` together with every
`assets/...` file the deck references, and the PDF as `<slug>/<slug>.pdf`.
It does not commit or push. Add a line for a new talk to `index.html`,
then commit and push.

The decks are single-file HTML (1280×720). Arrow keys or space move through
the slides, `F` goes full screen.
