githubsize() {
    rawdata=`echo $1 | sed -e 's/github.com/api\.github\.com\/repos/' | xargs curl -s`
    if [[ ! -z $(echo $rawdata | grep "Not Found") ]]; then 
        echo "URL not found"
    else 
        echo $rawdata | grep '.size' | sed -e 's/.*"size": //' | cut -d ',' -f 1 | numfmt --from-unit 1024 --to iec
    fi
}
