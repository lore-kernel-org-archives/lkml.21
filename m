Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804963;
	b=sFYNcXBw+nT5JzQ4hHxFR6Ru16ggDdfiXqK186kWYmR2wbQZwjoAkgIaU7zyvai/mDAM
	 wKlfyWSAgvlCq+awpmL/EeS/9zLlL9VjqOPve4vekrFRccIVztnJ+OnPot/oDwlNI3jSp
	 mBmvczmYpC6ryx6jRadi3uv4OtvYQlQXBMPSOvGJJFKOu1blCLqo7pCWBOGzaT9jRiToG
	 8zTyifYY/GYiRrLqYF76zZTtmVoq6BV7PBNltGbqq5hEZRduIuzHWgN6gVDimZhIo+ZoH
	 kiYcJfAhRvdhxyQomguETPLE3cH/BmGgyr0Frvndwxuh7abnFzMcU8VfautbaZA2mgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804963;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=RQK/ydKEeLXKBT5l3QL6Sgl7yMqU4m4lcflmcctpoRg=;
	b=lFYl2vgzyB2837BFV+Fb1W5GvSlz2epXxAmxbA8cUwvKdMgctSyT7Nn8qubYby7FTZrq
	 L4+9A05fOW89len5pwhdLb1TzDQne0R+sGJpRodne9CJmVm6jErSIL2zogOTzKQGQ1F2z
	 ZMNeMEpyhoV+uGOFrE5WZ228EoLrFpf8EJV7ziIj3WYWfJjFiXw/OyXi29pjrwuIGtHYC
	 qgP6x0NBwoMoukB49Gb2zZG0L4lyrCQzn44H1IDVDG+Y8722IFBh0iYV6ZxMBMt0690a7
	 fClvHKLCnc6NyiuGX85FO271Q1W7+SbPN3AUsocQyuLF4TvqLBOf4xim/dOR7dS2emQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6Se5zGd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9CE60A260A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6Se5zGd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F011F00A16;
	Fri, 27 Nov 2026 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804962;
	bh=RQK/ydKEeLXKBT5l3QL6Sgl7yMqU4m4lcflmcctpoRg=;
	h=Date:From:To:Cc:Subject:References;
	b=T6Se5zGdaPUYaWNMalfEwBAvnLqs2hZYULWR7X8tdxAP43NvaAmeiX1Lm96hixCMY
	 t//R9emoLaaiYqOcj5OMyrryRO6QdNvngo4ojE6Hv/QmkLYQ5KlGsvIWUZLHepgrnH
	 hgkG123pxdNt3nMuozMBytnl+Dtfp54H+hGBbxO9qdAfT5ZSrP0214PL+8nydO/1Da
	 zdBWbZRFu9D//NZ8voAlvBxOAZaF9MBB6hBStuh9mz9G/a1ZzGBJ8ZKKPyG164hs26
	 KJVcWa2gQNM4nmcTOF+TiN5R7V+1r74tHwrU6eCdESwRwJS8x178Fl3bh8TePXHOa3
	 USvIvhunWLe2A==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xX0uA-000000085Zu-0k0t;
	Fri, 27 Nov 2026 13:42:42 -0500
Message-ID: <20261127184241.978718465@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 27 Nov 2026 13:42:06 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Parri <parri.andrea@gmail.com>
Subject: [for-linus][PATCH 3/5] ftrace: Fix lost recursion records in ftrace_record_recursion()
References: <20261127184203.439481361@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Andrea Parri <parri.andrea@gmail.com>

cached_function is set to the current ip before the cmpxchg() that
claims a slot in recursed_functions[]. When that cmpxchg() loses a
race for the same slot, the code bumps index and retries via "goto
again", but the retry immediately matches its own cached_function
write and returns without ever reaching the bumped-index cmpxchg().

Concretely, for two writers racing on the same index:

  CPU 0 (ip = A)                    CPU 1 (ip = B)
  --------------                    --------------
                                     cmpxchg(&recursed_functions[index].ip,
                                             0, B);      // succeeds
  cached_function = A;
  cmpxchg(&recursed_functions[index].ip,
          0, A);
    // fails, old == B
  index++;
  goto again;
  if (A == cached_function)         // true: matches A's own store
          return;                   // A is dropped, not retried

Once dropped this way, cached_function stays set to A, so every later
recursion of A also hits the fast path and returns before reaching the
retry, until some unrelated ip overwrites the cache.

Set cached_function only after the cmpxchg() has claimed the slot. The
retry path then leaves the cache untouched and no longer matches its
own store. When the cmpxchg() finds ip already present, the writer
that installed it sets the cache.

The bug was found with the help of an LLM.

Link: https://patch.msgid.link/20261026182553.221141-1-parri.andrea@gmail.com
Fixes: 773c16705058e ("ftrace: Add recording of functions that caused recursion")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_recursion_record.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_recursion_record.c b/kernel/trace/trace_recursion_record.c
index bac4bc844ccd..4f63bec052fc 100644
--- a/kernel/trace/trace_recursion_record.c
+++ b/kernel/trace/trace_recursion_record.c
@@ -17,8 +17,8 @@ static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSI
 static atomic_t nr_records;
 
 /*
- * Cache the last found function. Yes, updates to this is racey, but
- * so is memory cache ;-)
+ * Cache the last function found in or added to recursed_functions[].
+ * Updates to this are racy, but this is only a best-effort cache.
  */
 static unsigned long cached_function;
 
@@ -67,24 +67,25 @@ void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
 		}
 	}
 
-	cached_function = ip;
-
 	/*
 	 * We only want to add a function if it hasn't been added before.
-	 * Add to the current location before incrementing the count.
-	 * If it fails to add, then increment the index (save in i)
-	 * and try again.
+	 * Claim the current slot before incrementing the count. If the slot
+	 * is occupied by another function, advance to the next slot and retry.
+	 *
+	 * Do not update cached_function until ip is known to be present;
+	 * otherwise the retry would match its own cache update.
 	 */
 	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
 	if (old != 0) {
 		/* Did something else already added this for us? */
 		if (old == ip)
 			return;
-		/* Try the next location (use i for the next index) */
+		/* Try the next location */
 		index++;
 		goto again;
 	}
 
+	cached_function = ip;
 	recursed_functions[index].parent_ip = parent_ip;
 
 	/*
-- 
2.53.0
