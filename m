Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795486047;
	b=5IJWRigVhOwVEHFlQCMI+1LeTkvPrmNryKf35sFnphHdJhcP8TvvKx/MyfamcgNRTR3E
	 HNYxyxYKqbYnNINiz6Dc83iiNfMf5svKGJV2ubW+BPxpLa8uttpr39WV3HFjUIdYzgDBE
	 /dh5gU26yxB9oalP3wuRFtFzXbHE0rShWkQjgd8jMqWU3Ifgm1wqxaJh54TL0Kw6d6knr
	 3lTtw6qeBGjuezcENg2bRBFYmSKgDfHYaFoZ2uofgI8taW4oVu+6tJF7YrqMqoD1XHNvi
	 3twBjHEebYrwSX53wfP495mr4L6tmeZBbL8kBFbYnLBy2K35IVBX1HXD+pzXLubEYoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
	b=xC4N/TLienF+ztwaGKRzsgMQWSFKx4T7FIXOcUmtlOvTr6vA9KXUr/0soYA1rEwv5tYL
	 Llccb/bipmqsWpfRo4m94nwY4O5Tw9ldNnR4NhHIGSCvc7lXNH/r3CshIHLa/X90Oh9/B
	 6LoN9bSbskx6iv4pjAYpWhiMU3MIjze03UGgzfYgmn0OQbbznKsbzldlowcnLbj4A1cRe
	 +3FwWK8shQcbCoLA2vKBF7axVq7UHbvVn364zBOr2jdjo2wgYxEqQCOrfw/ZXkPsior+u
	 Xpf7KS1Bj6scM0SMca7PpF1V3UhWQQGYbxM8yQicDPLSwWKeCMSnpNHo0ev3bxZ5Qig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIYDo5Uy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C656606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C656606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIYDo5Uy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so17925065e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795486045; cv=none;
        d=google.com; s=arc-20260327;
        b=BOWrguHpuoOJGXUBv55vKB4WiH3N7Axp1g7V/nykmYpeGQ5zs+IiWywo42fLidpdqm
         Zqe9NnhVrdNrugeY9xz7t8z+wnJ9/T7clg6ItKHLBMOP2hydUanLHtmRyFgxQ8hy5PZp
         vO8QWhlxxYqtiXSVH8RRmH6M884ylfFIrWh6nXMChGB7/WkDWkiZEyf77OUmUkHgOrRy
         6L69MFpSdE7MlH1bJutZuCS/pWt0RhxOAF6jR4KYmyCQy9klDlrNQyXnvTpSNyFuN2+1
         pCTutrq3aJfnaRu8UZ4r5lWVMnU9qLd6kYy6qbLBPwMIV4+aC9bM2a84MYkxRdd8ANf2
         ibew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
        fh=sMpfV1ZRUXDvBen+sAVhp/MWMLkuSOSCS/U48tbzBHM=;
        b=d+aZvNyE4wY5sI75oobaNLMAkoGVblRlaEfm5TxELv3JIZJGq/kuWJWU8/uddfAeUe
         UAChU7VV1pHR/nu66tCYflr8SMAkuqJbVJICQvDcE/R2ZhvXYNYGqGxL8XC0tn3KAMEZ
         agkf6MyBbEjKstcX+phSBcTVLZcU58ERsgBM+8Q2AQJ/lT4xE0Hd2rTCizdZSSYCbrEG
         t8ttJGDoAf5A9s3pAGL98QlHyrWbiiMPBdeZelRa1JRuqnunvNN+5n8kddfwRDBQDtc5
         HokaFAomFTrFZn94jVlahNYuzT9LYOYHgfDlRimYXcayBLEVGIef+0ksyZmmd8MzunYS
         BOVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486045; x=1796090845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
        b=SIYDo5UyPeegzFD1ViLJPRhiEjKYH1q0flElCuUlcuZEUKkw7v/HMw/ehCUJevfcGd
         mlESo1r7lcOmN1JzmR41ZthsPzPk8cGka/ZEGxAwVRgxthJRUx4gCiSKRn1AWbb4J8ud
         XHUfqwYfzHmEG3/v7GEEqGhScRWV3CSlCgk7F6pHd6NfywZSMW79SscHKI1kLs2pTy5x
         Pxr2OlQJTpZTb2xgSOLhj36CdWvOGoVRNQnPumRRs+uFHGjLkmiFPX1wjdzVaHktAl2P
         oRyIpuMjGKdY672PTaAJ7aE2HAQykghZrGVPL6kt5yJo7RVQV/72O9oVGJYmJvYiN/4t
         piMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486045; x=1796090845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
        b=TDwx/imZ/WJUyCaY12dVM7XYmM7PTblP+lGlzFfcLrcfY3IX6Cpy+OE2DdMsKK73HV
         YjgzDVlKwBeDVAhoq0xYFVLHmMMA9L00Eqa0Q6EAmMMg/43jjO1Or6LPk9CxRi6PazXi
         d4rjUNLTh2nJjY/AOTpzn35hsljfU9Tsfbuz5+HcMF932ZcGFk6KPOtq84yiv749TmHG
         6Xi9PlFDL/pckuR+F5MMpqdMJvRAahh8IWBoaiBrW/K5xuejJlezZ5zRgyCdv0oU9mdE
         IdQpEIHfNIyC7OuXYT4eYJrFAUYAVmkERFw/JNt/xebezXqrKUez9yNVv7c5HDsYzs2j
         3zew==
X-Forwarded-Encrypted: i=1; AL+hErH0E8XPIxaisg8Vpih90Mt0x0L/XjUUy2l26hbl9YzhFf6K5XqbT6HxTCd/i0nTKPBTE9EGDZ7QtJ7JWGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VzqKzGcdBmBfcqa0g4I27ugyVbNrIvD51wr9V7t6uc5Kwz8Np
	EUlc7LQvbVEXwkuRsMNqyQxhEON29cxzPz4Sbm6fcX3keX0keG4LHcCBXgJddyvJqdrx0gjru8M
	riNXevHjRYmYMzyOWKuv0jcyTz/EFQDA=
X-Gm-Gg: AZFdTZcBHbEcOysD5gEN7NWXVqORQr7J+GbpWbp1G2esx5bwKsfPCo8Dd0vk38Trxed
	niVyTPkfWQXYVJT7q4KZu2/ommPRqWMljTVCiLghrbgsdAm0w73LASwGgrWrbCGYd86PdiLpHPk
	hFPG6j50eZVY2p3vjVkn8WaY9Y1uXFQ/tUsIJUXKPEQkb5i3bPMRlhIooIKlxEJdzRECHxD618M
	9lvIQlGxyd3prElyT2rni5dLwKWvuDvFy7+V730BMonpl3rSnScOBuClG74vcHfuxWk6MkupvQg
	18R2SfakQ69bEPeKUmKlMKb+EumqhJn51y2B/9p1CkMBS+Rt/foEJHQwEbwKCLTRBV6nO8fJLoC
	BcWXxZpc7uRYsxLkbnQ+tm12qORxgczyQIe8QbrPog/g3wYQ3ELC+TZehmPxQlrURftjnPouURc
	dYgSNzK1OnKCdeB2XUIBIoxFVYegyEXofho9xImrWLY6UVe89QJ4WAQvoUnj8j7XpBPKCKcs/Ni
	w==
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id
 5b1f17b1804b1-4bb88812c92mr280620945e9.18.1795486044232; Mon, 23 Nov 2026
 18:07:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com> <20261124-mglru-fg-v6-3-8ffea39934a6@tencent.com>
In-Reply-To: <20261124-mglru-fg-v6-3-8ffea39934a6@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 24 Nov 2026 10:07:12 +0800
X-Gm-Features: Aa3M54oR3KlpB0bkG1vPMJxZCKqEDSLHTpf01h2UkcgR_PoelqiPBgymN4KGxg8
Message-ID: <CAN_Opa-UaAUu=dOGmDAUiaU+3-s89Y+Y2krz6zGEsNLHB3k-Wg@mail.gmail.com>
Subject: Re: [PATCH v6 03/18] mm/memcontrol: avoid potential counter leak when
 reparenting local stats
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
	Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:53=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> lruvec_page_state_local() clamps negative values to zero on SMP.  That
> is right for readers reporting page counts, but can be wrong for
> reparenting once MGLRU updates the counters without the lruvec lock.
>
> Reparenting runs after the forced stats flush, so a negative is a real
> balance that has to move to the parent, not be discarded. We will
> introduce lockless MGLRU promotion which may cause following problem:
>
>  1. A refs CAS on a folio on the child's lruvec moves it from
>     inactive to active, and its active/inactive counter update follows
>     as a separate step.
>
>  2. A concurrent isolation of the folio reads the folio as active,
>     debits the child's NR_ACTIVE_* by delta before CSS_DYING is visible
>     to it.
>
>  3. The child is killed, and the two __update_lru_size() calls from
>     step 1 land on the parent: NR_INACTIVE_* -delta, then NR_ACTIVE_*
>     +delta.
>
> The child is left with NR_ACTIVE_* -delta while the parent holds the
> matching +delta, and reparenting the child's raw value is what cancels
> the parent's credit.  However, if the child happens to hold few enough
> folios for that counter to be negative, lruvec_page_state_local() clamps
> the child's negative to zero, which drops the debit instead, so the
> parent keeps NR_ACTIVE_* overcounted by delta, and its active + inactive
> total overcounted as well, permanently: the child's local counters are
> gone once reparenting is done.
>
> So use a raw signed helper and reparent with that.  Ordinary readers
> still keep the clamp.
>
> Reported-by: Kunwu Chan <kunwu.chan@gmail.com>
> Closes: https://lore.kernel.org/linux-mm/CAN_Opa-+nb0vxQ+HsENCG2fEEMZoxG9=
Sy_DBC4CLkWjNLzDWKw@mail.gmail.com/
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/memcontrol.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 091401cecf39..3f551e2e3206 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -562,11 +562,10 @@ unsigned long lruvec_page_state_monotonic(const str=
uct lruvec *lruvec,
>         return (unsigned long)READ_ONCE(pn->lruvec_stats->state[i]);
>  }
>
> -unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
> +static long __lruvec_page_state_local(const struct lruvec *lruvec,
>                                       enum node_stat_item idx)
>  {
>         const struct mem_cgroup_per_node *pn;
> -       long x;
>         int i;
>
>         if (mem_cgroup_disabled())
> @@ -577,7 +576,14 @@ unsigned long lruvec_page_state_local(const struct l=
ruvec *lruvec,
>                 return 0;
>
>         pn =3D container_of_const(lruvec, struct mem_cgroup_per_node, lru=
vec);
> -       x =3D READ_ONCE(pn->lruvec_stats->state_local[i]);
> +       return READ_ONCE(pn->lruvec_stats->state_local[i]);
> +}
> +
> +unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
> +                                     enum node_stat_item idx)
> +{
> +       long x =3D __lruvec_page_state_local(lruvec, idx);
> +
>  #ifdef CONFIG_SMP
>         if (x < 0)
>                 x =3D 0;
> @@ -595,7 +601,8 @@ void reparent_memcg_lruvec_state_local(struct mem_cgr=
oup *memcg,
>
>         for_each_node(nid) {
>                 struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, NODE_D=
ATA(nid));
> -               unsigned long value =3D lruvec_page_state_local(lruvec, i=
dx);
> +               /* Reparent the raw value: the clamp drops the child's de=
bit. */
> +               long value =3D __lruvec_page_state_local(lruvec, idx);
>
>                 __mod_memcg_lruvec_state(memcg, nid, idx, -value);
>                 __mod_memcg_lruvec_state(parent, nid, idx, value);
>
> --
> 2.56.1
>
>

Thanks for following up, Kairui. Reparenting the raw signed count
fixes the case I had in mind. I also checked the clear_refs and
workingset changes in v6. Both look good to me.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
