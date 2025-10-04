export default {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: /youtube\.com/,
      browser: "YouTube"
    },
    {
      match: /youtu\.be/,
      browser: "YouTube"
    },
    {
      match: /google\.com/,
      browser: "Chromium"
    }
  ]
};
