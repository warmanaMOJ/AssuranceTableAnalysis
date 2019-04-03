# AssuranceTableAnalysis

Two scripts:

`convert.sh` runs through each of the `xlsx` files in a directory, extracts the "Assurance Table" sheet from the spreadsheet,
then converts it into a `csv` file.
There is no need to keep any particular order to the `csv` files; only have a distinct one for each spreadsheet.

`analysis.sh` runs through a set of `csv` files, looking for `OIDxx` entries. For each entry, simple analysis determines what
evidence is held, and with what level of confidence. The results are (simplistically) aggregated to get average values.
