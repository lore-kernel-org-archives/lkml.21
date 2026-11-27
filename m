Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804962;
	b=I9uf2RyEQ4qvbrVfE4iRnP79IRa5FM+OwMg1nl9/6NSEN6z3s8r9zi9vmnDwVBSeFIgG
	 G9Bfv37j6KbK1fEBAGGS5nNega6f/mgHW14hmdes3lxiISIm4wSEnhAD0JIuDdeH6clIJ
	 r7Q/kRc9shq/VdMA/Dlr8H4+tSfqIMNc1AKXaX+N3TSCfAxeLlKCKvZ8yGElT76U5qYzg
	 hGdT6/WuLnt0j5/INtNVCaWlfjmjQ6qneIghDkoCuvcMwOFixWB8PXGobkJ7ApHzESJdg
	 AhKhbFcreioKYACUJbH8eCqklLtYlrBBE0xb73iwlyd8W9PaBmT5FFF+J/fZmNhmqDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804962;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=0P+V4sNYqc0VZG4+bcbHubi4zAxo1/A9EQYf6Lm4dB4=;
	b=PmSlcUt+kLpzNKehQ41oRZd2qMFsBQcgSVHi0+Y1CFeOn9x1G/w/feq00Ba/mtKccWYR
	 IlYGG5l6HIlCG6x7g9zJ/luehU4EU+JCy47FsxEE0+G72GgK+TIA6p0/tvHwn8u1fe24P
	 k+jcQrfVvgElreyTrY5uq0smGLriWr10Qr3yI/iloXIjMiPrpv9zm9j8aKXuznDbkv041
	 ExtH7vRQz8BV0H5JbSXWVSzDOPKJGk6/3XMOdiDlm0uimT2HeXPnzy2NALPqoRrXtbjqE
	 WqrwBl8dIObS4fVuxkvmQOz4Kh8J1a15NbsrvCmjrcVnZSqnFG6FUwElqEPSP4JroMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTVBhNnw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9368606A682
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTVBhNnw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640361F0092B;
	Fri, 27 Nov 2026 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804962;
	bh=0P+V4sNYqc0VZG4+bcbHubi4zAxo1/A9EQYf6Lm4dB4=;
	h=Date:From:To:Cc:Subject;
	b=QTVBhNnwlRFbqO9NP8ETi0F0lX7+0s9gzvVGW8WftYnrCxy5Iq+p0cCAAIWnPj6p1
	 fyE8O9mi4Ouwz0t8zJP1V7vKQNT7dVT+0hAZ+PeTTPg01mYJ3D28ErcMJYlXgit/gM
	 v+/Mw3DOZEYPrr0JkOYYlzCbd40VTTlrL9B2YOVf/wC/ipddkSB+wbZ2GmKyaibgtJ
	 eqm9FJ2ptfAGZfeTjxM9KpjEMuGdJVXa1Pzov8fRQKDGONTm+i/Wu34Q3R94FAZcAo
	 Sb2o9IBjGv2eOMiHq0CMj0B2dKjXsEcGMnYrrcBxhXbxREg/WwGSGM6/3rvy8UbjUW
	 5yvUXikuDL8lg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xX0u9-000000085YD-2Cao;
	Fri, 27 Nov 2026 13:42:41 -0500
Message-ID: <20261127184203.439481361@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 27 Nov 2026 13:42:03 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Parri <parri.andrea@gmail.com>,
 Jeff Barnes <jeffbarnes@linux.microsoft.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Yifan Feng <evanfengff@gmail.com>
Subject: [for-linus][PATCH 0/5] tracing: Fixes for v7.4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


tracing fixes for v7.4:

- Fix user events on fork allocation failure

  User events are created by user tasks to be able to be traced within
  the kernel tracing facility. On fork, the duplication of user events
  can fail. If this happens the state of the event becomes stale,
  miss updates and produce undefined results.

  As user events are part of the set up of the program that uses them,
  fail a fork if the user event allocation fails for the new child.
  This only affects programs that set up user events for themselves.

- Fix a remote event alignemnt offset output

  The trace events for remote buffers does not take into account alignment
  constraints, and produces incorrect field offsets that cause failure in
  parsing the events from user space.

- Fix lost recursion records in recording ftrace functions that recurse

  There's a race in the logic that records ftrace functions that recurse
  where it checks if the last function that recursed is the same as the new
  one and if it is, it ignores the recursion. But the recording of that last
  function is done before the function is saved. If the saving fails due to
  a race, then if the same function is recursed again, it will be ignored as
  the code thinks it was recorded last time (but it wasn't).

- Reject '!!' at the beginning of input to set_ftrace_filter

  To remove a single function from the set_ftrace_filter file, the user
  echos "!func_name" into set_ftrace_filter and that function is removed
  from the list. The issue is that the parsing logic sees the '!', records
  it, removes it from the string and then continues the parsing with a "not"
  variable set. The later logic of the "not" code checks if the first
  character is a '!', and if it is, it triggers a WARN_ON() as it thinks the
  logic was broken.

  If the user echos in "!!func_name", the first '!' is removed and the not
  variable set, and the second '!' is processed making the code think there
  was a bug in the logic and triggers a WARN_ON().

  Simply have the code first check for "!!" at the start and return -EINVAL
  if that is found.

- Use atomic bitops and READ_ONCE() when processing flags variable

  KSCAN reported a data race on the trace_event flags variable.
  It is accessed in lockless mode during tracing and currently updated with
  simple "|" or "&" logic. This causes a read-modify-write race.
  Update the accesses to use bitops and READ_ONCE() to remove this race
  condition.


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 86020484c0cf36a72ab998274d051f9a14ff4f40


Andrea Parri (1):
      ftrace: Fix lost recursion records in ftrace_record_recursion()

Jeff Barnes (1):
      tracing/user_events: Fail fork when event state duplication fails

Masami Hiramatsu (Google) (1):
      tracing/filters: Use atomic bitops and READ_ONCE() for trace_event_file::flags

Vincent Donnefort (1):
      tracing/remotes: Align field offset in remote_event_format_show()

Yifan Feng (1):
      ftrace: Reject "!!" in front of a set_ftrace_filter command

----
 include/linux/trace_events.h          |  2 +-
 include/linux/user_events.h           | 16 +++++++---------
 kernel/fork.c                         |  8 ++++++--
 kernel/trace/ftrace.c                 |  7 +++++++
 kernel/trace/trace.c                  |  7 ++++---
 kernel/trace/trace.h                  | 18 ++++++++++--------
 kernel/trace/trace_events.c           |  2 +-
 kernel/trace/trace_events_filter.c    | 12 ++----------
 kernel/trace/trace_events_trigger.c   |  5 +++--
 kernel/trace/trace_events_user.c      |  8 +++++---
 kernel/trace/trace_recursion_record.c | 17 +++++++++--------
 kernel/trace/trace_remote.c           |  1 +
 12 files changed, 56 insertions(+), 47 deletions(-)
