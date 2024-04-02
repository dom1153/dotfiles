{...}: {
  ### set nvim's *commentstring* based on context
  ### useful for languages that embed other languages (e.g. html in js, a la react)
  plugins.ts-context-commentstring = {
    enable = true;
    disableAutoInitialization = false;
  };
}
