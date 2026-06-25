; Scalar / leaf keys
(pair
  key: (string (string_content) @name)
  (#set! "kind" "Field")) @start

; Object values — nest children under key
(pair
  key: (string (string_content) @name)
  value: (object) @symbol
  (#set! "kind" "Class")) @start

; Array values — nest array contents under key
(pair
  key: (string (string_content) @name)
  value: (array) @symbol
  (#set! "kind" "Enum")) @start

; Objects inside arrays (no key name)
(array
  (object) @symbol
  (#set! "kind" "Class")) @start
