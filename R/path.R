#' @title Show the path to the pprof executable.
#' @export
#' @description Defaults to the `PROFFER_PPROF_BIN` environment variable.
#'   Otherwise, it searches your Go lang installation for `pprof`.
#' @details See <https://github.com/r-prof/proffer#installation>
#'   for setup instructions.
#' @return Character, path to `pprof` it exists and `""` otherwise.
#' @examples
#' if (identical(Sys.getenv("PROFFER_EXAMPLES"), "true")) {
#' pprof_path()
#' }
pprof_path <- function() {
  pprof_env() %fl% pprof_sys()
}

pprof_env <- function() {
  pprof_env_new() %fl% pprof_env_old()
}

pprof_env_new <- function() {
  Sys.getenv("PROFFER_PPROF_BIN")
}

pprof_env_old <- function() {
  Sys.getenv("pprof_path")
}

pprof_sys <- function() {
  ifelse(file.exists(go_path()), pprof_sys_impl(), unname(Sys.which("pprof")))
}

pprof_sys_impl <- function() {
  paste0(file.path(go_path(), "bin", "pprof"), go_ext_sys())
}

go_path <- function() {
  ifelse(file.exists(go_bin_path()), go_path_impl(), "")
}

go_path_impl <- function() {
  system2(go_bin_path(), c("env", "GOPATH"), stdout = TRUE)
}

go_bin_path <- function() {
  go_bin_env() %fl% go_bin_sys()
}

go_bin_env <- function() {
  Sys.getenv("PROFFER_GO_BIN")
}

go_bin_sys <- function() {
  unname(Sys.which("go"))
}

go_ext_sys <- function() {
  ifelse(.Platform$OS.type == "windows", ".exe", "")
}

graphviz_path <- function() {
  graphviz_env() %fl% graphviz_sys()
}

graphviz_env <- function() {
  Sys.getenv("PROFFER_GRAPHVIZ_BIN")
}

graphviz_sys <- function() {
  unname(Sys.which("dot"))
}
