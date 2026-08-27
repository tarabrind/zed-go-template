; The text around `{{ ... }}` actions is parsed as HTML.
((text) @injection.content
    (#set! injection.language "html")
    (#set! injection.combined))
