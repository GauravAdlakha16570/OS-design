.text
	.globl uthread_switch
uthread_switch:
	/* Save all register to curr->stack*/
	pushal

	/* Save curr->sp */
	movl curr_t, %eax
	movl %esp, (%eax)

	/* Switch to next_t stack */
	movl next_t, %eax
	movl (%eax), %esp

	/* Set curr_t to next_t */
	movl %eax, curr_t

	/* Restore next_thread's register state */
	popal

	/* Set next_thread to 0 */
	movl $0, next_t

	/* After `popal`, %esp now points to return address. Pop it and jump. */
	ret