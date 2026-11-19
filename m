Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096975;
	b=IOE+4cNvfzVpNuMCGkPwWMu2zBWXxrgZRI52CbEWFRBpe77vrTIW87ooCYloK7qLJnXW
	 ymsmtP73mD5y2nTCNgU4vh6Qi1VtCPDoualM1ALiRN21kZt/jiN5h7D2DwFpQ5ta2ZqTz
	 e9CEmHwoEjFXyHzD2A/KFMH+wUFFU8U6LE9RbhkqBzOAk0JcWPaDUETVMer7796nbEcZk
	 Z67MYHpH+Uha7rq2+xE2PJsu1Zg3MW+ZQe2jyhOUhMLaYfJcWjwX2DMt15TmAtSJ0CJaU
	 jMIZCDsA923QRaax5pOOR3OhidxMHf0REbuFCgkpNxA5O98B/vTDAhejhrfh8e5UYpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096975;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=f/AGc49co9IRdKpA2VFSfedJ8sUlancWLOq8E/XkKss=;
	b=aza0xIh17qQYiSDYedGdg4800MWjXWqnIMgAmz9KRjQjK58tnxZUsAMU22AvGqyZE/JH
	 gAy1rRpZ0eV5uX/+J5yOqzk6LjQsh8fat44ZOc8Bot0PDuBqY018Jr8ag3gG7JcgFq25i
	 wQ2mZ3MkL0xxlKbsJcJwI0yUNeFhHzA9VR7xgJN2ZcmKB3jLMeQd8x+tBVqFv6BiYliTa
	 ZcTlevqoVcT6GpjQSpxxwnE83pPTtQ33D8rFPimf9mAmrXLVDcPTtEQHHVo3z+AZds9f3
	 V4HLSC7fVvwjsVChgWHCIaWH828S5lx+Plp306wpiIgdHtNZeaowWQ+LSMGYsC2muLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzFTbJwt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DA606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzFTbJwt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76651F000CC;
	Thu, 19 Nov 2026 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096975;
	bh=f/AGc49co9IRdKpA2VFSfedJ8sUlancWLOq8E/XkKss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YzFTbJwtNKpqIL0xlMGDibb3ay+gO/KS4DOjC2UA+xv4yIUw2Ua1VdQo54f6D7TvX
	 5WuBwYCsblhJNxukFgISaKRumsvQu1bYz45Cq8IOTu/4n/OrMXE1vb/Sf2UTEV0GgL
	 v7l8lTjRnT8Y6kunFJfNej0wRWxvJZFtV6TlVi0+R5P9unOVjl8KvuXKXjQalxuaUb
	 HyEVoG7oTUmjWEjxAXJtAy+vKdaxbujeiKeBjqwLlGfa0L9IIQNDhhMlAo9J3G84oh
	 Ao+oUKi8z+5/l6/Ts7yBvL0s2byzONhmJTO+6bN4XIxkCQzk7J6ZDWQWF+8tvzeqCf
	 Reb+NfcGUmgtA==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0A4D0198004A;
	Thu, 19 Nov 2026 09:02:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 19 Nov 2026 09:02:51 -0500
X-ME-Sender: <xms:hgH_amOYzRd7dVr8m0X7g4dhd52vpzYJP1__3mwQAoDj21RoOUuaDg>
    <xme:hgH_ajblJ4HPIBLUWaGI1DWJQ136TS6re2StEokZsZvx-Bao24jjuPRzvVL74BJOe
    3slNYq_lo972JdrbJvulUs1XmG_fGDmmYfKnbtCo0NUPooQCSIQPpFi>
X-ME-Received: <xmr:hgH_akajH_cplzEjSWRHxBPGZ_2sXbW5vYbeMz7bc8JNOuF-kKV6XLluWto>
X-ME-Proxy-Cause: dmFkZTGFFndgKVGI0oIvIBSZPYQMK+0+oHzR5AlkCgqNSv1APO1ZQxm+uD+BvHYnVxxgIB
    vSa5Zu78mA2Z2TePm6M6ndOlVZNwLHPnGbsavVyB4WQBW4lwfnz0iuMkTDNVmdXQnJ0z9R
    GSN82/7XQuqaLWFh6FTgvfw5TxqQkzkRqm5vUsD6EckF5MHALw4sle52/BFHjuEU5DQrFj
    O3b3bbvAoOkNVtTr6U35Lw0WpGVSONOa2Xcs273V7ZNh8J0uZ8Mq5q35rHyJnRmjOAZxSu
    Kq9oEepCa16IqD6r3owF4meYch2O/Sla+Ux0SA/V7ySnd6g4D89XLPu9CdxS9eRg7wvICZ
    Dr19o2X6VOMBl6x0ulunXyQZmMptdfIt1lN5VMUsVsVPCH7KeQ6uGqqYNUw/P+kRfDfYke
    VRaaL/4HNc9Nr+naMn2EqtnGPx94HcVrlHkyYZ2xiWKaKpPAW5jbSCXidDAgh0MXhVXS+6
    6Y1uqfrF3ZGImkVwLYgZUFrND7SmXyjnxCFTgHPYuuQeqGovwuAY8reY2C1Y+jTQPOoDYy
    ebVOof5U9J0ftBfrU54j2pDTDOUB64nsIGGRFeYcUNRVYNAGv9epZ5ffK7p1xc4FDHjyeE
    ihNzPqoWaalJ+YTTb9J5ojlLAcW24SATMaufEvr6iFdrxOmL+yk3HYs4OVqw
X-ME-Proxy: <xmx:hgH_aqQd7I9EvoDTH1ZlmphDB8mtkMBxYQSXM-eoRAVfgIW7SKZmjg>
    <xmx:hgH_ah0TPhcqs1kMRujzA2hnzOvByiCmTAAUYkMCvq8DzVo3SvrTIQ>
    <xmx:hgH_aoXm9znKxPe_jWJaaeRYKzd_okbM5eepRY4ZyEFPGvH0fG3Xkw>
    <xmx:hgH_aqxXc7oNOWhbttdfR8sTObCmoFjtZdGOjn6snZsn4p5TVJ7pcA>
    <xmx:hgH_aivB3jDIaRSZ8NA7AapUST-bjmtZLRskw0QzGjBZauwhIcW8eVGB>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 09:02:45 -0500 (EST)
Date: Thu, 19 Nov 2026 14:02:44 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 2/3] mm: page_alloc: make the high-order watermark
 check honour ALLOC_NOFRAGMENT
Message-ID: <av7_n5llADUbJI-r@shutemov.name>
References: <20261116125103.2894162-1-kas@kernel.org>
 <20261116125103.2894162-3-kas@kernel.org>
 <a066d403-1608-4c0b-b06b-0b786e71b12d@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a066d403-1608-4c0b-b06b-0b786e71b12d@arm.com>

On Wed, Nov 18, 2026 at 01:40:17PM +0530, Dev Jain wrote:
> So let us do something like: we have zone_watermark_ok_for_alloc. It will call
> zone_watermark_ok, which will only handle the watermark computation (so this is a
> refactor for the code ending at if (!order) line in current zone_watermark_ok).
> Then it will also scan the freelists for the correct order, correct migratetype etc.

A count-only zone_watermark_ok() does not work for three callers that
pass a high order: kswapd's pgdat_balanced(), kcompactd's
__compact_finished() under defrag_mode, and should_reclaim_retry(). They
ask whether the zone has a free page of that order regardless of
migratetype. They need the free list scan without the migratetype
filter, so neither of your two helpers fits them.

So the split is not count vs scan. It is the zone as a whole vs one
request, as the comment above __zone_watermark_ok() says. The _mt variant
is the one that takes the request's migratetype. Callers that only want
the count already pass order 0.

I am not particularly tied to the _mt() name, but _for_alloc() is a
mouthful.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
