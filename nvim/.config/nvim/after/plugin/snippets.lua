local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt

local newline = function(text)
  return t { "", text }
end

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets("all", {
  s("wish", {
    t("Wish upon a star."),
  })
})

ls.add_snippets("css", {
    s("reset", fmt([[
/* Box sizing rules */
*,
*::before,
*::after {{
  box-sizing: border-box;
}}

/* Remove default margin */
body,
h1,
h2,
h3,
h4,
p,
figure,
blockquote,
dl,
dd {{
  margin: 0;
}}

/* Remove list styles on ul, ol elements with a list role, which suggests default styling will be removed */
ul[role='list'],
ol[role='list'] {{
  list-style: none;
}}

/* Set core root defaults */
html:focus-within {{
  scroll-behavior: smooth;
}}

/* Set core body defaults */
body {{
  min-height: 100vh;
  text-rendering: optimizeSpeed;
  line-height: 1.5;
}}

/* A elements that don't have a class get default styles */
a:not([class]) {{
  text-decoration-skip-ink: auto;
}}

/* Make images easier to work with */
img,
picture {{
  max-width: 100%;
  display: block;
}}

/* Inherit fonts for inputs and buttons */
input,
button,
textarea,
select {{
  font: inherit;
}}

/* Remove all animations, transitions and smooth scroll for people that prefer not to see them */
@media (prefers-reduced-motion: reduce) {{
  html:focus-within {{
   scroll-behavior: auto;
  }}
  
  *,
  *::before,
  *::after {{
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }}
}}
        ]], {})
    ),
  s("novel", {
    t("This is a novel test to see if this works"),
  }),
}, {
  key = "css"
})

require("luasnip/loaders/from_vscode").lazy_load()
