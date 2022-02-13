add_rules("mode.debug", "mode.release")

target("./lpc_led.elf")
    set_kind("binary")

    set_languages("c99")

    set_policy("check.auto_ignore_flags", false)

    add_cflags("-mcpu=cortex-m0", "-mthumb","-std=gnu99")
    add_cflags("-Wall", "-fstack-usage", "--specs=nano.specs", "-mfloat-abi=soft", "-ffunction-sections", "-fdata-sections")
    add_cflags("-nostartfiles", "-nostdlib")

    add_ldflags("-mcpu=cortex-m0", "-mthumb")
    add_ldflags("-T lpc_debug.ld", "-specs=nosys.specs")
    add_ldflags("-Wl,-Map=build/cross/arm/debug/lpc_led.map")
    add_ldflags("-Wl,--gc-sections")
    add_ldflags("-static", "-specs=nano.specs", "-mfloat-abi=soft", "-Wl,--start-group -lc -lm -Wl,--end-group")

    add_asflags("-mcpu=cortex-m0", "-mthumb")

    -- add_links("c_nano")
    add_linkdirs("/Softwares/Compilers/gcc-arm-none-eabi-10.3-2021.10/arm-none-eabi/lib/")

    add_files("*.c")
    add_files("main/*.c")
    add_files("drivers/src/*.c")
    add_files("Core/Device/NXP/LPC11xx/Source/Templates/*.c")

    add_includedirs("Core/CMSIS/Include")
    add_includedirs("Core/Device/NXP/LPC11xx/Include")
    add_includedirs("drivers/inc")
    add_includedirs("main")

    -- 生成hex与bin文件
    -- arm-none-eabi-objcopy -v -O ihx lpc_led.elf lpc_led.hex
    -- arm-none-eabi-objcopy -v -O binary lpc_led.elf lpc_led.bin

    -- 输出内存大小信息
    -- arm--none-eabi-size lpc_led.elf

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

