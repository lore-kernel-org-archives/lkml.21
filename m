Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265879;
	b=U5pum9ZOSZYlVt4CWL4z60lNV/+QaU3U9MNv1sBNanU0mKm1DffCiGHWtPuPIEVtg+pg
	 OQz0tk4HlezgGHwI91unt9+1VSCz9mAzq4rX+DxN5ZKNaEGaxqG64y/mcyAoqynUaHpqM
	 rgHvrAgTq1mt16Of/0fPe0E6i6BfzVTMfr28JPhTlyD/t/M/K/or89Bsp3JSgrtalvVvF
	 HkRDbo3uvyJMwwrd5x++RI/6FDo6hzRupohHYoi/FxHZ8KvE7h/6RV9gPHqVw9j38JsiW
	 B+affdEK91lRU7pJEC1AFJ5TPzn/ZfFi2iMRUQr10zWf4a6qD1usGiO7WKF6+XO7mBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265879;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Stat-Signature:X-Spam-Status:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=NZMFEMyJfvP0H3TjnnlJ+bby/l27xyun9G0y3tSVPEY=;
	b=276cx87qdDeMTpMAJt6nlZC+tMRJYlC1Ku+hnKfXLe9MmpC5u671vIOHdqzbcO6jNOD0
	 nvBOo38zIYBb+fPjS6Wbpl0sERwubeSMwv5v5ToUAnD9j9Nhd2NclmHZEUW9DLmi02D7Q
	 /5MSM4WC6C600iULt9Ma2NjO2KHSi/RgN5UtFdVsB3JrULMelEHYSc5zAymUc8n7HmYpd
	 nOhDfGNgpMRN57QbOj9/sMoQDfx4hUda8BwWV/6KybC2kSkbNvv/zDPfhZXKwa4TQaFgK
	 zHGgWBfvSPUVcYPtBGdtmsBimj7qD+Z40NqQurRVOed6U2fpvZ5bo25uj484B1NunQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=egMhj66O;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65E606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B65E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=egMhj66O
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 4E67A1602C4;
	Sat, 21 Nov 2026 12:57:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id A7A152002C;
	Sat, 21 Nov 2026 12:57:46 +0000 (UTC)
Date: Sat, 21 Nov 2026 07:57:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, "Baek Kyu, Kim"
 <pocj8ur4in@gmail.com>, Breno Leitao <leitao@debian.org>, Brian Norris
 <briannorris@chromium.org>, Chaosheng Qu <chaosheng.qu.linux@gmail.com>,
 Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>, David
 Carlier <devnexen@gmail.com>, Jaewon Jung <jaewon8868@gmail.com>, Kyle Zeng
 <kylebot@openai.com>, Pengfei Li <ljdlns1987@gmail.com>, Vincent Donnefort
 <vdonnefort@google.com>, Vineet Gupta <vineet.gupta@linux.dev>, Wenwu Hou
 <hwenwur@gmail.com>
Subject: [GIT PULL] tracing: Fixes for v7.4
Message-ID: <20261121075739.3ad033bf@fedora>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9zzpotgmjcbdnuubhcq4auw5dai3m57o
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: A7A152002C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Yh6KY+MU+1Ij3xYbhyHdFMGKF7uqIXHw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=NZMFEMyJfvP0H3TjnnlJ+bby/l27xyun9G0y3tSVPEY=; b=egMhj66OVhcP5ElOVrDoVdnYtTyKiCBrYwV/ANJ+dUk229gmAjaK0s+VpW+sJxZeCr4pyHRF1ITeewrB4OdsVCafYpY3OwE9vOWeHoS9cmQCQneYf4HicDv1NoDauaXTP4ipzjdqd6jYymgPwIB2lM4rYB4iwtaq5NYhroq56Ik=
X-HE-Tag: 1795265866-306453
X-HE-Meta: U2FsdGVkX1+rEeh/OA0JaepcyIseIrdrK5RRTNGCgAPn0wDP7wr42ILnVCbAmeJJt1OyafCsRlAKlhbbpfsThWMlmRTMT6B5pOiUfrB4DGwahSQp8J+0RF9Zve7fiH5QpTiZ+wuFqCD5N+V92DXDtkHvArEFy0Gona4hR//DU9M7qgmGA6h16Nk8X+2IP8L2Nws5fdEOXO3bDFx0IofnK5td0W5UnURPVsaC8yHYEHKN9Yf7leGsYNg+YLlkWwAUgeLUBP5djSK01OXtczHdHk8GI5IYnawDj7eL7rulrkSx4Zq7QE1bF54XJYi+SGs3Lsv1ndsmya1pnYga8eMqRwAf34zWhlWi


Linus,

tracing fixes for v7.4:

- Do not WARN when trace_rb_cpu_prepare() fails to allocate on CPU startup

  The per CPU ring buffers are allocated when a new CPU comes online. If the
  system is under memory pressure it shouldn't trigger a WARN_ON if the
  buffer fails to allocate. Switch the WARN to a pr_warn() message.

- Copy trace_marker to all instances even if one fails

  Each instance can set a flag that it wants what is written into the
  trace_marker file to be copied to its ring buffer. Currently, if one of
  the instances has tracing disabled, the copy will fail. The loop that
  copies to each ring buffer detects this failure and stops copying to the
  rest of the instances. This is not what is expected as the copy should be
  tried to all instances even if it fails on one.

- Prevent perf from using filter logic to read kernel memory

  Perf can use filtering on addresses supplied by user space system calls to
  look at kernel address space and depending on the result of the filter
  determine what was in that address. Prevent perf from this type of filter.

- Fix filter logic on zero length dynamic strings

  The string filter match expects the length passed to it to include the nul
  terminating byte. Dynamic strings may be zero in length and have no nul
  byte. Have the filter logic for this strings pass in an empty string ("")
  instead.

- Fix boot filtering on common fields of events

  The common fields (like the CPU or PID of the event) are initialized after
  boot filtering is processed. This prevents boot filters from using them.
  Initialized the common fields before processing the boot filters.

- Fix ref counting of synthetic events

  When an instance is removed, it calls clear_event_triggers() on its
  events. This function does not properly release the synthetic event ref
  counters keeping them "busy" indefinitely. Fix the function to properly
  release the reference of the synthetic events they contain.

- Reject the size of zero for histograms

  Make it an error if the user tries to create a histogram of size zero. Not
  only does it not make sense, it is invalid to call to roundup_pow_of_two()
  as it is undefined.

- Fix tail matching of filtering fixed size strings

  The filtering of the end of string (*end) does not work properly for fixed
  sized string fields. This is because it matches the end of the fixed size
  and not the string itself. That is, if a fixed string field of 16 bytes
  has "abcd" and the match is to be "cd" the compare is done to the last
  three bytes of the 16 (including '\0'), which will likely not be the "cd".

- Fix the filter match of not-equal for out of range CPU masks.

  When a compare of a cpumask is out of range, the test returns nr_cpus and
  the match function will return zero (not matched) on that. But if the
  filter has a negative value (!=) then it should be a match. Fix this by
  returning "pred->op == OP_NE" which would return true if it should be a
  negative match and false otherwise.

- Fix out-of-bounds read in unfinished filter match

  If the filter passed in is "ip ==" without a value after the conditional,
  the parsing logic will increment one passed the nul byte and read the
  memory after it, possibly reading out-of-bounds memory. Detect this case
  and return an error immediately.

- Fix false success when failing on filtering of system groups

  A filter may be placed on a system group where the filter is then applied
  to each event. This returns success if at least one event succeeds. But
  the logic in the loop of all events reset the failure condition at the end
  of each iteration meaning that it would always return success even if no
  event was successful at applying it. The only way it would fail is if the
  first event failed on a memory issue.

- Free created option descriptors on instance creation failure

  If an instance were to fail to be created after creating its options, it
  would then leak them. Clean them up on failure.

- Allocate shadow stacks inline when enabling function graph hooks

  The current method of allocating the shadow stacks used by function graph
  (and which is now the backend of kretprobes), allocates 32 stacks,
  iterates over all tasks under an RCU lock and adds the stacks to the tasks
  that do not have them yet. After it has depleted and assigned all 32
  stacks, it would break out of the loop, allocate another 32 stacks and
  repeat. Unfortunately, this meant that it would iterate all the tasks it
  had already assigned stacks to before assigning new stacks. For machines
  running 1000s of tasks, this would take an exponential time to complete.

  This logic was created when the loop of all tasks required more locking
  and allocating during the loop wasn't recommended. Instead, still allocate
  the 32 stacks outside the RCU atomic but only use them if the allocation
  of a stack with GFP_NOWAIT fails. This brings down the time to enable a
  kretprobe from over 200 seconds down to 0.92 seconds on a machine with
  400,000 tasks.

- Do not start kthread in timerlat user space mode

  Timerlat has a mode that you can assign a user space task to it. Normally
  the code would not start a kernel thread in this case, but if a CPU comes
  online, it does not check if its in user space mode and starts a kernel
  thread regardless. This triggers a WARN_ON on clean up as timerlat is not
  expecting to have a kernel thread running. Prevent kernel thread start up
  when a CPU comes on line while timerlat is in user space mode.

- Do not free user events when an event probe is attached to it

  Event probes can attach to any other event. User events are events created
  that can be controlled by user space. Event probes can attach to these
  events, but they currently do not add a reference to them when they do.
  This means that the user event can be destroyed leaving the event probe
  attached to a stale event which can cause a use-after-free bug.

  On destruction of the user event, return -EBUSY if there's a dynamic event
  attached to it. Also make it persistent so that the event can be destroyed
  once the last fd is closed for it.

- Synchronize the clearing of the copy marker flag

  The marker_copies link list contains all the instances that are to copy
  the trace_marker writes. When the flag is cleared, and the instance is
  removed from the list, wait an RCU synchronization, otherwise if the flag
  is set again, it can cause the same write to be written twice as the
  instance would be added to the end of the list and a current copy walk of
  the list would hit the same instance again.

- Use copy_from_user() and not __copy_from_user() when reading user addresses

  When a system call event reads the user space address (like reading the
  path string of an openat system call), it users __copy_from_user() which
  assumes the address has been verified. Use the copy_from_user() function
  instead to verify that the address is OK for user space to read. Note,
  this has no security concern as this data read is only visible by the
  tracing system which in turn is only visible by admins.

- Fix shadow stack marking of the function graph infrastructure

  An old implementation of the shadow stack set bit zero of the shadow stack
  frame to denote tail function calls. This is no longer the case and the
  setting of the bit can trigger a WARN_ON in some cases.

- Do not do a reader-page swap when head is on tail

  The remote ring buffer does not handle swapping the buffer when the head
  is on the tail page. Prevent it from happening.

- Fix race between reader and writer of remote ring buffer reader page

  When there's data in the buffer, the reader first checks the meta page
  counter and then reads the data on the page. But because the writer
  updates the content of the pages before updating the meta data, the reader
  receives NULL unexpectedly. Swap the checks around so that the reader
  still returns the data if there is some before checking the meta data.

  Also fix the data ordering of remote buffer page time accounting.

- Fix wrong unit used in hwlat tracer accounting

  The tr->max_latency stores nanoseconds (even though its updated from user
  space in microseconds, but its converted over). The hwlat tracer assumes
  that the tr->max_latency is in microseconds and updates it accordingly.
  This causes the output to user space to be off by 1000. Do all
  calculations in the hwlat in nanoseconds.

- Properly match filter strings that start with numbers

  The set_ftrace_fiter file can take numbers to set functions via an index
  into the file instead of having to search all tens of thousands of files
  for a match. This code is shared with the event filtering logic as well.
  But this caused some of the event filters to get confused by strings
  matching numbers and turning it into an index which did not apply to
  events.

  Have the function tracing handle indexes directly and remove that logic
  from the event filtering so that the indexing only affects the
  set_ftrace_filter file and nothing else.

- Protect the ring_buffer ioctl from concurrent readers

  The ring_buffer ioctl call that maps the ring buffer can race with
  concurrent readers. Have it take the trace_access_lock().

- Prevent user events from defining a system name

  Currently, user events is the one dynamic event that does not allow the
  API from defining its own system (all user events go into the
  "user_events" system). But nothing prevents the user from trying to create
  one. As systems are denoted with '/' to separate the system from the event
  name, the API simply takes the entire string (the '/' and all) as the
  event name and tries to create a file with it. This causes the tracefs
  file system to be corrupted.

  Have the system call fail with -EINVAL if '/' is used.

- Do not use si_mem_available() in early boot for ring_buffer allocation

  When allocating the ring buffer, the amount allocated is compared to the
  amount of memory available so that it doesn't allocate too much and cause
  a system failure. It uses si_mem_available() to get an approximate amount
  of memory it can allocate. On systems with CONFIG_DEFERRED_STRUCT_PAGE_INIT
  and on early boot up, the value returned by si_mem_available() is derived
  by NR_FREE_PAGES and can under report the amount of free memory. This
  makes it nearly impossible to allocate the ring buffer and do early boot
  tracing on these systems.

  For this case, use LONG_MAX as the maximum amount available. If it
  allocates too much and crashes the system, that's on the sysadmin that
  asked for too much memory for the ring buffer on the kernel command line.

- Add notrace to event functions that use function hooks

  A few options in the event code hooks into the ftrace function hook
  mechanism. These functions must be marked with notrace. When
  CONFIG_FUNCTION_SELF_TRACING is enabled, event functions can be traced by
  ftrace and because these functions are not marked as notrace when they are
  traced, it causes an infinite loop and the system triple faults. Normally
  this wasn't a problem because without the SELF_TRACING set, all files in
  the tracing directory are marked as notrace.

  Mark the individual functions that are used in the event code with ftrace
  as notrace so that the rest of the code can still be traced by ftrace.

- Ignore .function field modifier if the event is already a function event

  Perf can hook to the ftrace function event which is special and is marked
  as a "function" event where its fields can be filtered against function
  names. If the perf uses adds a filter to the ftrace event and adds the
  ".function" modifier (which converts the field to a function field to be
  searched with function names), the double conversion confuses the logic as
  the code for the ".function" does not work with function events (only
  normal events with unsigned long fields). This can end up with a NULL
  pointer dereference.

  If the ".function" modifier is used on a function event, simply ignore it,
  as the processing will work the same.


Please pull the latest trace-v7.4-rc3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.4-rc3

Tag SHA1: 1de700af938ed37450886b4f4708d945709b505b
Head SHA1: 56ce4ed6316cae9536ea891d6686b92f1d930c00


Amit Machhiwal (1):
      ring-buffer: Do not check si_mem_available() before deferred init completes

Baek Kyu, Kim (1):
      tracing: Free tracer resources on instance creation failure

Breno Leitao (1):
      fgraph: Do not mark index 0 in every shadow stack frame

Brian Norris (2):
      tracing: Properly match strings that start with numbers
      tracing: Add tests for globbing number-based strings

Chaosheng Qu (1):
      tracing/osnoise: Don't start a kthread in timerlat user-space mode

Christian Aurich Zanettini Martins (1):
      ring-buffer: Do not WARN when trace_rb_cpu_prepare() fails to allocate

David Carlier (4):
      tracing: Define common event fields before enabling boot events
      tracing: Drop the synthetic event ref when clearing hist triggers
      tracing/user_events: Don't free an event that a dynamic event still references
      tracing: Ignore .function on the function trace event

Jaewon Jung (2):
      tracing: Keep copying markers when one instance is stopped
      tracing: Avoid undefined shifts for zero histogram map size

Kyle Zeng (3):
      tracing: Restrict perf filters that read kernel strings
      tracing/filters: Treat zero-length dynamic strings as empty
      tracing: Validate user addresses in faultable buffer copies

Masami Hiramatsu (Google) (4):
      tracing/filters: Fix MATCH_END_ONLY regex matching for fixed-size strings
      tracing/filters: Handle out-of-range CPU for OP_NE in cpumask comparison
      tracing/filters: Check for missing operand after operator in parse_pred()
      tracing/filters: Fix false success return in process_system_preds()

Pengfei Li (1):
      tracing: Wait for marker writers when copy_trace_marker is cleared

Steven Rostedt (3):
      fgraph: Read the task->ret_stack with a smp_load_acquire()
      tracing: Do not allow user events to add a system name
      tracing: Add notrace to event functions that hook to ftrace

Vincent Donnefort (5):
      ring-buffer: Skip remote reader page swap when on tail
      ring-buffer: Check remote reader page commit before meta entries
      ring-buffer: Order remote page commit with data and timestamp
      ring-buffer: Increment pages_read on remote ring buffer page swap
      tracing: Take trace_access_lock() in tracing_buffers_ioctl()

Vineet Gupta (2):
      fgraph: Allocate shadow stacks inline with GFP_NOWAIT
      fgraph: Use scoped_guard() for the task list walk

Wenwu Hou (1):
      tracing/hwlat: Do the latency calculations in nanoseconds

----
 kernel/trace/fgraph.c                   |  59 +++++-----
 kernel/trace/ftrace.c                   |   3 +-
 kernel/trace/ring_buffer.c              |  60 +++++++---
 kernel/trace/simple_ring_buffer.c       |  26 +++-
 kernel/trace/trace.c                    |  45 ++++---
 kernel/trace/trace.h                    |   3 +-
 kernel/trace/trace_events.c             |   8 +-
 kernel/trace/trace_events_filter.c      | 203 +++++++++++++++++++++++++++-----
 kernel/trace/trace_events_filter_test.h |  12 +-
 kernel/trace/trace_events_hist.c        |  25 ++--
 kernel/trace/trace_events_trigger.c     |   2 +
 kernel/trace/trace_events_user.c        |  12 ++
 kernel/trace/trace_hwlat.c              |  41 ++++---
 kernel/trace/trace_osnoise.c            |   8 ++
 14 files changed, 375 insertions(+), 132 deletions(-)
---------------------------
