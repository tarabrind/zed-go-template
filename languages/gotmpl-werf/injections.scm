; The text around `{{ ... }}` actions is parsed as YAML. Unlike `GoTmpl-YAML`,
; which uses the built-in YAML language, this uses `GoTmpl-Werf-Body`: the same
; YAML grammar, plus Bash injection into werf shell stages.
((text) @injection.content
    (#set! injection.language "GoTmpl-Werf-Body")
    (#set! injection.combined))
