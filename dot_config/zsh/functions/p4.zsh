# we don't have p4 installed, but we can make a function!
function p4() {
  if [[ $1 == 'add' || $1 == 'edit' ]]; then
    echo "=== ALIAS: You blithering bumpkin! Try 'git add' next time!";
    shift;
    git add $@;
  elif [[ $1 == 'opened' || $1 == 'status' ]]; then
    echo "=== ALIAS: You disreputable dunce! Try 'git status' next time!"; 
    shift;
    git status $@;
  elif [[ $1 == 'revert' || $1 == 'reset' ]]; then
    echo "=== ALIAS: You gigantic goose! Try 'git reset' next time!"; 
    shift;
    git reset $@;
  elif [[ $1 == 'del' ]]; then
    echo "=== ALIAS: You jabbering junkie! Try 'git rm -r' next time!"; 
    shift;
    git rm -r $@;
  elif [[ $1 == 'help' ]]; then
    echo "=== ALIAS: You pathetic pipsqueak! Try git checkout, merge, or push/pull"; 
  fi
}


#Face me, you addled amateur!
#Face me, you cowardly clum!
#Face me, you egomaniacal elekk!
#Face me, you inept ingrate!
#Face me, you meddling moron!
#Face me, you overgrown oaf!
#Face me, you ridiculous rustbucket!
#Face me, you tilted tyrant!
#Face me, you vapid vermin!
#You blithering bumpkin!
#You disreputable dunce!
#You gigantic goose!
#You jabbering junkie!
#You noxious ninny!
#You pathetic pipsqueak!
#You silly sloth!
#You ungrateful underling!
#You wretched wretch!
