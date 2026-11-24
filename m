Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795563967;
	b=kww9eY0bNw2xODg4FgPsIxPGKmGI3HUS8Kd1cNG0plIqZJVn8QP3uxfRQqGyHF6SQPcU
	 8caPpccpD+G8RmDpF/qCjGWMBe4PvIefy2PZIyj0HoDhXpjHll2+2PNznSP9H0gcn3D9A
	 GFcAq39SOQdxsDn56JoA+gnB17R+oBtdOwVsB39xfTvZJNBgRUKWkeL4EmeTdPPgoQqKf
	 uqtwx6TIJAEFQ2pLGbiU1+G6/LqJ58sX25585HWqlvcfXaAS96Yye2sT9P3Z4O6pGkelI
	 nLY9AuymrRF6bSg+qfqCNnjWRVnpt2LbS8Tt1Y9ERyJalUZuizTp2cy0HjlKgDW8Qsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bj72kE5VzukIZwPRd6gELH0mmyFkSQ8C1WZkrm6cOpE=;
	b=ZX6r54b1JVpm1IemrluKH7HJVHzjIzONL2LRXWeeocK803CCPmXLWmkGZAjVmQoLiW18
	 8YDk8tMntn6y42/H6NeEtiJCb3msqwkZiuWFcOiqfOpTAPP7hGZqS99DrWfycFWjv60oe
	 GqSlt5xvpIBiicz87zqOheeva9z6pkoxpXgvykMBkUMMZWULlfg7XuD1K6LjombI71DQj
	 YNGDTNo1xZKtpmaeBqiawVZHdupuFgr7eFBpjepc66SbgRy47gIKW59SRykvn+cdyTDcJ
	 0pteQ8asdTw9pDcDNVKehNRHO/Gktx42NgGHzlGo6JfYl9zuipgkA/fto14smFnCJDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lHZOL/BI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1095606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1095606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHZOL/BI
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso40176561fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795563965; cv=none;
        d=google.com; s=arc-20260327;
        b=Y1EQGoTukl/EqR0zNWWW6tkRslCF7bcDs8DMa6e118XAVLh/SZ8YUSlbgTpHvh7pVi
         xwYSImPcQSrwqycKjKKRa4kewih97uSAk/BvM5Y6l32qwN7PLhrU4lIUlUYEWHb5ZrcQ
         xnirPHMVIJsBm3dVBnTgxRM9mKmpUz9impb4cyZ2mt8Qxo58nFeSSZlFK8fYxwI1H8mq
         Pqec3uTOJUp+rFjzn1N/2csgpwsGoE3TPkrGvGbr9x3Ab70PB5V3UvZ5LXZuCHaUYB8B
         3PTmLBjVe4QGvgxO9CfeiqRWcQC9s9oUD7E+3BlQ4FSRH6S+qDXRjVccNUphZFt65ONX
         z77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bj72kE5VzukIZwPRd6gELH0mmyFkSQ8C1WZkrm6cOpE=;
        fh=8lj1yTj7zdi2gK8C/5yyg0Q+N6xAz3Q73vI3iRfJ8zI=;
        b=C3KHlfrsmPeK4dtgc0DcNLufF4sBf52mSWOzS66j2SG0Q3C8iTvHiUxfvl00SpGkcX
         WPH4YA0M3GU9XCEUzQAUNk3e36LP6znfUHs3Joudjq+ZB0kQzXYKF7+h7GekIzmoLum9
         kbu/6dtDGE9fn/B6qZGKoTwU3yyj48TjVjQE1ayBz3FqtXG1kDVZQxNIa90yU4HXaHay
         HC8ALrU746sCvFKbXCPVt5ZfHv2LHDhXiesJ3sY0ZesPMiegNTf/7fIUcPtB5JCWKxsT
         e1Y4cBIZliqk8q/UOCptHz+DJSEIqxAjvUU5e5snpgzxt1tMvU37AAYjvt88pGAslHSu
         oTJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795563965; x=1796168765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bj72kE5VzukIZwPRd6gELH0mmyFkSQ8C1WZkrm6cOpE=;
        b=lHZOL/BIQeKyj6pxe1uWsl2Doz+Q+U4P8IoSglyG6WmsPI8FzaqwGLsF6xe+OSYvkg
         ngRBe6Tk+WWnexCQnjP4HuKcwm2iIgd1NuccVNa8db7LSXOONX5PEl8CNV8ApN6/Q4Q4
         nGqwcvojTayoE3dK5uhiWdcxF6FQUpbgEBG4q9dXU1yTjJrsr+kGXScIh0Mi8AcmbBjO
         6bBg3t7Po08b8D2UjXC2IFdcEraTWEC5Dm5BslhML5aQ+a0Fg3ITqxduKirBIUIZ3Mph
         wCsUrXugDXxICbHf3dx4siub7JbVYiKYfo6VFWuO0tk5A2nprzVXK01mH8czJ8FRopzg
         O0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563965; x=1796168765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bj72kE5VzukIZwPRd6gELH0mmyFkSQ8C1WZkrm6cOpE=;
        b=K67RRLEXNn1qXdA6KIlLG1UQsoIkSwYpuQO54Gb4pfflqpptUC0J9yAoJk7NPnwg2b
         nojsomGNKkoWdnZwHA4DxIvtC8g+t+VgECbEHb3ofo/6MZACq1NzfnvLNRPsDisi9Ast
         tbPM/r86wtUolDM3PfdfzQq4UjxA8i/0WsJnA41GHlWOH92B+WQEdZ25UQLC4utCXgKr
         2c2/lEb8bUJcnlgYVhMlsO8MUf5sGFfhWAQ2BjNe19MFPRl3qpsBgySjFy1c9hmTLdGe
         tzsJABw8qhDyY//yy5G1VdYtBwm+j6olYr1KiUoh5OZ8PxFL70oUrU7rIUCdgMK+z1Yg
         s8xQ==
X-Forwarded-Encrypted: i=1; AL+hErHvNkjJ29ZBVJ8cOWNze02EKmlPSO2/Xo/LbmVOth20IiY6+OUsf869Egpurd5wLndRwIThLKUvueP+sQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u2WnIWYk9dynQzu3NtJ8f9Tky/nd33CJUZTEMWmVHBAxNywto
	wCCjoqp3533MqsX5+d74Xr7YW0Nto5NJObXWakvF5gWB0YSKztQn0TViXmZ74RvWJMZDtIU11aP
	ZwtUQ41PlYzE8adJNP8yQ65QN+7JvEkQ=
X-Gm-Gg: AZFdTZcJFOyvdcUYopWUXJnNXSn68NBRvrncPb0ICjJlTxWoLqJmx2UdoXnGAOJXBWf
	7fSyPzORJx/XpJnPG9TfllTV5OogGDIWLiIGy92DIYc70Z5OT8WL+BDSKaKiQ4Bqg2ogiIRAdWm
	isTjVJRU4RN+XI653KssTQUcb9zG04U4fWj5EpyZtrYiqIsLc3VrKBWjg5fCFuLjX1xJgmwxfgp
	xxZ6XazQIuYsArT1+9e8akwMxJC7LXNY/l2rXx8CQniWiL8FXiCyXGKQFf21lXdNkVKKSGR327K
	4beWBufYaR1EVCSADEFcL5eRY1xGmByieJ8FZPcs5ao2XetPS0KfZ7FsyaLjtSp8JZektX5ndpZ
	jOvy8XNtRXC6baSIcEynvXCpxp6UlNeasy038
X-Received: by 2002:a05:6512:a819:10b0:5bc:f29b:1a5c with SMTP id
 2adb3069b0e04-5c1bc7d0b80mr3077117e87.23.1795563964504; Tue, 24 Nov 2026
 15:46:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
 <CAKEwX=MLrDn55wmVKKba5=PcU+qFpkEbMmN2SjGTfTBiFKX8cw@mail.gmail.com> <awXr6iHBR54wBB05@google.com>
In-Reply-To: <awXr6iHBR54wBB05@google.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Tue, 24 Nov 2026 15:45:52 -0800
X-Gm-Features: Aa3M54qHuVeAHaNbCxo4wz47haXUGhMN7-gFVY621Bx4vmN82u_-P6KIceLACFk
Message-ID: <CACpmpodH3UUDLEze8=5v8LWgKnZWQVrQBhzSGJFY-PwEYmHEzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Batched zswap_store() framework with compression batching
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, hannes@cmpxchg.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 12:29=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Fri, Nov 20, 2026 at 03:16:32PM -0800, Nhat Pham wrote:
[...]
> > Have you tried perf-ing the store path to see what was the overhead
> > source (before and after this optimization)? I'm curious.
>
> So I was able to reproduce the usemem30 sys/wall time improvements here
> on a Sapphire Rapids machine (both in a VM and on baremetal), and I
> threw my LLM at perf-ing to figure out what the overhead was. It's
> important to note that the sys/wall time improvement I observed was on
> the free phase, the write phase / throughput (which involves zswap
> store) didn't show much of a change.
>
> Batching made more consecutive pages that compress to the same zsmalloc
> class more likely to land in the same zspage, so the freeing path gets
> faster as the zspage and metadata are hot in the cache, which alleviates
> contention on the class lock.

This is a real performance gain with batching, correct?

>
> I think the memory allocated by usemem all compresses to the same class
> size, which makes holding the class lock in the freeing path a
> bottleneck. I confirmed this by a hacky patch to shard the class lock
> into 32 locks, which caused the same usemem improvements and the series
> doesn't improve performance anymore on top of that change.

I think we all agree that vm-scalability/usemem is a
microbenchmark/standard. I am not sure I understand the value of these
"hacks", when my patch-series posts data with the standard mm-unstable
and my patch series with a standard usemem microbenchmark.

>
> I also tried usemem with Silesia to get realistic compression data
> (similar to Kanchana's testing on previous versions), and didn't see
> similar improvements (because the compressed pages get distributed
> across multiple classes). I also tried a kernel build and the munmap
> microbenchmark in [1] (which Sergey quoted in [2]), which also didn't
> show improvements.
>
> That got me curious tho, and I had my LLM explore other optimizations to
> the freeing path. I think we can get similar improvements in usemem
> as well as the munmap microbenchmark [1] by batching zswap entries
> freeing. We can batch both the zsmalloc object freeing as well as the
> LRU deletion. I am still looking into it and I might send out patches.
>
> But I think this series doesn't really move the needle on realistic
> workloads, as I previously mentioned.

Your statements and hypothesis based on the kernel hacks don't explain
why I see 6.56% additional Sys time savings with compress batching
over the gains observed with store batching alone. I am not sure how
to interpret your statement above without your posting any data.

Did you get a chance to see the usemem/ZSTD data with/without compress
batching that I posted in [1], and my analysis of the breakdown
between performance gains from store batching vs. compress batching in
[2]?

As per the data I posted, compress batching of PMD THP with ZSTD
yields an additional 6.56% Sys time savings and additional 1.12%
Throughput improvement over zswap store batching. Combined zswap store
+ compress batching yields 13.87% Sys time reduction and 3.85%
Throughput increase over mm-unstable. I think this clearly
demonstrates performance benefits to a well established
microbenchmark, run at scale, using upstream kernel git trees and my
patch series.

I would appreciate comments from Nhat, Johannes and Andrew on these
posted gains/analysis:

[1]: https://lore.kernel.org/all/20261120041906.5785-2-kanchanapsridhar2026=
@gmail.com/T/#m33e586ec89ed46790da284e7a2f6d99b50c9f935
[2]: https://lore.kernel.org/all/20261120041906.5785-2-kanchanapsridhar2026=
@gmail.com/T/#m51d7d13809d508a9116904c01bf3c94fdf2981dc

An independent replication of the gains posted by me in this
patch-series, using standard mm-unstable and vm-scalability/usemem
would also be very useful.

Thanks,
Kanchana

> Regarding the bpftrace
> measurements, I couldn't reproduce them. I think one factor is that
> probing both zswap_store() and zswap_compress() makes the zswap_store()
> numbers different based on how many zswap_compress() calls we make
> (which are less with batching) due to the overhead of the probe itself.
> When I trace zswap_store() without zswap_compress(), I don't see
> meaningful changes in latency.
>
> [1] https://lore.kernel.org/linux-mm/20261016120927.3191690-1-hongfengche=
n@xiaomi.com/
> [2] https://lore.kernel.org/linux-mm/20261123054746.2579253-1-senozhatsky=
@chromium.org/
