export default {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: /youtube\.com/,
      browser: "YouTube Wrapper"
    },
    {
      match: /youtu\.be/,
      browser: "YouTube Wrapper"
    },
    {
      match: /google\.com/,
      browser: "Chromium"
    }
  ]
};
