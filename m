Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792421;
	b=39knTZeY84GYmeoUPlwRmc5A/wt/+h6W2BZ7it+H1Fd1filRCpuEwXxDszGzoTePN5kD
	 UOrAvMd2YYl4my6ces+gPcNGyZ2086ij36Gr/Jh4yIAvOJI9549RwKWuSeJ9X4ZRqGVJv
	 fZLJMVM3nmRVNntFWiERvzdJRUX2a1a4/OoaKaz8NluRuFrhe4ncAeyQSoPc+c6U6oDn5
	 gL6XiID/VCNpBtGa7mwfkeajzKBXdRjqv2j1a2q0juY8IPxzRXxEhqZsjGZIiYIK8d7rD
	 iBGZvfXH2DhWT9t+fZuSDdkMiwbFq6L6Q8NBTIKJqb2QXhlpGCdgFtM1PTKu/fQvA+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0snJA/p3qoZflzr6S+Is/MiZdzdW+xQl+yqw+NL2eXs=;
	b=RSWCTpPYLpuNkvqs/4/m3WGQwdK+UtZL4h6TrkaIkEsyhx02NAOp1c5OEjgRW+AOe0vR
	 MCQf6/R4hxHQAHw2aOOIldPcItPVTrw+QsHPG99d86MYjhxcn7ZhDskQXUkERVBwVu+N4
	 NqbBQaOS2bYk/AIDTss4ECBBhScGD55ED0B+XVkvyzD0eI2yKGSSG+ON07ti2DO+zWC61
	 ZWi5TpTCrFGo0wh2IaJasNRPFFIq38Cc4wAm90Wuqp1vw7Zyhh1Y5ApZXL5nVp4c7g8ZA
	 OFsCAsI+UyrK0D0JGey0IAVHn9IS4xbcH/lQeTBq1S2aMJzMOEXaUKyWKUBG8b6WM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="MOT/hKYN";
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE71F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE71F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MOT/hKYN
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so57783835e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795792419; x=1796397219; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0snJA/p3qoZflzr6S+Is/MiZdzdW+xQl+yqw+NL2eXs=;
        b=MOT/hKYNoYZIHUYNtgI7Svut9HQ8qieGUNBtHupehQEDZfrjJWwyumg2grlu/c/INl
         ZJoq+fLZZfeqq7mKdQzDTDD/fpQ/t+lkp4wlC/cSR2R/hfSxmPy2SVLX6AYQmVFpuLSj
         /SpFYiVeN+SPYPgL4ZAYmefqxTTzKby8ibF1Jlrxb3uo5h5J36yuXZh1a37cwE7f+EN4
         0YBwOEr0I4j7/ZLf3gLo2jx6Cv305eCVId97AeCMyMbCzXJHpznO7DuwEurtZnqFIJyH
         GJDGYbIT6Vnv/XgrohFz4Q0+9ZVQ6djjdqkq0Uz0HFr3xMgygFA5CV7KeNnYTwfVQJKX
         +RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792419; x=1796397219;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0snJA/p3qoZflzr6S+Is/MiZdzdW+xQl+yqw+NL2eXs=;
        b=gsCJIQQzU/FGe+0NFEFJyeok2pa/GTXRizmQXPfrEDtsVl1AHZVCOFHadDzmL/bBcU
         60DXqCUl5/S9xUlG2KTf1ljBmR0T491CNsydfMcxnEPjyowvGu2JNwCUB99WQvW08pTT
         J7KHVlrTCxVmcJ5X24nrhF/HKtod0sYKs8qIWA434+T8tBUY3wyK4hY/k82jtHYsDxLk
         E1apuOW/HrocaFs32YYfJt0bu224Mam6Z0peLUR5C5MygzEM5MVuM5IQJbhGgPaIeVot
         OMDqcVX+MmgKys1nF7mnGP8E/4wgPRoZdC27pufwBxpgBrh7ZMckbz4b5J8PMgMnknBL
         ET0A==
X-Forwarded-Encrypted: i=1; AL+hErFJmLAcSx53a9nxKnDEsr3iHTxyB92tA/hmQJtAXZ1T4felBuTucuQ4Ntdv3sWZ5JTRUTI2NnQv7RyZcGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99QssXrIQtIy+dPlmt5wnDkY8tv85BN5R/k+msEj+eINzrct0F
	Tbuab4L6KLp6ndtRG3PyuP+DP74K8DD0tbNMwAc3GeABrRsaxTlL/GsFUO+G6VBr5BFCNzkb4V2
	XMXQS1P0mIzAFfFvfNQj2YQ==
X-Received: from wmee23.prod.google.com ([2002:a05:600c:2197:b0:4bb:4bbf:7120])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:9:b0:4bb:aa4f:c025 with SMTP id 5b1f17b1804b1-4bbaa4fc0f1mr120603915e9.1.1795792418988;
 Fri, 27 Nov 2026 07:13:38 -0800 (PST)
Date: Fri, 27 Nov 2026 15:13:23 +0000
In-Reply-To: <20261127151326.515232-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127151326.515232-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127151326.515232-2-vdonnefort@google.com>
Subject: [PATCH v2 1/3] ring-buffer: Use kvzalloc_objs for user mapping arrays
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Mapping a large trace buffer to user space requires allocating arrays of
struct buffer_page * and struct page *. For large ring buffers, these
contiguous allocations can fail under memory fragmentation.

Switch both to kvzalloc_objs() to use the vmalloc fallback under memory
pressure.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a5a0adc934fa..484fb1c08682 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7762,9 +7762,9 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 			struct vm_area_struct *vma)
 {
 	unsigned long nr_subbufs, nr_pages, nr_vma_pages;
-	pgoff_t pgoff = vma_start_pgoff(vma);
+	struct page **pages __free(kvfree) = NULL;
 	unsigned int subbuf_pages, subbuf_order;
-	struct page **pages __free(kfree) = NULL;
+	pgoff_t pgoff = vma_start_pgoff(vma);
 	int p = 0, s = 0;
 	int err;
 
@@ -7801,7 +7801,7 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 
 	nr_pages = nr_vma_pages;
 
-	pages = kzalloc_objs(*pages, nr_pages);
+	pages = kvzalloc_objs(*pages, nr_pages);
 	if (!pages)
 		return -ENOMEM;
 
@@ -7893,7 +7893,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		return err;
 
 	/* subbuf_ids includes the reader while nr_pages does not */
-	subbuf_ids = kzalloc_objs(*subbuf_ids, cpu_buffer->nr_pages + 1);
+	subbuf_ids = kvzalloc_objs(*subbuf_ids, cpu_buffer->nr_pages + 1);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
 		return -ENOMEM;
@@ -7917,7 +7917,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		cpu_buffer->user_mapped = 1;
 		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
 	} else {
-		kfree(cpu_buffer->subbuf_ids);
+		kvfree(cpu_buffer->subbuf_ids);
 		cpu_buffer->subbuf_ids = NULL;
 		rb_free_meta_page(cpu_buffer);
 		atomic_dec(&cpu_buffer->resize_disabled);
@@ -7974,7 +7974,7 @@ int ring_buffer_unmap(struct trace_buffer *buffer, int cpu)
 
 	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
 
-	kfree(cpu_buffer->subbuf_ids);
+	kvfree(cpu_buffer->subbuf_ids);
 	cpu_buffer->subbuf_ids = NULL;
 	rb_free_meta_page(cpu_buffer);
 	atomic_dec(&cpu_buffer->resize_disabled);
-- 
2.56.1.839.g22a8290db9-goog

