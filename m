Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163787;
	b=WSzkvMz2mO7dAKD3dzc9mQZ8h3kWnbyZ6Kir1eUTVZW2Evc3xIPwqJma+w7DDJTqQb2x
	 2UBLZysElolbJ6XjBQf0hEQ3/GOX4iDA6GS/ffFJjp00CeLHWokWfM6KArWiBZvD0ySyT
	 EkCMBBJFxg/UjLRezWCdX2fSjn0rmMpvLaqaCcknoK0/aAHwlX9zvjDkrbnKv3vDu0hY3
	 85DgEzulg/iI1kru2CHVz409LjgkAb3RQyEZ0lu6s/Q94cNylReWFHO95sP/VSH/zrd+N
	 l1kOYjdraJb5owvAhYhXSbeEwQ9MTgp2ffAB16P/Jf+HB+jGg4XGm7d5ZZugCygXu0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
	b=RpA4VWJAYTGIxam/1n+jC11K7On3bDlvSc5X98v69VOrwsnBjriJN8/RUp6YXgx1X3kj
	 k8U9O8PeLSX+ay+miguGy0kh9El2D9qo2Aycy0BXAnVdDTI2YUE+FqJmEMLSVcgvZ9EB9
	 p2PywCWZ9XlHedvgNRlvu34VIdCv2YOcKklaS8eNApX3f4pSghV8peaPLnenDm2gjK2C+
	 UbFlQzFsTnLni4ZZogOkzbnHy7LOPb3kE77nF6kGJedMtjhnO3iO7kKlZyhCGwhTBMk0H
	 GWyeENr2W2EGx2YIefWxBhf36JxAcpHlhaec5vNbDu+c1MvCKH1iIul5LYdJnVDZhAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ImBMdazn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5869606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5869606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ImBMdazn
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1038184a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163785; cv=none;
        d=google.com; s=arc-20260327;
        b=qTA85BEqodU1wRXGYF2zyp8fzOX4ZUUQyelj5AgS5QJ7wm/hZE7ciRQ4sz2a6DW77o
         VIF1eWaPMyG9geVd9LiJTm84hnJwa8KoqL22lsBDVzNFX8svBFEcd9wJn1n7KqGDBQNv
         30Z3o5UVi47N5VbFZdzVGSP1QYno3RHd4IUm6FvihbLhmqFn0x1fAY+KuYVXlNpq8WKb
         FdyK9c8c4FHGOOrBOTmKctg7L4GJNbFOiBUuis3bRKmXdNBp9EVzqLNIYqpxJH3dWs90
         B4YR1t+dQD82vtjwHnv+Rd5jLkk9M4kc2ymEIh/7BFCAswxNXWKxo6jTZ0uV2sKLt02v
         JYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
        fh=aWBGIP7N+BRcPz/NHkNmbk34X8cExL52eWKR46A7c7A=;
        b=faU2QEZBB1j1Lg25zYFtq3lrUPYEf8R8UdXyhVQElcle7VtsUae3J3SjcjU4jC2Goz
         nQa1fHBiq9CP3F/fSwBTTRqr5UCY4w4CHIw7AnAbN0FJeq3zd3oUHHA7NSyHUCgYsOek
         vtwzRVpHTpdSsXvQXeGpofvCy4XDpWPQ3e9JugfEDqcJx13VSAJMbWDlzxg69U5vWzWJ
         8EW0G6KS+Hfzn1hIvgJPtDWwoLnTD4DLLYbN2yvDYPSKi3GQ0E4J4DOpnsEJ+YGcPPQ8
         565+uVbaoFP8Wd9yIsQCPfgWQDwqaTJgB6CMasGu9wIuMbQlNNE2/P4G5iWUdFy/kvrW
         cing==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163785; x=1795768585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
        b=ImBMdaznztdlFHVgcK3gAMDyyV0pcNV7fvYhgBW3KV+noAu2vzpbNhdEvct/3ocLVI
         lUwNtGAJOm8lKtewZ2mFrPYC7XxbTwFfJJQdPxXRENuA2KJjo7pGWQG3UDBfWccSGGcK
         96aqvTSLdBcrlnSk+YdVHvfAfvd+C0oQrQlnxb+dWeGHfKaxawFiYKDiYo9M+Dc3acB2
         VbfAz/6ecV5RU3JVc9LppKR8ykF2xQ4KrB95a4d8v6yleQ9sG15xD6vmnFmZvcJEsGg5
         PdCoE8pOeNlGAZ9T+txgl533cKpUJIkxuG2K/GiQASzc5wF41xFNnvyafs+tLegcyFTl
         wU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163785; x=1795768585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
        b=rgdaldf+INRgn1AAQHjdVLWp3mx2TciwGpH6a+f+SeB1WdG9btcUzisjozHW0846oy
         Qvgxk17vijlAzLf30Uo+FsCYfCork7y+FUAjtzrx/wEnkoYnZUfl/aFiAl8hFOBCPBPI
         S4GbSPAJ61mRZX4B4ewY6UNsV7s9eUsms8YPkk5OwbyXKYLXwZOr5g/o91uVEJZDdhod
         kq1km5bkd7H3ZQ3L/WSexAkxwK3Ez0rnRQnsn/NddvM8L03j5Y4GCaIBKbH85dA3qj5b
         emO+kiX+jDQZtodsxafQd9rRK8VBOU/vYjq0ZU27Ie9FrbH98ISr8zR+pkyH6NEEmk9i
         +UMA==
X-Forwarded-Encrypted: i=1; AL+hErEv53zIHzKuQFr7uztQ75kPzacTDIBYxjgJgl8gjZ2qb579LTTO94rSW7LEZLDQTysNhvYw8j3QxnAzKo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6jsijN0p9Lv2SqnwjuRIX2h3LqixiKOC1CjrtwV0SpNyioOCN
	E5mbY1i7mIJa9F3R2gHW5lSDoPI7LBHJV/D3YyNc+bjR8EQVc275rxHcAZ1Q/n8TKtKGbmtmpiQ
	wDfB51nGchmc6eC6xSuHirYPMfu4Kg/g=
X-Gm-Gg: AZFdTZd2TYt29chkthAoujuM62eqkD3i1/HW105GglDupVyMFALbvVCkSvlIgQUPOQl
	ylA80uhRY/ZSz3NepoMlPTJuTu26NAS3wjnsLdY36h+0qyoyWYrE/r0K4telJs/kpyiJ8hVUqMN
	Arwm+MnHn6KufhfDK84yFNokY7JK4BEmkncf7YM/g16Zv+1gmEe6VpaOu0w7mne189i/6lS6QdY
	frhz44ydDQKWUcykybaPZqR2FPksXV3KiWBXs7+hQ14hCPtsJI4nACqPOV9o1fAhL2TkXeFBgGq
	JbQGnKXgUOolresdL39edzhqLtqHZ4fwSV4ujbpKFbq1zZoyYmbyD8n9sHgBKycjP6GH44sg6TS
	ku4hrZxBJPd55GXeRobHFC92x2EwaTQihQSzefdVqk82fHA8jbmcExKH91q2l/d5tnw==
X-Received: by 2002:a05:6402:1512:b0:6ba:12e2:46f2 with SMTP id
 4fb4d7f45d1cf-6ba37d18d2emr1237841a12.8.1795163784752; Fri, 20 Nov 2026
 00:36:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-14-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-14-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:36:11 +0800
X-Gm-Features: AclHuK9a_uzFGbOjQzRBvuGpHT7FEd2GEgizUKayktzr9rLjRf8PKuN-UHaqZ64
Message-ID: <CAN_Opa9qsHLGSPUjUJB5rCfD8T_zE8R1YpipcmYCqv3tGYuO1Q@mail.gmail.com>
Subject: Re: [PATCH v5 14/17] mm/huge_memory: mark folio as accessed more
 accurately on split
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
> The behavior of updating the folio's access info isn't consistent for
> huge mapping splitting or ordinary unmapping. The page table's young
> flag has to be translated into folio's access info.
>
> Right now it only checks and sets the folio's referenced flag, which isn'=
t
> enough since folio flag updates on access have their own rules. Ordinary
> unmapping (zapping) calls folio_mark_accessed(), and it also checks
> if the VMA has recency to avoid false updates.
>
> So first just use the right helper here to be more consistent. Keep
> accounting the young PTE as a cache access, sticking to the current
> behavior.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/huge_memory.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 0d589be136d2..1a415a6704be 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3104,8 +3104,8 @@ static void __split_huge_pud_locked(struct vm_area_=
struct *vma, pud_t *pud,
>
>         if (!folio_test_dirty(folio) && pud_dirty(old_pud))
>                 folio_mark_dirty(folio);
> -       if (!folio_test_referenced(folio) && pud_young(old_pud))
> -               folio_set_referenced(folio);
> +       if (pud_young(old_pud) && vma_has_recency(vma))
> +               folio_mark_accessed(folio);
>         folio_remove_rmap_pud(folio, page, vma);
>         add_mm_counter(vma->vm_mm, mm_counter_file(folio),
>                 -HPAGE_PUD_NR);
> @@ -3227,8 +3227,8 @@ static void __split_huge_pmd_locked(struct vm_area_=
struct *vma, pmd_t *pmd,
>                         folio =3D page_folio(page);
>                         if (!folio_test_dirty(folio) && pmd_dirty(old_pmd=
))
>                                 folio_mark_dirty(folio);
> -                       if (!folio_test_referenced(folio) && pmd_young(ol=
d_pmd))
> -                               folio_set_referenced(folio);
> +                       if (pmd_young(old_pmd) && vma_has_recency(vma))
> +                               folio_mark_accessed(folio);
>                         folio_remove_rmap_pmd(folio, page, vma);
>                         add_mm_counter(mm, mm_counter_file(folio), -HPAGE=
_PMD_NR);
>                         folio_put(folio);
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
