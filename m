Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556052;
	b=l/12VX0g/dxRApllaRntla0uw9pXa2KkAkZo09p3d9oDi8V5RydKEA9rkhWewIZHAe0N
	 0pZpQR0ez01eQaI7dT/NOqeBqzNX7jzmnHcy7ithatW7I/PrnjnhYXgX2ulMsgj5q+Q9l
	 RFu/kN/3ATrvUnQOHI6PObj+t4Boyu9wwrBhItaXpksMA7N4kD4883QNDDPxH4/PEy+27
	 3ft6FuTWnUCQbimVpW2SlJxJ2SAATwSgoG0nv5OD0Xxa7i2N9xmJeW6RbjeRRHy0hNwmV
	 LLu4R19o7/5CnNVhSNAnQIRBTmUa6TmecQeq8x0KpV0Frrg8npmTYY910qHQhqYtZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O9lMyeWaR2AVa49Y0bfc4zD6I2/RGDgVBYEZU7qaCoU=;
	b=R4W9yxw4pDKUbbgrZ3hcetf9+zS4OQNsyAPZzkLvG9d2nG+sVhD0oK0206Vvjizff63C
	 8MyUkbmgK92xe4Oh4bpOIjzVV+KHDdOVu13QdBlcaL7yeKPrWlX57Vm+kT802NKckzd0E
	 zWdSJ7OIN7NNO6WXenCHGtH829NkntMjA6p9kClcd2izkyYkWOLO/ePcqgy6TjfYrx+nN
	 F2U2FKa2RHo8gnVIZkgHKOZG2iPh904LiJ+VNJs1DBrb4/UX7blQ+YIQEnTuXro8JJ6zh
	 SdsaVN6s8jbmu/cwta7KtQbmCLYtOFTLj3d36+OhRUD1+cPzt/pmLwhZQPSuTL2gu5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmLl1+G3;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCE5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmLl1+G3
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so5658592c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556051; x=1796160851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9lMyeWaR2AVa49Y0bfc4zD6I2/RGDgVBYEZU7qaCoU=;
        b=BmLl1+G3ZH6+c5VVnAmGmT9Omfce7d3hpxSsCSV+KZQAMBmC/cZ8/hdcgKiSapeFgu
         CPnU9XWPc4owJpKpRcKClt6zXGnSMn1VoEMEqBLrZfcWKaLdK0xDNV6bpRagoK5engx/
         lDdR9Ej4UchNA19tJUpCjWhJ77zNzahgtWNqIC6alvczb6SR8xkz9OpZJGSQMUJK1pN8
         qUvyf/oLvp3HSUqU3I13MrHeN0WYW/pGzoQiq8nyIQLKnGJmP8YrTtcs08W+sqm72zJ6
         GVurAfx3fg2mSJQZni7IeZRcbISOaIvIBat7T723CZEYtzla2uqfrEjMvQx3CxRqONm+
         8Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556051; x=1796160851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9lMyeWaR2AVa49Y0bfc4zD6I2/RGDgVBYEZU7qaCoU=;
        b=bPRZLLU2rp8SV758KVuU6jnw/VahifFcQMvUvIATEaa6LZxPCjqC3GTYYzDrD4Mg6L
         qlyk8d0+i2fI9oVpnMWRRX+sdblmVs5FO54gCpnbCznQPR64RXuFNtCOEGmAB5h6njDV
         eLILXEd5WPl5oAzIRqRRpfQ9lRt+RW/sk0PqAFfTfIXvcOU9T2ZtVN3g9lV/Fr7BkRf7
         KmPk5+gNZRneHt9t6rPReTjiHRcXovTIOVSWj5dxEc298x2kVZVwrqI6Xfk3gmhxYJ+e
         lJu/dBgaKUIbeLxRHEFcScS7mduIAnxuaNGKSKkVVrFTLY+djIdm3x6A9sDnEmr22AP/
         aLZw==
X-Forwarded-Encrypted: i=1; AL+hErEaeOMImNPDx+5sO3YWbjwoWWzzQJ98znupkQ4B26Q/aTci69ufCPuPZZBGEvVlmWj37Wm61bRTBWLo6C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IGDcyRMAnscZDlc8vkOFGBhJ25bOQrVpDvtPjddH+b/QlUVeG
	dCxvDCCRg5zOcXcFoO/AlWICEI1th5dB6HLHN8V8hHlmSnLoPp53We+G
X-Gm-Gg: AZFdTZdck/WcJ36wUeEy1HUiuoHa2QU41rosKeXfhNB9AaCFgkMXIBiifVRNBCR/p3N
	+m+/GPEvPbd4NfzjrfD06SI38pZn9358ZSvLceiawFeeNKJUBBPY/MiZq4hZUZ+5UUdsh5rmB7m
	ZaSONge2M8G5FDy9d504iIZRhnfkrzI4EBqIMtZFT1OzN8bfP1vNADSZY2oENkHO0juw/kH3ZRv
	x7liMKracivgrubiAirooedPnxHZ+0rUX6paXi9ZZ8cImtpUe/Os6E6f8HkFx7gDDJX2gmChqI0
	cwUHXRUKrkesWp05surVsR6bodi1siJlV9nw21k2EPQmM28Y92SVL7fStS68zw2zBSyABkN7gW1
	OkLZj/6FjoIcEkU1kWF2Xrw8E7ZuRClld+96dBF/o6TNU/kOBYZPLrv9jrvSBH2KUsbAZNBwijA
	vEb9G60FLdxu3vbuIDidM4DliBp3JCZmeDfCGCP4x9t5g3RTN0WSiNWS+r1HIjt3cgEYE6jV7Fz
	csSlwwoGsT9QfAfeEAXWLnUdxRXfn/Ql+wRsDvw5Gv70Nekk65blskUpfjf6Uo6bPvy1sBMuHw5
	xCx3xUE2MUc9Z9T3auWFfhECqoYBNUYojrGccVothKBFO9Qkc4cnwdXeRaYG0AAtlzytCdb9LiX
	MDNbW6LpYRYo=
X-Received: by 2002:a05:7022:b0c8:b0:1b2:6855:998a with SMTP id a92af1059eb24-1b556911007mr14191850c88.34.1795556051100;
        Tue, 24 Nov 2026 13:34:11 -0800 (PST)
Received: from dev-oss-0.tail8d7c7c.ts.net (c-73-70-201-200.hsd1.ca.comcast.net. [73.70.201.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm43704981c88.7.2026.11.24.13.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:34:10 -0800 (PST)
From: Qian Xiao <heyheyco@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	Qian Xiao <heyheyco@gmail.com>
Subject: [PATCH] xarray: fix index jumping backwards in xas_find_marked()
Date: Tue, 24 Nov 2026 13:34:09 -0800
Message-ID: <20261124213409.2224472-1-heyheyco@gmail.com>
X-Mailer: git-send-email 2.53.0
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
xas_find() does. Keep skipping sibling entries at the return site.

The userspace XArray test suite passed. The kernel was not built.

Fixes: b803b42823d0 ("xarray: Add XArray iterators")
Cc: <stable@vger.kernel.org>
Signed-off-by: Qian Xiao <heyheyco@gmail.com>
---
 lib/test_xarray.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xarray.c      |  12 ++++--
 2 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/lib/test_xarray.c b/lib/test_xarray.c
index 615f7730a5bd..ddc392d42d29 100644
--- a/lib/test_xarray.c
+++ b/lib/test_xarray.c
@@ -1316,6 +1316,109 @@ static noinline void check_multi_find_4(struct xarray *xa)
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
+out:
+	xa_destroy(xa);
+	XA_BUG_ON(xa, !xa_empty(xa));
+#endif
+}
+
 static noinline void check_find_1(struct xarray *xa)
 {
 	unsigned long i, j, k;
@@ -1440,6 +1543,7 @@ static noinline void check_find(struct xarray *xa)
 	check_multi_find_2(xa);
 	check_multi_find_3(xa);
 	check_multi_find_4(xa);
+	check_multi_find_marked_nonleaf(xa);
 }
 
 /* See find_swap_entry() in mm/shmem.c */
diff --git a/lib/xarray.c b/lib/xarray.c
index 48f440d114e1..4d943791a7b4 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -1495,6 +1495,14 @@ void *xas_find_marked(struct xa_state *xas, unsigned long max, xa_mark_t mark)
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
@@ -1507,10 +1515,8 @@ void *xas_find_marked(struct xa_state *xas, unsigned long max, xa_mark_t mark)
 
 		if (!advance) {
 			entry = xa_entry(xas->xa, xas->xa_node, xas->xa_offset);
-			if (xa_is_sibling(entry)) {
+			if (xa_is_sibling(entry))
 				xas->xa_offset = xa_to_sibling(entry);
-				xas_move_index(xas, xas->xa_offset);
-			}
 		}
 
 		offset = xas_find_chunk(xas, advance, mark);
-- 
2.53.0

