# Replaces all whitespace between words in a file to hyphens
# https://stackoverflow.com/questions/1806868/linux-replacing-spaces-in-the-file-names
for file in *; do mv "$file" `echo $file | tr ' ' '-'` ; done
