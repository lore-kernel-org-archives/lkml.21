Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196475;
	b=XvjjE8C4HgUSXoHosH2fbOzH6fr2zSa/Pnv6BIb1+uQDzDJYnn3TWViWwIuz5NgFfVIJ
	 amjisb09UQTEMYDP33CkaneLgaA6PAXhkSkIUlI3qOBl6VkX0MCONcY6iFcQnQtYun/67
	 d034eyWKcjLI0SpYdUewcPvS5ggLAdqWhTMAH+ceAfO1Rv4c1iLVW1dPuCnGLPzTbqfu/
	 iGaTjS5ZRmYne2xE3zCYOsDBMegwQEJlFD8O2r0fx95abwYYSLOAjinxKntGGLnNPpf8O
	 6WGUnYRCqnWqPEuUL/Msu0nFrBMOYKxuTI5juVlNWp/s9+u+MWaa4p8Bg+511jkniVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196475;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=IKwU573rTuLHQShqQQOVB3PLU3mzP508tsBlnUnpsWg=;
	b=d7h0OJpql6LLXPP+0lLRNRRKD2uJSwlJukxs1odcMlGyicy1p/G/2u7Qxw2XCbdrzIDj
	 uud7iJ/o9VHGWiU3nxajbUf+y/Bi7gfepr4ZCHSirocnlu7BOh1yGkY6h+f61ugi8oyaX
	 3+OJK3wBWMS8xvgmBgnn/TrPWhCfqmB1fj5nK9OA5NO2cTcBIZf7Yf6IgiWmYsywRobWa
	 yK1mVyOwJBa8wqpJ5YmUqWAqlheY4qj2Gu2f57InCbV3SN/YBZUoRIwPR4pXtvsCVMunp
	 Ru0mq1cNKlAW40dmq+DhDH17WxSHRdaeMHKUOrgYL3PVksEgmcJ77hQLuVoNiKaErEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcubvQUh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEFC606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcubvQUh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB971F000D3;
	Fri, 20 Nov 2026 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196475;
	bh=IKwU573rTuLHQShqQQOVB3PLU3mzP508tsBlnUnpsWg=;
	h=Date:From:To:Cc:Subject:References;
	b=BcubvQUhUx7IszabFZIdY5BWC19Z8sr9ydSRwYwNMPYveQgres8He5XBQvwMSjG9F
	 /Zht9poAQDVSCLd1Y9zJHmudwtUhnBP5RB1x2bOpSTw/prSNey5AbutRZc5g+/iSPp
	 7xqA9+ytww1rfCKG6Oizgg2OdAxoqP4Tsm8NaxPrHdoNRlERhIAZXS6Ilo/Ls6nvlo
	 lPoBvQdkmPJAzAyu27sOjmPcSXiIwmdFBNJa4i/BNedoERaY6kZEWnOkmPNi9+OZrU
	 OMAaYHyF+qvoVjbxSs6KgRg1pOtEXKtLlYBqinTcAukQnU9Qb3PDmxaLoUCytzRmIm
	 WH8UlyZvPxZvQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbq-00000004aEm-1Gwx;
	Fri, 20 Nov 2026 12:41:14 -0500
Message-ID: <20261120174114.106457870@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:38:53 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com,
 Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [for-linus][PATCH 01/32] ring-buffer: Do not WARN when trace_rb_cpu_prepare() fails to
 allocate
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

From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>

Creating a tracing instance allocates the buffers of the other CPUs
through trace_rb_cpu_prepare(), which WARNs if the allocation fails.
But __rb_allocate_pages() bails out on purpose when si_mem_available()
is too low or the task gets killed, so a mkdir in instances/ with a
large trace_buf_size is enough to trigger it:

  WARNING: kernel/trace/ring_buffer.c:8094 at trace_rb_cpu_prepare+0xf1/0x100

The same failure for the current CPU, or in ring_buffer_resize(), just
returns -ENOMEM. Use pr_warn() here instead.

Link: https://patch.msgid.link/20261104222558.863948-1-christian.aurichzm@gmail.com
Fixes: b32614c03413 ("tracing/rb: Convert to hotplug state machine")
Reported-by: syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a707c4f.13bfb6d0.1ecdd5.027e.GAE@google.com/
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 75cd8df23c1b..ed267d628826 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -8091,8 +8091,7 @@ int trace_rb_cpu_prepare(unsigned int cpu, struct hlist_node *node)
 	buffer->buffers[cpu] =
 		rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
 	if (!buffer->buffers[cpu]) {
-		WARN(1, "failed to allocate ring buffer on CPU %u\n",
-		     cpu);
+		pr_warn("failed to allocate ring buffer on CPU %u\n", cpu);
 		return -ENOMEM;
 	}
 
-- 
2.53.0
