; The text around `{{ ... }}` actions is parsed as YAML. Unlike `YAML [Go Template]`,
; which uses the built-in YAML language, this uses `werf YAML Body`: the same YAML
; grammar, plus Bash injection into werf shell stages.
((text) @injection.content
    (#set! injection.language "werf YAML Body")
    (#set! injection.combined))
