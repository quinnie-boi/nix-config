{
  home.file = {
    "Templates/flake.nix" = {
      source = ./flake.nix;
    };
    "Templates/Markdown.md" = {
      source = ./empty.txt;
    };

    "Templates/Plain Text.txt" = {
      source = ./empty.txt;
    };

    "Templates/Word Document.docx" = {
      source = ./docx.docx;
    };
    "Templates/Open Document.odt" = {
      source = ./odt.odt;
    };
    "Templates/Portable Document.pdf" = {
      source = ./pdf.pdf;
    };
    "Templates/Typst.typst" = {
      source = ./empty.txt;
    };
  };
}
