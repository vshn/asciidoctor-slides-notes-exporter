#!/bin/bash

if [ "$1" = "html" ]; then
    ruby /usr/local/bin/extract-notes.rb "$2" | asciidoctor - -o ./speaker-notes.html
elif [ "$1" = "pdf" ]; then
    ruby /usr/local/bin/extract-notes.rb "$2" | asciidoctor-pdf - -o ./speaker-notes.pdf
else
    ruby /usr/local/bin/extract-notes.rb "$1"
fi
