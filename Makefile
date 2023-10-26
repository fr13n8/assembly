AS=nasm
ASFLAGS=-f elf64
LD=ld

all: addiction hello_world print_args functions_use_case input_scan print_digits itoa sum_args

addiction: addiction.o
	$(LD) $< -o $@

hello_world: hello_world.o
	$(LD) $< -o $@

print_args: print_args.o
	$(LD) $< -o $@

input_scan: input_scan.o
	$(LD) $< -o $@

functions_use_case: functions_use_case.o
	$(LD) $< -o $@

print_digits: print_digits.o
	$(LD) $< -o $@

itoa: itoa.o
	$(LD) $< -o $@

sum_args: sum_args.o
	$(LD) $< -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $<

clean:
	rm -f *.o addiction hello_world print_args functions_use_case input_scan print_digits itoa sum_args

.PHONY: all clean
