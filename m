Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720131;
	b=CTufGxSs6ZVR5bV5krJ18JdnlpTmfnT5XTq3NpU0DFv+XnXX9Q/tabgY2/A9zB8IwKwv
	 KxW2yC6jcN1AQEVNX2TDVuJsPU/3h+XVOjXW9fvEZkPMK+ISgVeEmwdGlRFkNaBXZ3CGn
	 Qnpa+KAHsHYTZS02Rw/dn5EIlJ13xk7/hwbIpAZdd3hMdGsZQ8s4SU2SOCsMO8jaT/hvF
	 c3Shl3l+bFik1SmtX/D+PuKxS3bnj7noInWhZLLjApX9SdiQz4+OBS1wQZSnSFVSAtwrM
	 4xmIJ6xShm6rbzi5jTXS9QnvfBLyh1awR2LcOKzdxc0zjmIRIcFoLKxcnva/ph3Jzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9ewvhhUgD+3DTi6q55eZEV6TlKSbwabUrukp4E4TfKM=;
	b=auZL7OgXOmTY28k4KjKwaaO1TZZbxMPNhgNJ4aISQek3aF4zBBH5dBK4RwYDL8IuBFHf
	 dzJ32394C3ZQLXfti6wROALyE2Zk1jguvLL0N/yAJ/iZUSON4fAEHhK0RjwIBq9A9Y6in
	 pFVrX0xAdSKo4b9OpkCR986RZqM0tQUysX6d0p13nrz1wOxh9UmcCE4DZdI+E2qsTQcrj
	 ZxGI6mTnzhlFRgKqA/zUk3+KsdfiJEb0IiuQoBH6LNVUVq8PeJm26+/fxfAykA0LBbmPA
	 c+69S7dAeQ09b9p028zJfqQ4s6spgaSlWgw5kLb3DSrWBlxFBANRsp7QhIL5DM+qX0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMtz5P7g;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372E7606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMtz5P7g
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380c28f9e35so8278252eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795720130; x=1796324930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ewvhhUgD+3DTi6q55eZEV6TlKSbwabUrukp4E4TfKM=;
        b=FMtz5P7gW1yWAgiHcO+m9wAmRu39FXEGTwaJzDQSrTabauU4A5Bet4h6aqkgnZ9rBr
         5V+h1ti3PJ5Vziee3vny2oJwFoPIUuPMtBz5nmX6TVrnCxn1VpQ5Wg2uiTTLB2RO1Yaa
         OYt2bacIJYfJXi9z1vF4L7lnn8bN/kVgEycT90U9C8kQa04GbM14xfIHAKriIbqLErAO
         Uc72c2aW68zxPLbJtPqYA0EPrfJaniQYN1h+8iQtmt04opz+1t/UUKcUAtcEi6hftZyf
         tzBDcAifd2nAWB4zxkPZf1EJJYRa3CfBcFCLk91jPTm/75cTaOcLA+SQ3QrCS/wHJzD4
         97Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720130; x=1796324930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ewvhhUgD+3DTi6q55eZEV6TlKSbwabUrukp4E4TfKM=;
        b=l/lBKXQsI5AB0Tov9VvgnmSZMERtTdj+SYaE22PB6r1xyzKJvJQnyPIpnST0poyk1D
         TdcHePrj3aezG6EDRzatBNVitzeO70FBigRgaT5JAOK6s7Ohlqc67k+TMbWyOu6N8HqX
         GFLIo3pHGoIVB/oaoS59KFZdyJyE/yZ2fCIJuVwZ2hSEebwFnW1JBk4f0PUeOTxzb2j6
         kaN6lbRpCl1D/XQMibrkwhTxeL+o6x2EM1n7TtsidLlQ31YW0cthMOTKlA4EPx6JvHNY
         c4uUTHXFojdWpZFiFwgsBCp5+sjUgS3Cg3Iog9CnENdg8XaSIfz3foD9YaHGAJDSqkFd
         Cmyg==
X-Forwarded-Encrypted: i=1; AL+hErHqS71iZxnne2Gt/vIY+XySDBntG2Y3QzHD/A9O73K+wJDMfE5LGIVQj/iY7s91LMMR8L4ymyQRyNtkkQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l6ZhqdTtHbPjG7oB7319iUcjIfGxt4XV02L205qdKSWVAaZV7
	cPnRfh50a6s4/gz1KNe+BL4E37M9/IefHEYa5SaZHcai2bEjce0H8uKQ
X-Gm-Gg: AZFdTZfLGd89CLi+MZFWGucWIcdtLcSZklcOJJ13A5JPQFsUFj37IpTp8F4XcLcl1c9
	Q///p3fUsxaYjPSKa4BXn4+oCKDUbdhN1l8LT4Rz6r/IJvM+xCtTRDKqV4yHFd5ounDfeiboOUW
	mlZv+3X1RIh8Dxu76MEkE3HVkFEcFZRK9am8gIFdguZ8g93HZON68ycNxmSFy9KrpTHEyn/kF4R
	1M+E1m/xTmderyS4uYNFX9+n4/MuBazOJUUUbiB2hc2EzNgv7ZvC00N+FCP9VmlwcJdKzSGfzL0
	plpD6hQt5ROHKubVup5b7nZ9XnynIaKR3yfhOfelVy3QbMFZXgcWuKJQFB2Eb7O0hxzjh+2Jb4Z
	4d3Ekk8hjZAycsJH1w+W4Rbi1L66oZPkDJPr3FCZGRjzYD60KVJK90+qQFKJVldCRCp0j09uEfr
	8JkJTh18QKAHpGLpAntlJ/78Nn/sHyxRiGcRlAcYZWDbF3qUALP1Zy860K18unvqFIG9GcEd0F0
	eI3R6pPCdEacyiUupBgtdOcUjyUs0d6rb68Zj2EaagO+RtKUfBNu5f/83NgMcBY1BC3Ap7zeeq4
	iNBXC6Dh7kSIs0n+ZN+o9wwnnAhjiNZ6uqh2vwvRLuwgkfgUOeqjdcdogvba6VKEYRc+GRBUR+K
	P51GlwhpDvCg=
X-Received: by 2002:a05:693c:20ce:20b0:381:761b:f335 with SMTP id 5a478bee46e88-3856f94eda0mr23029896eec.6.1795720130090;
        Thu, 26 Nov 2026 11:08:50 -0800 (PST)
Received: from dev-oss-0.tail8d7c7c.ts.net (c-73-70-201-200.hsd1.ca.comcast.net. [73.70.201.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm81307145eec.11.2026.11.26.11.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:08:49 -0800 (PST)
From: Qian Xiao <heyheyco@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	Qian Xiao <heyheyco@gmail.com>
Subject: [PATCH v2] xarray: fix index jumping backwards in xas_find_marked()
Date: Thu, 26 Nov 2026 11:08:47 -0800
Message-ID: <20261126190847.3064508-1-heyheyco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124213424.2224554-1-heyheyco@gmail.com>
References: <20261124213424.2224554-1-heyheyco@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xas_find() keeps xa_index when a lookup starts inside a multi-index
entry stored in a non-leaf node, and aligns xa_offset with that index
before advancing. xas_find_marked() still does neither.

Walking from a sibling slot to the canonical slot calls
xas_move_index(), so a start index such as 127 becomes 0. After the
cursor has been walked, xa_offset can also stay on the canonical slot
while xa_index is inside a later slot of the same entry. The next
xas_find_marked() then recomputes xa_index from the stale offset. If
the entry is split, the call returns a marked entry below the index
already reached. xas_find() returns the following entry in the same
situation.

Resolve the sibling without moving xa_index. Before advancing a cursor
that has already been walked, set xa_offset from xa_index the same way
xas_find() does. xas_next_marked() uses that path when the offset and
index disagree, as xas_next_entry() already does. xas_pause() aligns
xa_offset before its existing calculation, so the resume index stays at
the end of the entry.

If the tree changes while a sibling is being resolved, do not descend
into a node that does not contain xa_index, and do not let
xas_move_index() decrease xa_index. Return XA_RETRY_ENTRY instead.
Callers that use xas_retry() restart from the same index.

The userspace XArray test suite passed. The kernel was not built.

Fixes: b803b42823d0 ("xarray: Add XArray iterators")
Cc: <stable@vger.kernel.org>
Signed-off-by: Qian Xiao <heyheyco@gmail.com>
---
v2:
- Use the slow path in xas_next_marked() when the offset and index disagree.
- Align xa_offset in xas_pause() so the resume index stays at the end of
  the entry.
- Return XA_RETRY_ENTRY when a concurrent change would descend into the
  wrong node or decrease xa_index.

 include/linux/xarray.h |   3 +-
 lib/test_xarray.c      | 165 +++++++++++++++++++++++++++++++++++++++++
 lib/xarray.c           |  23 +++++-
 3 files changed, 187 insertions(+), 4 deletions(-)

diff --git a/include/linux/xarray.h b/include/linux/xarray.h
index be850174e802..8c42d899d94c 100644
--- a/include/linux/xarray.h
+++ b/include/linux/xarray.h
@@ -1778,7 +1778,8 @@ static inline void *xas_next_marked(struct xa_state *xas, unsigned long max,
 	void *entry;
 	unsigned int offset;
 
-	if (unlikely(xas_not_node(node) || node->shift))
+	if (unlikely(xas_not_node(node) || node->shift ||
+			xas->xa_offset != (xas->xa_index & XA_CHUNK_MASK)))
 		return xas_find_marked(xas, max, mark);
 	offset = xas_find_chunk(xas, true, mark);
 	xas->xa_offset = offset;
diff --git a/lib/test_xarray.c b/lib/test_xarray.c
index 615f7730a5bd..02e6843d0227 100644
--- a/lib/test_xarray.c
+++ b/lib/test_xarray.c
@@ -1316,6 +1316,170 @@ static noinline void check_multi_find_4(struct xarray *xa)
 #endif
 }
 
+static noinline void check_multi_find_marked_nonleaf(struct xarray *xa)
+{
+#ifdef CONFIG_XARRAY_MULTI
+	unsigned int order = XA_CHUNK_SHIFT + 1;
+	unsigned long next = 1UL << order;
+	unsigned long start = next - 1;
+	XA_STATE(xas, xa, start);
+	XA_STATE_ORDER(split, xa, 0, 0);
+	void *entry;
+	unsigned long i;
+
+	/* Multi-index entry in two slots of a non-leaf node, both marked. */
+	xa_store_order(xa, 0, order, xa_mk_index(0), GFP_KERNEL);
+	xa_set_mark(xa, 0, XA_MARK_0);
+	XA_BUG_ON(xa, xa_store_index(xa, next, GFP_KERNEL) != NULL);
+	xa_set_mark(xa, next, XA_MARK_0);
+
+	rcu_read_lock();
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != xa_mk_index(0));
+	XA_BUG_ON(xa, xas.xa_index != start);
+
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != xa_mk_index(next));
+	XA_BUG_ON(xa, xas.xa_index != next);
+
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != NULL);
+	rcu_read_unlock();
+
+	xa_destroy(xa);
+	XA_BUG_ON(xa, !xa_empty(xa));
+
+	/* Split the multi-index entry after a lookup begins inside it. */
+	xa_store_order(xa, 0, order, xa_mk_index(0), GFP_KERNEL);
+	xa_set_mark(xa, 0, XA_MARK_0);
+	XA_BUG_ON(xa, xa_store_index(xa, next, GFP_KERNEL) != NULL);
+	xa_set_mark(xa, next, XA_MARK_0);
+
+	xas_set(&xas, start);
+	rcu_read_lock();
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != xa_mk_index(0));
+	XA_BUG_ON(xa, xas.xa_index != start);
+	rcu_read_unlock();
+
+	xas_split_alloc(&split, xa_mk_index(0), order, GFP_KERNEL);
+	if (xas_error(&split)) {
+		XA_BUG_ON(xa, true);
+		goto out;
+	}
+	xas_lock(&split);
+	xas_split(&split, xa_mk_index(0), order);
+	for (i = 0; i < next; i++)
+		__xa_store(xa, i, xa_mk_index(i), 0);
+	xas_unlock(&split);
+
+	rcu_read_lock();
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != xa_mk_index(next));
+	XA_BUG_ON(xa, xas.xa_index != next);
+
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != NULL);
+	rcu_read_unlock();
+
+	xa_destroy(xa);
+
+	/* Nothing marked past the index already walked. */
+	xa_store_order(xa, 0, order, xa_mk_index(0), GFP_KERNEL);
+	xa_set_mark(xa, 0, XA_MARK_0);
+	XA_BUG_ON(xa, xa_store_index(xa, next, GFP_KERNEL) != NULL);
+
+	xas_set(&xas, start);
+	rcu_read_lock();
+	entry = xas_load(&xas);
+	XA_BUG_ON(xa, entry != xa_mk_index(0));
+	XA_BUG_ON(xa, xas.xa_index != start);
+	rcu_read_unlock();
+
+	xas_set(&split, 0);
+	xas_split_alloc(&split, xa_mk_index(0), order, GFP_KERNEL);
+	if (xas_error(&split)) {
+		XA_BUG_ON(xa, true);
+		goto out;
+	}
+	xas_lock(&split);
+	xas_split(&split, xa_mk_index(0), order);
+	for (i = 0; i < next; i++)
+		__xa_store(xa, i, xa_mk_index(i), 0);
+	xas_unlock(&split);
+
+	rcu_read_lock();
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != NULL);
+	rcu_read_unlock();
+
+	xa_destroy(xa);
+
+	/* Pausing resumes at the next marked entry, without repeating. */
+	xa_store_order(xa, 0, order, xa_mk_index(0), GFP_KERNEL);
+	xa_set_mark(xa, 0, XA_MARK_0);
+	XA_BUG_ON(xa, xa_store_index(xa, next, GFP_KERNEL) != NULL);
+	xa_set_mark(xa, next, XA_MARK_0);
+	xas_set(&xas, start);
+	rcu_read_lock();
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != xa_mk_index(0));
+	XA_BUG_ON(xa, xas.xa_index != start);
+	xas_pause(&xas);
+	XA_BUG_ON(xa, xas.xa_index != next);
+	entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+	XA_BUG_ON(xa, entry != xa_mk_index(next));
+	XA_BUG_ON(xa, xas.xa_index != next);
+	rcu_read_unlock();
+
+	xa_destroy(xa);
+
+	/*
+	 * A leaf multi-index entry.  The next step must not use a canonical
+	 * slot left behind by the first lookup.
+	 */
+	if (XA_CHUNK_SHIFT > 2) {
+		unsigned int leaf_order = 2;
+		unsigned long leaf_next = 1UL << leaf_order;
+		unsigned long leaf_start = leaf_next - 1;
+
+		xa_store_order(xa, 0, leaf_order, xa_mk_index(0), GFP_KERNEL);
+		xa_set_mark(xa, 0, XA_MARK_0);
+		XA_BUG_ON(xa, xa_store_index(xa, leaf_next, GFP_KERNEL) != NULL);
+		xa_set_mark(xa, leaf_next, XA_MARK_0);
+
+		xas_set(&xas, leaf_start);
+		rcu_read_lock();
+		entry = xas_find_marked(&xas, ULONG_MAX, XA_MARK_0);
+		XA_BUG_ON(xa, entry != xa_mk_index(0));
+		XA_BUG_ON(xa, xas.xa_index != leaf_start);
+		rcu_read_unlock();
+
+		xas_set(&split, 0);
+		xas_split_alloc(&split, xa_mk_index(0), leaf_order, GFP_KERNEL);
+		if (xas_error(&split)) {
+			XA_BUG_ON(xa, true);
+			goto out;
+		}
+		xas_lock(&split);
+		xas_split(&split, xa_mk_index(0), leaf_order);
+		for (i = 0; i < leaf_next; i++)
+			__xa_store(xa, i, xa_mk_index(i), 0);
+		xas_unlock(&split);
+
+		rcu_read_lock();
+		entry = xas_next_marked(&xas, ULONG_MAX, XA_MARK_0);
+		XA_BUG_ON(xa, entry != xa_mk_index(leaf_next));
+		XA_BUG_ON(xa, xas.xa_index != leaf_next);
+		rcu_read_unlock();
+	}
+
+out:
+	xa_destroy(xa);
+	XA_BUG_ON(xa, !xa_empty(xa));
+#endif
+}
+
 static noinline void check_find_1(struct xarray *xa)
 {
 	unsigned long i, j, k;
@@ -1440,6 +1604,7 @@ static noinline void check_find(struct xarray *xa)
 	check_multi_find_2(xa);
 	check_multi_find_3(xa);
 	check_multi_find_4(xa);
+	check_multi_find_marked_nonleaf(xa);
 }
 
 /* See find_swap_entry() in mm/shmem.c */
diff --git a/lib/xarray.c b/lib/xarray.c
index 48f440d114e1..eadb39894913 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -1283,6 +1283,9 @@ void xas_pause(struct xa_state *xas)
 	if (xas_invalid(xas))
 		return;
 
+	if (node && xas->xa_offset != get_offset(xas->xa_index, node))
+		xas->xa_offset = get_offset(xas->xa_index, node);
+
 	xas->xa_node = XAS_RESTART;
 	if (node) {
 		unsigned long offset = xas->xa_offset;
@@ -1495,6 +1498,14 @@ void *xas_find_marked(struct xa_state *xas, unsigned long max, xa_mark_t mark)
 		xas->xa_offset = xas->xa_index >> xas->xa_node->shift;
 	}
 
+	if (advance &&
+	    xas->xa_offset != get_offset(xas->xa_index, xas->xa_node)) {
+		if (!xas->xa_node->shift)
+			xas->xa_offset = ((xas->xa_index - 1) & XA_CHUNK_MASK) + 1;
+		else
+			xas->xa_offset = get_offset(xas->xa_index, xas->xa_node);
+	}
+
 	while (xas->xa_index <= max) {
 		if (unlikely(xas->xa_offset == XA_CHUNK_SIZE)) {
 			xas->xa_offset = xas->xa_node->offset + 1;
@@ -1507,14 +1518,18 @@ void *xas_find_marked(struct xa_state *xas, unsigned long max, xa_mark_t mark)
 
 		if (!advance) {
 			entry = xa_entry(xas->xa, xas->xa_node, xas->xa_offset);
-			if (xa_is_sibling(entry)) {
+			if (xa_is_sibling(entry))
 				xas->xa_offset = xa_to_sibling(entry);
-				xas_move_index(xas, xas->xa_offset);
-			}
 		}
 
 		offset = xas_find_chunk(xas, advance, mark);
 		if (offset > xas->xa_offset) {
+			unsigned long index = xas->xa_index;
+
+			index &= ~XA_CHUNK_MASK << xas->xa_node->shift;
+			index += offset << xas->xa_node->shift;
+			if (index < xas->xa_index)
+				return XA_RETRY_ENTRY;
 			advance = false;
 			xas_move_index(xas, offset);
 			/* Mind the wrap */
@@ -1532,6 +1547,8 @@ void *xas_find_marked(struct xa_state *xas, unsigned long max, xa_mark_t mark)
 			continue;
 		if (!xa_is_node(entry))
 			return entry;
+		if (xas->xa_offset != get_offset(xas->xa_index, xas->xa_node))
+			return XA_RETRY_ENTRY;
 		xas->xa_node = xa_to_node(entry);
 		xas_set_offset(xas);
 	}
-- 
2.53.0

