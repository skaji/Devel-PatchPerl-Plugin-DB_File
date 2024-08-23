# Devel-PatchPerl-Plugin-DB_File

Devel::PatchPerl plugin for perl 5.8.1 - 5.10.0

# Problem

On macos 14 and clang 15, we cannot build perl 5.8.1 - 5.10.0:

```
...
cc -c   -fno-common -DPERL_DARWIN -mmacosx-version-min=14.6 -fno-strict-aliasing -O3   -DVERSION=\"1.806\" -DXS_VERSION=\"1.806\"  "-I../.."   DB_File.c
DB_File.xs:971:34: error: incompatible function pointer types assigning to 'u_int32_t (*)(const void *, size_t)' (aka 'unsigned int (*)(const void *, unsigned long)') from 'int (const void *, size_t)' (aka 'int (const void *, unsigned long)') [-Wincompatible-function-pointer-types]
                info->db_HA_hash = hash_cb ;
                                 ^ ~~~~~~~
DB_File.xs:1014:36: error: incompatible function pointer types assigning to 'size_t (*)(const DBT *, const DBT *)' (aka 'unsigned long (*)(const DBT *, const DBT *)') from 'int (const DBT *, const DBT *)' [-Wincompatible-function-pointer-types]
                info->db_BT_prefix = btree_prefix ;
                                   ^ ~~~~~~~~~~~~
2 errors generated.
make[1]: *** [DB_File.o] Error 1
make: *** [lib/auto/DB_File/DB_File.bundle] Error 2
```

This plugin will fix this.

# Install

```console
❯ cpm install -g https://github.com/skaji/Devel-PatchPerl-Plugin-DB_File.git
```
