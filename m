Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952234;
	b=4gnjzSChLTcZO6zJPXSEAARGh5vH7LfcNLM2ovU+BP4GChDJjG62cgXFPrlmA9scVzNr
	 gl5AuTCXXYBuwQXKICF86ic7VmbJ1XZgAZVwnwu10TVIno2HCT2w6ihFAVStxX3/YEaXK
	 7oe8myDLL0DAws0DTScomTiLjAg7sfrpghQwOJMSORXdgImmEiiGJnHgwppt78Rdsj7Ke
	 NWXK0lotP8G2Wxoi5zN2J6wTGH1hxhNiLmUF7EL1RE21ya3hT3zL6xOyzgxzddOxVuzcR
	 K3tElGv4so9L7QNNgpRrbSjz7Zw3/mGpKdZm5M1vKsBaqYOd45jzJ0iIHZr+WGCAC7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8PaA3W6212Dyis47Nq4cJe1H4XdQ8rUDPqkRzhbwtFg=;
	b=AY2ttupWIp4lYWP+rNbKjMa/fZaL04d7fW1RvU0YndPSK5sHdG1xpfR9pipycB4GFW0q
	 2giW7kbXk/xQIbGIWeYaRkY13xCbTSn/Z2GN/UQqc1IjarVyBHm/RlTVClkKcr9ZtUC9W
	 MZsB0MzFbp7jdIO2fq9Q7qHNzlwN9kMswOfIzmcRbSV+2VXqx6Np0BdIWkpdhHTsGtfYw
	 6Z7ExXx2bl7M8MZUnARPlSjxItkVH/beqXfgKd9OJsBrys0BDKyMEkF1XwTV24lBft4JT
	 xyK4IYOZXQhTbd2V9r5p+7cX1tQy7q1mWE8j0cHxYJ6/B2xXEzYqzfE0YVj2aXvrl1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCTCD8N0;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51338606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51338606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCTCD8N0
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43bf9548df4so310230fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952233; x=1795557033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PaA3W6212Dyis47Nq4cJe1H4XdQ8rUDPqkRzhbwtFg=;
        b=TCTCD8N0Wh0n3LEQhL2nAGFLQGr8xjQYzRswPRzRijJec5xYn/2Xc8j9mfvwYK7GyY
         f3YB6ATfYMUhv+EjN9IYvu2miub1Waw0LN5DqggW8M/wYutmFxZn6er7JBWzGJ6YvU7J
         fujr/UniJQnimWEyZfqYzAbf5p98mzHMCqetPXNp5DNl1vYPnRZhPxZN1b63giPnPB05
         Jt7cZD3g5vBECGPyKHgNDcJz/REyk8GTHw4C9uAVks95cTZVi5p6/9n7UzzBdEsIsvMJ
         5D9R8oj/pq1KvDZW/O7mksZCw7nwv7FyjyZIV+SzG8O1nxWXYVSqn+HXQw5ofv8JRDyt
         JfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952233; x=1795557033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PaA3W6212Dyis47Nq4cJe1H4XdQ8rUDPqkRzhbwtFg=;
        b=Jf9QytAuHDslRlD2P++CZb46r5DKBr7U38xlojdr8sR1iUjthLaGPo2+K1VIevM4yS
         VeFoHhcdEqtDzRFEWz61jS2IjtP5swVTocHYfWZ2NNNqvGItFfrTilE7hdkDfJJOLPyd
         ZBbgU2X1jA+FIFmQG3yQCzbsZKEjsp4hobEUposTWlmdW99jUbL05WvsPD5P3NdP4yaP
         JuvodJmIW7V15h/zhiXW+uKDeEwUkaE5Kq33Jo4xgYXJ+r4Y0a+KZWZyKjheyngGU9kj
         PRpwP3IlkohcMrZfsMJTnbXbuiZL/2+rg4R9cD8TAGN94ljiQMxKQl/JsA3YjwWCwzdo
         /qSg==
X-Forwarded-Encrypted: i=1; AL+hErHUXqWB/LPf6xM29QMnDhoMAJC8HqjQwVN5ZCa1wmeZECPqp6lmRbf/FVaeUGGY11IxhBIZaf3QRuEOaEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AzLeAJrgTisKa1NKKoJeHlA7Vc8XHYC4PHXW8JRa7zwZ8YTjY
	CS832X9MqKEe4CnJjHbm6Mc1hQz31esRL5Gye7I5CEjtO6l9UaJThqsC
X-Gm-Gg: AYBFou2ThFG/OGuFbwRGBFdABhgipnMppClGz/nUd0RQh6vwc3X6c2Y04qq0an4pCvo
	sUNFhz+rnpN/H9GzxfsXIw0yzhKH2pES0eudg4vsGVnFsh9Bvpy4fcXv6HbsW+rUocO+dZL/TR6
	4MejQUDemaOI5gEFXrjmGDIJy7mJHeSDHZPTimEb4eZtWwcHD3hJt3amsv1u04CGnRFp3GZoREa
	Uzr/FZVBSi6HC4fRe/hRcIRdrSXTn6pAHO4giYUYsWz/YQqFCvtQhyuXDRoCZd0GGRggEnbdHTU
	6sPX6LIzx5OeN1WSoTlyBeCkUqrhtgJ05LYo+Ffsp5YmLQSyCKp/HL8mYim7cqW80zcJzWvgxbc
	ItMvydGQGSvxCJ8pW6fcFpB3bbvHKGCaJ2E8IlwLFdMTYM04PnP3g8ZQOv18nyK2iwC75vE0jcR
	wYSYZ8Qgp2/VX4X6X0FBl6QfDoM4mV+LWFVr0c5bqZaqaiTv9QBnwlLlKTqnkkVKih9DJbh1McQ
	ioQ7ho3zRbgV/CmSDDUeyYMD3CFgZBT4Q7LAqN3EIq22ESc4AvXve0BEbkNkcNMH5/OX8sLwfdD
	j18FCf5ZnM7Pw35rVod5ItPv4sZucNfA143QKfPt0ghrk8Q4AUwsovLhdjtRdEim+GKrwA9MDKT
	4MEhE+oJmAQsNDQOMXxK6My55Eybc6UsG90ZHTw==
X-Received: by 2002:a05:6870:2e96:b0:42c:49c7:a499 with SMTP id 586e51a60fabf-4b75754e3d4mr478558fac.3.1794952232865;
        Tue, 17 Nov 2026 13:50:32 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744c1e070sm504943fac.14.2026.11.17.13.50.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 13:50:31 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] tools/mm/page_owner_sort: fix slab allocator labelling
Date: Tue, 17 Nov 2026 13:49:47 -0800
Message-Id: <20261117214947.13471-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

page_owner_sort labels a page as allocated by slab when the page flags
in the "PFN" line contain "slab". Since commit 46df8e73a4a3 ("mm: free
up PG_slab") slab is a page type and is not printed there any more, so
slab pages are reported as allocated by OTHERS.

Also look for the slab page allocation in the stack trace, as is done
for vmalloc. The frame is new_slab(), or allocate_slab() when new_slab()
is inlined, as in the example in Documentation/mm/page_owner.rst. Slab
pages allocated before page_owner is initialised have no stack trace
and are still not labelled.

Fixes: 46df8e73a4a3 ("mm: free up PG_slab")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
Tested on v7.4-rc3 in QEMU: --cull=ator finds 1280 SLAB records, 0 before.
Found and written with the help of an AI coding assistant.

 tools/mm/page_owner_sort.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 6c2ac5d9dc4b..453da5ba85c5 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -489,7 +489,8 @@ static int get_allocator(const char *buf, const char *migrate_info)
 
 	if (strstr(migrate_info, "CMA"))
 		allocator |= ALLOCATOR_CMA;
-	if (strstr(migrate_info, "slab"))
+	if (strstr(migrate_info, "slab") || strstr(buf, "new_slab") ||
+	    strstr(buf, "allocate_slab"))
 		allocator |= ALLOCATOR_SLAB;
 	tmp = strstr(buf, "__vmalloc_node_range");
 	if (tmp) {

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.39.3 (Apple Git-146)

