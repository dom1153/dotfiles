scriptfldr="$HOME/fav/personal-rc-files/scripts"
if [ -d $scriptfldr ]; then
#   ### TODO: add package flows (react, vite, tailwind, etc)
#   ### cp more scripts for debug, install, run
#   ### that... and an empty vite project
#   ### have run.csh check for node_modules , else npm install

  function createViteReact() {
    if [ -z "$1" ]; then
      echo "createViteReact: Please supply a project (folder) name"
    elif [ -d "$1" ]; then
      echo "createViteReact: Folder '$1' already exists"
    else
      ### npm init vite $1 -y
      ### vite v4.2.0 😎 react 18.2.0
      mkdir -p $1
      cd $1
      cp -r $scriptfldr/node/viteReactTemplate/* .
      cp -r $scriptfldr/node/viteReactTemplate/.gitignore .
      mkdir -p public
      echo "Project folder '$1' created (also now in directory)'"
    fi
  }
fi