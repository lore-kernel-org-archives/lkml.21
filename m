Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162923;
	b=eDHW9QP7oZNAkik00dXw3nosPY+2FJQZnYeL1msblPRarOxr4PXssl5IKvtJlfa9buOG
	 aDQCAlCfi5xyjHElJhyhih2iHuV1IEoA5VjiuZrEW95nEuSKk1gnYZNLxGCABB5YUIgxb
	 uXwWf7NRgdq53f+ZR7IcY9F0gtBP1eij6WsQcBMN3kTFXcn/twLJillyjwLvLgUsHTN/w
	 b2sjk+cyqcyNv2e2p0P3G2svmqDvprChsG3mliYUe+kso6CGBm9J2Y7Xq2A2nVlF0PfkW
	 /UySmB38+9LM4NcJcfh+wlOyo7vherQI3wy+/6H6O1Ds6b4u1S+1Y5PfEgaeszK+Myw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
	b=O6NbETAq5UMv9gn0u75bdZtuAqQY/ckuWM4HxBKkSho72Rl3B6EtByDRACydsAxJNET3
	 LqmHL7mYMha4VCVNRoBDzBNUyYT/0J9jMf8ctbWCgGYqcf2mVfUQ27QtveB6shMVp0FTn
	 /raAilQW4EZc/ssKWC9aqfqL4sZETokZeiN48VqNS/8/0o/+GurRxcehwsvzGJ7DBfwF8
	 gj4c+Q56jx9O055PJB3d6wzF3hV4RcyK9TdItSir5wKNOnpjt6pQEqejt0TjpFN+wrY4Q
	 RjK99ym87EBzWJzNqOaZlddGeVT/OBO05oQDn+1yFXlU1hpgiaoPv/BOElpVHTu90hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lfmZvxA/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63C606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD63C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfmZvxA/
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso892216a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162921; cv=none;
        d=google.com; s=arc-20260327;
        b=DLHtQRafw2/Nl0Vba20xpRrj3zAKjzw52euYLLeCH69UwIVX2TDLliv0HC5UxtsQn2
         np0l2csOByXll4KAsGcdawH3F7ppNvrk5esjbqbiX+sC/avXq/1xmbFntwwx/ENyDN9S
         cOnMSW9HoVtdIcvM5Fg7HQl+BJfYuU8NvJsVWZ8hSo5+X+AnG41RKP8tmEMSsw15cWuc
         YatAOeoqLx2NOJ+Iuvyfd0PAQq/M8+sX4U0MF91DaYgUH9JM6tOoqfCtI3XeX0cuvKGd
         XcUTH96c744ilyeK07rNgHqE16PDCiTNWhutSv9VCBOpN9WbxYj45FligNMLj13hGlmr
         l+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
        fh=6c8TNW7Z7wYIhSOZYaTNDzFtxkI7y64FEKYmnx1jVUI=;
        b=rN3+jnID9Buc/SoAdbxtuS/9aVw1AFLqnwvyZrFwAwgN+t2z52Q9rQ705+LvE1eMqM
         q7GRF6RRa7lFZLG3cXvMacXtYvY4+J0gukkkuZ4vH1WgrZUyjglZwK7mXijnBnNjI1rO
         ojzo0hz/x6fm+hUsnwxAoIFqzDZ/ZYbWYQVd0LcOwm9oMJH34KoW/Ip52F1XnrsAMT9s
         k+2NOGTWVtvJAFC5vNZqrI5nM98RNvDhfuGTVoq/dBwM3lUAz8PLYmlC2wSAnAJR7qnq
         L6sTo8VvSq3Hi5Illk/7QJ7SvCiqdxM3VtBX8AK4LDk2Lp4fPmkxdKDkgDnkOmDUsXOp
         PO8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162921; x=1795767721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
        b=lfmZvxA/1HGejNGMYWP3y4EqkZ6pBnz7SLZBv3rujos7mJOt7yAdi9yA+9b6S4jk+D
         ipzGPH9AnJr9Lqj/mvk32vCLkbD+rSP/a7NmQ7Dljdvin4dNwDXjQlU7ei+YYomRNWGI
         90F2j7LYpKCgJSjIXyqCm8QOtOLplCl5bbWN7HZWLDXyutGBAlMc1WTKyM1wyO5bhBn9
         46YL8OYmDmto9N+M94yif75del23Y6bMpTINzOjQDDII/YdtZD7ugq1c0AnEhrXdUfnN
         vUohWs7UdgYxVJUj1GtsmBRsCs2g0B/QliBO4iXaaSJ5yPmpynI27gB2rgJm+q24d2SW
         wMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162921; x=1795767721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
        b=a0aAmnISPOc7jHITRex88nKtyfi+AEdPWXohNBiQM0IDTvXyy0qaLkycv3U5GnyOhJ
         QEBWXztC+mlHojU4iBt0ZRoRQOAdEIej5pvLhLDNybjon5htfvkjcyqia7EDZ1apZymS
         edCWsm+0OAhKosOYngNtxvH3OqC2XDD0w4ny2nXGJ3LGsULrNfQG7lqq+wqkFaSv53ec
         UWazqhmwlMVxE8+B+D2M//QLYLvorCsMlyIyWHzRfSq72O/uTmFdI4uBxooaXFw4Y7Y+
         E+apjsTSxwzn99I5V+SGbRUMk9gqN4ftT079cn0jqCU13WmFJMJCHOKK5T85O3QUqCCv
         M8cQ==
X-Forwarded-Encrypted: i=1; AL+hErGrnDcvJLWeayJRzBX/6oJzuqYk+0Udb83ys8xqwyt8c0XJG8ePelwvL+QWwvSQU1abt+MVR7OqMV+v30A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F9S0+n5yb34i+87a+lBe7JoHj3ujB1nhjAMxSgAcYWGULRtTF
	QbrWCqRgNpsNhKEGG+tQ2zZcLQCX/SdOeYyBkG5Hqe7o0JiHVmNZlykCDaTmiCesMhJhEXYbe2U
	5TmV07JouBM4v4liENYH92gbwSCtPO8E=
X-Gm-Gg: AZFdTZf0d0IX5A/pYpW8UIICoFfwUKi+5A49r7/u68Z202ked5lHsGlzkkbILXla1Ag
	5Wprd2+q21ZK7ilJ4obf5d36RIYUq/rrQLrTK5PMiQ3rUC3lIDt1a7jmB4EO+SeOjJqsHqHkXcN
	t8O5g10babZb24t/9rGOdEvpEvT31c1Ywf67bqJJ+TveL+ROdN6CB2gviUep/7TSkioHdpjH7tT
	YvkLL6cWRY3qOHxkvqu5SDfQITFSvkPSw7VgrjPnGcn6n7a29hordah0xzjJPoj9lOkz1YP7tli
	rJW+UH/IU28qSBudIC90sOsWFMBMdqvRuUfn0CyBnBf2OEBPfozIdTntrmlDDID8Z3cYy46nbzN
	OfziOBaxVypqFt7FgLGTnJpNGcQo21ijcOyEA6/+mP1SsAPNsCr3tZH9KLeare2g=
X-Received: by 2002:a05:6402:2105:b0:6ba:3738:aa76 with SMTP id
 4fb4d7f45d1cf-6ba37ec713emr1520051a12.28.1795162920798; Fri, 20 Nov 2026
 00:22:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-12-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-12-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:21:48 +0800
X-Gm-Features: Aa3M54oR841ct7toroFKb5-FMop-YAlKT3qgtmdkpn6S2_l60VC8mi_ZrcEbsCc
Message-ID: <CAN_Opa8SFEzeu93GpJY7OkOUP5AeB3P9_8MGuhi6JJnBQsA4Vw@mail.gmail.com>
Subject: Re: [PATCH v5 12/17] mm/khugepaged: convert to LRU refs based
 operations for MGLRU
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> For MGLRU, PG_referenced is only the lowest bit of the folio LRU refs
> count, so folios with nonzero even refs no longer have the bit set.
> folio_pte_referenced() testing the raw bit misses hot folios at
> refs 2, 4 or 6, under-counting the referenced folios of a candidate range
> and aborting otherwise good collapses with SCAN_LACK_REFERENCED_PAGE.
>
> Test the refs count directly when MGLRU is enabled, mirroring the
> smaps conversion.  The classical LRU keeps the plain bit test.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/khugepaged.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 4bbe319ef86f..68f7a30e36be 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -579,7 +579,9 @@ static bool folio_pte_referenced(struct folio *folio,
>                 struct vm_area_struct *vma, unsigned long addr, pte_t pte=
val)
>  {
>         /* The folio was referenced previously ... */
> -       if (folio_test_young(folio) || folio_test_referenced(folio))
> +       if (folio_test_young(folio))
> +               return true;
> +       if (folio_check_lru_refs(folio))
>                 return true;
>         /* ... or the PTE mapping was recently used */
>         return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, a=
ddr);
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
