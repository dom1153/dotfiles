{...}: {
  # Use treesitter to autoclose and autorename html tag
  # It works with:
  #   astro, glimmer, handlebars, html, javascript, jsx,
  #   markdown, php, rescript, svelte, tsx, typescript, vue, xml
  plugins.ts-autotag = {
    enable = true;
  };
}
