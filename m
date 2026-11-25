Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612399;
	b=f/gLO1xnEh+G5Py49db+F/2k7Fyi6icPDdyYXLSRIMtRaS5YvngDfH46xjOoisjKwTTE
	 /cF6Gcs2tzJusXJoCGPh07nK9XJrxbiUnF04FTAZY2X495qLe9hOImTM8YNMMVBkFWDNY
	 ug2CmMhhU1ri+odaNLcNEzvwVtyiobLZIBRnlgdA254/NUk/1SGbiDrpQnYyVnmSrHj5v
	 KRDOYav5jNKqdXEpKtuBANKytt/QhNQ7rJPQs7FUk84VRsaz9ohIwmlpd/PW74I414qXy
	 FkLTBuJuU5SyBVvlTfVYhX8mz7aRtC2y0rXIj8PxXFlKSxU28af9pOiey3hzSYvoYrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Yz7JNlPDDcs8XZFhzYAPoSiu941gv9oYg8JZ/90iT4=;
	b=JWRwnfux5r5J8zZq+9gK2330iHUit+Sw8Shg4n4N9WCFbn6i9Cib4zbS1kRGloBx6AFH
	 HbqVe5pH8/Rn9ZVEqTu/P+3T99Qqi2I7vhIGiolItL3UhI1dWL2zE59DDGCgqRsFz+t/V
	 IrbKR0VwX8SNJBcUP3G8aIX91S5MDr3odEOrvheDngV1DCSYP8X9m/fQUoB7ydqgejWPU
	 IdAAjeCipFHB9byfoJHYhBQUga/PrfK80D0AF6OXZLcDyXixR9NY+2MSaEVjm5kzkt1Ah
	 gY74/ceC3bmgWknnQLtw6bo0agp4sGs/IuqFC1j9SwO9if9VixXgwHtGPqfkjBwPe6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0vv5HDD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A16606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A16606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0vv5HDD
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so7066285a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612397; cv=none;
        d=google.com; s=arc-20260327;
        b=lM+kojaH0F5Fk4ECGLeuOmFZwq3wwge5YmJrCCrXUirwnuZIvyvfVlwP7Kk6XsZWac
         HGd3NYkkAR8MgTG9BOVlDdNO2BKb33yOvlilPiCxZn/rrcOnU3ATOzHgeHwwMslwTv+u
         4wJgoBsvAH4xGSsrtN3YwMgmIXEvcw9SMSpKDsBGBzOfgFbwLc6usmU+q+3PcnxBpPQX
         C+pJv5lyCa3i3ECO/dOl7rg+PAi+27yzIVd4AISwbsNtDoNq895/dgeZDnqsrHKrtwhO
         RuYakzWkVYmN2FLH+JyFAlTeYMFFOcAXbRRoyEokCY4qO68/sF4tM53ypHAG/WgJoeqX
         39ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Yz7JNlPDDcs8XZFhzYAPoSiu941gv9oYg8JZ/90iT4=;
        fh=v6Sx2eVafN6U/hLvBexR6L7g8BnWqAuHL4ZFFNhWE80=;
        b=FzfsvAxMOPcOmPh/79N97/ccjysmTbm3qpTr5LA/XblkeO0PpfB7JdluEkl489V/2O
         Ssvtu5qHkSMpja89LQnO+4FFl0AF3FAldRq1/0xoO/MHSvNgxQbi9ksn6N/LpkPTVFvX
         8qF8OHHRrt1Rbd1UpabBe1y49mY964pGujGgJDs40qfxvYvHv0Kum4gLzL31+64hWGYL
         rOmEoc2A12DuAk7/tmSSBYrX/KfPD5Af+YBxIe8GmmvIcDukKtIs57cC2WtdIMLUdYc1
         s+uwcBU/oBefwSbUw/IoYzVeKz4kgK/b00zmBaA6KUtrQwG2608H4T0mghSfKdpDxOfj
         m+8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612397; x=1796217197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Yz7JNlPDDcs8XZFhzYAPoSiu941gv9oYg8JZ/90iT4=;
        b=n0vv5HDDhQGJx2A3SZ9UrU+9j+SJMLmyzK7GRIhTgCeVF3W9mHcsWgDDEOIM+SSb5J
         d0zlmJEZMWQJbBbMP7QULVebH35itoKoCjJ0eHNerucf5DgJiMaidCg5rvo9SmOde1il
         E1HZ42khDgyKjqkNbwHk/IYMCc3VvVXmJ24IK1eSUsUsq5Sz+0xxCOasIX+zmAD51LsO
         21MDtIAT4wQCBGMbhKocFMemYjqSPdS11kFF/qU3oIH7R2e80W1dhPd2uTzfbpJhIIsu
         6/vX6CPqvL2aDs2Z/rHJe9uhXBRc0EGpUV0CAKNi4D+AQsll6t8CBem4My/QX30ws8qS
         seuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612397; x=1796217197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Yz7JNlPDDcs8XZFhzYAPoSiu941gv9oYg8JZ/90iT4=;
        b=i9rUDEiYE57cstoWnYa4PPFy0nl48pJ9/74z3vM8UarbQnzKqxN9yBhCk7mJeKcUwn
         tviy9PD1uHuq3A7C3iKbeZkZlCXdcUHkrfZg6gXrxRNRk4Ejx2nF50aTtUBBuaTykaBv
         ZAba2icvaztsZ+VtBH7UkuGKFghpB1xCW6U5WURfVvHibQgSamUCarYIqReGYxAXY4VZ
         z6+LLMQOcRANI5Q+ptgHMRHN0dob53Ud2YaVt0Bq3VZCx+6NCEahTKQB4uyDszKxvpGB
         h3AE2S/Q8t4tNDU33wh3XDOW/Z8IE6RL1dBJxoqJKzpxTlxTKwTTq8iMhWc7hFMgXcBd
         SQag==
X-Forwarded-Encrypted: i=1; AL+hErEOd+VVpDJSSSg/seNPlTl5Nbg1ygxWtc/6tm2BpER5aoZaPg8rOdSftSx1XvZ1N4LUr7tBYL6jpbjey50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eV4jxfiV+CxVvMg5jgwJMTEhSXAT1qKluXPLZhpLIU/Pg32yt
	CtzGh2XQXBANdo2pCBU8MmCDCvh4SFk0PO2oJfEjMR4UkfPAVDFi6WC+1rKUXN820KLDV7D6xSk
	/sevKPhh2MUb312UzC4CuVraDQeMgGIU=
X-Gm-Gg: AZFdTZfZrsRGWwAwLGmF1UM+H0oydfFH8xQLIT7PP7NMaTMTjoniofY5+/QFofrV5W1
	2IPMlCL0uvCnLsSCbziiXf+ULesJMPk3zgVYKVEaU4j9yLbQ2JfOSftu21jnWC2Qxsvi56LPQfv
	oSe/LsAQMqVr/uioKFCCVR3zE4U1tycCvXjq4nMoybNpwe7oDPxZvNC3m7sBeZtpHWF3dTTe69+
	ztvc1Q+c8w4pnJxsfriXUnrl51LvqOKiWHHblC3gHBpB1+46lOjPGCM0LDq32rG0/tFv1wyOMXQ
	5RogI+ZQx6SIvnb1uhfo5yqPik+VvlKSTIII6tI70R+ej0oiegWQr1YgZAGaKgFsLSSyOAuONzr
	axB+xCnuEH1uIqHv651Cj9ZL1SYJEplQ6uO15oK3a7yTDClu7OMgJxoNo0YSSmjqQ48BgLg==
X-Received: by 2002:a17:907:9693:b0:c4c:ddd1:d006 with SMTP id
 a640c23a62f3a-c513ab47f40mr1378964566b.38.1795612396826; Wed, 25 Nov 2026
 05:13:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-15-8ffea39934a6@tencent.com> <fc51ad85-16f7-41fb-8eb3-2b8ee595e711@kernel.org>
In-Reply-To: <fc51ad85-16f7-41fb-8eb3-2b8ee595e711@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 25 Nov 2026 21:12:40 +0800
X-Gm-Features: Aa3M54rLCFPdJCUVsWAcKF2l0FhpWm6CiFAaLjU-bCfz_TzbQSOhJaNF1aUKI_Q
Message-ID: <CAMgjq7D-EFYsivqq1Z4c60ZMh0pBU2ofgfqVaqp_vbPG8wbSiA@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] mm/huge_memory: mark folio as accessed more
 accurately on split
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:09=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/23/26 19:53, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > The behavior of updating the folio's access info isn't consistent for
> > huge mapping splitting or ordinary unmapping. The page table's young
> > flag has to be translated into folio's access info.
> >
> > Right now it only checks and sets the folio's referenced flag, which is=
n't
> > enough since folio flag updates on access have their own rules. Ordinar=
y
> > unmapping (zapping) calls folio_mark_accessed(), and it also checks
> > if the VMA has recency to avoid false updates.
> >
> > So first just use the right helper here to be more consistent. Keep
> > accounting the young PTE as a cache access, sticking to the current
> > behavior.
> >
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 75e8641bf9ff..fa9f6d21e786 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3122,8 +3122,8 @@ static void __split_huge_pud_locked(struct vm_are=
a_struct *vma, pud_t *pud,
> >
> >       if (!folio_test_dirty(folio) && pud_dirty(old_pud))
> >               folio_mark_dirty(folio);
> > -     if (!folio_test_referenced(folio) && pud_young(old_pud))
> > -             folio_set_referenced(folio);
> > +     if (pud_young(old_pud) && vma_has_recency(vma))
> > +             folio_mark_accessed(folio);
>
> Can we just have a helper that abstracts that? We pass in vma, folio and =
young
> state and it takes care of things?

I think we can have a folio_mark_accessed_vma(), and so it will be:

+     if (pud_young(old_pud))
+             folio_mark_accessed_vma(folio, vma);

Also converts a few other callsites too, also avoid touching too many
other folio_mark_accessed callers, there are a lot of them. We can
audit and see if folio_mark_accessed can benefit more by passing vma
from more places later.
