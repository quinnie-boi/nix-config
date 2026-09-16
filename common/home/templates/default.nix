{
  home.file = {
    "Templates/flake.nix" = {
      source = ./flake.txt;
    };
    "Templates/shell.nix" = {
      source = ./shell.txt;
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
    "Templates/.envrc" = {
      source = ./envrc.txt;
    };
    "Templates/Typst.typ" = {
      source = ./empty.txt;
    };
  };
}
