motion-cbl-block-bug
====================
*UPDATE* This has been resolved! This repository stays here to be a working example now.

~~RubyMotion copy block bug~~

~~The code in ```app/app_delegate``` should work to setup a view query with a given lambda as a map proc but it fails with with.~~

~~```Assertion failed: (block_copy != NULL), function rb_vm_new_proc_from_c_block, file dispatcher.cpp, line 1492.```~~
