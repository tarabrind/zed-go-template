# Go Template (Embedded Languages)

Syntax highlighting for Go templates (`text/template` / `html/template`) where
the embedded (templated) language is selected by the file extension.

The text between `{{ ... }}` actions is highlighted using the appropriate
embedded language, chosen per file type:

| Language                     | File suffixes                                           | Embedded language |
| ---------------------------- | ------------------------------------------------------- | ----------------- |
| `YAML [Go Template]`         | `.yaml`/`.yml` + `.gotmpl`, `.tmpl`, `.tpl`             | YAML              |
| `Werf [Go Template]`         | `werf.yaml`, `werf.inc.yaml` (and the `.yml` spellings) | YAML + Bash       |
| `Shell Script [Go Template]` | `.sh`/`.bash` + `.gotmpl`, `.tmpl`, `.tpl`              | Bash              |
| `HTML [Go Template]`         | `.html`/`.htm` + `.gotmpl`, `.tmpl`, `.tpl`; `.gohtml`  | HTML              |

## Bash inside werf shell stages

`Werf [Go Template]` is a YAML template language with one addition: its YAML body
is handled by an internal language (`Werf YAML Body`, hidden from the language
picker) that injects Bash into werf shell stages:

```yaml
shell:
  beforeInstall:
    - apt-get update # highlighted as Bash
    - | # block scalars too
      apt-get install -y foo \
        bar
```

Only sequence items under `shell:` → `beforeInstall` / `install` /
`beforeSetup` / `setup` are treated as Bash. Lists such as `mount:`, `import:`
or `secrets:` stay plain YAML.

Other Go-templated YAML (`YAML [Go Template]`) is untouched by this and keeps
using Zed's built-in YAML language.

## Use as a Helm / werf alternative

The `YAML [Go Template]` and `Werf [Go Template]` languages work well for Helm
chart templates, `werf.yaml` / `werf.inc.yaml`, and other Go-templated YAML
files. If you don't need a Helm-specific language server, you can use this
extension instead of a dedicated Helm extension and additionally get correct
embedded highlighting for Shell and HTML templates from the same extension.

## Grammar

Uses the [`tree-sitter-go-template`](https://github.com/ngalaiko/tree-sitter-go-template)
grammar.

## License

[MIT](./LICENSE)
