; Sequence items under a werf shell stage are Bash commands.
;
;   shell:
;     beforeInstall:
;     - apt-get update            <- (flow_node)
;     - |                         <- (block_scalar)
;       apt-get install -y foo \
;         bar
;
; The `shell:` parent is deliberately not part of the pattern. Anchoring on it
; would require the whole six-level chain to parse cleanly, so a single ERROR
; node above the stage key silently drops every Bash injection in the file --
; which happens routinely while the file is being edited. Matching the stage key
; alone needs only one intact level. The stage names are specific enough that
; they do not appear outside `shell:` in a werf config.
;
; Sequences elsewhere (`mount:`, `import:`, `secrets:`) stay plain YAML.

; Single-line commands.
(block_mapping_pair
  key: (flow_node) @_stage
  value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node) @injection.content)))
  (#match? @_stage "^(beforeInstall|install|beforeSetup|setup)$")
  (#set! injection.language "bash"))

; Multi-line commands: `- |`, `- |-`, `- >` and so on.
(block_mapping_pair
  key: (flow_node) @_stage
  value: (block_node
    (block_sequence
      (block_sequence_item
        (block_node
          (block_scalar) @injection.content))))
  (#match? @_stage "^(beforeInstall|install|beforeSetup|setup)$")
  (#set! injection.language "bash"))
