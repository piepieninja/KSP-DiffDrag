

// Specifies the desired drop 
function print_corner {
  parameter mode.
  parameter text.

  local row is 0.
  local col is 0.

  if mode = 2 or mode = 4 {
    set col to terminal:width - text:length.
  }.
  if mode = 3 or mode = 4 {
    set row to terminal:height - 1.
  }.

  print text at (col, row).
}.
