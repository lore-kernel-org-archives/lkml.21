Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196478;
	b=J9rNypzLOzfDgXKf1jKn/8f6HTIsYi1U95K19XOA8pkXX208GgRJq1ooc9OJ//rlTh6L
	 a8rQlQJw26dkRhB7dj+K04OgnulvkkT7wv6+0cCmYqsLvkaOGvmsZAGfG2gdTJxbuf47k
	 BaBYyuh3Ic+hyUJsuCHBxm3tZN9RiAHL0ZwFEJlcghx49zwkupsaOFcZRPKJDoeZk+hSg
	 rbK1wIYkbyayLom1Ko40vfYxORr1AetazlczV9/LPrI0FwUei7Ynaz9pS3hW1grOaIeWL
	 bitbF8SLNXkiC9zdCj9USUB39AlA8nLAV/4cRCGE4oNbw9rCHa+6p3uQz+ATg0/4UWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196478;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=6PVkO6NTC7dpMPTe/FW4COGPbA44ihsJoE5HVmj490w=;
	b=QG5NUidryLrSK/URoWUAHwDfN8l0gYfnNM1Lvnrqa+3YhMGCJVwfYy4+vVF1puIoRhXr
	 2lUFPjaIczoNGcQCzH1vyMt7KB1eZTGXL5rJfGVS6NV07nl6ziKnMv9EcJJRkNVGkxisv
	 k5JQm2Suy1EqdXykUeYgdxulz+NyLwKsS0H7F888vtU9SWsSh56wwR1wkK42wkyljWqnX
	 b5dJNrQLeEJ+cC32xmFli2sYNa61ZVCP82YduhKOyiFpQA55Bn8i31m85F5XS9taI/bp0
	 gE4R9PR40EL8qnd8ZihTLEXnudRaCvLnWFfYCOrWbNYG0G9LkSS2WFexeX2v+W2bxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K97rdEjY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52960A3836
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K97rdEjY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0871F01564;
	Fri, 20 Nov 2026 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196477;
	bh=6PVkO6NTC7dpMPTe/FW4COGPbA44ihsJoE5HVmj490w=;
	h=Date:From:To:Cc:Subject:References;
	b=K97rdEjY3a1J5JDvLU4UpLjceP2NPXW35kkzpMgd5a+YbqwCq6t5eWNi28LoVjpTI
	 jcWmWRNP67eN+S/wpl1ymCvBaEtutLSYxLHhtmDppMxqaKVOHllWzgzFBL+6Tkn/89
	 cN1vB4920hvgrnq7lPcG8UOnUBYwrOeXusvxTuWVzOU9/rpcBLAb8GIibIm/8RasS4
	 JKXnZLMZNepGY9NX6FGizcxsZqMJkUu8Lcn3vd3Sz/9YNdEf/EKtngOZoZe+jw/SjZ
	 yIGeIncQJqJ1tVGZ69KY98/icRT5O0hOpEBHLL60a9yuu42ZyfbZk+o8nGyVTELKdr
	 EHWYytXBMf1pQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbt-00000004aMZ-096K;
	Fri, 20 Nov 2026 12:41:17 -0500
Message-ID: <20261120174116.869592834@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:07 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 15/32] fgraph: Read the task->ret_stack with a smp_load_acquire()
References: <20261120173852.687189370@kernel.org>
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

From: Steven Rostedt <rostedt@goodmis.org>

The setting of task->ret_stack was switched from a smp_wmb() and the
update to the variable with a smp_store_release(). Match the reading of
the task->ret_stack with a smp_load_acquire() to replace the read and
smp_rmb().

Also update graph_init_task() to use smp_store_release().

Link: https://lore.kernel.org/all/20261021174406.2891598-2-vineet.gupta@linux.dev/

Link: https://patch.msgid.link/20261117200108.35179ae8@gandalf.local.home
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/fgraph.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 8a6709959b62..1d900445d23a 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -568,7 +568,11 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
 	if (unlikely(ftrace_graph_is_dead()))
 		return -EBUSY;
 
-	if (!current->ret_stack)
+	/*
+	 * We must make sure the ret_stack is tested before we read
+	 * anything else (See alloc_retstack_tasklist()).
+	 */
+	if (!smp_load_acquire(&current->ret_stack))
 		return -EBUSY;
 
 	BUILD_BUG_ON(SHADOW_STACK_SIZE % sizeof(long));
@@ -576,12 +580,6 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
 	/* Set val to "reserved" with the delta to the new fgraph frame */
 	val = (FGRAPH_TYPE_RESERVED << FGRAPH_TYPE_SHIFT) | FGRAPH_FRAME_OFFSET;
 
-	/*
-	 * We must make sure the ret_stack is tested before we read
-	 * anything else.
-	 */
-	smp_rmb();
-
 	/*
 	 * Check if there's room on the shadow stack to fit a fraph frame
 	 * and a bitmap word.
@@ -1125,8 +1123,7 @@ graph_init_task(struct task_struct *t, unsigned long *ret_stack)
 	t->curr_ret_stack = 0;
 	t->curr_ret_depth = -1;
 	/* make curr_ret_stack visible before we add the ret_stack */
-	smp_wmb();
-	t->ret_stack = ret_stack;
+	smp_store_release(&t->ret_stack, ret_stack);
 }
 
 /*
-- 
2.53.0
