Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196478;
	b=Eiloe6HyM968Eli7DYt5Z0Z1mc9RYD6Lzy6jrbXsIwzyxEYic1/2sX544IVF6JlQ7QGX
	 mJOIOHpdOohCBl1gxP6dEySYdkjiaUK0hScFCsSjQdlUAXPlkClYRY4bpgklmg0aC4xIR
	 bNqOHEvK2CEBmEGUUsk7cQgAtPo4MrLc0d+GorBjUVel5N4o6B/PnhD+qN2HPQDeBjeG6
	 y7gTIerZvre1qh7jj3AUcDX05jt3dlLxqfYvjN23eeENFzHjQREWZn3M4s7clVZ4XoMLn
	 1aRr8lX8goTzfLQz3IiPf50H6DRmucXpdHrIqF3sdjKwNP5t4BuKhtJa1EOgSVbaSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196478;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=oxxQtTft3XO+pieJmDL2EMYgDsiaLVdi4GdnuB/BugI=;
	b=bSkubyBPx7RdttkG+uTDrcFt7RBRBm4IeSJxbgJyAAzdefx2Rjb6jMdXWkyaQHq8Q8hS
	 ascUqxOijlyMHi0Wkxd4LSn9HJyqgBDAZrcSA6OtjM3069Y+9XdgiVq6K+gKsOkdnhJpb
	 yqLYtEjq9lip3RLKMd1KIgsfuDiaujHjacPUWfliZKumZ6AoPOTE1nXltDjnqi/TQvNCm
	 EhuvaLDu3UnMSH2W5laPr6S7feVCKEihlpgDyIbClpm6QC62IsNbJgz7pAsnjvpwuQavA
	 9Av0IOjZnLfhUrvFdtVUN4THjv71gwLipg0m6K7M1M5AmkVKSbQs4Km9dhwC3tBm6QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGUeCJta;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F860A5BCD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGUeCJta
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A88C1F00AE3;
	Fri, 20 Nov 2026 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196478;
	bh=oxxQtTft3XO+pieJmDL2EMYgDsiaLVdi4GdnuB/BugI=;
	h=Date:From:To:Cc:Subject:References;
	b=EGUeCJtaMf50fHnF4cFeyeXcYfHrFmcE3uUNChc/vzxHH86ao2IorSYLA9RJ7dgZN
	 qVN/xn+oj5tQKe5zaFNpiqVl4vYHnxUO75qotYQ9mOIoj3JpQN8St1Cn5dzDgljLzZ
	 EfVLbWEsChlsxZT/0Z+HHKyiaTx0W15qu/haBlR4WL4twu01QfN+emxDkddIaHcKoV
	 /YVTdeKJaDa/IWDNY0q+L8rdw7ytdJ8tojViD//cqBXEwMr2DjCKql8JuzLy6lch1K
	 lWJKalax9HIb4BkbwSC4VFDFWmTxx/td3Mzz+kbHmUL9YovGXD1JNIGrQ0RAgwDKed
	 z7zANB71IoOBg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbt-00000004aOJ-2VsE;
	Fri, 20 Nov 2026 12:41:17 -0500
Message-ID: <20261120174117.427149904@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:10 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pengfei Li <lipengfei28@xiaomi.com>
Subject: [for-linus][PATCH 18/32] tracing: Wait for marker writers when copy_trace_marker is cleared
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

From: Pengfei Li <ljdlns1987@gmail.com>

Clearing copy_trace_marker removes the instance from marker_copies
without waiting for trace_marker writers still walking the list. If the
option is set again right away, a writer on that entry can revisit
instances and write the same marker twice.

Assisted-by: LLM
Link: https://patch.msgid.link/20261107110722.1241413-1-lipengfei28@xiaomi.com
Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b11ec4d3cfb8..bffba5e27086 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4035,7 +4035,9 @@ int set_tracer_flag(struct trace_array *tr, u64 mask, int enabled)
 		break;
 
 	case TRACE_ITER(COPY_MARKER):
-		update_marker_trace(tr, enabled);
+		/* Writers of the top level trace_marker may still be on this instance */
+		if (update_marker_trace(tr, enabled) && !enabled)
+			synchronize_rcu();
 		/* update_marker_trace updates the tr->trace_flags */
 		return 0;
 	}
-- 
2.53.0
