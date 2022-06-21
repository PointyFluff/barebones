// getting unexpected results from cargo-generate --lib --git ...
// hoping this kludge works...

let crate_type = variable::get("crate_type");
debug(`crate_type = ${crate_type}`);

if crate_type == "bin" {
    debug(`deleting src/lib.rs`);
    file::delete("src/lib.rs");
} else if crate_type == "lib" {
    debug(`deleting src/main.rs`);
    file::delete("scr/main.rs");
}