Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258218;
	b=K0uZchM7efNqAMR18DqUSDgJ7QX8WDYacBTVUgZDCAEmj8Ekv6Myo/2LHdTpNedLWIUD
	 1VIPESpFo+n8DhhOTfkq73x99yi8L6npzS6KuPQaEz64dgtQvQ85ppGtyOH79CAHU2KES
	 zfyTdjfN4wAZBXBWLNOgXE94x9IxLIPIWNRd5/LFcPJQIJS0U0EORITOGynK29fAzcvRG
	 jT+SjTTnuK5IkQhNf9moooDQk/Lm4Q49ejcECGIS4PYydi2Is17leal5RpRnXm9zMGr7g
	 SgtDIt4zhqU/G84QZTAtgSsoy53Xay9fXT+QrJMO8saYLqN7wJoNxdYwZMrZE8YQRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258218;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eMgIUwgaRDtqFb+dCr3Uz5uFgrgh0VgOFSH1MBelITs=;
	b=f9TqXUMNTiDt/Z4y7CO0omwWfuToiuj8Z9YZLEoYQT8OAZy3ZPCDP9w5ya+4v+wLQuCv
	 STTGjvpWPa64Tap8msPhkkNKsm8NMqtS90lF+5wQ6Es3KjUPotHKrbOsVlA/ErAGarAyP
	 OvREq8F9ZFxKDgPwnBeIyI2BqWxAcJqzRtTGJNWDDu9ivClvRYdSxqB+3LKMC3Oh4nvjF
	 afQehkr3rybJr9L+2II34KvPic5tDvw2XsqXHpJFUZN81JnMwr2i3xLGw3BfNjypA38/a
	 o92Sf00prujzzzUhGe0N3mM/9ZByBh2Y89MtAy42qpsOcHGNFUCTjwCLvSBMGNFHDtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kVri6+A8;
	arc=none smtp.remote-ip=91.218.175.140
Received: from mta0.migadu.com (out-140.mta0.migadu.com [91.218.175.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22055606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22055606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kVri6+A8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sfx+nUxKF49z2Q7WoOfZ/Q2qOCkr5Uy2iYFOKJnNr3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795258215; v=1; x=1795863015;
 b=kVri6+A8zkwusITNHEyjn9+k5B9eiVogHSWEWQa2fQzIIMyULgyqPcdb8SXbIKNiRTP8OUSb
 zmXMjcpk8xGj/XKUD/VNu1YiTqyDUZh8enPtTK/qQsySqD7KGRCPOadmbB/R6oHMa+wstYht88m
 96EV/Ci/vrxibNok8CEoHmgM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fce2ada30c03c903;
	Sat, 21 Nov 2026 10:50:13 +0000
X-Mizu-Trace-ID: fce2ada30c03c903
X-Migadu-Flow: FLOW_OUT
Message-ID: <dcf13dbe-f843-4e21-80a9-82214b501f4e@linux.dev>
Date: Sat, 21 Nov 2026 18:50:06 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/shmem: don't use the memcg of an uncharged
 folio
To: Chris Mason <mason@kernel.org>, hughd@google.com, david@kernel.org,
 baolin.wang@linux.alibaba.com, akpm@linux-foundation.org,
 qinyuntan@linux.alibaba.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261120195057.50031-1-mason@kernel.org>
 <20261120195057.50031-2-mason@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120195057.50031-2-mason@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/21/26 3:50 AM, Chris Mason wrote:
> The shrinker for unused huge tmpfs folios can dereference a NULL memcg
> if it races with the migration of the folio at the end of a file.
> 
> folio_memcg_list_lru_alloc() assumes that folio_memcg() is never NULL.
> But it is NULL until the folio is charged, and a migration target can be
> in the page cache before charging.
> 
> shmem_unused_huge_shrink() looks the folio up without the folio lock,
> so we can race with migration:
> 
>      __migrate_folio()               shmem_unused_huge_shrink()
>      =================               ==========================
>      __folio_migrate_mapping()
>        xas_store(newfolio)
>                                      filemap_get_entry()
>                                        returns newfolio
>                                      folio_trylock() fails
>                                      shmem_unused_huge_requeue()
>                                        folio_memcg_list_lru_alloc()
>                                          folio_memcg() is NULL
>                                          memcg->kmemcg_id
>      folio_migrate_flags()
>        mem_cgroup_migrate()
>          commit_charge(newfolio)
> 
> Fix it by keeping the original objcg around while the inode is isolated.
> 
> Fixes: 743e7d025d2f ("mm: shmem: make unused huge shrinker memcg aware")
> Suggested-by: Qi Zheng <qi.zheng@linux.dev>
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---
> 
> Notes:
>      v1->v2: adopt Qi Zheng's suggestion to return early in the
>      failure path
> 
>   mm/shmem.c | 39 +++++++++++++++++++++++++++++++--------
>   1 file changed, 31 insertions(+), 8 deletions(-)
> 

LGTM.

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks!

