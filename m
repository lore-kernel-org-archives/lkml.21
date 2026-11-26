Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795705318;
	b=OLDH0RrvgVjmk2tw2O33ZWoIr2A99h+6aoGlFYJ/sZI/kotEOjo+5cilO8I2lL3E0uQP
	 BpZ7qpGXKUA7sol8SmiuhOvnRcSBF15MRsEqklN6GN5+xhpX9S+lN4ooqOcSCiyxLfnsL
	 H2MBKox1tamv5BBSddxz7TBEBNhMhFzY/6LIjgV+kLmPbVkiRoY0P1d0gMIhx4+PcP5Xr
	 lpxTyM6rIEmqOCyEqD/wXT9mvHjkwWxBK6kv/FlDv3q94loVHOOCvu9VuKTH123Sw4g3c
	 6AgcB9c4UnZqY2YOIhOOCR8FhQGxtmB+BWGjONwm8FwYXuFjyG53jj79DuODQdf6lnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=ksHsU0kbsqVUkEZNVmcgFe4AO3w0i+7EkE+yHh4jTrM=;
	b=o6bgnLbCgCkaVbixxUFT6T0R2ApnFQH6zIc4DBSjnZud7wdk1AUIIkWkaQ4EUW4tUwYd
	 +oNDGwT5K9z1Z5g96TMsyqYPkrVfHWIgf+D/U1qVgufnZWMSl3x5M5N5VYoYV2JBKZwri
	 Q6xJi7BlQ7KL2GGfU6gbNj7HF9/+3uDG3UyI159uA455wb9IVvRaM/ecw3Yi5kv0jh1+H
	 ayka3a7J40GI6DOUIG8smq7+ye+GX9rAJDdYIY4bvP6Eb0oQBRYS3AM/YMDXxLMYNxoT5
	 oRrNrDR3nlWADDlfQCD12A+AEA/lc8GIsHU/Jg1aOwVwFvQnFpV3mnezngucgICiatg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=P20P0qzw;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4E4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=P20P0qzw
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUw912097275
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=ksHsU0kbsqVUkEZNVmcgFe4AO3w0i+7EkE+yH
	h4jTrM=; b=P20P0qzwdql3dJs55tVw/zSzER0pnEDse7ct7RVGedvqKP1wlaPFt
	2s73M5Y2IlukoczLKpiPu0XiW/qLarOOrkPmrP2TCHeRa0jx8As94si2fvP+lKkd
	2eNagtp00Z/AB6j7OnOoAuwuiMms5RE8iA5/uTUwzM8rGADXF60qRBA6Eb54t27L
	tyFd5dsxxp4AOKwfcv0BIv95oxDoozVeBFGbjIkFis2h1Bdnp1E1AxqoV2iEMzRg
	aH1G1eL+IPsXzC1At1XQHo/CnQZtoYWBvB6+Mi49vKJQP1n32Kxrv/W4W6xXBSJd
	NZtyf4UXDuiDA28Cd08oevAIA1bTncLQA==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j5dcnekbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:56 -0800 (PST)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6ba7b00b52bso821869a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795705315; cv=none;
        d=google.com; s=arc-20260327;
        b=Pe4XPQCdhLRFv8bycMhKxudvr1ousM0rYstNQebBmjPQjRkXP8rJHxCnw7JI3JbvA2
         rxZoSCjy2oNlmyPNPfpjVYU4tQq43GnVM5Ai/QMzdSAyBJ/jqcN12RUYWJgpIUvL2y7K
         AThQ4dJ/NoM/WbHMCwK8M7RZVrc00LdgzCJz7NKJQUIovqfWeYLTZD9+Ni8sq7JsdgPW
         PYl0Se43On75RloKDk3i5PEntEYnjxzUEEe3GfGX7QeP/cLpImBAtC1ihGbAXMJjcWII
         PgNj+g6x2GyN7GAq01uoazr+KJJbrTIk8bF26lmHfhxg3pr7Tyk4+0ck99WxV7IrBfFU
         iY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=BqPHn9TvziiIAHrsauOPgw6b2tlMG6ggA0GmAWeOUhA=;
        fh=kIT6sVchjby8NWmA4R/KwFHTt6NPUQajtRznAZYJKH4=;
        b=Gbk9qBgjRB7IG6laf0Ju8fgRYT0e3i7lVEltIJODBCLSX3KonyCkpYinCNsCD9ULLu
         R/DALUsBRJAza2r3nqmGZxATlW4XG9bXxDrbTpqb3qxt2VxWJXAWkO0khSLjko4dlFEN
         0e5I75xOVLWydfoD3No6Kxxz1AChHyZM88flqvK22JN/3s5DnlCsM6KAkI6C4IiPq0x4
         9Zl2ciS6e/nO1UvY9TtC9clcADbgExrhgJNKjlK/yYnIzDdKXqMfOfk6BcR6/7vWAXh1
         VbjdBCmNIH9tMSz9k3gYcIW6FgHIzZGuRwaxRZI+fS/xsEvh5Wu2gnJRtU+4VPZd1ULJ
         9Seg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705315; x=1796310115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqPHn9TvziiIAHrsauOPgw6b2tlMG6ggA0GmAWeOUhA=;
        b=K8ky5uJfxircpy2xM1JJX8rz3qCvoYX+9KcYt8IAcUKdCt2qIOAkaz190+eFslV3wI
         SWLL7hO/io18rcwDLUm3KP8SeT/M714fbz9V0Xh8ePg23FtVSq7WRlnIAUnlUSkQRsU1
         /qWZc/X7WIEOPYw9qTCa33lmqOYhYNAOpET8TsJxu4vdsY2j3J8vxJs7RJBHlkeGHzyK
         PeRg3d4B1o8/mc8g/PZQxSKldwZtwRPl/rS37unJPAkxRNpN9VPA67ApOfT10adIwSlT
         6ZoF/JWZhXq7Gn9WD7PUJ98CUZw79YiVfMcGwpB35v7eyGIpc54dnBZr8NQMrll7mFBd
         OA0Q==
X-Forwarded-Encrypted: i=1; AL+hErGlW6io4woFUswy4o3inVxGA7va66HFIgKOKWhp5IzigZT0A+ygIr+Q9tCcQ5lY9s2I7ruWS7AAOEOIpaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SR9Vq2TH5ZBMCpvpldNbXQXAYJ1jBKW1DVE2K9cwxdddk+wxn
	tl6Qpy2/LgLaMpyudh+okE0IMTY6d+4yK6GEDo4WGkX+kPWCS/7EyuRoe2OLilsHg5HNWoX0bwK
	+IugQBTgAoLMKbDFnZqI2K4Gxzi42TyYmVUC0Pgk6rk3ymVVH5XnXPqRJQ1EbICAFqv839Dq7D7
	2InC+86q61b7suO+YricWs/H+3SMEgn06Z7/KqYFc=
X-Gm-Gg: AZFdTZe5ki6fPSeblri6whbmNL4nqzsBC6z55I/arddTU6EXbraRcPm4jOtlHuObWeP
	Q1XW4ohindL5mQfCC+7ydVQciZ+ZhLqSHToIa3l3QEXI3SHSfOvr4FERRen1/Z4TNamn3KA9GbB
	UdiiegHuetJSvh0/7D2WHDVVG8mQpUx2OILip/tl7VbBzH0ycv0+iF2c7SmtGMC7TG3KovLXpCh
	npdeWW5vmcaIYptBA==
X-Received: by 2002:a05:6402:210e:b0:6b8:6e5d:31c8 with SMTP id 4fb4d7f45d1cf-6ba37d34b4emr16199823a12.16.1795705314928;
        Thu, 26 Nov 2026 07:01:54 -0800 (PST)
X-Received: by 2002:a05:6402:210e:b0:6b8:6e5d:31c8 with SMTP id
 4fb4d7f45d1cf-6ba37d34b4emr16199723a12.16.1795705313703; Thu, 26 Nov 2026
 07:01:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126094318.244973-1-alex@ghiti.fr> <98fecdf0-6409-4499-90e4-63996f33db90@kernel.org>
In-Reply-To: <98fecdf0-6409-4499-90e4-63996f33db90@kernel.org>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Thu, 26 Nov 2026 16:01:42 +0100
X-Gm-Features: Aa3M54rDcsYyFryAPjZjAPtJPfhPSO-4qzJEQsClg3xH9Aj6JUbbS_UM0fHTqdo
Message-ID: <CAEmasaXWwWeuQnMbA+g8OyvNwe721Dro+1h+5pfTpzLuV6dx3g@mail.gmail.com>
Subject: Re: [PATCH] mm: free the swap slot of a dirty swapin folio
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
        Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Baoquan He <baoquan.he@linux.dev>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Youngjun Park <youngjun.park@lge.com>,
        "Liam R . Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX+WG+iFoeO1/4
 UzSf62uZkOXJDAH2xBYhAj76PiIj96c5IALHSdMmeB7SnT1nzyBE3ewfLtOE53FgSz5rStl8uWJ
 O5Ku/GHfdmj++u6UiMB4psqD+Zp4nQA=
X-Proofpoint-ORIG-GUID: ZnysyEeSUhZ6T3UUQZCpGQtSmVaa355L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX4QfPVmCit7GD
 p6bNECC05WqfylsYW0qUWBk7mjK2GcpRCao2QTMdB041FVpo0zldOnxjzeUWqRwRoEIPs8lk8ku
 R8+/+6OZL26hsq6Fc7FA9EPOninx26V5igVwp6sf+w0Owj9PZnKDRgfQWwJmNCKFraqjP90M990
 mXKF50FomCaDgHcsPozJDvNwvqvgQfgXCzy3Gk5MMo6ouZSzwesgW8TQPBBw3tHiW77wbNBIY7q
 7iJ+hCi0vxlXjIvdoHpMIG2nYX/gEWsRFJsT7CMrkAiRA9pTLbZdA8rP0/AP1mLdiBrJaSkztmP
 GMd6cMwOPPMnaWkBy4h1tKgMKcao9ZtbOqTIKPKsM+8DmCmA4PoofUNJXyGXcFlyqpAykhntHk5
 FMq/eD1lKb3sx29vPIdbSAL6CevALeaJaIL/HDfk37zzIOjZLVXFJML1wd9eUnewvwzp/Yn3sKO
 YItYw2RL65O/A3f8GXQ==
X-Authority-Analysis: v=2.4 cv=Ku3YSmWN c=1 sm=1 tr=0 ts=6b0849e4 cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=oIRQa5m1TaVr89WThhUA:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22
X-Proofpoint-GUID: ZnysyEeSUhZ6T3UUQZCpGQtSmVaa355L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01

Hi David,

On Thu, Nov 26, 2026 at 1:54=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> >
> On 11/26/26 10:42, Alexandre Ghiti wrote:
> > do_swap_page() frees the swap cache of an exclusive folio on a write
> > fault only. A folio loaded from zswap is dirty: zswap drops its copy on
> > load, so the slot no longer holds the data and only reserves swap space
> > until the folio is reclaimed again or its owner exits.
> >
> > Such folios add up, and they are expensive to free at exit: on a large
> > production workload, the exit time doubled when zswap was enabled. A
> > third of the increase comes from the folios left in the swap cache,
> > each costing about 3x a resident page to tear down; the rest comes from
> > freeing the zswap entries.
> >
> > So free the swap cache of an exclusive dirty folio as well, so that the
> > slot is released at swapin, as is already done on an exclusive write
> > fault. The folio is dirty, so it would get written out again anyway:
> > the only cost is a new slot allocation on its next reclaim, which write
> > faults already pay.
> >
> > On the production workload, this patch removed that third: the exit time
> > decreased by about 15%. On a simple microbenchmark, 4 GiB of anonymous
> > memory in a memcg pushed to swap, read back, then SIGKILLed in a QEMU
> > guest (mean +- stddev of 9 runs):
> >
> >                      base            patched
> >   exit time    989 +- 24 ms       502 +- 28 ms   (-49%)
> >
> > The cost is paid by folios that keep cycling between zswap and memory:
> > each reclaim allocates a new slot and adds the folio to the swap cache
> > again. On a kernel build in a 600 MiB memcg (-j4, defconfig), this is
> > not measurable (mean +- stddev of 5 runs on bare metal):
> >
> >                        base            patched
> >   time (s)        592.4 +- 1.1      592.4 +- 0.9    (+0.0%)
> >   sys (s)         256.6 +- 1.5      257.5 +- 1.4    (+0.3%)
> >
> > In the worst case, random reads over 4 GiB of anonymous memory in a
> > 3 GiB memcg, so that half the reads are zswap read faults and the task
> > spends all its time in the kernel, throughput drops by 1.1-1.4%
> > (mean +- stddev of 5 runs on bare metal):
> >
> >                        base            patched
> >   reads/s, 1 thread   37310 +- 182     36889 +- 77     (-1.1%)
> >   reads/s, 8 threads 291937 +- 802    287954 +- 373    (-1.4%)
> >
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> >
> > Notes:
> >     Previous discussion:
> >     https://lore.kernel.org/all/CAGsJ_4xBtKGqXFP4zvp+Qn+tb4X7aCvXn+wqDq=
ot_cXR92DjhQ@mail.gmail.com/
> >
> >  mm/memory.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index d477a4f986bc..dac0f0a24bc7 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4711,10 +4711,13 @@ static inline bool should_try_to_free_swap(stru=
ct swap_info_struct *si,
> >               return true;
> >
> >       /*
> > -      * Free the swapcache only if we are the exclusive user and
> > -      * this is a write fault.
> > +      * Free the swapcache only if we are the exclusive user and this =
is a
> > +      * write fault, or the folio is dirty: its copy in the swap slot =
is
> > +      * stale then (zswap loads are exclusive and dirty the folio), so=
 the
> > +      * slot only holds swap space.
> >        */
> > -     return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
> > +     return exclusive && ((fault_flags & FAULT_FLAG_WRITE) ||
> > +                          folio_test_dirty(folio));
>
> Why not more readable as
>
> if (!exclusive)
>         return false;
> return (fault_flags & FAULT_FLAG_WRITE) || folio_test_dirty(folio);

Agree, I'll change that for v2.

>
> But ... isn't this zswap specific? Why do we have zswap specific stuff in=
 this
> common code?
>
> The comment already gives away that something is not quite right here.

I am mostly interested in the zswap benefits, but nothing is zswap
specific here: do_swap_page() can also find a dirty folio in the swap
cache when reclaim bailed out before writeout, or when the swap write
failed. In all those cases, the copy in the slot is stale, so the slot
only reserves swap space. zswap is simply the common case, since
zswap_load() dirties the folio.

What do you think?

Thanks,

Alex


>
> --
> Cheers,
>
> David
>
