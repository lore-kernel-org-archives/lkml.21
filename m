Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136848;
	b=gMQyHijLZ26BGQ9aNRs6y0FyHmYSPe4VQxWEgrbnYHiX4FjiyXGKx4pQ8MYQSXwzHRsd
	 tt0HuSfuOBhPWOsa7+Yo7eKYSPKqMrB25Dx5N1pu0EhI9kFXjTl1Mo3wHainXNsYN655g
	 mOw8DgyL3QFwOWAxhx+yiTOzaqbVIoEDdQ/dHtv5lZ7hboltBia6DE0IxSiArOM+dT2wa
	 aTPjKSQ8MDbkHGsItyMnZk0hwWS2qC/2JbCocRsf0xijHnFtNzlw+Zuvggzd7fB/0keLf
	 LrdARNB+KYIakMJ8/ge8qxEUZBEA/OAMlhjgDelbo2TixBhDG2h4pHUBd4BsbrmDj4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=G58QRfdEQzG7y46akZhuXorptjXMkpo3OuC8LCJ2NV0=;
	b=Ofa7p2XKyf9Y7BGw6GXQzubQDY0pBO1ZSmOmLrQ9E/ZJ/tRuwKw/Uu15zXajYhxhPtYF
	 GGWjx003tca5wEZzoXJHUaMkeCCYz5vdPgMF7DBvrsom9scQrF4jE4EaDnPDvLwgrsGum
	 xLzrvgTTzRnazQdliLW+mq1wolZxcUm3GeWd4Hh9jDy4gxrI1SC2wGxxjBW8neTsBr98A
	 Yzf5s5y3OLKHUHNmt1oYYiEsmfArF6AxY95eCUgmvFWV+YzLtbLCBaX5JvdU1MUB3HqnL
	 Sj4rM2qsW/i5dxwatLMP7yl/5UIetPZgs4vOOQipNSh3Uc1yvyBX/aDbSHmDhEfgLvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i/NRDXeT";
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6260A5BE3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD6260A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i/NRDXeT
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b776f5a7c0so290136a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136846; x=1795741646; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G58QRfdEQzG7y46akZhuXorptjXMkpo3OuC8LCJ2NV0=;
        b=i/NRDXeTSYEfEezD5V1XCNniH5DnQR9vfzm+vN5gKK7HSmUVNFLhUWOtZn4LXRiIJQ
         7lOr84/ZOjXvt7ritNVVu/osy3RhSUyU3FCk+Pw9T0yIlE0tS9M7K5m0c5cvKVY4vcRh
         vDQGrnMk78tO+qeqC8ad8KBdcWSowlXT2FagYVCCZtB/EJiLRo+yck6vYxjyaPewi4vR
         UL0d9YPpJ3xayrffRlaaHIljkm3oTX4gKw2dicVuQ8h3dJIW5pRCbKERyujSv1BcD6ie
         J2zwyS0rwBonSC+WfgiN2c/3IOZmtmGZKJHfgc25vf4U4QDfGhET0Dxyxo5sdg5s1aQI
         Jd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136846; x=1795741646;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G58QRfdEQzG7y46akZhuXorptjXMkpo3OuC8LCJ2NV0=;
        b=V+g8xA8ONZaFPqvJsq4sUI3lC/wC+PDrvWcRFzsmGnbwwYs/Jy9GQm2uLQV95GYzg4
         VQO1Wjkfkgws27TT3iBQu08IVt9e1aegurOcTErW/s4/uDtmF46rLYnEVsXf+9QdD7Bz
         PKQhpIMrFdsdGaMBUiP6FchRPWRYFU9E2O1dB/Ce562cdM7PN85u6//G9C0mxwHUj6hZ
         kPaSTGItwtGgtTWsKUC8Hbbc36SReH0Ru+q4e4TcW3luUo9SmLdCayHPBhJvZAGMGVNy
         zR1nvfAN8WLRaIsFHTVOHEg+ObAm2TBp7qU9XhT9axa7jwoRQqpe46CJmR/hiWU7ut1M
         TXFw==
X-Forwarded-Encrypted: i=1; AL+hErGEbvSJCaXRL3Yb1lnzqcTgr8SzrbN0CUFWWpTDVVtPxSQW1UF34NFxLNtzG36BFVP1jLxf0paNlUpLLJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cbTIk5njfdeXkBtOJ/sGxfQe6s9iTU7JbxOIZZMtc27UdI5hS
	xw734/DDTNjx3sVODeAtwLtDg89NFEz2eGrCd8MyqfA2GmVhDO6NxbjBfE/5lmMdaa5UpEQORaK
	o7eiiKg==
X-Received: from edag35.prod.google.com ([2002:a05:6402:3223:b0:6b7:7926:2af4])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1c05:b0:6b9:c43d:892
 with SMTP id 4fb4d7f45d1cf-6ba37c7bebdmr666829a12.1.1795136845436; Thu, 19
 Nov 2026 17:07:25 -0800 (PST)
Date: Fri, 20 Nov 2026 01:06:52 +0000
In-Reply-To: <20261120010655.467825-1-lrizzo@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120010655.467825-23-lrizzo@google.com>
Subject: [RFC PATCH v3 22/25] net/libeth: Use GFP_KERNEL when pre-filling RX rings
From: Luigi Rizzo <lrizzo@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Naman Gulati <namangulati@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

libeth_rx_alloc() is called both when pre-filling RX fill queues in
process context (for indices 0 .. fq->count - 2, when buf->truesize is
still 0) and when refilling RX buffers from NAPI softirq.

Use GFP_KERNEL during the initial process-context ring fill so page_pool
and PISA page allocations (including set_memory_decrypted() under CoCo)
are not forced into GFP_ATOMIC context.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/net/libeth/rx.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 0e736846c5e8a..4361dbcf03cb1 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -106,10 +106,17 @@ void libeth_rx_fq_destroy(struct libeth_fq *fq);
 static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
 {
 	struct libeth_fqe *buf = &fq->fqes[i];
+	/* fq->fqes is zero-allocated and pre-filled in process context for
+	 * indices [0 .. fq->count - 2]; slot fq->count - 1 is first allocated
+	 * in NAPI. Use GFP_KERNEL for initial pre-fill and GFP_ATOMIC after.
+	 */
+	gfp_t gfp = (buf->truesize || i == fq->count - 1 || in_softirq()) ?
+		    GFP_ATOMIC : GFP_KERNEL;
 
 	buf->truesize = fq->truesize;
-	buf->netmem = page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-						 &buf->truesize);
+	buf->netmem = page_pool_alloc_netmem(fq->pp, &buf->offset,
+					     &buf->truesize,
+					     gfp | __GFP_NOWARN);
 	if (unlikely(!buf->netmem))
 		return DMA_MAPPING_ERROR;
 
-- 
2.56.1.809.ga0b61035b5-goog

