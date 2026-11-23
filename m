Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445748;
	b=d9bElHRQvDI+9z6ohIOU3NptLKGVV9AtRR9RVmzQgVwQu/YauJsP7skhvulHezlEtpjV
	 iuxz+Qzt4znRf9Vm60qVCeVoPLfZRPr+fWDh8w9v6tFmgum96K5IekIONihAtp2yxL2Co
	 3JUdVCEw6CvAtAde672TnfS4lmHlwnXkZmF1CKBI2rbjXFyZweIbgaM/80zmwnQlNecoO
	 f2gZ7+9/MjIs45abWsNM8vpZPX+setYw+2d3xdyFOSF8xbzUAkJI2baBTy6gJmpjX9Tje
	 +g+no4ZazH5vzUo9rwhdB7DW4DyF+1Q0+xDNlFb4pIl85LxzVisdTwp8Vy7waxR3OwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445748;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GtAIY8t++Pi3S54Gl+4rbcWBOhqrYWd+bondmO7DScI=;
	b=f5RjKXrI4MMhk3yKE1BuhdvTY3cCKmV3HD81nu2szllYPZZetsV56Lrq6TDo/r9pglS3
	 dq0iQYKAxoPxWgkbJVS4GA++hsEmp81pQAhM5dhFEbZPQYwYX2RO7mBIXvfBbM5NAgHK4
	 4rh57kUmQJiull/6riqinD1v+q3UMmSpoBmO8XX7CfOtmR29KPDxWjs2JD7N/7I+l19RH
	 QINjodTkB27EXY7bzu+OOe467jSH5/yV/8mtWkobJS5MP+OX0H4B+5YgNRPY6wIKd0XCg
	 j5jxF3afWsIzMp0YEW+1/nrJbMBvN3w0LxTR3mTNEnY91qxfCxD3bU2gx77y9CElwsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Uz0HA/Rl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEADA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uz0HA/Rl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9881F02837;
	Mon, 23 Nov 2026 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445748;
	bh=GtAIY8t++Pi3S54Gl+4rbcWBOhqrYWd+bondmO7DScI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uz0HA/Rlu8fKDbVRpvAuy8h/qGps3sCnzLPrsLkMT1OH96XtRjjiDGw/8HyqxtLVR
	 1rvQjBNhH/qMH4z+OB2ZuX70DKfHYGeem9W0fw27CZmsdsw2S7B/ttkrzWQlwe+/jU
	 plmjWFLl4qB/3Yp5tYRuahfYeuhztR3qSjsELvXA5n332fOEQLsAVBfrsKIZ3l1qDE
	 zc6cwDVMGNAJY45EPxFiD87St5YpOgl224pRiVXobuwHSfIVCeawM1fRB9ugLO1li0
	 altFHAahfPLIVgkYzB8fMACH0tmmrarGybjTHK/kbIcufAoYzCfCtrEp/40yx+3ynM
	 MyIdNYAdsIrZg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id AC573198003A;
	Mon, 23 Nov 2026 09:55:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 23 Nov 2026 09:55:44 -0500
X-ME-Sender: <xms:7FMEa3f-Sz6HgHM1Hz-jAv3ZeU_sNmrwds1nwGVg_ldynzJSk2zuYw>
    <xme:7FMEa7pTH-f5jXyuHfRoYHxUZFbH_XHUsPDYfRsRx7q6eXVS3XAUms_qJbwrzra_S
    Ko5YAjl1JZcsVe3OB1zqhJOm_LpLkNM08QHnH-yZ7M79AlUFdNcrxXJ>
X-ME-Received: <xmr:7FMEa3pJdAihxcgFR_7-7_62v4v-nrAbiL8ADCXZZDVGBfcDKqJpEz6M6kw>
X-ME-Proxy-Cause: dmFkZTF5/xtpjPpHesf4aE3Pt6SqRbNPn6rHFJce39L5WbVhcA6BqOMSaZbdO3uwhHffvC
    zz0SLl/RqCpStIBJmFLZ2miQpr6V09dAeZ2fN8sXfLFpbHB/OPdpNkFjPYaQbjLx73U5xK
    M6sgigScqL1FXS/dkG1BI38AQjOutbopnpGTPcKxaCTQSfFRsfOSDNZVASDxurl9knMtGJ
    XtRLMPfprJTsS9YAKtzbJTjWqVza+EEJNYKvubfLJ1as5UKbiqle0FV4Uf3B7C3PhpLu2k
    mCqqPBAMxSg7AsSlnp7+MS+i9NpUeqEghe0sCakC5uZ/0Z2IgkEMSeNvITP8XDQyGbvDkn
    7TuCq/CSaDAyCkScCZ5Dx2aHfszPVp+3wtyvl3IaL3JvMG2nMUozORFgRADVd3ggtTCK2p
    jCSZT5NeYqakFUa+Kcg7mr7Ciaeimz/mAz7OtKC4V3ByTzAMmTlEqxmOJZR9NlirZNmfjw
    PalJgEsnN9vXd+QTkADZBpNCzdM7MdcwjUFXTT0KAck8fRf99KmRIh/aaeONj2heRDcnM0
    ZlZnPrHqFbDoTBYj6IDAB2TdixIyEOQt4xVcAMwdH+xJMvpLjHB1l0eoaJQS3tfSHp4lLq
    Nyz6K6JrohwwD4iCBSCG2zcgeM2VnNjdMuxaqqUlTxfeWBt6TIpNcfsnqYng
X-ME-Proxy: <xmx:7FMEa8iZOU6kxNF6w-VPcn1t2VVd1tCY6ILW9SPAKaCGgJEF-0E8sQ>
    <xmx:7FMEa3FG9GRYhU7Uyj1tSy1KWlo6aZbcdfAQYH3xKmQWffIX46Kb4Q>
    <xmx:7FMEa0k5GSx9rpzw_wxnmFwPfQveqaN3yxBvIOTH5EF5TG58hZHqKQ>
    <xmx:7FMEayCtrwdh1EeZOlP4Otfrr93Q-JsHnuNvtoKb--j6hZsCdwRvIA>
    <xmx:7FMEa49bRadcmQ0hSzXHjH4Yzv71FAGwznnnU8lAfKVjh8Rnw7xJ-jfG>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 09:55:39 -0500 (EST)
Date: Mon, 23 Nov 2026 14:55:38 +0000
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
Message-ID: <awRS1q5WvQyKLAf3@shutemov.name>
References: <20261116125103.2894162-1-kas@kernel.org>
 <20261116125103.2894162-3-kas@kernel.org>
 <a066d403-1608-4c0b-b06b-0b786e71b12d@arm.com>
 <av7_n5llADUbJI-r@shutemov.name>
 <38d06816-e138-4edc-b26d-499617870506@arm.com>
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
In-Reply-To: <38d06816-e138-4edc-b26d-499617870506@arm.com>

On Mon, Nov 23, 2026 at 04:11:37PM +0530, Dev Jain wrote:
> But, for the existing callers who pass order > 0 , aren't they also checking
> whether the allocation can be served?

No. kswapd's pgdat_balanced() and kcompactd's __compact_finished() have
no allocation to serve. They are woken with an order and balance the
zone for it. There is no migratetype to pass.

should_reclaim_retry() has an allocation, but it asks whether it could
succeed once everything reclaimable is freed, not whether it can be
served now. Its order-0 part already counts reclaimable pages as free.

> It is confusing me that both alloc_flags and migratetype are logically
> part of the "allocation context" but some callers are doing
> alloc_flags & ~ALLOC_NOFRAGMENT ... I am not sure whether the below
> Sashiko report is related to that, I didn't check in detail:

Only should_reclaim_retry() clears it, and that is what Sashiko flagged.
It keeps what the check did there before the series: it never filtered
by migratetype.

Filtering would send movable order-2/3 requests, like 16K/32K mTHP
faults in a MADV_HUGEPAGE region, to compaction retries and the fallback
sooner. That is a behaviour change of its own and needs its own numbers.
Out-of-scope for the patchset.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
