Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457912;
	b=a8OnZeMr6ukpocGcJKE7QBE6IGeGnwGSCuf244+icEJFbBotjs5Io/7Dhm21cPF0YASq
	 tFBsOkb1kOdkzxCPgyyIxJeyCjmYz7CRg8+0mC9MeGDzRqIPlosQxbi3Y7RkhwKoSAT72
	 UTvxe0fAAOoLUhknTJ5uQF5kMa5hWZXv+Pr7q6nXDrEw9hp8WRN5InKZZDN+5vBw1Ywzr
	 k5qc4ILSnoMKbc6qH8QfUtMkN8MVX4XqU57EnCbu5GXfebvWPrLgTX2hhwboEU530rxR0
	 Nh/lIm0rSVSL1JqxXpe2icggQ8G14BqlU9cQRAuBMz95sFvDmZQe2FgLS0yLb9+H4CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=StHkoBAdAlawOIXQLWKads0UJny1AZdhexBmHXAPI9Y=;
	b=QhQm1zWm19CxWICKhjO03ycIBMKo1ArxmqUjVqH0bye8gqIX0aKS4ZnDcVVAiAqsitzk
	 7YIUr4t2Aj7D+xXbXCen/TTryIh/K8TQ1Ss0Zf5GAkx4oYqagoYMtydPSlfp4zkFOMnxZ
	 W/isOkaaPwAI39IdAjrZfA/optM43H7gt5QXc6xH2aFSFKL54NK4NUhbEHZ4NTEiD5VEI
	 W7nFBLT3IQYaTxxb25YZu/AebRqxJKx+LqZcDWPEPB+YGfqOwYCADifWmvFt3nul2CI0r
	 HbPQqacGAPUEEHcl7Y47yfHS2Egx0+UQhKrm4KNzIjDtesC44SyxJMdeRGNSevWOSxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjjJTgnP;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE9F606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE9F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjjJTgnP
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-844a8bf7e25so2005453a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457911; x=1796062711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=StHkoBAdAlawOIXQLWKads0UJny1AZdhexBmHXAPI9Y=;
        b=EjjJTgnPdygpRhTewVlt5HdcK4nrxyrLHfRkGMk/vkEXGFQlllea3BbuzjCmqH+Ion
         PA6JaSoyZFhdPJ6cYZi2ZTQGAEwjJZVB+/kcL3k20CITn6vC/fKJHtaBQpqq0I8RLSCt
         ngpm0134NKU/uqtDAY2PNyTYSfqlPv3Gc6+P6Zcj6WpOYakMIznWZ1DV3FDtbXWu65FA
         3Zy6GBolg6x0IhJWFaYaTYxx8Zl5mzuwtnk9PyrVkVRqiNyKkOakGnFoOiXVvMmwMnXz
         dIOUZoCrph0XXaTAKy3LqmXkwkbWhM9WlDFIM41xnGz6eERrJ/qygz7CdHiE5rT8Mp81
         uzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457911; x=1796062711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StHkoBAdAlawOIXQLWKads0UJny1AZdhexBmHXAPI9Y=;
        b=2uyluyjx1yf4+DAiXbFB5++7X4wzI9GXkChZ3T3p+7VKl0bgs09/gyDAdMQdMLjZ1C
         bst1cWiUFYteQYqaaIg0kJSaoSbxzasrdFzX+cVBVTr6kffJuz534NWI+JJthdFWL7bm
         NyY07gdx3IF3tK3QUF2zGsR3ivmXa6oU0r/+H29ioBnmxM/YbFjJTH7FsJKilOzkhQj1
         cmFkJjq2Eci/zyoAkMOWxQoELG6a+SKwgMmtfi6yJV+Q8aEEFzhwa7GP8WQyCiFNWsVF
         vAHS+B/qXE+HuevQcc48bBwjvOQAtafj2plfXrqXTzZVbD/c1b/L/R8e94ecVEkQc1un
         idkA==
X-Forwarded-Encrypted: i=1; AL+hErEbM1aWThipC07wIEmUpCt9FNkJLFf6aiB/gsX4KjpaNXz7HR3cmZpZiFiYb5E4zWlMsm9ovKhoVd4j2VA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YWKwM3T33n3r7FfdOTzcwQEMwxohlIGesk42t/cfTENm+wloP
	ijk9Vy105xN8LYyBeIxZUYUQeGtwpiFjLg+3MFHZv16x4GzOyYGVIlKS
X-Gm-Gg: AZFdTZchTtfajPsj2kwKm9AL/0+KYa+yNul1nLwNmLLqg/yDVZopPNLKjE+TGEc4zo8
	BXjAqtEMvSEKznnzSgcTPTZ18dhexrSLkfMPxh6z1my9+z/dKSqeN2JiJyGMA5LYHEa5XNqdPEa
	DR5RktrSQWXJbQXpxM/Rb9K7za/tRH6XdLYAr1XclMvY5G6ecgKgvdyUah2MQCiPCLVPSb65mZz
	eB4YO4GmoPonRmh1XzafxgAutj+wYOC7YbMbEoappSlVKZG0hvKlOMbFUkaCXRAIohzhhhjsL7v
	C4pRZb/q9C3pvWAoivdv8RoFUlZ67hp0M0i3vqyOUKKF27vxPka7e53V2P2ATcqcpDHo82kVhgi
	8qkyCewtqP7Ya3w/JoOIzOCG65COuceA8zNr3Ern8Zfg95ydj+tNOKnm5Jnq65yGDwJ7npBCY/B
	j5WVpSm1I5RbD/MD/EvRdJQddlIMvqYzTq8xexAbPgmHHPS3YdG84rr777f4ISCvxCaAMsiFVhT
	7H8uHUdaBhObi7Rtb97rKMEXXibBssHfZVbuYvWmyJZfI9eeFtrSosAArnPYv1ZoTL2bJmxaH/w
	m4kjwEkfg3SlEkC+kcVJwFPUMa8du8cCqnArR+pDaAPLKtAGjUvFFO05cagg
X-Received: by 2002:a05:6808:660e:b0:573:1dfa:f0c2 with SMTP id 5614622812f47-57a0ae27327mr12433757b6e.29.1795457911381;
        Mon, 23 Nov 2026 10:18:31 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5a::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250ef2sm10116253b6e.3.2026.11.23.10.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:18:30 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v4 0/2] mm/page_alloc: get_page_from_freelist cleanups
Date: Mon, 23 Nov 2026 10:18:26 -0800
Message-ID: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
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

v3 --> v4:
==========
- Make kswapd_wmark_pages() static inline, as suggested by Vlastimil.

2 cleanups for vmscan and page_alloc code. The primary goal is to make
get_page_from_freelist a bit easier to read, especially after the new
kswapd zone skip conditions [1].

Based on the latest page_alloc/for-next branch as of 11/18/2026.
Notably, there is a dependency on the aforementioned kswapd zone skip,
677dfdfad244a "mm/page_alloc: only skip kswapd nodes below their kswapd
watermark".

No functional changes intended.

[1] https://lore.kernel.org/all/CAN+CAwNsqWpPoag_XE6bxbrfi6m71xw1NS_wc3h_ShZjNspSjg@mail.gmail.com/

Joshua Hahn (2):
  mm/page_alloc: move the kswapd node skip check into a helper
  mm/vmscan: consolidate promo vs. high watermark checks

 mm/page_alloc.c | 47 ++++++++++++++++++++++++++++-------------------
 mm/page_alloc.h | 12 ++++++++++++
 mm/vmscan.c     | 11 ++---------
 3 files changed, 42 insertions(+), 28 deletions(-)


base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
-- 
2.53.1-Meta

