Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471295;
	b=K4tEpugM3NX60MyWuVOc8kfwqcv/J/55Y+vvMJR41G/b9bKW9Ts11PQon0x1aDmAsrL9
	 fFfX9c2EuUok9CXgT9s40O+P9tQe2otr3kR52jVjwYqlhXkY2RVwaVcuIAI19Sx4GL9Fn
	 Jq578AxX4s6p2OQBFuOfeTpGKunkz2W7Sb+5+JD0DtHM/kaQQtkuLoQ1Y4OEOGgS7ObWy
	 mihD4lH9TweBoWyMZ3fnNZupe6A1DLtBo+PoyG+JzKDx2gCcoQTXJc4Lehmc2KsqWIbf/
	 D6zRerWmiy1bd0nBJuTuUs2i0bhFbaX9KZNl3PBLcUvElLv14R+4nm08JTLljsUOx4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
	b=OPYpBgnVCHjA/JbXzd88XOqsbKEUPjT5dWIdA6fchxeNsWrAgfys2+mf+nM/YgZNxxFh
	 8ai8H0BFsn1oRKkZVsdy57PLDwRX4AFRi3FBrMqHYLdw9smHG4CkVIm3myQUoECbh5+2o
	 +tCSSEu/OVq4NGu3PO9kt4BuM4GlDfFpr3WXPRr860R7ngReKosOKfNctNj5+2Wqh2L5m
	 F2y0MoF8h9cn8F2Qz6R7fPxWUWSRL509L6Dqx7gD8rp6DsGO4/xgagQXcTC/UtnI7U62w
	 IdCk23hbm11vTtnwO25nP1IM1EWiNuMXRrrGrDMO0qY2jbW8kvTadomX/3Cx2Zv/sgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MsrTYuOJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEE606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BAEE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MsrTYuOJ
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJwYGH2236989
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:01:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=HXlZPN3cIE8
	dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=; b=MsrTYuOJYQ2wytJCLzkEX65+iJt
	K6N23+oL6xEcDGJ6PnEdfU42/bHNwn1aZcR/d2lCBKBQ7Hjj5EWmqpCETDR9eQ1F
	hl3GntDVNxWEv7byptEAlCVTSzTGeKygL2vYEP366PP43s7n8Fa39izCDAto3Fdf
	iPIIXEISjxVunEbIg8Yn/yVRpvBRcQc+0u4ptdDH2EwkDaF/8mwK246FEvT6hxTu
	d7eYm0b6mO1LTl1Np0uBWTtI0HM68lYEvSlPCZsdeFOTuP8hsDqM+/qjp0qtqRo8
	DhjuNo74AJTvHSy2mYz/hx7xhE6DfnRTv2ksulgkxzIKCUsoYPC/EzZGhew==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j39pgcv62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:01:34 -0800 (PST)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde9044a96aso1077803a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795471293; cv=none;
        d=google.com; s=arc-20260327;
        b=G0YJK9BEExgTkZQ04JMsojQlIgayBLU66WOWrJQnVbgyiwwEz4JjLFUYDtdiGtPTQ7
         Hf9HtRhjp1JxQJ4y/FOzD3eFRqxNTnhv0ItDI+bnZV05CRpQZYJbuq4q4KKxCyXNUXRE
         ZOVCR7p0GlPyj96hcnuDBnGV6OMwNwf9U/PjAN+gl4O94r65+s31J2+Fo3c3VqHhot8+
         uglKEHZACNDFZH9ID87wiQ3w9p76JuK6UDBCJj4qrSBFBxXnby74p3iGjRebv4EFdBZu
         dgc0+W4GCREOV34llaogkxRgRlGu+lVXGXv/VADzD9Ai1MKvjsVrf2jW6+wI0OifKAXc
         DKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
        fh=15j8VYKoYm9KYXqdNLnQsfF8iE93VpkTl4xl65E1hPQ=;
        b=evb778mJ+n1k+aK1jJNJ4elbHKYLKFwVZhww6nMJGer9A1aCOS81okNLw0dKnXly+C
         7JuVeXmMXaywny3Z4VdSOIryFGUJUXdyyE9owBsehUrYYhjQcR/9nz6USVUx0C4Er33w
         7112HOHgu/e9tfpQkGOU5XZa3EX2YpWyphUU3L0HjJyxSMYnCfx8HBNWlMSeAlBbBXZ4
         +1orgIlqWeVexqk+BHlMZyNmYe6NLA7Usj05afGhjaEV/tk7qlxH7r3m9gGGZqYsYcPQ
         KVe/L/j8P8R91gp7soJ10qFoq8b1RnyZKXBnIfkUNSfPuehUaIetE3nfaFQ5nuH3Pwx8
         P8FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471293; x=1796076093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
        b=0rO+netRawfJN3pWH/gCCEycKLfTKR5cvrv0Y/pJAJXvs2qL2pjR3Sd1/89XN/eHod
         6L4av22A+MKJPaz4OZUSiP8BQATOeXlI4oEHlCq08ut3fCvHRr0kuV1cKv9fZpzK9Tkk
         hFOdvZgbOrZszfGJYDsBjdn4N/qK4PQLhlZF+tZPrGeMcH1FGMUHrTLMWkVST4QClRH6
         dWYDqf07e885aH9xv1nK6LE+A0OKTtytiIkM8esfEIdL8nYh1NQby4HtEBRsd8V4pUOw
         Jp+ETCOCHslEx+cnuWcEGukC0YuhTltuA/MvCq9b5u6SDezRSeUZV1HEhfMqFqSkhosy
         jq5A==
X-Forwarded-Encrypted: i=1; AL+hErHIBhpsslsxoFZ31yWgVpPxIEVKnJkE2nF9nXWf5lYps2vcDmn2L7qQgRHi/bb7quXPq8dZ67IWEfLt9xY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/yO/rgD50watyn7w9TfHUxQcX8trZ+uIG3kI0kAdRgrfu88h
	nYT+Z9+PFk2zLBdMAKO726TP4+D06j4o0TzoK7yyeUMsHickw9pNuyVu7MPlWBB6SKhhR1jT03/
	hHsU5342agnDc+LukxPJvA+zjMvtxRS+/Garpk6sAdhYjDIp2Rt2FIML+9hZMerZy8roAEGUfMw
	nmmtKMN6il7pvVCu2Ki1CCZpuqPRambzMnG3keJpM=
X-Gm-Gg: AZFdTZcQDeztdeem2O/aJfzdSR7wGKokXrHwoXZuKQY8AxCK4FBZHiWeedK3WYrtdAt
	3tPpxsiQcRX1pgFJ+Z2Enm7BbBJGO+bMOMSZAcxyml4O4bu+j+Us5lWhYjbKicakVAWomnji1Kg
	s/YAQ5zmIeUCgUki/xfsQATUJEurT4dw+pu2gqvLtvBAiDpGrIOjlkwawjBMhZXtdts/3uis6Uf
	BE/7IVqYd4Ch0Ev86vjn/wpsBfOyO2I6ZJu
X-Received: by 2002:a17:90a:e705:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3b41c7e11bemr11000761a91.8.1795471292973;
        Mon, 23 Nov 2026 14:01:32 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3a5:147a:3b63 with SMTP id
 98e67ed59e1d1-3b41c7e11bemr11000723a91.8.1795471292482; Mon, 23 Nov 2026
 14:01:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-5-toddfreed@meta.com> <179529586053.3135.7106623626318776669@kernel.org>
In-Reply-To: <179529586053.3135.7106623626318776669@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 23 Nov 2026 14:01:19 -0800
X-Gm-Features: Aa3M54qKoeHizOx32dSF-QEKNJXmc6qKuSfI7qtOC8d-AkJeAsj6kZH5_ClB_hE
Message-ID: <CADh2yMxeyoDYgcp6WpF6F4hcLGvt+DxKTWLQQi7HrUo8fit8vg@mail.gmail.com>
Subject: Re: [PATCH net v6 4/8] ipv4: icmp: don't quote decrypted payload in
 icmp errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Jf8pPkKV c=1 sm=1 tr=0 ts=6b04b7be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=vS69VSOLqzyyCQB8HVkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX8fCJUAAzeXvQ
 3ejF3TgLLRc3eM6WwkDGTrKoZkq6n2NMAgImEjY3qYcrniEdmO/2BYDGBvFtPL6EdSyLW0pr9F4
 KX71wOAKCZ0Ym3h+hS+Nhk6fWV0lLHb9sAEQsMbdEtY7/kOTQThGQ6+5K1dikPieqVxqmlsfo38
 oiu1Z/pGDxlzb8dLPXVeQCAXcJqPoGJkb2cZ8CcSloUpqkFRcoR7u3xSYShIIZEYNgW8Wc8hfrZ
 pofYbHQNpGNCCWqP7ybeRy66xN/DFSHh2XQta7Fg0YMbE/qf0DluuXZtt4UtHYfAGWATgyrbC2x
 mFy7+RwjLn/pfnggbkOFRPPH/d/4vAX+bGom0Bg83H08D/oKi+P3arIZ3rmTvxar74kamwKjme8
 564vpee+ysYtSmWIGvnAwoS1azIdo+WEbC8M8NLw0Mh1Edr/3HCCyj1yKSVy8XmkvxbRbu8k3WK
 AkHyrMfxSmcVE4WDY1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfXzzpkxOzygx8T
 lva4Zt6sfur8O8lhS71oCNc7y8ezVycRurc8DBOh1CAuyrLQQkGyltpclRsPfn0RaIGxHGEGyay
 cjh2CMdVo3xAffOML/vl+NPsra3sdDI=
X-Proofpoint-ORIG-GUID: u4HC8ZfB_2FJZx1GVC7I0ET7NmDdkkYQ
X-Proofpoint-GUID: u4HC8ZfB_2FJZx1GVC7I0ET7NmDdkkYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

> [Severity: Medium]
> This check only covers ICMP errors sent through icmp_send(). Can a
> decrypted payload still be quoted in cleartext by the other IPv4
> unreachable builder?
>
> The commit message says:
>
>     nft reject in the netdev and bridge families builds its own
>     error (nf_reject_skb_v4_unreach()); a separate nf-next patch applies the
>     same rule there.
>
> This patch carries Fixes: 784abe24c903 and Cc: stable. A stable backport
> would then make an inet family reject of a decrypted packet send nothing.
> A netdev or bridge family reject of the same packet would still send
> plaintext.
>
> Should the netfilter builders be fixed in this same series, or through
> nf/net with the same Fixes: and Cc: stable tags, rather than nf-next?

The nf-next series in question,

https://lore.kernel.org/netfilter-devel/20261111003111.3826942-1-toddfreed@meta.com

 1/2 netfilter: bridge: don't refragment decrypted skbs" (dd5e0f8aebca)
 2/2 netfilter: reject: don't reply to decrypted skbs" (01538dbd6b9b)

patch 2/2 reproduces on net/main. I believe the precedent then would be
to send it to nf (not nf-next).

patch 1/2 does not reproduce on net/main. And it no longer reproduces with
the net-next series, "psp: introduce socket-less psp associations". I will drop
that one.

-Todd
