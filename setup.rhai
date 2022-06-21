// we can see existing variables.
// note that template and rhai variables are separate.

let crate_type = variable::get("crate_type");
debug(`crate_type: ${crate_type}`);

let license = variable::get("license").to_upper();

//"APACHE", "MIT", "BSD", "GPL", "LGPL", "MOZILLA", "PUBLIC"
while switch license {
    "APACHE" => {
        // https://apache.org/licenses/LICENSE-2.0.txt
        file::rename("licenses/apache.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    "MIT" => {
        // https://mit-license.org/
        file::rename("licenses/mit.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    "BSD3" => {
        // https://opensource.org/licenses/BSD-3-Clause
        file::rename("licenses/bsd3.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    "BSD2" => {
        // https://opensource.org/licenses/BSD-2-Clause
        file::rename("licenses/bsd2.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    "GPL" => {
        // https://www.gnu.org/licenses/gpl-3.0.txt
        file::rename("licenses/gpl.liquid", "LICENSE");
        file::delete("licenses");
        false
    } 
    "LGPL" => {
        // https://www.gnu.org/licenses/lgpl-3.0.txt
        file::rename("licenses/lgpl.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    "MOZILLA" => {
        // https://www.mozilla.org/media/MPL/2.0/index.48a3fe23ed13.txt
        file::rename("licenses/mozilla.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    "PUBLIC" => {
        // https://unlicense.org/UNLICENSE
        file::rename("licenses/unlicense.liquid", "LICENSE");
        file::delete("licenses");
        false
    }
    _ => true,
} {
    license = variable::prompt("Select license?", "MIT", [
        "APACHE", 
        "MIT", 
        "BSD3",
        "BSD2",
        "GPL", 
        "LGPL", 
        "MOZILLA",
        "PUBLIC",
    ]);
}

variable::set("license", license);