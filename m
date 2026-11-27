Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795751119;
	b=lKeKMbcG/r9AGx+FQ1eiYjHKHaiSa9mqV/Y9KA7snJUe5p12zcHBvgo2fbZwbdVk9jJl
	 Ykcl0wBDdiyEMtDqmv6WPprUc2T/6+DDUGmnv2gQf1joV6PL2yP8Z2lPq1UJiCHW+J1OG
	 DPo0+9x4EOwMsIT7PVHFYGSblgXd3bntiS2YTciKUvBmoMf7QH6JTzUoYB41+njdYCx7c
	 MwFjTdGBf32slEZZd/CWOIkQSo/DG8sVuuGAMVHo0NpnmVeHp85nJmTZNtAoHlIf0lzbD
	 CFFXub3xeQnmGwjZq2xvWOifFXGx0dMjHc3B5gJWSK/5OGL4OAi5yjSffv67Cmx2ymw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FbnZURxMx4LYMK8HegrQ0qedsvGCdsjG/NAXgIAIpJs=;
	b=mv8iFGDDZfIvLhCBRACM39WrAz5yD+FNq6WMl+aCLgV8J8d1LU6SHDghFV1GC66erxPO
	 ZpEjF1NSn/0WBdyHg2Oqo2wUQf/PH+vpwEjL9FMPGC1GAWZY8aQ5pyAESh+4YMjTTFfbb
	 ubrD6AUSQtZv1iMdTMiAVl66adPFaV4+WCheMjFP0AWtqrNNKvfWeLVo+xGhKYPqsQltP
	 +MiQAm/nHgLlRs6BthWgQOFJizuBO8T8UBIKZ1KLaeA8stJbORANm6LZTF6jY6da39XKY
	 OuXDTovZ9TgxmV9zxyUIAYKv0HPpnam+xKACv45vUGQCvMIkmOXDmdcp1d94+eaFdkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJ6JJEP4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66DF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJ6JJEP4
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-949589c1495so672666985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795751117; cv=none;
        d=google.com; s=arc-20260327;
        b=lgcg5v2rBR8OaYn/Y6uYtsdBSlDkoPMk4lkwvXMpC45ew3yvDWMoo4XlzMLnN3OdfZ
         l/yP3mwQKQLWuali3X+H4HMUgPnNYgZonoueuzW9Ua248CqcOmnP8KBLppKAgYBwzQgv
         2lLEZ8Xx+XgJEVkbJeerg8VRtHS/RmwoMsG7eQ3DkSmFwe/G9WRFzETTsY7X7kE/ohpb
         8XvvQ9IPOHAe+N70zJwal+GhjKHq6lTsJL8DQKWeKTvroNweWeZoZYis6LxrcW/PR1VB
         Z1GQc7Zon9uGko0OAagIHXYiYQZGp+22WwSW2w9Eyw1xeNaZK5Y22lxsgNRsdBrQ3srz
         fJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FbnZURxMx4LYMK8HegrQ0qedsvGCdsjG/NAXgIAIpJs=;
        fh=zQEpk8rkQwAakVA01FbdS8yC+WIMKp55pcO/Os+BodU=;
        b=mnlQl26Z5X9DdbuvBJ8Dp6CvoF/Qsx38ACAihI92EKPzjuOd8KWj/+6XtZPFid79dL
         1T2d9zj26/pG7qWV4ewqG2s5Oh5FDvptqiil2ttWARw4KrCPp2IlKaQtoSk0vGKdGNiz
         CEsYeCJtnnmDrJWj+AcL+golg6P48vO4Xe5cLYlSXXV2oD5M6g4JQIJpvB4fUc5RcWTS
         ORAPdKjtGHDL12WHq0prVrSATgcxIrEzqtibVKkuvH0LLxGZxBqIqJvFN7lowljj2uE6
         1gD5DWWxhc/XydWHJnVwScROaU536TV0yOV8Aj6FWTPUkIPL+BiF1CJWyogjxFOn2DS0
         4+hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795751117; x=1796355917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbnZURxMx4LYMK8HegrQ0qedsvGCdsjG/NAXgIAIpJs=;
        b=XJ6JJEP4oSsth+gQxIhZHfZIpS4t9u/j4s4JDsVJ9pOQO9KxJEL2i8l7dH8qDsddtb
         c0JH53kJ6z3TER+MDElAAo7GbpsyiatMg/Fl+xNWkJkslkYnsIxUxfMPRSc4wSudzOOc
         BsNOy9Xd1xm7jMl5f3IvCa0x252MyDB2C4T95TaHd026R6HdH50bvUG+ek7W4wqoQCLo
         gWvulSpvur0VkaMncYm6XltL+S/8UXeNV+7QNqswtLAWsPldUryOOtiXyb59Mmm/XuVm
         Kk4y9qL6OWjOaCzIo+h6oHaD3+n0mIy79O4o0btY21U9+JwQisxFM1Pv8h2jHtoxapTM
         ACOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795751117; x=1796355917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FbnZURxMx4LYMK8HegrQ0qedsvGCdsjG/NAXgIAIpJs=;
        b=eAAE8LxPaNkEojbX7ZZeNYUTL6uoLFGuGfsuT4S+HpPuEo0MoptT44SsyMT7xLVda8
         o/uf94kDNs1FD03CnoFgrwqsYcDavJ5IH0nhp5eNqk9S0iNo6mcjeq9aN455zpkifznJ
         dFCdIZVWxKYT+qhOEvk8FhXmieQk7XXN6/fDvz0OyEaO1l1u0p6MsBT4siVtoG0+KUXL
         iLX9kYUzKR2lSrf87+0oBB06vj3XLujFjHqv73lsVK7BH+Aye+W7BaFKbrNU35Y2Labf
         /oFwru3+WSLj1Rrjxd0tK8vTEkBdV6J16MNdPGIPZ9OxEDtFy4YjLYKzLcuM0e1SBfZC
         cyvg==
X-Forwarded-Encrypted: i=1; AL+hErGRLHgMYPi4HMWQth6Drurn5jvdZPVrJMLDwH5MDcRxZ2vi7ITd2BlENkEF0VvKyzn7vCTTEzLmyehFaUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sFexdg7TYNBvjZRaxxNiC4AJUNH9FiYnGCZN0QxhL+Nu3192d
	3P7EX+b1CXZOkDgN408meAEECUZ6uul+mFNq8v0zHz+z5ayJHDdLYvuT+dHCDa0l52YHD+wSHf4
	xPff4exDvIT1vjHdviXX2kNedK1PEl2Q=
X-Gm-Gg: AZFdTZe8MQMLbZaz8tT2KaG4oA99lMTGInr1+V0iacPvt5oPiWMBCq6H1UTkkyGKWtK
	cuJVX/HU9yCJxE6ABOXeQ6ya3xrkKdE8p1ozvvjURAHB9Oo/7yNzbumrzjn8lNCUAFaxIJ3MahL
	I09nbOMqFLNedoOjDfaynL41/X5BIOvwQrZCmydy2tRtxpBtcNHggMTYxCNf9VpHpHwEHslS5yU
	lsj0z54NJO7JzmfNndpIZSrVtdxpmzVwmO4AKVCQRhIaHe8iERA0SbjOcZYUs9TE6Fnb6xhhELQ
	ZdHhfUh7ha2Lf5Q2Yre7fJEJNo2G00Qfl3p30SHlkSgOeTQY0WZdAecrFk9XD9GGaupNzAAs4G9
	XL5vgex68sAmVBqdsEHRlr8tqqUw4OdsGz5GxElS/iGD16OcEjCaf9ZkNt/z1cQK0EgNN/80=
X-Received: by 2002:a05:620a:7113:b0:949:7bb1:ac62 with SMTP id
 af79cd13be357-949ba9b3e2bmr4101755985a.25.1795751117359; Thu, 26 Nov 2026
 19:45:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103041134.33310-1-physicalmtea@gmail.com>
 <20261103041134.33310-5-physicalmtea@gmail.com> <auxHe77Kv3tS4hjJ@sgarzare-redhat>
 <CAJwVaMK6UpxOmCbuzGK15h+DhN5H6cj6cy-=gCHtSxoVbLfzwA@mail.gmail.com> <awgGJECGxVi-40Tq@sgarzare-redhat>
In-Reply-To: <awgGJECGxVi-40Tq@sgarzare-redhat>
From: Jia Jia <physicalmtea@gmail.com>
Date: Fri, 27 Nov 2026 11:44:41 +0800
X-Gm-Features: Aa3M54pcBjgXejbuaq1eXqIMf3KBe8_JC3aAgzKGz_iHEeLknXQ66it8CaqM6QA
Message-ID: <CAJwVaMLfUK-qiP87i4d66UEnOEet6m0BNuDr+kDWiXrZv06SYQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/5] vsock/virtio: coalesce native RX
 write-space notifications
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: netdev@vger.kernel.org, stefanha@redhat.com, bobbyeshleman@gmail.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Fri, Nov 06, 2026 at 08:49:17PM +0800, Jia Jia wrote:
> > >
> > > On Tue, Nov 03, 2026 at 12:11:33PM +0800, Jia Jia wrote:
> > > >Each received packet can update peer credit and call sk_write_space(). A
> > > >writer cannot consume that credit while the virtio RX worker retains the
> > > >socket lock, so repeated native write-space notifications in one RX batch
> > > >are unnecessary.
> > > >
> > > >This patch coalesces write-space notifications on the native AF_VSOCK path;
> > > >data-ready remains per-packet here.
> > > >
> > > >The batching patch establishes batch ownership before its first packet.
> > > >This lets this patch record a pending notification for that packet and
> > > >flush it even if the packet immediately ends the batch. Deliver it while
> > > >holding the socket lock to preserve the callback context of the existing
> > > >receive path. A following patch changes that timing together with
> > > >data-ready handling.
> > >
> > > Can you report performance data related to this patch also here?
> > >
> > > IIUC this is not giving a lot of advantage, so my question is if this
> > > more complexity really add a value for us.
> > >
> >
> > Sure. The performance tests currently cover patches 4 and 5 together,
> > so I will include those results here.
> >
> > They do not add another broad throughput improvement. I kept the
> > combined notification change because of the cycles/byte results.
> >
> > With P1-P3 only, against baseline:
> >
> >   Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
> >   64B        66.728    61.220  -8.25% [-18.99%, +3.91%]
> >   256B       14.363    14.515  +1.06% [ -4.22%, +6.64%]
> >   512B        7.792     7.578  -2.74% [ -6.55%, +1.23%]
> >   1K          3.988     4.032  +1.09% [ -1.64%, +3.88%]
> >   4K          2.063     1.973  -4.38% [ -8.23%, -0.37%]
> >   8K          1.702     1.667  -2.06% [ -7.99%, +4.25%]
> >   16K         1.473     1.475  +0.17% [ -5.06%, +5.68%]
> >   64K         1.385     1.358  -1.96% [-10.61%, +7.53%]
> >
> > Only the 4K interval excluded zero. With the full series, against
> > baseline:
> >
> >   Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
> >   64B        65.282    57.843  -11.40% [-13.77%, -8.95%]
> >   256B       14.710    13.813   -6.10% [ -7.89%, -4.28%]
> >   512B        7.709     7.188   -6.75% [ -8.79%, -4.66%]
> >   1K          4.075     3.862   -5.23% [ -6.80%, -3.63%]
> >   4K          2.034     1.887   -7.21% [ -8.67%, -5.72%]
> >   8K          1.664     1.568   -5.78% [ -7.83%, -3.69%]
> >   16K         1.450     1.385   -4.48% [ -6.08%, -2.86%]
> >   64K         1.338     1.317   -1.51% [ -3.21%, +0.22%]
> >
> > From 64B through 16K those intervals stay below zero. 64B through 1K
> > did not show that in the P1-P3 run.
> >
> > This is also why I spent the time making this work with sockmap.
> >
> > The value I see is lower RX CPU cost, not another large throughput
> > gain. I am still unsure the extra code is worth it, and I would like
> > your opinion.
>
> Thanks for the numbers!
>
> Both tables are against baseline, but the two baselines are a bit
> different (e.g. 66.728 vs 65.282 for 64B), so it's not easy to see the
> real contribution of P4/P5. Can you compare the full series directly
> against P1-P3?
>
> Anyway, IMO the big win of this series is P1-P3 (throughput), while
> P4/P5 add a lot of complexity (saved native callbacks, new af_vsock
> helpers, sk_callback_lock, sockmap corner cases) for a ~5% of CPU
> cost, without throughput improvement.
>

I ran a direct A/B comparison on top of the base batching patches:
reader TID cycles/B dropped up to ~2.3%, and guest CPU1 aggregate
cycles/B dropped 4.4-5.8%, which matches your ~5% estimate.

Guest reader PID/TID (cycles/B):

  Buf     P1-P3   +P4/P5  change (95% CI)
  64B     7.032    6.963  -0.99% [-2.52%, +0.57%]
  256B    4.323    4.256  -1.55% [-2.82%, -0.26%]
  512B    2.296    2.257  -1.71% [-3.35%, -0.05%]
  1K      1.313    1.303  -0.79% [-2.50%, +0.94%]
  4K      0.744    0.727  -2.19% [-3.46%, -0.90%]
  8K      0.611    0.597  -2.26% [-3.52%, -0.99%]
  16K     0.535    0.534  -0.29% [-1.48%, +0.90%]
  64K     0.512    0.513  +0.36% [-0.43%, +1.16%]

Guest CPU0 aggregate (cycles/B):

  Buf     P1-P3   +P4/P5  change (95% CI)
  64B    21.688   21.049  -2.94% [-6.02%, +0.23%]
  256B    8.333    7.892  -5.29% [-7.02%, -3.53%]
  512B    4.448    4.240  -4.67% [-6.13%, -3.19%]
  1K      2.497    2.382  -4.58% [-6.81%, -2.29%]
  4K      1.302    1.227  -5.73% [-7.26%, -4.17%]
  8K      1.050    1.013  -3.51% [-4.37%, -2.65%]
  16K     0.953    0.925  -2.98% [-4.79%, -1.13%]
  64K     0.842    0.805  -4.29% [-5.75%, -2.81%]

Guest CPU1 aggregate (cycles/B):

  Buf     P1-P3   +P4/P5  change (95% CI)
  64B    48.985   46.388  -5.30% [-6.36%, -4.23%]
  256B   11.194   10.704  -4.38% [-5.48%, -3.26%]
  512B    5.886    5.592  -4.99% [-6.00%, -3.98%]
  1K      3.080    2.945  -4.36% [-5.61%, -3.09%]
  4K      1.508    1.421  -5.80% [-6.67%, -4.92%]
  8K      1.215    1.160  -4.51% [-5.64%, -3.36%]
  16K     1.079    1.029  -4.66% [-5.87%, -3.44%]
  64K     0.941    0.894  -5.01% [-6.34%, -3.66%]

> So my suggestion is to split the series: send P1-P3 first, so we can
> focus the review on them and merge them, and then send P4/P5 (squashed)
> as a separate series. That way we can also evaluate the direction
> suggested by Bobby (batching in read_skb() + coalesced sk_data_ready(),
> like TCP), that may allow us to avoid saving the native callbacks at
> all.
>
> WDYT?
>

Sounds good to me. I'll split out P4/P5 and send just the two core RX
batching patches in v6 (dropping P2 as discussed in the P3 thread).

We can look into the notification changes and Bobby's read_skb() idea
separately after that.

Thanks,
Jia

> Thanks,
> Stefano
>
