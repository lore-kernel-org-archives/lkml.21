Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772996;
	b=2DTJARFQ1kPQ5CwotMiMukAd0XEkDVbisZUFjeXhgjrX7b2QXeHlseT/5u9A/35gYDZa
	 c9H3Y2GIG2uHccocFEyXYYc93yPfaZ+LdcbwLkCqyZWzBrqFO3NysKDfNKppXnP0tMaiZ
	 ojmN8C0BHWZCixNXmvXZ+RSK8j/IiZlux0EKVCmgtNyRCfBvOWWU5ap38+bIodwJRoti0
	 iVGNkMkSy4IKCN+khnXDwbim9zJkIfB+yGfqdTYopKsHeX3EZg917f7vwmjOakxeQp8Hh
	 O9fnVzD5bvNDiFHR5ALl+SsAG/iXyNroAEGrxpAwDeFR0yOpo9yxaKf//Yn8PjbzkWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GPGFP4sreEa8pcqEXU6GZ2Nw6FWeow+EWOPTmXiDvGA=;
	b=aD+xEirrdDdDdvm7hYJFKMsxEq40e9vRfan+xMQuSAdNXEjC+m2nmnvnc/pZ+zvDH6FV
	 X+42CQ8HHQit4IKO9xkgfY67BCrKW0BpmXagyrYLT71T8CaQqPprm/k9HRg5lO7nO3Cdl
	 ophzdtz3rBbDLtNamhxub3v/goayMn1vumZs+JQzaMTKImoOcOEQRJDg3srfXmiLC3Mmq
	 yXG0DpP/B85sAJ5oT3k+nM+z/cMkroPZzjypyM/ZYpWwrB8uEtQZY3UcUdVDvePd05P9Y
	 7s+DhvQdw/7lsVs1OLQt9ZNzBWRgtCYFHsJ7Sv8KG5D4yHLaAtD6mzS9L0zsJLtK4Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="t2V/yCNr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34D5606A686
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34D5606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t2V/yCNr
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so9639443a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772994; cv=none;
        d=google.com; s=arc-20260327;
        b=cE2HL0Nj/GWJjoD0shZw+TpuHFGfiDVBpS9WJWyKLJ32mBs3M9hXi7AvGVHslSwl4d
         MeGmOdqLUKVJrvdn+yRGnQ04PalDJaVy5xjvsjdXcRO6g3NNlW1RNSfBuafdtvfwCOfI
         JO4IwDzLKmi2iSj6cWGiGMg98diVHsPyZUujDXkwvWV5jhFSjWfmu5nUgKSvwr4oJA86
         OsDxG7kRKtIJHoU3XOqp3tw5T7Tk/amx61nWSxSOHniCbBH3k4KAo/CYUxYZeqxF7SHr
         jOMbw2AhhD5WJSZcDUhGbPHczP7eEACSdOYXUwHbKaTa8KCejpAbxm3/MTPMvDXK4GtH
         ntvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GPGFP4sreEa8pcqEXU6GZ2Nw6FWeow+EWOPTmXiDvGA=;
        fh=8fKISH8614MLJ0ee8WDvqHxpxeLz/vyfRBHB9QpbkUU=;
        b=rVVvXQzR0uSAKGXu01f57s0njahnUAqXcu9cSA0Lf6+MpJ1BBfepGDKRuILnfVlvmz
         EvVJdKMw/W0PkOSxZ6Tjo9FFER7tr7UMPNVIBOTYCbdQ1BOqv6nF0y5NLPaalqcVAzT8
         az53M/Lsk6l5UQxwwLhvWNmT7iwWY/fnk8+ZD02nj2cZPsPtZh5DdRlrXoJqBxkXsVFW
         ru5de9WospT08sTN6AXZNLK22VCPeiE+2f7Pe0YqlWb0k4yjcgz/aVB1pSlOP2GY0pK8
         fHefXvjtTEc/WHBkjm3dcWSHSnT6n0MJr9YkiOeijXhhA+YqY/qNtEz8qEF6Wk3OV6mU
         c3gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795772994; x=1796377794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPGFP4sreEa8pcqEXU6GZ2Nw6FWeow+EWOPTmXiDvGA=;
        b=t2V/yCNrI2uPjbcMFiS5DiwrzJdln2YJB7eKH+xMY4aq/NfHJ1wHiRnVj5rvW5h15s
         QtyQsOaSHUYkGmajiRNVwbGbcC+MwMwJgsz5ahGepNNdg+Ilk/IH/kYRvf9aGDp+4MNF
         OwBwU2MiEZ58dWZLY9lQ6ffhgJVFC/C6yiYW9S050i36u1cbXf73NtVnjvA3QlelFSrH
         vu8MYoafMBF3vjN6gUPXNq/Y3FxJj+M5K7pEziRqHpL7/xG9AJitmYSQfM1M/TfDAQZ5
         6xatHOB5Lu0ID13dSVOOGjvbnsC0OJjpBCmxSHuImzAnVOT/fB9ntw1P/n3wWS8Eddny
         rr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772994; x=1796377794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPGFP4sreEa8pcqEXU6GZ2Nw6FWeow+EWOPTmXiDvGA=;
        b=Bk79vK1ql18RCDSerdqMMgLZRwEeBIaNLhPZMRkfVJJQipE8mI+qDVgcMoBEQKcTg/
         iImNZ0RwJGhOryscJ0R9xTa7C5D54NENR4N7E5yM3S6c3KRM36gm2TuuuRRwYY0hGP9I
         hbdb19f0MThUL9iY1WVaUw+5lFO9w0YJB5r2R2s6L+j+Gd9lwrCstbRlwdAlWGQC1tu/
         Nw3URBiaZ1EUT07nbnyRwdJbsWSkR3yHFd+t1efW892KNhqETXSpHNMpv0MYIJ4vlfNK
         bAoFXahjtJNuAhSnUopWGg9MFzKowVLOra4WMXcgVnQ2lOl5fpw8bG4dSoCAkrBIhZia
         DB6Q==
X-Forwarded-Encrypted: i=1; AL+hErGUyG3Pt7SUJuim/qcB2DVHtTZXgbcY9C7JzKjoGMpH+zKK8BR2LNmTgsU5yY2Sfg5/h31WZVoqdlKKw7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cpo+S1ATVvFH1mZcvoHS1Vey0PrS4bhKnAm00WEjzbWkO0fWH
	JlgV0ZiMAU57TlWJlCqqdYDMNO0KtaFVWMRAzKz2H4SLkbWI3DtZq+ZqpGwfzk+xiyiLJj5KdzO
	7JqMtxX3MwIXMyS5ytleHbwCkULUBbJ6Nz4NrhgboBw==
X-Gm-Gg: AZFdTZeXmVsvVIppGVfrl8CQIoDWCjIC3dHjMXJXnbYjqSln2FsdsJfzSHVQqsdMm2s
	gBsbpP/krKEThanlccN3PJyWZ8lmefgdkuwJ/NO62OIUgBEtRk4QcHeGtWDyAQTiewK5WcfGgB1
	geTzFonM1UiIimKTQ92MCUsGWEUr2F+idx8MruTnhDHYGeeYYgaL1Fu+ZGMHDN4knrt0RoTaDqX
	0Yf6e0Lyjedjzv9UOHOuhc1fn6cjdhF7pCLkt1IOzMXBHVVngNncHFks2wasGPoMDpL9EENyETn
	1AUIiLmbfC+KuKj+EDa05MfRNvzNzo/0pDHFwZHPeMZ4lF4k/eUZzY/w/EXO56+ojhtyNrGLLZy
	VxAywI3a3wzAufPyClWYsIYt+Ldk6fCaZ49afKAsjvCT8geNYJgrRf+5shYpZBzIVarjK3w==
X-Received: by 2002:a05:6402:4019:b0:6b1:ca87:c588 with SMTP id
 4fb4d7f45d1cf-6ba37eb9c13mr20096021a12.37.1795772993605; Fri, 27 Nov 2026
 01:49:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127083542.3172843-1-christian.loehle@arm.com>
In-Reply-To: <20261127083542.3172843-1-christian.loehle@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Nov 2026 10:49:39 +0100
X-Gm-Features: Aa3M54rjnnVhSXL35BlQDgTZhZnFpsdADZDYLiRCLnKpoPpo2Ju2HPDXgLMZins
Message-ID: <CAKfTPtB67yXDi84yXy3=x2znRYt5huQNiHDK-0KYxAcezHhULg@mail.gmail.com>
Subject: Re: [RESEND][PATCH 0/2] sched/uclamp: Fix dequeue accounting across
 static-key updates
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@kernel.org, peterz@infradead.org, qyousef@layalina.io, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com, 
	kayracizmeci@gmail.com, wvw@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Nov 2026 at 09:35, Christian Loehle <christian.loehle@arm.com> w=
rote:
>
> Static-key updates can let enqueue account a task before dequeue observes
> uclamp as enabled. Patch 1 checks the task's effective UCLAMP_MIN active
> flag on dequeue, so accounted clamps are released regardless of static-ke=
y
> update progress. The early check keeps the unused dequeue path short, and
> enqueue retains its static key.
>
> Patch 2 picks up Qais's idle-flag wrapper cleanup from v7 [1].
>
> The measurements below are for patch 1 on v7.4-rc4, before adding patch 2
> and rebasing. Each cell gives fix / always-on percentage changes versus
> unfixed, with CONFIG_UCLAMP_TASK=3Dy throughout. The unfixed and fixed
> kernels keep the uclamp key disabled while always-on performs accounting.
>
> Nine fresh boots per variant, 20 measured repetitions per boot. Changes
> are geometric means of paired boot-median ratios.
> Positive time/latency is slower, positive throughput is faster.
>
>  Workload / metric              =E2=94=82 i7-13700K: fix / always-on =E2=
=94=82 Xeon: fix / always-on =E2=94=82 Orion: fix / always-on
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80
>  messaging-processes / seconds  =E2=94=82        (-0.06%) / (+0.09%) =E2=
=94=82   (-0.40%) / (-0.21%) =E2=94=82      -0.38% / (-0.31%)
>  messaging-threads / seconds    =E2=94=82        (-0.19%) / (+0.05%) =E2=
=94=82       -0.86% / -1.77% =E2=94=82    (+0.10%) / (+0.11%)
>  pipe-processes / usec_per_op   =E2=94=82          (+0.18%) / +1.56% =E2=
=94=82    (-0.002%) / +2.41% =E2=94=82        -1.17% / +1.19%
>  pipe-threads / usec_per_op     =E2=94=82            -0.78% / +0.88% =E2=
=94=82     (+0.01%) / +2.91% =E2=94=82    (-1.61%) / (+0.53%)
>  schbench-256k / rps            =E2=94=82       (+0.002%) / (-0.04%) =E2=
=94=82    (+0.004%) / -0.05% =E2=94=82    (-0.20%) / (+0.03%)
>  schbench-256k / wakeup_p99_us  =E2=94=82        (+0.42%) / (+0.51%) =E2=
=94=82    (+2.33%) / +10.62% =E2=94=82    (-1.44%) / (-0.37%)
>  schbench-4096k / rps           =E2=94=82        (+0.00%) / (+0.00%) =E2=
=94=82   (+0.00%) / (+0.00%) =E2=94=82    (+0.00%) / (+0.00%)
>  schbench-4096k / wakeup_p99_us =E2=94=82        +32.68% / (+12.93%) =E2=
=94=82  (-10.66%) / (+2.71%) =E2=94=82      (+3.03%) / -6.99%
>  tcp-stream-1024 / Mbps         =E2=94=82          (-0.24%) / -0.69% =E2=
=94=82       -0.61% / +1.07% =E2=94=82      +0.36% / (-0.52%)
>  tcp-stream-16384 / Mbps        =E2=94=82          (-0.03%) / -0.29% =E2=
=94=82       -0.57% / +0.23% =E2=94=82    (+1.04%) / (-0.82%)
>  tcp-stream-64 / Mbps           =E2=94=82         (+3.05%) / +18.60% =E2=
=94=82    (+0.12%) / +23.54% =E2=94=82        +2.50% / +2.09%
>  tcp_rr / transactions_per_sec  =E2=94=82          (-0.57%) / -1.68% =E2=
=94=82       -0.66% / -1.33% =E2=94=82      (+0.10%) / -1.58%
>  udp-stream-1024 / rx_Mbps      =E2=94=82        (+0.19%) / (+0.17%) =E2=
=94=82   (-0.41%) / (+0.32%) =E2=94=82      -1.58% / (-0.63%)
>  udp-stream-128 / rx_Mbps       =E2=94=82        (-0.82%) / (-0.15%) =E2=
=94=82     (-0.38%) / +1.54% =E2=94=82        -1.31% / -0.69%
>  udp-stream-16384 / rx_Mbps     =E2=94=82        (-0.31%) / (-0.49%) =E2=
=94=82       -0.35% / +0.30% =E2=94=82        -1.52% / +0.61%
>  udp-stream-2048 / rx_Mbps      =E2=94=82        (+0.02%) / (+0.06%) =E2=
=94=82   (-0.24%) / (-0.09%) =E2=94=82      -1.18% / (-0.74%)
>  udp-stream-256 / rx_Mbps       =E2=94=82        (+0.33%) / (+0.29%) =E2=
=94=82       -0.72% / +1.56% =E2=94=82        -1.76% / -0.86%
>  udp-stream-3312 / rx_Mbps      =E2=94=82        (+0.38%) / (-0.07%) =E2=
=94=82   (-0.04%) / (+0.14%) =E2=94=82      -1.18% / (-0.54%)
>  udp-stream-4096 / rx_Mbps      =E2=94=82        (-0.06%) / (+0.22%) =E2=
=94=82   (-0.24%) / (+0.08%) =E2=94=82      -1.31% / (-0.66%)
>  udp-stream-64 / rx_Mbps        =E2=94=82        (-0.18%) / (-0.17%) =E2=
=94=82       -0.57% / +1.20% =E2=94=82        -1.51% / -1.45%
>  udp-stream-64-pinned / rx_Mbps =E2=94=82        (-0.94%) / (+0.90%) =E2=
=94=82     (-0.28%) / +1.63% =E2=94=82      -1.21% / (-0.30%)
>  udp-stream-8192 / rx_Mbps      =E2=94=82          (-0.25%) / -0.39% =E2=
=94=82       -1.54% / -1.01% =E2=94=82      -0.96% / (+0.15%)
>  udp_rr / transactions_per_sec  =E2=94=82          (-0.72%) / -1.69% =E2=
=94=82       -0.94% / -1.55% =E2=94=82        +0.44% / -1.84%
>

I rerun the test on my dragon rb5 with patch 1and  perf sched pipe -T,
perf cpufreq gov and only WFI:
- on big, the diff is -0.68% (+/- 0.32%)
- on medium it's -1.35% (+/- 0.58%)
- and on little it's -3.99% (+/- 0.56%)

That being said, I don't have a better solution so far ... So although
I always favor putting this kind of feature behind a static key to
avoid penalizing non-users, if others are fine with it, the solution
is okay with me too


> Separately, paired log-ratio t-tests with Holm correction across the 69
> fix-versus-unfixed comparisons retained only significant regression:
> Xeon UDP_STREAM 8 KiB throughput =E2=88=921.54%.
>
> [1] https://lore.kernel.org/r/20261126012836.15205-3-qyousef@layalina.io
>
> Christian Loehle (1):
>   sched/uclamp: Always account active clamps on dequeue
>
> Qais Yousef (1):
>   sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
>
>  kernel/sched/core.c  | 27 +++++++++++++--------------
>  kernel/sched/sched.h | 10 ++++++++++
>  2 files changed, 23 insertions(+), 14 deletions(-)
>
>
> base-commit: 029fd68a263364583b6f9b34d22761acf0a3940c
> --
> 2.34.1
