Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537810;
	b=C5Tn6lp2+nBbew3NRiiXIvDBHfiXNexHvtnBiIeoTWebrp36BfR0n5rRcj0mD0AHsigP
	 qTi/iAxAUQcywwA5LW2wBNx4fC6uawnStB1zd2zyiSVHnEHDklAW3Blbvbxlu3Cd/90gX
	 RoqQ80KiECIvcv2REgIgL30+Yb0tGHPResoIofCCZvyOD6NBHYUj5rM7ZINBumk3RBly0
	 PTdXkgEzQyR3h2kzlnqsVM/Ks4TKkxlPueheimPPT4O4f+WIWSf4oB0GIhiFy7EAWUqvW
	 g4Fk6b9wicrjcI5BvORbq8b6ZVU7IpHkWQzotBlD1Q8SMa9+cs4PyO2CQgteGqYw1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537810;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6D9+I+ZmlOjtvLz+YOPIuvhffTkLTCvwIKyzYhBrqno=;
	b=cLr5CsNc0tl+N5GLxWlBIE8W4eyaZa94c79I1ekNheAhOcQCVmN6hxNLKfNmt6UHqM8g
	 1Lxxuh/3Av27VurCaSf6NTZag4rYr4kQzLn/eEChqnM8/KfrwK19UINRXQcdXHu+kqvfA
	 95b/szhnJ6rzn+ZYOVUJ7QVi/E4HRpQRjj2rIsNirFGYQSJuCzlJDJ9+QOR+Lzxcqs76d
	 UXAay1EyHGVhLqYaIMIO6VVjbH5jI+gUgtnljJZC2SVDgadxvwquQ38Xj45qw31or2lxj
	 JF7+ZHZ9ItbqMpkk7DAwOg7tWIO5iTc5rWKdlVAPlZmDTjBuexaFfHiRYCH/oFvHdUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bdkq+wWL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6B606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bdkq+wWL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C96A1F0093C;
	Tue, 24 Nov 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537810;
	bh=6D9+I+ZmlOjtvLz+YOPIuvhffTkLTCvwIKyzYhBrqno=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bdkq+wWLQce3hhRQ97zJL1Z8+g7iSSFsK3z6EXe4YQKfnV8n4AFfqk3ptRwJbZMig
	 pwPcxkKooNReAyYqtCTUNntA3ocABMBmlLg3s7PmnQ3zND02eexv0W6D578ZGlh38P
	 sknL6PKUHbEcmnM1MVU8CKGzublZI7Tb32zVMXMZlEL7uzhQ6dA7Rxe7QcYFHfN2SA
	 NBRBc73xlRho9Z4uMfT7f19+IgErYWg3jkjPO1B2hYD+zgMSIrQHsmJzpVY/nuF6c6
	 CJ9m3sqf9ZqkSrhVlZm8GkXV8BMZS/tpAuGUiNVXbU7VKYWqnGTi8gBbefgDGlGRfz
	 7o4dvohxO0jaA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Tue, 24 Nov 2026 17:30:02 +0100
Subject: [PATCH 1/3] mm/slab: add ___do_kmalloc_node() to deduplicate code
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-kmalloc-entry-rework-v1-1-37b1631a67b5@kernel.org>
References: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
In-Reply-To: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

Most kmalloc family entry points end up performing __do_kmalloc_node().
What it does are roughly two phases. First, selecting the right cache
via kmalloc_slab(). Second, performing slab_alloc_node(),
kasan_kmalloc() and trace_kmalloc().

__kmalloc_cache_noprof() and __kmalloc_cache_node_noprof() already have
the cache pointer, so they both opencode the second phase. Add
___do_kmalloc_node() for the second phase.

It's useful to inline the first phase as some parameters might be
hardcoded NULL, but for the second phase it means duplicating a lot of
code to avoid any calls for the allocation fastpath. So let's try not
forcing ___do_kmalloc_node() to be inlined. It could almost be a tail
call, but isn't, likely due to the on-stack slab_alloc_context.

This is the effect on slub.o. Almost the size of the new function is
removed from all its callers, as expected.

./scripts/bloat-o-meter slub.o.base slub.o.1
add/remove: 2/1 grow/shrink: 7/9 up/down: 1005/-5353 (-4348)
Function                                     old     new   delta
___do_kmalloc_node                             -     768    +768
sysfs_slab_alias                             166     221     +55
sysfs_slab_add                               469     511     +42
do_kmem_cache_create                        1677    1714     +37
slab_memory_callback                         677     713     +36
slub_cpu_setup                               415     446     +31
show_slab_objects                            707     723     +16
calculate_sizes                             1328    1344     +16
process_slab                                1209    1193     -16
check_bytes_and_report                       226     210     -16
__kmalloc_node_track_caller_noprof          1087     382    -705
__kmalloc_node_noprof                       1092     387    -705
__kmalloc_noprof                            1100     375    -725
__kmalloc_cache_noprof                       790      62    -728
__kmalloc_cache_node_noprof                  827      57    -770
__kvmalloc_node_noprof                      1442     637    -805
__kmalloc_flags_noprof                      1307     428    -879
Total: Before=82451, After=78103, chg -5.27%

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slub.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index c35a50538d00..70df0a2e3876 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5512,6 +5512,23 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
 }
 EXPORT_SYMBOL(__kmalloc_large_node_noprof);
 
+/*
+ * Deliberately not inline to have all the callers share the code, using a
+ * single call.
+ */
+static
+void *___do_kmalloc_node(struct kmem_cache *s, gfp_t flags, int node,
+			 const struct slab_alloc_context *ac)
+{
+	void *ret;
+
+	ret = slab_alloc_node(s, flags, node, ac);
+	ret = kasan_kmalloc(s, ret, ac->orig_size, flags);
+	trace_kmalloc(ac->caller_addr, ret, ac->orig_size, s->size, flags, node);
+
+	return ret;
+}
+
 static __always_inline
 void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
 			kmalloc_token_t token, const struct slab_alloc_context *ac)
@@ -5532,11 +5549,9 @@ void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
 
 	s = kmalloc_slab(size, b, flags, token, ac->alloc_flags);
 
-	ret = slab_alloc_node(s, flags, node, ac);
-	ret = kasan_kmalloc(s, ret, size, flags);
-	trace_kmalloc(ac->caller_addr, ret, size, s->size, flags, node);
-	return ret;
+	return ___do_kmalloc_node(s, flags, node, ac);
 }
+
 void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
 {
 	const struct slab_alloc_context ac = {
@@ -5671,38 +5686,26 @@ EXPORT_SYMBOL(__kmalloc_node_track_caller_noprof);
 
 void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t gfpflags, size_t size)
 {
-	void *ret;
 	const struct slab_alloc_context ac = {
 		.caller_addr = _RET_IP_,
 		.orig_size = size,
 		.alloc_flags = SLAB_ALLOC_DEFAULT,
 	};
 
-	ret = slab_alloc_node(s, gfpflags, NUMA_NO_NODE, &ac);
-
-	trace_kmalloc(_RET_IP_, ret, size, s->size, gfpflags, NUMA_NO_NODE);
-
-	ret = kasan_kmalloc(s, ret, size, gfpflags);
-	return ret;
+	return ___do_kmalloc_node(s, gfpflags, NUMA_NO_NODE, &ac);
 }
 EXPORT_SYMBOL(__kmalloc_cache_noprof);
 
 void *__kmalloc_cache_node_noprof(struct kmem_cache *s, gfp_t gfpflags,
 				  int node, size_t size)
 {
-	void *ret;
 	const struct slab_alloc_context ac = {
 		.caller_addr = _RET_IP_,
 		.orig_size = size,
 		.alloc_flags = SLAB_ALLOC_DEFAULT,
 	};
 
-	ret = slab_alloc_node(s, gfpflags, node, &ac);
-
-	trace_kmalloc(_RET_IP_, ret, size, s->size, gfpflags, node);
-
-	ret = kasan_kmalloc(s, ret, size, gfpflags);
-	return ret;
+	return ___do_kmalloc_node(s, gfpflags, node, &ac);
 }
 EXPORT_SYMBOL(__kmalloc_cache_node_noprof);
 

-- 
2.56.1

