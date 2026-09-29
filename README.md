# CookSmart — Privacy Policy

The published privacy policy for the CookSmart Android app, hosted with GitHub
Pages.

`index.html` is the single file that gets served. It is deliberately
self-contained: no scripts, no cookies, no fonts, no images and no outbound
links, so hosting it introduces no tracking and no third-party data processing.

## Editing it

The master copy lives with the app source at `cooksmart/privacy.html`, with
`cooksmart/PRIVACY.md` as the plain-text version. The in-app Privacy screen shows
the same text. When the policy changes, update all three so they stay in step.

To regenerate this folder from the app source:

```bash
cp cooksmart/privacy.html privacy-site/index.html
```

To check the page before publishing:

```bash
node cooksmart/tools/privacy/preview.js
```

That renders the file in a real browser, reports any external references, and
writes a full-page screenshot to `cooksmart/store/privacy-page-preview.png`.
