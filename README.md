# Go Template (Embedded Languages)

Syntax highlighting for Go templates (`text/template` / `html/template`) where
the embedded (templated) language is selected by the file extension.

The text between `{{ ... }}` actions is highlighted using the appropriate
embedded language, chosen per file type:

| Language                     | File suffixes                                                       | Embedded language |
| ---------------------------- | ------------------------------------------------------------------- | ----------------- |
| `YAML [Go Template]`         | `.yaml.tmpl`, `.yml.tmpl`, `.yaml.tpl`, `.yml.tpl`, `werf.inc.yaml` | YAML              |
| `Shell Script [Go Template]` | `.sh.gotmpl`, `.bash.gotmpl`, `.sh.tpl`, `.bash.tpl`                | Bash              |
| `HTML [Go Template]`         | `.html.gotmpl`, `.htm.gotmpl`, `.html.tmpl`, `.html.tpl`, `.gohtml` | HTML              |

## Use as a Helm / werf alternative

The `YAML [Go Template]` language works well for Helm chart templates, `werf.yaml` /
`werf.inc.yaml`, and other Go-templated YAML files. If you don't need a
Helm-specific language server, you can use this extension instead of a dedicated
Helm extension and additionally get correct embedded highlighting for Shell and
HTML templates from the same extension.

## Grammar

Uses the [`tree-sitter-go-template`](https://github.com/ngalaiko/tree-sitter-go-template)
grammar.

## License

[MIT](./LICENSE)
