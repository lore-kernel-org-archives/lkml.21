Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537814;
	b=Si2AB3R6dNfIzGM9AEatV0NnF3H/3c38qRfkIFu3eczhvrSwUL6KT416euOeoQh9klCe
	 bxdApmZk7SpC/N+moQrodEPbXdlr3e+sFwQYXWNmdjyD7msmSNMsdn9o6f2s3Sp8a0ZHT
	 Q7ER4Jo7ra2/BZ2OvJs5eTot9/y661Azpn4sLYUkRRa+WUy7ow7rbKr8LEBjDeSc9yqgw
	 OFTR56oqR0emombNHh7m7+PhS9sRsPBRnv1t1Lmgf/NUfHGV+M5eLSkZaba8XNq5/Jz8z
	 zr1k14LSZEn5wi3UL0Fk1YrwjBDpZo/da+34rPdgMO86han1QrWjmdaTqvg74N/iiFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537814;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=0YOPC/VLNeMdRJQ9kwXd9U/GVf6NunW+URWaX0/FAcA=;
	b=ScNuqhiLRHKAFcGSrCGrL7un/cDUh2AjJWy0qUn8OD17bSsl46ktZTZCTZSXLIooHCFY
	 mx+noAvG4MZtZa0tGY91+0UEyleXrc8qqOn6RFAK2M9RlvyGI7U2LhVkoW/N7Zb7/o4UC
	 FGAcaiQJ6NEExWthYlsnYolZZE8v4pWiOvGhSVgrBwiBPaW0lNSqoDL8iA4SMp7n/qKCz
	 Eguc5lw3X5UA5wuc6RcTpfuTcb/RlIrhKFdmjsnjOj+V11R/JhT9kWtplhOicuR2SFRZe
	 27DJojXHfdDqpYAwa6rbnrjUadek3lwV0b0OhNbZJkpcSagbAPtMu7aR3l158syim8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PW28nj0f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4A606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PW28nj0f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD831F000C6;
	Tue, 24 Nov 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537813;
	bh=0YOPC/VLNeMdRJQ9kwXd9U/GVf6NunW+URWaX0/FAcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PW28nj0fqJl30QfG7T+ET2wN1ObTPauVNBzfsnQQrHjHoI0UUqBB8JOG7lCfIA4ON
	 d/Q1SyjRREy1OM3MycA30XGEuIDbgd6wJRK8w3U+pcHfwZDH2xZn9jtUWM3GaazjzQ
	 AILkS0HZmpxCjzu1e8QdgJLArfMMU0SpGH/1uWbt/yZrqJU9jqXiu7XkW5jD/a9/Ao
	 urRQhxwRX+pOlP9Acg0XP9gUiTlKPEvlNqLjSjqpa4A+Cfyi7vBrVMjoqjxDBi1+72
	 +M/xkEiDosIMgJSRjVRfbLgDkncbhVG9kclEir+DX9D5jDK7gdfYkuRdveu82lxv02
	 CX1QtyUUiKZWQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Tue, 24 Nov 2026 17:30:03 +0100
Subject: [PATCH 2/3] mm/slab: add own entry points for kmem_buckets_alloc()
 family
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
Message-Id: <20261124-kmalloc-entry-rework-v1-2-37b1631a67b5@kernel.org>
References: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
In-Reply-To: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

The way buckets have been implemented was to extend
__kmalloc_node_noprof() and two more functions with the kmem_buckets
pointer parameter, which means all kmalloc_node() callers now have to
pass NULL. To avoid this extra parameter with CONFIG_SLAB_BUCKETS=n,
we added macros for parameter declaring and passing.

This can be avoided by creating own entry points for kmem_buckets
allocations and not using the kmalloc ones. They all end up performing
__do_kmalloc_node() internally.

Since it's just 3 functions with few callers, do not try to do anything
special to eliminate code with CONFIG_SLAB_BUCKETS=n. Only make sure the
bucket parameter is changed to NULL in that case because it would be
ZERO_SIZE_PTR otherwise.

The removal of the now-unnecessary parameter macros is done separately
next.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 include/linux/slab.h |  16 +++++++--
 mm/slub.c            | 100 +++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 94 insertions(+), 22 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index cda126def67a..46ecf99f044e 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -1175,11 +1175,18 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags, int node);
 #define kvzalloc_flex(P, FAM, COUNT, ...) \
 	__alloc_flex(kvzalloc, default_gfp(__VA_ARGS__), typeof(P), FAM, COUNT)
 
+void *__kmem_buckets_alloc_noprof(kmem_buckets *b, size_t size, gfp_t flags)
+				__assume_kmalloc_alignment __alloc_size(2);
+
+void *__kmem_buckets_alloc_node_track_caller_noprof(kmem_buckets *b, size_t size,
+		gfp_t flags, int node, unsigned long caller)
+		__assume_kmalloc_alignment __alloc_size(2);
+
 #define kmem_buckets_alloc(_b, _size, _flags)	\
-	alloc_hooks(__kmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), _flags, NUMA_NO_NODE))
+	alloc_hooks(__kmem_buckets_alloc_noprof(_b, _size, _flags))
 
 #define kmem_buckets_alloc_node_track_caller(_b, _size, _flags, _node)	\
-	alloc_hooks(__kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), _flags, _node, _RET_IP_))
+	alloc_hooks(__kmem_buckets_alloc_node_track_caller_noprof(_b, _size, _flags, _node, _RET_IP_))
 
 #define kmem_buckets_alloc_track_caller(_b, _size, _flags) \
 	kmem_buckets_alloc_node_track_caller(_b, _size, _flags, NUMA_NO_NODE)
@@ -1360,8 +1367,11 @@ void *kvmalloc_node(size_t size, gfp_t flags, int node);
 
 #define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
 
+void *__kmem_buckets_valloc_noprof(kmem_buckets *b, size_t size,
+		unsigned long align, gfp_t flags, int node) __alloc_size(2);
+
 #define kmem_buckets_valloc(_b, _size, _flags)	\
-	alloc_hooks(__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), 1, _flags, NUMA_NO_NODE))
+	alloc_hooks(__kmem_buckets_valloc_noprof(_b, _size, 1, _flags, NUMA_NO_NODE))
 
 static inline __alloc_size(1, 2) void *
 _kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node, kmalloc_token_t token)
diff --git a/mm/slub.c b/mm/slub.c
index 70df0a2e3876..6674caabbb6e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5732,6 +5732,34 @@ void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
 	}
 }
 
+void *__kmem_buckets_alloc_noprof(kmem_buckets *b, size_t size, gfp_t flags)
+{
+	const struct slab_alloc_context ac = {
+		.caller_addr = _RET_IP_,
+		.orig_size = size,
+		.alloc_flags = SLAB_ALLOC_DEFAULT,
+	};
+
+	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
+		b = NULL;
+
+	return __do_kmalloc_node(b, flags, NUMA_NO_NODE, (kmalloc_token_t){}, &ac);
+}
+
+void *__kmem_buckets_alloc_node_track_caller_noprof(kmem_buckets *b, size_t size,
+		gfp_t flags, int node, unsigned long caller)
+{
+	const struct slab_alloc_context ac = {
+		.caller_addr = caller,
+		.orig_size = size,
+		.alloc_flags = SLAB_ALLOC_DEFAULT,
+	};
+
+	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
+		b = NULL;
+
+	return __do_kmalloc_node(b, flags, node, (kmalloc_token_t){}, &ac);
+}
 
 static noinline void free_to_partial_list(
 	struct kmem_cache *s, struct slab *slab,
@@ -7106,26 +7134,10 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 	return flags;
 }
 
-void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
-			     gfp_t flags, int node)
+static void *__kvmalloc_fallback(size_t size, unsigned long align, gfp_t flags,
+		int node, const void *caller)
 {
 	bool allow_block;
-	void *ret;
-	const struct slab_alloc_context ac = {
-		.caller_addr = _RET_IP_,
-		.orig_size = size,
-		.alloc_flags = SLAB_ALLOC_DEFAULT,
-	};
-
-	/*
-	 * It doesn't really make sense to fallback to vmalloc for sub page
-	 * requests
-	 */
-	ret = __do_kmalloc_node(PASS_BUCKET_PARAM(b),
-				kmalloc_gfp_adjust(flags, size),
-				node, PASS_TOKEN_PARAM(token), &ac);
-	if (ret || size <= PAGE_SIZE)
-		return ret;
 
 	/* Don't even allow crazy sizes */
 	if (unlikely(size > INT_MAX)) {
@@ -7151,10 +7163,60 @@ void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long
 	 */
 	return __vmalloc_node_range_noprof(size, align, VMALLOC_START, VMALLOC_END,
 			flags, PAGE_KERNEL, allow_block ? VM_ALLOW_HUGE_VMAP:0,
-			node, __builtin_return_address(0));
+			node, caller);
+}
+
+void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
+			     gfp_t flags, int node)
+{
+	void *ret;
+	const struct slab_alloc_context ac = {
+		.caller_addr = _RET_IP_,
+		.orig_size = size,
+		.alloc_flags = SLAB_ALLOC_DEFAULT,
+	};
+
+	/*
+	 * It doesn't really make sense to fallback to vmalloc for sub page
+	 * requests
+	 */
+	ret = __do_kmalloc_node(PASS_BUCKET_PARAM(b),
+				kmalloc_gfp_adjust(flags, size),
+				node, PASS_TOKEN_PARAM(token), &ac);
+	if (ret || size <= PAGE_SIZE)
+		return ret;
+
+	return __kvmalloc_fallback(size, align, flags, node,
+				__builtin_return_address(0));
 }
 EXPORT_SYMBOL(__kvmalloc_node_noprof);
 
+void *__kmem_buckets_valloc_noprof(kmem_buckets *b, size_t size,
+		unsigned long align, gfp_t flags, int node)
+{
+	void *ret;
+	const struct slab_alloc_context ac = {
+		.caller_addr = _RET_IP_,
+		.orig_size = size,
+		.alloc_flags = SLAB_ALLOC_DEFAULT,
+	};
+
+	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
+		b = NULL;
+
+	/*
+	 * It doesn't really make sense to fallback to vmalloc for sub page
+	 * requests
+	 */
+	ret = __do_kmalloc_node(b, kmalloc_gfp_adjust(flags, size),
+				node, (kmalloc_token_t){}, &ac);
+	if (ret || size <= PAGE_SIZE)
+		return ret;
+
+	return __kvmalloc_fallback(size, align, flags, node,
+				__builtin_return_address(0));
+}
+
 /**
  * kvfree() - Free memory.
  * @addr: Pointer to allocated memory.

-- 
2.56.1

