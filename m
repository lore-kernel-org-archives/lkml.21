Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136839;
	b=CyDkcu7ve4JVu7vabbSwz4vBwExDDS/3mhRD9J2+JRs7P8I11S4zvvgtA53/eaWgrFm9
	 j1flZC2B/2dkUaG3+vZvwIiY8SEcUhkXBwfCMwQL6Q0qWT0zipfqeT0pY+RAU6mGfRabc
	 nMOe/Q9huhK1erVSXLHb2K86+C4CLq7a+EyXUu0jLFXK0SWNPb371et6Mn2yY9LFkUgm7
	 P6byDzfLSGXsdsJLB59vJT4QZUzfpsL/HD74me6N/SywUisbVWoMGhbXnVy6dgxBZo7cl
	 +PfHRF9IocyJ8tytXgjcAP6/Ghk1W6q06/s2yiAQTXc4Sp3JfBC0PAWcCQkQvKoyuqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vXU5FE3T392RxN9QNel254D35psegmPr29XGG2IaIcw=;
	b=pUUOBEU/ARdv0dHtrmMfLMJv+MCoqYnIXpCkw+pzLDSY299DbBq5d3niZbL4MQjLCunc
	 QuChSZYYN4gkvb1ZDR++swic7R+0XyP1E3w9rxWjnZAipebw7hC5dDyYgVS73KBc5sPzp
	 dzJcfswRcIpIk75Snyr5m+QRzeUnE5PXajQtoyHYwkVcBMFvaZztfzF4qmiJjkhioZNS+
	 w4Vdt2morVq6xw+gj9BXaAm/WPHjvxsJX5xFPwCphb4hPTseC2Hps76IgZtGLY+k6tJFN
	 XaKdl9VG+vxX7dJcTEYZoknBTTiYxFGG0QOa88yskMs59zzJX4C0uzjznrKIAoJmlkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JN1XES1B;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1860A3810
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F1860A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JN1XES1B
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c505f26e9e1so24315766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136838; x=1795741638; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXU5FE3T392RxN9QNel254D35psegmPr29XGG2IaIcw=;
        b=JN1XES1B+9xWtZQpoeMZD1UeWfT8QzjJSgx/sA0JgmGXSEnoJmVjMhf9okWGToRyHI
         UC4p+4/gQ3721KhE81Am0R88BKIzA+63rA89MYsqczHOOjNk/NbKL5GRSVvSLYdrwFx7
         veJLApSlferalQefLmHR+mCgrOfnX40PeDyA8ugXlIHH0G+Vd1uNUEnIfQ7P5ZkksIPy
         3dw8vuxjXyNwYxSor20m6+Xloh49B3bI8AXiF4P+b8O2Ogb6X96BGDOB2a6/v24AIV38
         +Xk17oB24yyJNkX/CpxmOpCNeqIP9D9jG6kcaTsguL1bNkWDRHMQZcaWGRXk5eOxSdfT
         JBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136838; x=1795741638;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXU5FE3T392RxN9QNel254D35psegmPr29XGG2IaIcw=;
        b=TBQQRW+mtoYBMn9yVa18xRRrJzT1vrPYjDcDvL7Gv8inLlL/8J3XjoFy94Ph92qxez
         I5cbPuBF+FpevVccn5RPxL3wdBMQ9gQALmWSReVKSM2ELdUWjY4qIz9jxA7Wnn46maI4
         dytPLOofNhJEqqOeJMO0tA5azEtQ7ucoUApuQ/cJz63k9xl7mzvXwFYkeWjIBny8hPPe
         HVeqfUaIrjglzGYuZHQX7k6u/Vhx/yjszXtmt2uQBgwBjigSq9MJVZqJ+qKzT0uMTtF0
         tJ7HIi0tFj9yJ2Cpeyq17Q3Tx+EwUIOHN4Qfh2erQc5egt65Q6R0CGwZB1DaBfUA6OGz
         U/sQ==
X-Forwarded-Encrypted: i=1; AL+hErGP0bARHuPNXzPuAa8bEbBoNtXDEd5dvqF1jwahtdBCQ6OttbcLoHe3fpFUD5NU/RCyn/WnJE0+3trREUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z1KAWA4kJz3eorTDtyFxEMCVdWfQkN/cYC07Ra1AyCDSsjlFh
	EwEav/H30PdBjIK7mvUuY2zWefhZM9QeJ2tXw2Aumv4Opjdd0/RyhKMLgiypppFmijAGuJulGFp
	JP4QSEw==
X-Received: from ejdlt17-n2.prod.google.com ([2002:a17:907:c651:20b0:c50:cd62:3dd0])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:4fc4:b0:c2e:62af:b6fe
 with SMTP id a640c23a62f3a-c513a5e62e7mr135377366b.8.1795136837193; Thu, 19
 Nov 2026 17:07:17 -0800 (PST)
Date: Fri, 20 Nov 2026 01:06:45 +0000
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
Message-ID: <20261120010655.467825-16-lrizzo@google.com>
Subject: [RFC PATCH v3 15/25] net: Use PISA for page_pool memory
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

When a page_pool performs DMA mapping (PP_FLAG_DMA_MAP) on a device with
pisa_rx_bufs enabled, pass __GFP_PISA_RW to use PISA memory.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 net/core/page_pool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index d7c88c0b67e53..91cae5ba78373 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -16,6 +16,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/page_pool/memory_provider.h>
 #include <net/xdp.h>
+#include <linux/pisa.h>
 
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -622,6 +623,8 @@ static noinline netmem_ref __page_pool_alloc_netmems_slow(struct page_pool *pool
 	 */
 	if ((gfp & GFP_ATOMIC) == GFP_ATOMIC)
 		gfp |= __GFP_NOWARN;
+	if (dma_map)
+		gfp |= pisa_rx_gfp(pool->p.dev);
 
 	/* Don't support bulk alloc for high-order pages */
 	if (unlikely(pp_order))
-- 
2.56.1.809.ga0b61035b5-goog

