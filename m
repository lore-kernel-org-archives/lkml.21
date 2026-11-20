Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196477;
	b=V/vnJOCtw39taicARUkrS0Lhfbxyb6B0CtBHCm3pTTHBkmZbJCC8mJkFljcvF5z6STTB
	 NnXA4njwEvs8wv6vLFthn/eny4NmN6kZBWytzzEaGPp9/GtysuctObBXeGeH+5sOOxN/S
	 XjWgzYb9Xrso3rcyf7LB2rYnVuxNJWKB2XSPLuOt6TTCRM2nv/kaLG5xQBQMsk6AWAAFO
	 PCDDPGKPzRenL6afflkkCs4Fo/08KZJ74TkPhz/KiYBIF7+30GciFA0oe4HRNQO5dGWFL
	 DWpCKBOXGU7+gNm6x7lTugZucAUm/HYiRWcqdeduy9UOapSE8rOESOHQKFVtPL+XEDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196477;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=uytcfJbCxhhDCdb5RfCUXL9TOXmJM2/Mzb8X19qc3s8=;
	b=c3yNfxQzgA2WJoIiefgc2rbpqtfS5tuC6xwpkrUAGnkwLy5YIOATindPwL4roUhRa75N
	 ESwt7Lq9XTYcqLmO59fPHkaGZ73bWOVarRI3a9eKmE9a6nBLCNZ2kvxxPgzojq8XtRfTA
	 uksJJ4cQFCaxYi2sV+bXq4qNSzG7W+1G2AU+t46NGeRwzaqvbfHiXFjwzZg4hdJ3hAXiq
	 jZP94QVcO7W6aBXv3AFSEWWiVDjRE9BtiNCh2nCJ89DkZuAsWrdWpEY1Kd589u54lZ2ap
	 8gmb+stFgQ1y3swBE0zfQmX3EGtMD8803sjvEwZSTyI50hIo0jrLNbSXwBfzpIrsegA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbngQQTa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0460A382F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbngQQTa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A1B1F01809;
	Fri, 20 Nov 2026 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196477;
	bh=uytcfJbCxhhDCdb5RfCUXL9TOXmJM2/Mzb8X19qc3s8=;
	h=Date:From:To:Cc:Subject:References;
	b=KbngQQTaG7Wtc6TtrHncJ5EtUIL+8k5HVakxvQAG9LCvvtLpv15yjH+dFFNLrlWWv
	 aq2jdEu4T4G4GOUtXugtzLSgE/8Sb8xkw4V4UxlkPqRP+VghdowlbUIeuBrscA5qmv
	 Mucsubq+4tYmDt1bv3La0FAO05LHEI91BNwk1yy4q9MJErd28hEFY009DqvZAMaYAb
	 846SFnzfbULPn1bpu/9ZvvucXB/HcdDcg6PiEI0yAXqYPDEppkR5ZXm3D4WmYZO7wB
	 DHKnaTwaMCxoj1jkJSa38Gmz4S+/Jw/KM/T5btWCvthiGfxzS0fnqoBnubUdrFbvvs
	 NrqwF0rMOWq2Q==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbs-00000004aM1-3ZFp;
	Fri, 20 Nov 2026 12:41:16 -0500
Message-ID: <20261120174116.689317537@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:06 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vineet Gupta <vineet.gupta@linux.dev>
Subject: [for-linus][PATCH 14/32] fgraph: Use scoped_guard() for the task list walk
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

From: Vineet Gupta <vineet.gupta@linux.dev>

alloc_retstack_tasklist() open-codes rcu_read_lock() and unwinds it
through an unlock label. Use scoped_guard(rcu) instead and let the
compiler emit the unlock on every exit path.

The -EAGAIN case now jumps straight to the free label rather than to
unlock; leaving the guard's scope releases the RCU read lock on the
way, so the unlock label has no remaining users and is removed.

No functional change: objdump of fgraph.o shows identical call targets
and counts, including the three __rcu_read_unlock() sites the compiler
emits for the exits from the read-side section. A PROVE_RCU +
DEBUG_ATOMIC_SLEEP build with the -EAGAIN path forced several thousand
times is clean.

Link: https://patch.msgid.link/20261021174406.2891598-3-vineet.gupta@linux.dev
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
Tested-by: Vineet Gupta <vineet.gupta@linux.dev>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/fgraph.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 59c217b06695..8a6709959b62 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -1057,32 +1057,31 @@ static int alloc_retstack_tasklist(unsigned long **ret_stack_list)
 		}
 	}
 
-	rcu_read_lock();
-	for_each_process_thread(g, t) {
-		unsigned long *rs;
+	scoped_guard (rcu) {
+		for_each_process_thread(g, t) {
+			unsigned long *rs;
 
-		if (t->ret_stack)
-			continue;
+			if (t->ret_stack)
+				continue;
 
-		rs = kmem_cache_alloc(fgraph_stack_cachep, GFP_NOWAIT);
-		if (!rs) {
-			if (start == end) {
-				ret = -EAGAIN;
-				goto unlock;
+			rs = kmem_cache_alloc(fgraph_stack_cachep, GFP_NOWAIT);
+			if (!rs) {
+				if (start == end) {
+					ret = -EAGAIN;
+					goto free;
+				}
+				rs = ret_stack_list[start++];
 			}
-			rs = ret_stack_list[start++];
-		}
 
-		atomic_set(&t->trace_overrun, 0);
-		ret_stack_init_task_vars(rs);
-		t->curr_ret_stack = 0;
-		t->curr_ret_depth = -1;
-		/* Make sure the tasks see the 0 first: */
-		smp_store_release(&t->ret_stack, rs);
+			atomic_set(&t->trace_overrun, 0);
+			ret_stack_init_task_vars(rs);
+			t->curr_ret_stack = 0;
+			t->curr_ret_depth = -1;
+			/* Make sure the tasks see the 0 first: */
+			smp_store_release(&t->ret_stack, rs);
+		}
 	}
 
-unlock:
-	rcu_read_unlock();
 free:
 	for (i = start; i < end; i++)
 		kmem_cache_free(fgraph_stack_cachep, ret_stack_list[i]);
-- 
2.53.0
