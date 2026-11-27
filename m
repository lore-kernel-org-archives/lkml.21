Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795772411;
	b=Z5NNc1lPFgq8VWoPKuNK9dFGvBdUkLaB3RW6GechzUASHi4Y2DGNv/MCSau7fP193gEz
	 vMKjO1H2M2kh29BGd4lsaNhnA94Cz9qF/PtljUOwcgJ6D3fWZDUmp59dDSjMoFwgAFGJL
	 FjwK+hEMW5t/AOiWxxw3NhwUEg4P+33fBj0cUeTGwONV6sQoAOA0jFTMStOB6ItCmJSYK
	 mYgze/zm3TqGpIUqJwrurIIFcbF4dHQ1LlTZihN+KjVlcKwDV4FtsW8eHbQhta4ImY7ML
	 RLGZtP9XqyaH2Tntp7ErcgsBH5VU3RFBEq4OFZWWMqmlI3V2FncU3pVzvh3slVKuREw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version;
	bh=is5J7r0Ef/xrmo4YxI5quMbN9FdWHv/9/YnjItP6Yt0=;
	b=ZUL2fhQnm3dUO5rSVuG8YFw3mlTuWFgNOQX0tw6Wqzqb2Nl7uyvPs57CinsOTOsa8G1E
	 Po9Vpv/W2fjig0xMFE0cNxYWxCDrc5/cUxBkf8Cm+HtHv+5meKI/zw8wk0+YAgCbBxcxg
	 aBnK81pZULOHxH1pBJqMGFqFfoJV1eZE3WhGK6p0fquReSx97EZ88J+s79kKpGJBgTURm
	 v6oY70RTXsqOEP05BaWDQ5JrXDkNVCzYboA54sG1ypgbcyqeCgi84nsea13BpwIhyFufH
	 VdSGALelLWpCi8/ZmKCiTTmBiPj29mUnV0q9iYlkfwrQMwKgHrVFnxiC47sRodsGpIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=DhQjNKNt;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B495606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B495606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=DhQjNKNt
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7ISux1795737
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:40:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=is5J7r0Ef/xrmo4YxI5quMbN9FdWHv/9/YnjI
	tP6Yt0=; b=DhQjNKNtWKTSVhjXUMjklBf860c2koaQ0BDBebFB8iv1+48TJ4l4O
	RK2rrVoQMZm1xxClAAFrl3sW8FYdfrZlX2bmE8a5oeeRyLxsQMwwjSD8dZHZ41YQ
	uL1YMuc8N/b4Z4HhoIJZSE98aDbsECIHIeFFh2Z1jsrr35DQqA8f7D3H9qbNAS4Q
	p7PYhI/I6441lOuYGk0lUMb/24xsx5LAQ6aTwxoDemHaoVRa1lHPa3tA36VP+xPo
	CWyX6iT+jygqJwYBh2UBjuFelbpXC7qPtXLUDr07Q3+2Kufxwvb74bIU18+5aemU
	uyBTpoLmo9qKqlvu0P/wtwwtUJO7bI3Qg==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j74m30kvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:40:10 -0800 (PST)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c508bafaddfso617002066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772409; cv=none;
        d=google.com; s=arc-20260327;
        b=D3fQXrUDKGR11i3e7xSIQAuD+xJyA62ce/kR8hI/wLmgAGSZMQFBQyM6UdCPld9ZCE
         Krl4Q6aKUehumk4UaJYNeEiwahnzl9bezaKBHYqGeN6wlbtH2+43m0tjnjfqGgzbdEvm
         40EZ/Fet7jW6PsUvoKjgLRqTdk/JSdFPZHrIhpQwz0m8TOOsnVri7/o1Um4ZexeRSdk4
         BOoAyIbb+42qzYangSlXI2krGtq3F+5T5YYQKlUj6P+DrOhyyn2Z40zIBNwGy3ZcdoUB
         weRv3rBmtVpP7l+UU+CDbqiliuHTcq2elaXvRjqPw9VIgnFYveD++OjeO4rcTblStkch
         SHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=E74cUDt+53y0CLiPmLFJnM4HNCk8BJIOGuonFAunoHU=;
        fh=8Xo3pKe6B7HvWxnafH/fGlFdXy7TzQQn7eB1cZXNKK4=;
        b=p5Huh25THDrqqqCzUXXXIhc4icCgZq5tVYO0lU5ATo5DT+WeCu1I63XFvIL8ES4bpW
         /yl95McqBQWZGUQ8rGdDCbX2YFIl+UOhXrG9LkXbYuH53+EjAKow0JolCsrWqBYNoYVH
         yuU/lRTGFjA3m5tHaTxx0gNynrYDf69CZVRhi2QfedQrJUbO0E0/hCXTcat2fuIYE0FH
         WoM+kn9ky+vZQ7tjvnBFiPj82oXhgk7sWDRdvbJLK5rmPuhONJlJSA/rSQ8vr4/Mu2VD
         Ms18q49CX/qE70xIhIwhiQEi9MHs1PlSUKTPLzQXFGDYXcilaUsGAH2WXXWlYc3NMWvR
         zJBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772409; x=1796377209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E74cUDt+53y0CLiPmLFJnM4HNCk8BJIOGuonFAunoHU=;
        b=OOQ0Uyh8rBlLGvxKAq7UAbUV3gAMq88P+UXs/QhPLKPYFsPahbibFwPjX+yQCZ/v26
         VyM0OnOcoMX8kVYmj4TNM/B+W5EE1CIPLvjPmjKQhJHzWVg3g+7HPYmvKHnyP0UOp56a
         hUtI9fMrINFdiBaU9M8WMXQdU9+vwMuPwWeUPi+MyL3rr7w5mD14hU7Lz3Xrv4W/Dauk
         4osK8C3cst5fyXIbL81c96kbB/UtlXQk9HwrBLYGyDgof71yPlGtIq0okpntwaQCRsJ9
         UzfS+G9eX8p3E7DcLF/QSmj+LAbDjTGB/J8wsxB/rBJpW9bLM2iB6YoNgd6b4lJOvn+0
         yHkA==
X-Forwarded-Encrypted: i=1; AL+hErEp/ViBNxECYwI7i4KMjRpaXxRCOrvWQHY8/nSRqo7s8qM3QaS3lMLYva+d9mA0MzxIyf23p+IGGBraN3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Mpp2L2tpn02UduSBxEwXNLTdgEN3PedlZIrT/z5dAbmOEiBz
	9FYYQ3luTQXCzMK+QVzMXRv1LjBgdLY63y93n4uTjXYIDzS5kzhGI1VyBVF6pACbhOdsj366uw+
	nT4S7ddlPuUEVyeGiafI1gBkvUK1osZnxUe8qQbdLPpevK83k9EnQr3JnfitqrtYecrRelfRCRJ
	cdUAsAXXc1U7gjoHkbL6IoLrM8U9UUIpaHCdCA3fk=
X-Gm-Gg: AZFdTZcmyAB/mVV7Bblm5h0eRk90Prl/akEjESWBrptX+EtXvGqMDVGX8K0Jc+r4Qte
	/h7/dYXUtnH5G8SHZ073INPmGIAJMiZGu7VhFhoENpqz4WeMEP/p95pMW/eLD6W4u9qUY0aSiJr
	BD6Z1JY5sg3y4k7SxzjNg5NnDk52ypbTzH3ajJ0UYIAg0Lwpea8QMjhfB/zhprJ/4dMW6njW13a
	ZKf+03Bim9+HRMsLQ==
X-Received: by 2002:a05:6402:2812:b0:6ba:9d0c:cc6a with SMTP id 4fb4d7f45d1cf-6ba9d0cce2amr11603243a12.30.1795772408974;
        Fri, 27 Nov 2026 01:40:08 -0800 (PST)
X-Received: by 2002:a05:6402:2812:b0:6ba:9d0c:cc6a with SMTP id
 4fb4d7f45d1cf-6ba9d0cce2amr11603214a12.30.1795772408589; Fri, 27 Nov 2026
 01:40:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126094318.244973-1-alex@ghiti.fr> <CAKEwX=Pt1ke4MdjDB=bpQn1bBbdxVao4sx1ruTawYQUY+ROvNA@mail.gmail.com>
In-Reply-To: <CAKEwX=Pt1ke4MdjDB=bpQn1bBbdxVao4sx1ruTawYQUY+ROvNA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Fri, 27 Nov 2026 10:39:57 +0100
X-Gm-Features: Aa3M54qcjTs8ofwTqh-jGgLfXEfH8dMC2a6-W8fsLMUfYshQ-oilOzocX_Q6zcM
Message-ID: <CAEmasaVP4FSKNqThkqtTn_Sz1EDkK=qb2TGVdoTAVa=9XBwcbw@mail.gmail.com>
Subject: Re: [PATCH] mm: free the swap slot of a dirty swapin folio
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <baohua@kernel.org>, David Hildenbrand <david@kernel.org>,
        Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX/RJGcJSbjgdK
 WRNGin5TwClYUok8wRXuJ5TzpYOE5lRfMQZR+ktU7oHbDCkydQXE4N1x1tnvzESO8JDN5lC+Sr5
 cLvoUAOtZ2ZVSheIYK01syvzYpCiBTKxCLSph262ips7L8y9R3BecCncM1syKWbVs3FqMfGRJQq
 qeOzIWeg/89HWi9X/XrJUBDml612LopKytTUB+Bx9Hf+yOa67y+fi+jblpL8JB8NbC/lpjwD3ha
 gvBTAj0afPhc02IUO3oSSzmDeDOVfQzrGAGFA9VtUcI9kw1QIivjCBxfyvUwRg/pKaEmTs6l/r+
 +ZU4lkxDoR/v+N8vkE1rn7GsvjUvaOwQe+mWDGJTuWv9bLuJwMh487EINkeykomd5S95dlHe9de
 7XLHr1hPAeMTtOl2spgukRI2Isf1mYhpcfBsDvkIURusC/GFcwC13440/VHLhjPhT/KgUoBxvnt
 mCNmTkQk28/cj2jzw4Q==
X-Proofpoint-GUID: HZYpwVOW4xBy_o_b_wQEEvUvaNsaXgRZ
X-Proofpoint-ORIG-GUID: HZYpwVOW4xBy_o_b_wQEEvUvaNsaXgRZ
X-Authority-Analysis: v=2.4 cv=X8XHu2Te c=1 sm=1 tr=0 ts=6b094ffa cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=pGLkceISAAAA:8 a=vvh9Qk1aVFpNxidmG9UA:9 a=QEXdDO2ut3YA:10
 a=PsfoTyiJ_72bb7xyA04f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX6wiLtMmNoXDY
 nM8USopRqqTBbiMKRy2tWYNui8kWkWuLxdF6sAMseCDvETluEi7uiTcSs0EblHzVLKtbw7LMUW5
 So773WKgcFfnEJldblEDcGIIhW59pnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01

Hi Nhat,

On Thu, Nov 26, 2026 at 7:15=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> >
> On Thu, Nov 26, 2026 at 2:43=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
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
>

First, thanks for folio_free_swap() comment from your other message :)

> I think this worst-case throughput drop fine.
>
> With SSD swap, I think the number is even going to be less
> significant, and furthermore it will be much rarer to hit this case.
> When SSD swap IO completes, it's going to be in clean state. I guess
> you need to have a reader race with a writer who wins the race and
> dirties that page before the reader?
>

The race you describe would not produce a swap slot backed by a dirty
folio since the "winning" write would delete the swap slot.

I (and my nice AI companion) think the only way (apart from zswap) to
reproduce this is if a swap write fails or reclaim bails out, which
should be very rare.

Thanks,

Alex
