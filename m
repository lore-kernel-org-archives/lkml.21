Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200818;
	b=BEBOrDvqxNrKwywCuCj5WiKgooKKFl3IvT3CSh/a/uyHil9gVneSZJucogv7erTD7zEB
	 l4l/wyaYDSq9TNqOvZ+caX9zHALGCL5jyAcH7gUJXWYaL2wB/345Q6XohAcm2fgeGw9rF
	 LyEQ9VKNobNzTS/KiWDWlt/ICXJ3ERwGYxG5KEnOz8ZP8WMOJAh205a1UfItywcgsu2dz
	 ct7fWErB5Hjn+kd4C6aurVxq0SVGVbO/V0Vgu7i7q6hVLFbkItstE1SuHMShPcNa9LhVS
	 FLJIJQlyfnoWyPX/MyDgVZTKe2tughJij5wwmm9wNqukStdZAQ+q+GSDjxMgu6EVf/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9sT5pKOPeQasJwUhxA6x5muNzyWLPJdu9Xt2Zxrlxh4=;
	b=QuoiXifE4yQGDZCtNLEOeZKTdyt7/gwBtOx8gVARyNJhZUFM5PkzXQdycVMCwVhfFMLP
	 YyAt/iC+KSRBiVgv2TffREazTn4kFLd9Selvrq6qLYr/ilOC2iss7umZJobjHkW2Ly+5c
	 +EWqx51gq1WgPtJnvzxofsOGGe/B0CVZt+3DssYfxnHjbR3J9p8IztiMsMtVxvhgRmOrq
	 BotvuX0M870uyBShBqdG805UKZjotMTez+Q9Kt7MlrcGuQsPrCx+1+U8FP1osTlfqooGI
	 G9coUdK3+X3RQ2W+SIr/Kxq/Gj1M6Tj/z4cX4IVAIXazQhvMdMzn+yNFelL9ojSLiAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw5csPJs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55005606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55005606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw5csPJs
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso606614f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200817; cv=none;
        d=google.com; s=arc-20260327;
        b=cl7MvgbU9FxL2D3WvOxLCGP+4Po+eHAt/KEW3YGHiI30NrFUrK52hSryaD9pLOxtcz
         m6M11Z3r4R7ULh27jwJiNqzOusggHyMNWUqkrLtabmLyImlFtEYBKLPLbCFOePJzUvs+
         Cum3Whx+aomoXE6CS0L3V2KBRozQCMgnOW9u2h0L2ZyBxImEMTRNXFLymxOeUibzCYfZ
         arpCN8WCGRmh9y2kRK8a4Db7B1CvKuL4zgaj9xDVPhwsbg0McGFldW0hnJqXIzYdYhSy
         pyuG84+WaV0vvB2EZhfqVxqQB28uhf43B1HoyhO9WpiEq2NvsI9jIi8XPaf+jR9KtmMi
         DYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9sT5pKOPeQasJwUhxA6x5muNzyWLPJdu9Xt2Zxrlxh4=;
        fh=oTIBcHp8Zz8JrST97TN9hWyKawy6k2S7jhuaAxvR8X4=;
        b=Y7wd5XC1WaakeM0PGI0t2Zj4qIgWzPiGtN18uA8BBPaOIa4MVQHGmeqjxZOvwO4CZX
         ecbmLmcImx4icrBZElVpZWPSB8MtYdkjsTwj0k+WXsCmJAp6MhuIecgd1C4DeFs8NDts
         tQFn5XuudB33Bg0Mn1ccK1SkRCPqjz06UpZZm4ZoTSiEbQZEIOg2Z18HMm1AwtKxKmTe
         cnZTCVevAZ9frKvrKm8WihqfGVUldyCl0IKuFfdPwg6qhQlF8vrmSJ6mdWCqCUfvH64Z
         mBa5ppO7dzbjGbavTdmLjU3KT5j1T47ErE61/qoDiTYmDYJ7OT1IFQDJWjrp4mckXDZc
         fjDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200817; x=1795805617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sT5pKOPeQasJwUhxA6x5muNzyWLPJdu9Xt2Zxrlxh4=;
        b=rw5csPJsy9Grjv/kuDIkQSXttCNYOg6+rxmUPkkASaR7hWAbzckAvDPMREyWl41Jpv
         6Wm4HIb37WTD7f4yTaQh+u4hRgprD96xHlk/B2phHMxFlPNy08tezRtQWluJzIaEjUUT
         PPuzW4vTJq86XyFDNlVSKVe5AIRdRzYZW/eO0yRqe8COET/d48wXeOwyg94GVNqvy748
         FWFVvoQmBR+tm46nKnmocK2A8XvnLiQch6HurDhEHcRra4Q3yN8jMhVDEiN8bCaymXly
         uXLs9MHrnh3ERbakZWvGtw9nV3LjfdNqtxGygeVv5OkZh3/K8meJgem6swkzw1Yaiaki
         tePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200817; x=1795805617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sT5pKOPeQasJwUhxA6x5muNzyWLPJdu9Xt2Zxrlxh4=;
        b=D8h1x2YfQmxeTsoHPndUmNy3ULeXS9lTvIU3CO1G0dXtgCBcogkhDS8Ywz9xSNdLx7
         VRtxixrfuADAwX7vijlYwRK/Bh2kPwPKw7iTAroY2a0kDCUt770pUBdk29/F1c7PEkhn
         eeRL1vIZVye3A2arwWFgGI5v5jU3zQyLqJlrK1UnoKbCJdPiMf48ELlyw/JtQE44Sxb0
         5xbXsXS2oqerdbuch3Are3twJyvEYCYeQl1ytVCbolkwXctJG3lo+C0hPfWKK817GVoG
         j15fSihIIbDWDDVGUH0IELBfHBbTnZwC8CdyRKCO4q8m1J/f4W4yYY46nTFcySeBFbvm
         vlPg==
X-Forwarded-Encrypted: i=1; AL+hErHnwcaGLnrOhEXGcbrE4TCdnYUlkXvUO62NQBiE7P+5JmJwV0/toZei5jzTx0iMLCq0CMLQquw2U4vsnXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T6aTKqygupbmRsnzj94Ecw6NiErxO/V0RMjfWEEnla+1IU09w
	8qUYtxegpCadeLoTVhZNekkS20DKqJtvzWbAAINxmdiaCvxeGGZGFr3EppZIdeCy9IrvzqgN/wY
	2ZzH0qcADVrSiRsmKq0/n26zT/+vSIH4=
X-Gm-Gg: AZFdTZdrhMrd1uRx1jvCjp1yIF51ryk84aVi5rHW3y4SP+l048Q2HMjyY0viKIbRqI7
	CB2cUDV3CcQ9A/36WcW0J5Rem0SxpV9o83gmO/4IqzAb5EAPgwBG4pusROpqODXPH7a4A/j1TR9
	vaK8anzXyrOIaq3W/mA+DWQH/DikJjcPSMjASdIuFsZtLj9S7W/c52otZVqiU6HejJGKYf9SHYA
	A7uEmqOgX5AVGQEltv+LCJ5e+02ES7DAVJrPBJXvCjs1Qhs6HQ2vVVU8qFx0FsAhLezVjfi4sdz
	ggnvXVR7HC5oWFo0b5iESgnbVCQiLiZqd6+ECq0k0CFph90pXrXVqaIUgZ3eQ+NCqnA0eGyraRP
	2yBnJlXtT+QDtcWEtR2ue5KG6SKFMFfdXPxaTRw5vHlMAK5E6Dn+PyoGgj7LuWzuEcWonv4OD32
	d/RiqzXs/Yky+vfhecuGM=
X-Received: by 2002:a05:6000:2883:b0:4a4:39bb:970d with SMTP id
 ffacd0b85a97d-4abab02c469mr8089761f8f.2.1795200816511; Fri, 20 Nov 2026
 10:53:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260817131843.45121-1-husong@kylinos.cn> <CAO9r8zPqJncFKQbF3tGe1d4sg-4dLQ3dQRGze_vab26wWrXTqA@mail.gmail.com>
 <179438454803.6.16655549133383619919.zswap-rstat-counters@gmail.com>
 <CAJnrk1YzYswBKv5F3=FF_o_4Pywgw0ifLq0tXYSWO7TARnFRJQ@mail.gmail.com> <CANGjgdnTjbou-XFqip7B_cGjrfZzZpan3dFuAk1-rU3bJOu8NA@mail.gmail.com>
In-Reply-To: <CANGjgdnTjbou-XFqip7B_cGjrfZzZpan3dFuAk1-rU3bJOu8NA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 20 Nov 2026 10:53:24 -0800
X-Gm-Features: Aa3M54oX3M667iXU9--_PVn5exl7P5ruO3wAPnPpv8aIQlT07cgivJguladt78o
Message-ID: <CAJnrk1YRBkoMppbn-GitdTXaNmpCf8kM2WHWvSfNPzNygoqw+g@mail.gmail.com>
Subject: Re: [PATCH] mm: memcg: use ratelimited stats flush in obj_cgroup_may_zswap()
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Song Hu <husong@kylinos.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, yunzhao@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:38=E2=80=AFAM Chengfeng Lin <lin2530632123@gmail.=
com> wrote:
>
> Hi Joanne,
>
> I tested the non-forced flush in our setup. It delivered PAGEOUT CPU
> savings similar to those of the hierarchical per-CPU counter variant.
>
> The only change in the non-forced variant was:
>
>     __mem_cgroup_flush_stats(memcg, true);
>     -> mem_cgroup_flush_stats(memcg);
>
> Both variants used the same MM base, 2967f3ccdb5f, and the unchanged
> reproducers attached to my previous mail: 32 MiB with one worker, and
> 256 MiB with eight workers. The finite memory.zswap.max remained 64 MiB;
> compressed occupancy was about 18.75 MiB in the larger test, below the ca=
p.
> The hardware was the same i7-12700KF with microcode 0x3e.
>
> I ran five separate boots: baseline, non-forced, baseline, counters,
> baseline. Each boot had two warmups and nine measured program runs per
> condition, including an unlimited control. Reductions below are relative
> to the mean of each variant's two adjacent baselines:
>
> Finite-limit PAGEOUT CPU   Non-forced             Counter variant
> 1 worker / 32 MiB          12.640 ms (-45.72%)     13.276 ms (-43.04%)
> 8 workers / 256 MiB       202.784 ms (-84.03%)    207.455 ms (-83.55%)
>
> These are summed worker CPU times, not elapsed times. Whole-program CPU
> reductions (non-forced / counters) were 22.57% / 20.97% with one worker
> and 61.82% / 59.97% with eight.
> The counter variant is the same hierarchical per-CPU adaptation tested in
> my previous mail; it retains the existing rstat updates.
>
> PAGEOUT CVs (non-forced / counters) were 4.65% / 4.33% with one worker
> and 2.91% / 9.26% with eight. The maximum absolute PAGEOUT baseline drift
> in these finite-limit comparisons was 1.69%. The small mean differences
> do not establish that one variant is faster.
>
> Separate instrumented admission runs also confirmed that non-forced does
> not mean no flush: the limit check performed 53 / 818 actual rstat flushe=
s
> for one / eight workers, versus 8192 / 65536 with forced flushing and zer=
o
> with counters, while successful stores remained 8192 / 65536.
>
> So the simpler change appears sufficient for the main benefit in this
> below-cap workload.
>

Thank you for your work with testing this, Chengfeng. When I come back
from vacation in three weeks, I will submit this change as part of a
larger series and I'll make sure your email is cc'ed on that.

Thanks,
Joanne
