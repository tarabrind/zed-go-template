; The text around `{{ ... }}` actions is parsed as Bash.
((text) @injection.content
    (#set! injection.language "bash")
    (#set! injection.combined))
