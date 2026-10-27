# GoTmpl Embedded Languages

Syntax highlighting for Go templates (`text/template` / `html/template`) where
the embedded (templated) language is selected by the file extension.

The text between `{{ ... }}` actions is highlighted using the appropriate
embedded language, chosen per file type:

| Language        | File suffixes                                           | Embedded language |
| --------------- | ------------------------------------------------------- | ----------------- |
| `GoTmpl-YAML`   | `.yaml`/`.yml` + `.gotmpl`, `.tmpl`, `.tpl`             | YAML              |
| `GoTmpl-Werf`   | `werf.yaml`, `werf.inc.yaml` (and the `.yml` spellings) | YAML + Bash       |
| `GoTmpl-Shell`  | `.sh`/`.bash` + `.gotmpl`, `.tmpl`, `.tpl`              | Bash              |
| `GoTmpl-HTML`   | `.html`/`.htm` + `.gotmpl`, `.tmpl`, `.tpl`; `.gohtml`  | HTML              |

The language name doubles as the info string for markdown fenced code blocks
(matched case-insensitively), so a snippet inside markdown gets the same
highlighting as a real file:

````markdown
```gotmpl-werf
image: {{ .ModuleName }}/cilium-envoy
from: {{ index $.Images "base/distroless-fin" }}
```
````

## Bash inside werf shell stages

`GoTmpl-Werf` is a YAML template language with one addition: its YAML body is
handled by an internal language (`GoTmpl-Werf-Body`, hidden from the language
picker) that injects Bash into werf shell stages:

```yaml
shell:
  beforeInstall:
    - apt-get update # highlighted as Bash
    - | # block scalars too
      apt-get install -y foo \
        bar
```

Only sequence items under a shell stage key (`beforeInstall`, `install`,
`beforeSetup`, `setup`) are treated as Bash. Lists such as `mount:`, `import:`
or `secrets:` stay plain YAML.

Other Go-templated YAML (`GoTmpl-YAML`) is untouched by this and keeps
using Zed's built-in YAML language.

## Use as a Helm / werf alternative

The `GoTmpl-YAML` and `GoTmpl-Werf` languages work well for Helm
chart templates, `werf.yaml` / `werf.inc.yaml`, and other Go-templated YAML
files. If you don't need a Helm-specific language server, you can use this
extension instead of a dedicated Helm extension and additionally get correct
embedded highlighting for Shell and HTML templates from the same extension.

## Grammar

Uses the [`tree-sitter-go-template`](https://github.com/ngalaiko/tree-sitter-go-template)
grammar.

## License

[MIT](./LICENSE)
