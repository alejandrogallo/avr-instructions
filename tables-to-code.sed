#!/bin/sed -f

:start
/^$/{
  n
  /|/ {
    s/.*/```\n&/
    :test-if-finished
    n
    /^$/ {
      s/.*/```/
      b start
    }
    b test-if-finished
  }
}
