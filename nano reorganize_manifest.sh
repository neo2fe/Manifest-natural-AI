#!/bin/bash

# Reorganizace jazykových souborů Manifestu

# Přejmenování nesprávných složek (jen pokud existují)
[ -d "UA" ] && git mv UA uk
[ -d "JP" ] && git mv JP ja

# Vytvoření složek, pokud ještě neexistují
for code in cz en de es fr it ja pt pl uk ru; do
  mkdir -p "$code"
done

# Přesun souborů do správných složek
mv cz*Manifest.md cz/Manifest.md 2>/dev/null
mv en*Manifest.md en/Manifest.md 2>/dev/null
mv de*Manifest.md de/Manifest.md 2>/dev/null
mv es*Manifesto.md es/Manifiesto.md 2>/dev/null
mv fr*Manifeste.md fr/Manifeste.md 2>/dev/null
mv it*Manifesto.md it/Manifesto.md 2>/dev/null
mv ja*マニフェスト.md ja/マニフェスト.md 2>/dev/null
mv pt*Manifesto.md pt/Manifesto.md 2>/dev/null
mv pl*Manifest.md pl/Manifest.md 2>/dev/null
mv uk*Маніфест.md uk/Маніфест.md 2>/dev/null
mv ru*Манифест.md ru/Манифест.md 2>/dev/null

# Přesun README a LICENSE do kořene (pokud nejsou tam)
[ -f Manifest-natural-intelligence_README.md ] && mv Manifest-natural-intelligence_README.md README.md
[ -f LICENSE ] || echo "CC BY-SA 4.0" > LICENSE

# Přidání translations.txt (uprav dle potřeby)
cat > translations.txt <<EOF
Manifest Natural Intelligence — Language Versions
--------------------------------------------------

cz/Manifest.md       → čeština (originál)
en/Manifest.md       → angličtina
de/Manifest.md       → němčina
es/Manifiesto.md     → španělština
fr/Manifeste.md      → francouzština
it/Manifesto.md      → italština
ja/マニフェスト.md     → japonština
pt/Manifesto.md      → portugalština
pl/Manifest.md       → polština
uk/Маніфест.md       → ukrajinština
ru/Манифест.md       → ruština
EOF

echo "✅ Reorganizace dokončena. Připraveno k pushnutí na GitHub."
