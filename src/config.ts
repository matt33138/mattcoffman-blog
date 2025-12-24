export const SITE = {
  website: "https://mattcoffman.com/",
  author: "Matt Coffman",
  profile: "https://mattcoffman.com/",
  desc: "Daily writing by Matt Coffman",
  title: "Matt Coffman",
  ogImage: "astropaper-og.jpg",
  lightAndDarkMode: true,
  postPerIndex: 4,
  postPerPage: 4,
  scheduledPostMargin: 15 * 60 * 1000,
  showArchives: true,
  showBackButton: true,
  editPost: {
    enabled: false,  // ← changed to false
    text: "Edit page",
    url: "https://github.com/matt33138/mattcoffman-blog/edit/main/",
  },
  dynamicOgImage: true,
  dir: "ltr",
  lang: "en",
  timezone: "America/Chicago",  // ← Nashville timezone
} as const;