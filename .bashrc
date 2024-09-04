githubsize() {
    echo $1 | sed -e 's/github.com/api\.github\.com\/repos/' | xargs curl -s | grep '.size' | sed -e 's/.*"size": //' | cut -d ',' -f 1 | numfmt --from-unit 1024 --to iec
}
