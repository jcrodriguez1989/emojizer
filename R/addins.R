  #' Addin function: Emojize active file.
  #'
  #' Apply `emojizer` to current open file.
  #'
  #' @importFrom rstudioapi getActiveDocumentContext modifyRange setCursorPosition
  #'
  emojize_active_file <- function() {
    # get context, get the code, optimize, and put the new code
    doc_context <- rstudioapi::getActiveDocumentContext()
    out <- emojizer(list(doc_context$contents))[[1]][[1]]
    rstudioapi::modifyRange(
      c(1, 1, length(doc_context$contents) + 1, 1),
      paste0(out, collapse = "\n"),
      id = doc_context$id
    )

    rstudioapi::setCursorPosition(doc_context$selection[[1]]$range)
  }
