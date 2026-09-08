export default {
  defaultBrowser: "Vivaldi",
  handlers: [
    {
      match: /id\.getharvest\.com/,
      browser: "Firefox"
    },
    {
      match: /youtube\.com/,
      browser: "YouTube Wrapper"
    },
    {
      match: /youtu\.be/,
      browser: "YouTube Wrapper"
    },
    {
      match: /google\.com(?!\/url)/,
      browser: "Chromium"
    },
    {
      match: /127\.0\.0\.1:32400/,
      browser: "Plex"
    }
  ]
};
