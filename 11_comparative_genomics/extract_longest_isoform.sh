#!/bin/bash
#SBATCH --job-name=extract_longest_isoform.sh
#SBATCH -o extract_longest_isoform.out
#SBATCH -e extract_longest_isoform.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=12 #Note: you are always allocated an even number of cpus
#SBATCH --mem=24G
#SBATCH --time=1-00:00:00

# Usage:
#   bash extract_longest_isoform.sh /path/to/fasta_folder

INDIR="$1"

if [[ -z "$INDIR" ]]; then
    echo "Usage: bash extract_longest_isoform.sh fasta_folder/"
    exit 1
fi

for fa in "$INDIR"/*.fa "$INDIR"/*.faa "$INDIR"/*.fasta
do
    [[ ! -e "$fa" ]] && continue   # skip if no file matches

    echo "Processing: $fa"

    base=$(basename "$fa")
    out="${fa%.fa}.longest.fa"
    out="${out%.faa}.longest.faa"
    out="${out%.fasta}.longest.fasta"

    awk '
    BEGIN {
        FS=" ";
    }
    /^>/ {
        # output previous record
        if (seq != "") {
            gene = header;
            sub(/\.t[0-9]+$/, "", gene);   # remove .t1 / .t2
            sub(/^>/, "", gene);

            if (length(seq) > length(best_seq[gene])) {
                best_seq[gene] = seq;
                best_header[gene] = header;
            }
        }
        header = $1;
        seq = "";
        next;
    }
    {
        seq = seq $0;
    }
    END {
        # last record
        gene = header;
        sub(/\.t[0-9]+$/, "", gene);
        sub(/^>/, "", gene);

        if (length(seq) > length(best_seq[gene])) {
            best_seq[gene] = seq;
            best_header[gene] = header;
        }

        # print
        for (g in best_seq) {
            print best_header[g];
            s = best_seq[g];
            # wrap 60 chars per line
            for (i=1; i<=length(s); i+=60) {
                print substr(s,i,60);
            }
        }
    }
    ' "$fa" > "$out"

    echo "Output -> $out"
done

echo "Done!"

