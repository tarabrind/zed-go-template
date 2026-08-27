; The text around `{{ ... }}` actions is parsed as YAML.
((text) @injection.content
    (#set! injection.language "yaml")
    (#set! injection.combined))
