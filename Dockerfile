FROM asciidoctor/docker-asciidoctor:1.22.1

COPY extract-notes.rb /usr/local/bin/extract-notes.rb
COPY extract-notes.sh /usr/local/bin/extract-notes

ENTRYPOINT [ "extract-notes" ]
