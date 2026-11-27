Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795784435;
	b=zr5ojvCK/Z/ciB9I1k6D7kmOlaks13Ylgc0FrPyf+DRISqhvGfoAR56E4seLN0sMjnQ0
	 gmHqXRoNSdnl/1kkJYLmNI8Y6F0wpID5N9wY3Vb/8lOpzh8zOrazAYcp6U1kpNjPQiZ5f
	 t9+rlJ/bApOlCiUu1CmLy17jXzN2S3DdZ0deM7lWYDdhrhKa9AHOdls2MJCQ5codlHv9p
	 s+6pYcMNMke6+AG3fYudcKLSmTvPbYq8tUMN4oSeD/nqiP0zbOeQE8UUiVs6Cc/YwXn8m
	 AQUjr4AnL38vbDdLZTxAxMj0zPQkuX/tdEb2Z+FkQkc6PdKY1Tnck8mvKLMjMzySUUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=7teMupy8MF4YjMpK/hwe3YNA82UcxCnXtUs1S5alNwo=;
	b=ep3l6C6U/aVtk1Sm+w2PGKb1d++C5Q8A51kaZ4+Tf2QL2Dyejc+929lR7G85JWRMtQ95
	 36dMt2t5/1T/rQ61rNQTCFf+d+THjQHQ+4U4Ixsbnya1VmV2CjYyssSslXUzXbSJGkOfl
	 C9LNNPjMTAAnlWzmfMUM1WlAlnUmBkwSFKcZp0OYPxCvJgJ8dfhJOhFZL3nEfafRN+2i6
	 8Al/TwUlb33yW+bD7ftFQDLEKznSFJcfEXs3p5dG9uentH2tJvob2oEGEsPCOwntTfi5d
	 UyRP8ZSytHNwGkkk+P9IPHtVZEME1gco3zQl0aF0vTsGMghjr4CX6EwLiepQkHlkL4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="aXR/vobn";
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173E606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E173E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=aXR/vobn
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ARCgsG12242724
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:00:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=7teMupy8MF4YjMpK/hwe3YNA82UcxCnXtUs1S
	5alNwo=; b=aXR/vobn8u2liUuC4mC3z46nuYvERdAVdlwRS3iXR7MxMxnZaaeQZ
	OGATlvmouiioIpYkJh9/z4lN3mdrmb7e1Siao+wlkFpxLtC9iwm/uH5+T9D3JASN
	MhOZ98t4b/75WfMpM/Pi846qnf9EkMtRAxBNv8VQtqOTQQor9FjnKbZg4pTPuvvp
	WUlw7bKtAfa+UEZ3zeTeO8bGeRSiXlQH2Pd8PmKPpesz/258zUrWttMNy9Jx17fw
	EWEwTHMh6ucq0dhvTeLWqN2iC482nOE59FbCgw/zimqJKFkZLeW/SLAKEg0goMAD
	8ehAFoXuaAvUEvpBM2zwzvovurO2fvaYA==
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	by m0001303.ppops.net (PPS) with ESMTPS id 4j74kj1ch0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:00:33 -0800 (PST)
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6ba63cc6d3aso7175031a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784432; cv=none;
        d=google.com; s=arc-20260327;
        b=C/lBW5ku6/OfnTwWbl7CPcafBQZDFjIBTGR8m7j/6VOPJLsubr1xhZqaZHaA6S/SSw
         h6SqPwSgJvQkQKD0UXjbaSK+TAhPbu+LTLhu1muqjC2YdD5LNA5uJforIMRrIupRSmzR
         wDqUlsmjZIRMpHNAp6BYald7edJibx3ryYxoo5BwAprWgAmqSrssHs5G02/GwGwrfB8N
         ON6qyZjU+iehYyDL6+WUJyZ9PH1Ly6S3wNZovM0rc+TDX9Uh76H5UGyd92vFk0EyiIQW
         RtbJIiMUamh799Dk3XPqyLjDHZtts5qcC/8e9tB97ToMBesCrYyBbIzIlD8cA/ML9FUP
         OTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=U58PdAKYgWEy9xrKD7vJr8dnYymoYkrZQQMc9UOq6KE=;
        fh=+WMcFCmav807soVnb6IF+BqPDffe7hHeMYj5vIthkPg=;
        b=cIUpotNccNRoPASQoZs8hdmgEanpX5WdUJFFS0CKe99n8b8usixYJAx4Bmk11ASlKL
         9w6RwboX2ZRqcgNIQ+esPaD5XEVMDePvf7/GSxG7D5iqBagy/mpNyCf5Jg8yC4sZbmQ3
         Zud38/X2Bnx20VG3kcUO1GYlFjdAyD6jh4+LTm3O4ItueVv5zd8k8YYHzHtNlX4HfEZn
         ko8CcP1ahcqOfF4jMkV4TPrqY02Y+IbXXbCbdAhbpZaTyr74QNDaA+m1xjaNbptAA/yX
         DhxwX70p5NCnSdhaqt3m/QOF6ZDfSvQWnQvtIzKddQ3L3TvRPHcF9KaQJFkD/JMMd77r
         Lq4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784432; x=1796389232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U58PdAKYgWEy9xrKD7vJr8dnYymoYkrZQQMc9UOq6KE=;
        b=kSV7yzHQU0zERphT3LQvkSTQDcJAZQFVOy/ythKyLMz8iMeI9Zg5g2cYCOer+O+s0z
         0p+i15F3aQWEItK4Xdd+UCfmZxfbhyMVHJLJzZHbHWLNveA+ug5mUHQMBJUO0M9EanCQ
         WlCsmH82RKIw3DO+a6J30X5hBN/v1jyM4Y4uGkSrcGyuebcqM9RzMdlLhjLjo8zlhmgK
         O8qojgBVdf0xCmwlQE5DaKot6kymMETojvvRS0MbDcO/NOAhny0xxr9H6RI+ZNu/OX0Z
         n6P9zoi5nH5WKIXAtBmIN0VF5SPDXFP5C5jTzZGfG3Y5kh2QuYPAwcTRy7GM3EZXjghd
         5ZsQ==
X-Forwarded-Encrypted: i=1; AL+hErEm0m3uQTwUUu2nD40eMfBPTRMKUvnAZPSIIJA/4BBdHd3uRlKufP50DajBvLmRIXXtAkop8yqNb3Z8Gpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uYl3IfSFVUFtrtsH0MRs3SrqhjivcEnj4aVxUKUKC52YWW1O6
	JLyCRmeyO6KV7M6NCMmGSe4Lmjw8mkTqJ2yaPyIBuzYYL4+0sNPr2g/xGOUvHR6elX7wQeC+uBH
	AtTU3VkmMhDQjWGMMCs5CUflk4soN49bAYnCin9lc/R/gfwy7GxJp+ZNhN0sQAP2XV3YhVCHb63
	Vs4DlWgfZkaIsbgnSFIxpTHWOFNiL2ZHaVOT7Ixpg=
X-Gm-Gg: AZFdTZdti/sQ4cu1AerKeKjcLRKQUkyTcxKeRYP5oTBIm7l1+Q/eoCxMd3w69ubWuCc
	ZMQmisJY6KsjVG5t5gh6h9gAwrbY60ECjVDhmSVlVvxDLVwEw9yz1q4pCN7mOJ3qlsbN0ciBTG3
	vjXWjckyJFQlIUD9zdu/6jLDKvOLIEOtU1ZPQUqil/SuYrmLoCSiF/UKoE+ByNsNhvL6aAn/61T
	jifarBNsLaIcvG+
X-Received: by 2002:a05:6402:24a3:b0:6bb:3e3f:52ec with SMTP id 4fb4d7f45d1cf-6bb3e3f5e7dmr5705789a12.22.1795784431918;
        Fri, 27 Nov 2026 05:00:31 -0800 (PST)
X-Received: by 2002:a05:6402:24a3:b0:6bb:3e3f:52ec with SMTP id
 4fb4d7f45d1cf-6bb3e3f5e7dmr5705763a12.22.1795784431451; Fri, 27 Nov 2026
 05:00:31 -0800 (PST)
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
Date: Fri, 27 Nov 2026 14:00:18 +0100
X-Gm-Features: Aa3M54rvqZUJkH2JRhumkYIwpkF7HMuEByZ3mHW2QZ8e9F4sQ-Co7N_mhVDAmHc
Message-ID: <CAEmasaV0DX+7=GhH2k_AzqSs=0gHsEdTEr9GFPg=e5Qr0r-MRg@mail.gmail.com>
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
X-Proofpoint-GUID: s694xIC1u_q6CGF0j8u2HIqmS4pFhkgu
X-Proofpoint-ORIG-GUID: s694xIC1u_q6CGF0j8u2HIqmS4pFhkgu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfXy9seejgnzd2N
 8Ui8F1Im2EIdYLMALXZMqSqURxKnwXCje0fqhMB39Cs+WGGEbJopXAFz4WrrvuyG1EVBW7PsF2E
 8ky66gVQctCGBTSxUQsDJgYIu+gYZcw=
X-Authority-Analysis: v=2.4 cv=Jr9kP84C c=1 sm=1 tr=0 ts=6b097ef1 cx=c_pps
 a=CYpx6mtW7qE8U/l5VCnCPQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Zl66_HLDLhFR8LBIjjkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX73i8OEbtZeqg
 twWJwOK1FI3r4ftWFx7gOnGavOSo+ZBSMsE0u7GwqVVWeIzkaoDmsXQtXGx9EqAnkqTddbjblIM
 LctWlqD692h5ZZVa/KoYRjGdMyvBc1Vo7RkMl6AXt6ERbolm5bVb4CZCe77kB/RzAbx5EcFQtOD
 FB+rZcqPLG6eckN7QpDW0K25PiQ4swpjdboPWm8Usl1vk3LjXsEJraBpt+7IQwLtcSAbFgydTmQ
 H5qePncAM05c42Rw0dkpRn/FVA3R0S6Cl8YIzMf8BOt1Pv6OQLSYtQrHrnqEdg2CYLyWhjo945Z
 ZIDZnNiLdikW2+ttiQahA8oextstZ7M9GKheToeCwgAAE+WuCMv795Ls+eWwjuFgZ0vfu1zxpR4
 xc6I3kshL008kd+mPdof8a1zy+psCNhJNPYBic0TQxF1VnXesXwed+Bkjy6k2zUCAEpQclKIfbb
 oih3msF4S7kqRuZAFpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01

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
>
> And we should measure the effect without zswap.
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

Just microbenchmarked without the exclusive check. That handles the
case where a process zswapped out a bunch of pages, forked a child,
the parent zswaps in a page which is then non-exclusive and the child
reads the
  same page: the page is non-exclusive but the swap count drops to
zero and then the swap slot gets freed.

                                        exclusive check     without
    swap cache after reads     2048 MiB           0 MiB
    exit time                            388 +- 39 ms     229 +- 6 ms   (-4=
1%)

  And no change for the exclusive case (504 +- 20 vs 499 +- 11 ms)

I'll send the v2 soon.

Thanks again,

Alex

> --
> Cheers,
>
> David
