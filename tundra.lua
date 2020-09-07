local common = {
    Env = {
        CPPPATH = {
            "include",
            "D:/SDK/glfw-3.3.2.bin.WIN64/include"
        },
        LIBPATH = {
            "D:/SDK/glfw-3.3.2.bin.WIN64/lib-vc2019"
        },
        CXXOPTS = {
            "/std:c++17",
            {"/EHsc", Config = "*-msvc-*"},
            {"/Zi", Config = "*-msvc-debug"},
            {"/MDd"}
        },
        CPPDEFS = {
            {"_DEBUG", Config = "*-*-debug"},
            {"NDEBUG", Config = "*-*-release"},
            {
                "_CRT_SECURE_NO_WARNINGS",
                Config = "*-msvc-*"
            }
        },
        PROGOPTS = {
            {"/NODEFAULTLIB:LIBCMT"},
            {"/NODEFAULTLIB:MSVCRT"}
        }

    },
    ReplaceEnv = {}
}

Build {
    Units = function()
        local deluxe = Program {
            Name = "eengine3",
            SourceDir = "src",
            Sources = {"main.cpp", "glad/glad.c"},
            Libs = {
                "opengl32.lib",
                "glfw3.lib",
                "user32.lib",
                "Shell32.lib",
                "Gdi32.lib"
            }
        }
        Default(deluxe)
    end,

    Configs = {
        Config {
            Name = "win64-msvc",
            DefaultOnHost = "windows",
            Inherit = common,
            Tools = {
                {
                    "msvc-vs2019",
                    TargetArch = "x64"
                }
            }
        }
    }
}
