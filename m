Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196479;
	b=jAJHLHzYe6ZceF8W98rlp3CqcpvbnUNGtcwWQEGua3LpuXG1TP9+OcUGc7CwiXBzTdNo
	 /1zHkHPTzuyr58UtDTyQu9jTNUP8spfyoW9V5V495gBSB7O0jaZuatmRpvsUg8QCj4rMj
	 kMsKH27aji2VlnJIAaS1+uFjLmBqQmBR00kzOtTw9vqhrdKZ3HMiLjtMWHuJ84Mj6Kpld
	 GD8Osa1NGuzGrnjng+GkHhklXxyr1Y08L2sYNR2xP7g+YGy6BgpB70o3AOFVxqQdNV0nu
	 gSco280ccyT7Bs7SelFinju+CCWVGrEf+VhOrnE24+94kvfSZlS6IY1u1Rnm+DfZ6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196479;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=ssnsMdRV4HWaI5COUd5M88QLmBWKel1i9g9HoZ3domo=;
	b=MQggSTbtmwlQwSlBc9N8mIBNrB04VWqCqLxoKPZ+QYZgs9aC4Bk6fRQOQTNqlc0cQbb6
	 RJ83fpiqF3FW9dDgimRV5/ksMFbrZLWtg2Dv6Vieap2CMwCEujmyo4Wk5qWLiMIxCpVXr
	 CfFuKk9JNKMdTlVHG3ql32nX6qvUgMkVpS4KnbqeVlYLshRTOhtaqplNvK+txggr+BeV/
	 POr/LP2TYNi3ZfPSEgoVYGqzqmtynjDwWdE/VBZrk7H9DLMgdWbnRwF2HgvHuaKCgTokA
	 2exuPnEjcBAJXh7CDNmj/Vib/MDYX2K6mULFhf5f00GUZ97K62BT99V33eonA5uWR2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdKUzmWp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B260A6F51
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdKUzmWp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8171F01571;
	Fri, 20 Nov 2026 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196479;
	bh=ssnsMdRV4HWaI5COUd5M88QLmBWKel1i9g9HoZ3domo=;
	h=Date:From:To:Cc:Subject:References;
	b=YdKUzmWpsz7I3Y573SHreBZzXD4e0wqVQMl8695PQSCHA4IaRoXTCZIcdiZYAAzN/
	 Ak842otCL0TZt7+KV+Yvh2FXcJ4ys89JzNa5Rb1XO0gq0grGq74JlGEaP7J13IQGDH
	 x6xFFnOqFoqwXbXQ/jdFSoEHo4RAP/1jzDoHJ/tgdnWGl4ZDPIvyggUzOcNKwgaI3E
	 bYIPqxLgh91PXbs37jgbW77I5+hELVaIty5akQI/55H8ZUisfu5t+nGmvDqUYw3jLA
	 r7x9rhnXNAbOFO1bKDKQqN8Yip9vpUnlWi5pTqriszs5Zqym/xUAWYrmgbcaTVIccp
	 HaA5tAMC5nlYA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbu-00000004aRi-2vPe;
	Fri, 20 Nov 2026 12:41:18 -0500
Message-ID: <20261120174118.533527393@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:16 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 24/32] ring-buffer: Increment pages_read on remote ring buffer page swap
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

From: Vincent Donnefort <vdonnefort@google.com>

__rb_get_reader_page_from_remote() swaps in a new reader page without
incrementing cpu_buffer->pages_read. While this isn't an issue now as
trace remotes do not use buffer_percent, add this missing increment for
consistency.

Link: https://patch.msgid.link/20261113152729.837429-5-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 158c7c75688b..0a1c7f98159e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5881,6 +5881,7 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	cpu_buffer->reader_page->read = 0;
 	cpu_buffer->pages = &new_head->list;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
+	local_inc(&cpu_buffer->pages_read);
 
 	if (!rb_page_size(cpu_buffer->reader_page))
 		return NULL;
-- 
2.53.0
