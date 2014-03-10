Flos LaTeX-Template für Arbeiten in den Geisteswissenschaften
=============================================================

[**Demo-PDF** - so sieht die derzeitige Vorlage kompiliert aus.](https://github.com/hacklschorsch/Flos_LaTex_Template_fuer_Geisteswissenschaften/raw/master/thesis.pdf)

Ich hab meiner Freundin geholfen ihre Abschlussarbeit in LaTeX zu verfassen.
Die Arbeit ist abgegeben und sieht IMHO ganz gut aus. Ich hoffe, dass ich sie bald hier verlinken kann.

Weil ich damals zu lange nach einer modernen LaTeX-Vorlage gesucht habe die

  * Unicode überall kann (auch in der Bibliographie)
  * Zitate nach APA-Style unterstützt (und das mit ordentlichen Zeilenumbrüchen)
  * Bissel schöne Typographie hat out-of-the-box

habe ich mir vorgenommen, selber ein Template zu veröffentlichen, wenn die Arbeit abgeschlossen ist.
Letztendlich sind wir bei BibLaTeX mit APAcite gelandet um die Zitate "richtig" machen zu können; BibLaTex ist überhaupt super. Ein mit wenigen eigenen Optionen genutztes Koma-Script erledigt das mit der schönen Typographie, zusammen mit ein paar frei verfügbaren, eleganten Schriften (Garamond & Optima).

Die Abschlussarbeit wurde auf einem Laptop mit Windows XP und MikTex verfasst. MikTex sollte alle Pakete, die benötigt werden, selbst installieren können beim ersten Kompilieren. Evtl. gibt's Probleme mit den Schriftarten. Der Quellcode enthält einen Link, der die Installation der Schriften Garamond und Optima beschreibt (siehe thesis.tex).

Das "makefile" make.bat sollte auch unter unix-artigen Betriebssystemen laufen, wenn man es aufruft wie
> sh make.bat

Über Verbesserungsvorschläge -- oder noch besser, Patches oder gleich Pull-Requests -- freue ich mich sehr.

