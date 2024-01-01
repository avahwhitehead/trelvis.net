# Clean
Remove-Item -ErrorAction Ignore -Recurse -Force docs/
mkdir docs

# Compile Sass to CSS
npx sass .:docs/

# Compile Asciidoc to HTML
asciidoctor -a stylesheet=docs/styles.css -b html5 -D docs/ -R . *.adoc

# Include assets
Copy-Item -Recurse assets/ docs/

# Done
Write-Output ""
Write-Output "Done"