; Sequence items under a werf shell stage are Bash commands.
;
;   shell:
;     beforeInstall:
;     - apt-get update            <- (flow_node)
;     - |                         <- (block_scalar)
;       apt-get install -y foo \
;         bar
;
; Sequences elsewhere (`mount:`, `import:`, `secrets:`) stay plain YAML.

; Single-line commands.
(block_mapping_pair
  key: (flow_node) @_shell
  value: (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_stage
        value: (block_node
          (block_sequence
            (block_sequence_item
              (flow_node) @injection.content))))))
  (#eq? @_shell "shell")
  (#match? @_stage "^(beforeInstall|install|beforeSetup|setup)$")
  (#set! injection.language "bash"))

; Multi-line commands: `- |`, `- |-`, `- >` and so on.
(block_mapping_pair
  key: (flow_node) @_shell
  value: (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_stage
        value: (block_node
          (block_sequence
            (block_sequence_item
              (block_node
                (block_scalar) @injection.content)))))))
  (#eq? @_shell "shell")
  (#match? @_stage "^(beforeInstall|install|beforeSetup|setup)$")
  (#set! injection.language "bash"))
