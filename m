Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955620;
	b=Ndq9fyrTYPM0iKNPiXHlfYxX2JBVFOKTGYXhQtvL1Muiqgt2qdyap/1UYGLD7G/SwfO2
	 MAokGFN6pHvH92qwxsa9luBu01+1H3CKvOX0ouLCfvO/cjoGn8ZgElf7DrxlSloSmNApy
	 26gH5VH4Yz8GwP9Tyr3El2kyyIEpYipluOYSiKEAFHuWkn8mcJ6WQSDmSdpO080ZZXZIi
	 +xrPg8EEBDZDpt9ghV9VpqRhZ6DUGMbTaabfZ2OKj9+g77pG51+UjEjoMQjsVYXEU7tWX
	 J2wmiVhz5+vTQS4VcQ5Ic4xnHKvXIjfPGNPOD1+VCj23JcT8V2LOVj/cC21Rfe2D9TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
	b=vDwIkOCXagad5hDZFxnEMadx4FK16E8v17fR9BUsfHx4pK5uKJ9TdPu4LABZJkbSpxrt
	 XIuvzUcQFQLCoIfGROJcEiF9qhfKKD0bJYT5DRUnbdma6U5SHbMVsT9SALoBONuorC/li
	 g+Z0/b82G9DCp9hNqzDPM1dbPCESNfRQxFkd6BkWtZvBHZqsJv3/Hx737WEpXXQxWJvj+
	 SFY4SwXfIPPa6XlcsRHQZWLLQ676qljdPHJjsNTAH8TTkncarT5yys57sE/gOEWpDWvam
	 kZZ61EwR1kruI92XN1TbQKrGhWKullYlduzuZALqp9M1xTOsz/Ol1JSCSE19TuiJgjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF65606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF65606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfYLM2157379
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:46:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KSC81XL1+EQ
	pdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=; b=OpD+6PDMlyRVIQ4gUsxd1pQRiiY
	2xNljoVElEeEhFUiOG5Uk44VLPG4O4uXpXj0+j4jeDetx+c0P8e+noxSYq2lCh5W
	KHejIzt/I4UdTJmzw+Fg/nSj7cB1QTMx/l3bO+xrP+TSeATVVrDxWTZVHibCW5U+
	hjOQG+u9uC1e2kybz2OaCsXrkrsDWl9/U/SGRqGmJY0vG7rKiLXndtlvel7lQl55
	sdjYVggRIUMT42oLfV5wteJXfkuV+1P3ib3Fp4ylW8JJJGpvlzjjnP6mzY9S0HdJ
	AQ9e8xf/1KwJnz4XcYTaX6HmGdSH8UZ30qmpl1eTP9PIAKGbfG22H6j3L9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu603bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so171809a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955617; cv=none;
        d=google.com; s=arc-20260327;
        b=Ejk6VAF96/cafLrOOTyqB4DXu9Dg6B1Lc2m6INphvzwY3WVEGmPzGUxtWjck1YAuC/
         SEK8A/q9fBYDxV87oM5uM1ck5NVhS9KB6AnmRouXMYapsMmNwNpUjENpnWnmrB517IZl
         U8QlRRFlY18UBq3SWgtRB4J4MEaKqbNn/hJwrjfEyxRGKOaLwwXPN16Iyicv2xnFWB1o
         5Cjo+dBdJBZrFnnZybl4M0g9RX/Q2HhLvgIzNrP/9HRkAJK5L6PzZZFt1xuWv8kCM+IP
         sggh8BVcvq3TACcwMYf++OHRQwdcar1377wviZstk5/BbxCKZYVxdy9JJ98m8ZLZg/hF
         /Obw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        fh=yGDr3l7vd82Z/rW+DocLc1cuqWmD9Ho5k0g2yP9uUas=;
        b=bLUhegkSzFwUBNTD/ar6FCD9H2k/50E5eRTspAgsNfqG/GzvEZeNSHVDZZykQjUDZ4
         f4PuRtoXo55wqI2CY5/cjMpqU44r54saVsUXZxxsbjIUgm7I0ei9HEhGr7ETiiG0e/vz
         gW80K9/gsnz/w9tRH3NOqyohk0p/PZwGgMKs/V25NrVBHyuv/g5ZctrYInqvruo2LbzU
         vAt9pXa/99QB5mmdarXF0u+8l4SOXlWVvUvpLgh1frJnw6n/6SPHSQQJufq1xd49Ipjl
         CPhFcH1uWcp+MV6A85MayKiqvVN8T+lnwiuyF6hyBqVxfGGye0N7j+BDyTai/yT9sd6M
         Gs1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955617; x=1795560417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        b=zJZwdVsvRZua/d0vS8tNQr+prjl/eNBpJtQfV+UmaI8KAHrKOui2u+H1Nw9ang6rn3
         sp5fNb3CwNPUH4LZTnT32AhaCEwvvSF4QqMaCOrss57VrQYN2ECGxcIuQiDvk7+4qtdw
         eHrXWzrkIyD4MtOnCZv/j3CdVpvmIDt0Hh6iIxaLreCE7k/JcstkbKNqIicdBMeufzwI
         Itmf429v7g0QxadmoTuf3yrQpJ3R3yV6TzuLTQXb7JSWZJpwT/fEYYNj5c2oSU3hECmN
         jE+pie41eSurVSWAg1CavYzfY736qaJlSz42xF6rBTINwDx7KkZnvI+CSzI4xpi5SNK0
         4KKw==
X-Forwarded-Encrypted: i=1; AL+hErEQZra47wblyEUxmnh7aV8z+vWV9E0isqgwUsRI3xmFP5+I9qOCMp5qTBk+3oojhLDZMurLc8jXtUnZwkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YJAiYpXGAMw4Ut7+s+M9roVmlxKQS8xPT7/neHrIompOYk8Ts
	h5f7rCKIvx1BxxTyQZXpEaRN0+ERWMxOvJcYDUGPN8HeORMCszj07cmO+HBCe+p9yGUOGC7XObV
	pxFRZwdw05wspV7fvzj6QoUHh0ym52Lc6TsJpreznNELVEIm0zBr1mO3guJHfW6Cw7+uDZtVCyB
	2XinjlZQJnEEJr//dp5n3rtmfCZXEFJvY1bg7orGI=
X-Gm-Gg: AZFdTZeGIc2T1RSLZZ25R5DoI5hoxbj6JL3J3o2sBpT/bWQH5l8ct7h7tWHKJzkyrdb
	b6VnTSyJMkA2IrBMopFXPZ5z/+JJyODZgNtstmYkyIqc0oXtqbrCsHhVN5kwoy6xv+0nU/ltTaI
	C90uQfieHayEhED+FwTfzhs3yzso9Uj/h6q8/qBCn1T9mjlWHwdrGukih+webQ6/DMDyH6pgkPW
	TAlwMGx8/7dWBdzHxiIV9Wj1V0vDIXYZ9ut3loGRQpyFN9Jz00=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr710195a91.13.1794955617315;
        Tue, 17 Nov 2026 14:46:57 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr710167a91.13.1794955616819; Tue, 17 Nov 2026
 14:46:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-10-toddfreed@meta.com> <179471270451.2199510.14795764193886368841@kernel.org>
In-Reply-To: <179471270451.2199510.14795764193886368841@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:46:45 -0800
X-Gm-Features: AclHuK_60Rb9y_3QFrgeQGfRKqUkPpfoiUhcDbbJP8UTYE_KV9Woof2OdSMKaMY
Message-ID: <CADh2yMwGN64zEVedBhYbMDcsyPjSJ90tyPz7evJ6x7B9pAk3TQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/15] net/sched: add act_psp for psp
 transport mode
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: QgfIGv4XiEzQ7w9mZQJzcSQE6zJvtA0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfXxx/+iIrJS0XZ
 WGTmP3w+0wYzHHAdZMamc96co3fzq7b29UX27sDcb9EkQVagfA9Lggi/Y3SLDclyilMdRSQyFUB
 shbDZ9pLCVGN0tV60o548rGJY2vxj2UXa7gY7Kd96XD/9ttHdAM6QLM45pbX3W8AF+eTg6/oxkW
 EUqvLjRcGxFSe/m/W0+y09rGd4OJyWYjH0/zcBR/6SxYwIEDolEcFkc1hntolqoebt3YLtL5+LX
 ogHT7FUJwPgBAHSVytRFohcBL6slQeGBNkR45edBFeGK3OHDEZTA9QVF6JAiEdey4QbOZHcxJ1t
 d7cJUU3saNu6t8vHZi0JC0J37KqEh8IyiclCaqpW7WKsEHxwmuJeKWcyNd/IY1bBh2ADyA/0g8+
 vErOn4hI1RhwisG8A8hqz9VwjwcDDuuAjoMbwLBbi+vvZ3ZvM9ATEZHEyqvI10Ci9c6xRBJpcuT
 1GvduynAlLWPpQHbRGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX8SkbAheCcqt9
 RtYhUjU/J3Y//2uiWzigOSVCHKfWzddig0UsiIr5HznwvK+YS1n2xbhEJo9+odrHOGEx4BYpUHd
 +GvuZqZOiVrkfFSc5Vp8jVUAfMDpyTY=
X-Proofpoint-ORIG-GUID: QgfIGv4XiEzQ7w9mZQJzcSQE6zJvtA0E
X-Authority-Analysis: v=2.4 cv=Mfz5KJ/f c=1 sm=1 tr=0 ts=6afcd962 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=DHOIGP5XwAi4GC-hQCcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Can the METADATA_PSP dst and skb->decrypted get separated after this
> point?
>
> The commit message relies on skb->decrypted as the backstop: "on egress,
> encap sets skb->decrypted, so that sk_validate_xmit_skb() drops the packet
> if it loses the METADATA_PSP dst on the way". The egress to ingress guards
> in mirred and bpf also check only the decrypted bit:
>
> One path where this happens, on a non-PSP netdev's clsact egress:
>
>   act_ct (defrag, sets tc_skb_cb(skb)->mru)
>   -> psp encap (the reassembled packet is not a fragment, so it is accepted)
>   -> mirred egress redirect to the PSP netdev
>
> tcf_dev_queue_xmit()
>   sch_frag_xmit_hook()
>     sch_fragment()
>       ip_do_fragment(net, skb->sk, skb, sch_frag_xmit)
>
> sch_frag_xmit() then puts the original dst back on each fragment:
>
>         __skb_dst_copy(skb, data->dst);
>
> As a result, every fragment carries the association but has
> decrypted == 0.

The fragment path is handled by "net: don't fragment decrypted skbs" in the
net series,

https://lore.kernel.org/netdev/20261117203137.804424-4-toddfreed@meta.com

This causes the skbs to simply be dropped instead of being fragmented.

> Would it make sense to do one or more of the following?
>
> - propagate decrypted in ip_copy_metadata() and ip6_copy_metadata()

Conceptually it makes sense. But because of the fix above, that would be
dead code. Furthermore, they still couldn't be sent. skbs which are to be
encrypted on tx (ktls, psp) need the L4 header, and non-initial fragments
do not have it.

> - also test skb_psp_md() in the mirred/bpf guards and in the cleartext
>   backstop
>
> - have decap refuse packets that carry a METADATA_PSP dst

In both cases, these guards would be dead code.There's no way for these
to happen once the fragment path is closed.

-Todd
