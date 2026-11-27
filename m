Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795772373;
	b=by44GWTVpKgirBpZjDZkjtrX/+nr7968PM2++HDEB2wpU+j6/S5NdL04RID8kkci4I8Y
	 kEgsEPhBoJVMcyqmSzbQM2XlUqrvQiDCj7oWgUBJ8VpPsZr+l+7vQIx5vUNw45yOZiGkd
	 zZ76xMOdgORUZYfzSLIisHPvxTDXl0n7de/Gowrr5CSI1WrlvqS51oVPH38/M0I16LT5M
	 gF7FkXMDaE9aPd/jC2y2EllSoKUOtVun7Z5rjdDtJWO11sVycL8ogCckJC3xdB/0+LjeX
	 tA2pQuen7/vu/RMQq9QvPJFKWLc8ApfRL2GnqKvKowa9klbXmk4LggvgxVNt5cZsnwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=K0z9LEZHumUAUHG3YdMFAeVsWg1NsvibU7Iun+HCcQE=;
	b=YNRG1hVoXAtJSAiITl8rcVL/oMoLfFJ3EEg+saqXiAJLUAFX2yYLUkt7zt5J0usTFux3
	 GCylEnDHBF+sIKSKe3nyCr8obSp60NzxSlyhSRy/43eVxny6pIQZwy56dMhQ6gHr14bBz
	 sM7/q1S18SvQFrmUymjteVIPQHgnuTJLKWYwWHxowOlCaq0HqfNAIeW8kho912gaA7vOq
	 kJd4n8VdQXm7MTaZs/qPSHrSE9V/6Vtl9ikbhlQhM+Ih7U7kL/lVwytWIGj/IV6YYt8q2
	 xcBt7AgonntTbdxwb/Jwv9keUM5ULj6DpuaczCrhISj7DVMcEF0Ca5MhXV3O3F4Prrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Cl2qQFTv;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Cl2qQFTv
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7IbEF157316
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:39:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=K0z9LEZHumUAUHG3YdMFAeVsWg1NsvibU7Iun
	+HCcQE=; b=Cl2qQFTvVltL2w23IhkdmlXjtl4mRblSIYOUrodH8uXBikuOyaPfn
	AwM34clYsLNxslN91njKCZR4h6K/HVDqMuRAgtZ4Zk59P3LKSkDQVTwk/vPEUm4D
	+VwkcfQajLtb/HBD8BWP7z6lSuyw/PsNbm911CXaYdf4kTJT4COVo4cDzuttG19X
	F1nwCmyLf1HyikDpTlGEvcGiftlaNiE7yKQ48qT96k73Dya5sEUwqeLxHRpO4NU5
	cZE7xohkfaFDJj4jowDSz4bgmkDAHvu5gCNYOsePuO2NuUcdwVBL2IW07q//387o
	g6lfNRkD/nwxz6Xg7hiEnYNPaZxoQ2Cpw==
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j74mxgk78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:39:31 -0800 (PST)
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6bb7aa8d433so850400a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772370; cv=none;
        d=google.com; s=arc-20260327;
        b=gGvqZVMn9l9Ln8YS08Ejww3hG5z9gWJ0JQBeI0+ddKeRDTI4RDb9wPr7efw3yUE3qQ
         k1rwX42R2iwmjMeGoCjKkqFnAUOs/P21k0trmoXibQWOqBs9Tesb6xonlBuyXz4BtyWO
         PlLuEWbgZ2Z1j1G8JChEh1ZpZufpqMdkSdwmdBa5DtMV1BJcuXLzX9jFLbz3Xo30b4rp
         k5Vp1Ih7EcRuWzDAirkZpQ1q2yV/Yg/w94+NJUwE+j5s24GOlMmyJTX7sTc0qMlICBQu
         xJqqmWVD93gRtwH7azFDMAwE2mB45QXEqeWzz79j7D5VdKumoC9yDxlES/G7jFpLa3Do
         AdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=8zFqGbpLQ4kLiiFXncahL4YN57S9NI9BXavbvixV9aU=;
        fh=iQOEHvOmhzP9D/YziopFRhGWPdJEZpcgSFWczgrZ4/k=;
        b=AeZBfpHK1AtuSyJkTH20pO9tuAc+dEfd8JkpS4ai+NKCbepaPSYI6jPnYaL/rz3x+D
         /FzBhsFMVLie52vmyWEb0l2zBZGdFhmpr8jAlbjJuL6+MWkdwKTcD+vrl32syik2dtEq
         tbFS/X6Z/DC5Cb8miB7SVSfXGknxeBQtQCSa4oTwhTI4fQalxsyGEXOxHh78ql2dYK9e
         lGne8UXpK6KVJii63huSTNOg6jUilGV8Ktfem6K2M9L+3pi869V1gEuvi27JUpJdxl5Z
         dWnSQXolpoQg6D7afUXpbkx1dBEiiYC7RocwaxlTn7zqvMM4BV6jc3JhB+5m9Lty/FnR
         x9yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772370; x=1796377170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zFqGbpLQ4kLiiFXncahL4YN57S9NI9BXavbvixV9aU=;
        b=dqJKR4YPb9PChvbBO6C4D3EuP0wzPDbv0i2yDAsNw7hu3GtGk188Lc1mA5BYuecuLQ
         0WsjRkPUSVdE5fNlH+A8l01bAT7aLODv6pgdlR10VPgiPYoJCPys7Z3/MqyHdXpJBcoz
         W0VjGLkXfvBcd461DIt6ovG9WU8yyG8A+r7DHsM8DcaBcnWxvj1EshI98ewfBJVawfVr
         JEk1bS7IM6Eqz5Pz2gVeIhvkGjfsc5cOrYAqoakpZ8AR6c40Qk5W1HdicXT3gTxtyZ10
         Wi6mz+sKRW0RPiLMmzBpHIZcmcCOomNPcOOxYMEnm826TkePAs2CUL6tYTHOC4l6hqg9
         Ahzw==
X-Forwarded-Encrypted: i=1; AL+hErEsR2zKsEFTqN7KynbyAlzyL6GmDwtZoc2nh1PksBl2c22VeRgoPdqpBWX+h4FDFUQQ4Z1LZd8onhuIZyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SJCDrrXt0SEL4YG9AjmhiuJodYLJd2gQsG3GUderHGTQC7vaw
	FA+x7iz6hxkyOzYF7gpp6cdnUM3vqcWkwSs1uhpWsuYYJGz40hbGqEQ9MNGFCzSMnM8Zfjo2GMw
	vYzM2TKiAy1eJBtpmrUHw3J52zwVIlFAR/LUjsU02tsMWli2OBEUsXwN2u22t/nYXXPWLdeR/TL
	reNLSueDp3EEuIEFrr+MmZ+sHPqkbrgg7HSDHBWHE=
X-Gm-Gg: AZFdTZdoRMOowmjnhNqzoYxDHeOl8pCLdkk0uRq/PqJdFazb4ui1v+UDczqLC1wxzc7
	iJo0WUjLwG0Yh7EqZLd4NmqLuzLOdz1XtRB7YegE/TjDD7sc6oGomu1HszYVqpO4O6IuHK/sPod
	qcm6d/ipCzMC6zV2vnf4bWkgogTw2VXRdG4ES+pJFI4TyUN0VE2TU0xr0kdXLodYKaKuIhVEdT/
	BYq4O4qSwA55c8hnw==
X-Received: by 2002:a05:6402:450c:b0:6bb:64cc:b969 with SMTP id 4fb4d7f45d1cf-6bb64ccbb08mr2777489a12.10.1795772370412;
        Fri, 27 Nov 2026 01:39:30 -0800 (PST)
X-Received: by 2002:a05:6402:450c:b0:6bb:64cc:b969 with SMTP id
 4fb4d7f45d1cf-6bb64ccbb08mr2777469a12.10.1795772369944; Fri, 27 Nov 2026
 01:39:29 -0800 (PST)
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
 <CAEmasaXWwWeuQnMbA+g8OyvNwe721Dro+1h+5pfTpzLuV6dx3g@mail.gmail.com> <0b7e81a8-d291-4cbf-8da0-e65e9a0b40a0@kernel.org>
In-Reply-To: <0b7e81a8-d291-4cbf-8da0-e65e9a0b40a0@kernel.org>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Fri, 27 Nov 2026 10:39:18 +0100
X-Gm-Features: Aa3M54qX-_pqmJg9C5gzk0ism0i4jtfnK4izYtYrn72d6ijUNYhsMgGVj8eDvTE
Message-ID: <CAEmasaXR8nP+jGF9XHOr1Bibo253wLgVh5D9Bjw_2Tjy8RFp-w@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX1jFT5Y8QgnAH
 AKBNxKURp/f0FQUEg/X24ZcfcbtxB30am31DC0KQZOyAIaVeGesr8GtIb2pXQrIYUedsJD1SzCC
 f/Yk2Lqp4HsPUMGPilK0bmAkzLnhzG4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX8k9TtV6Cjs+E
 ho2HMnBVk9YfRUREpooR67y5s7hPAucpuOvlNRnhZrEvyT2dymJC3RJboqBVmVU8pwcxv0VDXST
 ZOCx1cz/HSWCcB3+RvNVu0t3k7khZ2tRF6zMqjlDf+Y1YdYce6YyikV0RmI6/R8MXxt73dP6l9i
 1H/ugdCyEHG3eVnbnYKjky1vG6F6ASDN4KmWekh/tWWDZ5Jv52OYGewC8rWS5tx8edbses5YT2/
 hTd58if/LundVF2lsKF4pXedFjTRGZXkSGrIKvPSZmjR3RoB8dHwl3x2h0myvrUV7975TPOvfDs
 xoaYIW3KM5YmX8KgYQ4ajh/jcJQdFMatQ3Bir+Z/LoEL9PFuQ45xF8D9+vxegAnMEa85GNX4Gts
 TtXT3YJdfueRK+RY02h9bUr1uxDdtbbDKFCAImHZanTrCC6LyCMZRzQa8x7xOtBn1iVbNtP57zN
 dKBaxD/67CMxr+zHiNQ==
X-Proofpoint-GUID: GKt2_2y9-3_zGD71jIzBH5CaK2wxyQRp
X-Proofpoint-ORIG-GUID: GKt2_2y9-3_zGD71jIzBH5CaK2wxyQRp
X-Authority-Analysis: v=2.4 cv=ccNHPXDM c=1 sm=1 tr=0 ts=6b094fd4 cx=c_pps
 a=9KvDgq78n9V61H3VJbnhTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=BHRAutx6adPIF07HuA8A:9 a=QEXdDO2ut3YA:10
 a=j5kO0B45gQVIxiUYEfTy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01

On Thu, Nov 26, 2026 at 5:20=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> >
> On 11/26/26 16:01, Alexandre Ghiti wrote:
> > Hi David,
> >
> > On Thu, Nov 26, 2026 at 1:54=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >>>
> >> On 11/26/26 10:42, Alexandre Ghiti wrote:
> >>> do_swap_page() frees the swap cache of an exclusive folio on a write
> >>> fault only. A folio loaded from zswap is dirty: zswap drops its copy =
on
> >>> load, so the slot no longer holds the data and only reserves swap spa=
ce
> >>> until the folio is reclaimed again or its owner exits.
> >>>
> >>> Such folios add up, and they are expensive to free at exit: on a large
> >>> production workload, the exit time doubled when zswap was enabled. A
> >>> third of the increase comes from the folios left in the swap cache,
> >>> each costing about 3x a resident page to tear down; the rest comes fr=
om
> >>> freeing the zswap entries.
> >>>
> >>> So free the swap cache of an exclusive dirty folio as well, so that t=
he
> >>> slot is released at swapin, as is already done on an exclusive write
> >>> fault. The folio is dirty, so it would get written out again anyway:
> >>> the only cost is a new slot allocation on its next reclaim, which wri=
te
> >>> faults already pay.
> >>>
> >>> On the production workload, this patch removed that third: the exit t=
ime
> >>> decreased by about 15%. On a simple microbenchmark, 4 GiB of anonymous
> >>> memory in a memcg pushed to swap, read back, then SIGKILLed in a QEMU
> >>> guest (mean +- stddev of 9 runs):
> >>>
> >>>                      base            patched
> >>>   exit time    989 +- 24 ms       502 +- 28 ms   (-49%)
> >>>
> >>> The cost is paid by folios that keep cycling between zswap and memory:
> >>> each reclaim allocates a new slot and adds the folio to the swap cache
> >>> again. On a kernel build in a 600 MiB memcg (-j4, defconfig), this is
> >>> not measurable (mean +- stddev of 5 runs on bare metal):
> >>>
> >>>                        base            patched
> >>>   time (s)        592.4 +- 1.1      592.4 +- 0.9    (+0.0%)
> >>>   sys (s)         256.6 +- 1.5      257.5 +- 1.4    (+0.3%)
> >>>
> >>> In the worst case, random reads over 4 GiB of anonymous memory in a
> >>> 3 GiB memcg, so that half the reads are zswap read faults and the task
> >>> spends all its time in the kernel, throughput drops by 1.1-1.4%
> >>> (mean +- stddev of 5 runs on bare metal):
> >>>
> >>>                        base            patched
> >>>   reads/s, 1 thread   37310 +- 182     36889 +- 77     (-1.1%)
> >>>   reads/s, 8 threads 291937 +- 802    287954 +- 373    (-1.4%)
> >>>
> >>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> >>> ---
> >>>
> >>> Notes:
> >>>     Previous discussion:
> >>>     https://lore.kernel.org/all/CAGsJ_4xBtKGqXFP4zvp+Qn+tb4X7aCvXn+wq=
Dqot_cXR92DjhQ@mail.gmail.com/
> >>>
> >>>  mm/memory.c | 9 ++++++---
> >>>  1 file changed, 6 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/mm/memory.c b/mm/memory.c
> >>> index d477a4f986bc..dac0f0a24bc7 100644
> >>> --- a/mm/memory.c
> >>> +++ b/mm/memory.c
> >>> @@ -4711,10 +4711,13 @@ static inline bool should_try_to_free_swap(st=
ruct swap_info_struct *si,
> >>>               return true;
> >>>
> >>>       /*
> >>> -      * Free the swapcache only if we are the exclusive user and
> >>> -      * this is a write fault.
> >>> +      * Free the swapcache only if we are the exclusive user and thi=
s is a
> >>> +      * write fault, or the folio is dirty: its copy in the swap slo=
t is
> >>> +      * stale then (zswap loads are exclusive and dirty the folio), =
so the
> >>> +      * slot only holds swap space.
> >>>        */
> >>> -     return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
> >>> +     return exclusive && ((fault_flags & FAULT_FLAG_WRITE) ||
> >>> +                          folio_test_dirty(folio));
> >>
> >> Why not more readable as
> >>
> >> if (!exclusive)
> >>         return false;
> >> return (fault_flags & FAULT_FLAG_WRITE) || folio_test_dirty(folio);
> >
> > Agree, I'll change that for v2.
> >
> >>
> >> But ... isn't this zswap specific? Why do we have zswap specific stuff=
 in this
> >> common code?
> >>
> >> The comment already gives away that something is not quite right here.
> >
> > I am mostly interested in the zswap benefits, but nothing is zswap
> > specific here: do_swap_page() can also find a dirty folio in the swap
> > cache when reclaim bailed out before writeout, or when the swap write
> > failed. In all those cases, the copy in the slot is stale, so the slot
> > only reserves swap space. zswap is simply the common case, since
> > zswap_load() dirties the folio.
> >
> > What do you think?
>
> If it's generic, then the comment shouldn't mention zswap in the comment =
:)
>
> And the patch description should be all about zswap.

Ok, will change that in v2.

>
> And we should measure the effect without zswap.

It should be very very small since do_swap_page() only finds a dirty
folio in the swap cache when reclaim bailed out or when swap write
fails, which should be very rare.

>
> So, folio dirty -> We'd need another writeback because the content on dis=
k is stale.
>
> If we reclaim swap, the next reclaim run will have to re-allocate one.
>
>
> But why is this "is dirty" linked to exclusive?
>
> What if we did
>
> /*
>  * Free the swapcache if the folio is already dirty, or if we will dirty =
it
>  * immediately afterwards by writing to it.
>  */
> if (folio_test_dirty(folio))
>         return true;
> return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
>

I had missed that folio_free_swap() checked the swap count as Nhat
noticed, in that case, I agree the exclusive check is useless, I'll
remove it in v2.

Thanks,

Alex

> --
> Cheers,
>
> David
