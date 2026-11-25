Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629966;
	b=KAASpbeLDOdJqRlmiGif0/rxMGCIN0widbnopaCAYt9v+DBNaiPfN8NjOVJUcghMu1fl
	 rJLoNxPZuj0PxOHGPME+QhlD9fyIZ8hGd/XZHJXJX+mfnVwr0PGn04MCUsuRzNY/AOEeS
	 S4OhFKAMyiwpozeWUEwWRGqCgB4xb6yyuxOM5XXrUVx1cb8iu95Ao2l4m4T+E7grUdVGH
	 d2+rp4wjERJaBJz5TC7QoZ3cenzh6+M0xuwXI+zZ+wmE2kk2gbund7X1xD/NpONcC44qP
	 SSIAHVsGjHs7kEHw9MdAVs2iqjjS0AzPlhq1xAzx6viuT46/ES6TxNdjSqcmFs3di+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s0yGO0nle6dWsSssSP9hU9J70E3ycwEl+Dc20fwXM0A=;
	b=q/fnTqRF6+LDRNQ62U1kKF+fCfj7ZAA7NthuTmaLbU6m+L4Ok1uweiqrqxKl8BSJ6ROP
	 c91xo5MRSEJqP8gUEy3fD1ZM84IGQ8BVH08I6loK2BhsbxXExPUXa43lOAIhlkqY0aFia
	 bQlX8fw9P5Hw73c0zzoe59wk4o+UH5MzZo/OBKk8YAry8Ea/4dOHgJG8J5LQgELf4woLL
	 sPxK3vdqOQaDtRjXcyJ2ukG6tT8qyImCKAneYzGENUXGTtYgTf1VRrgKioE1SxDT2zN+d
	 lomDWbpiIrRf+OO51UZzp6pPROlFraCAnKspIZzoXGCTIPFnHUkfcchGa481FJMhv+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rDEbnNB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29964606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29964606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rDEbnNB
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso7501202e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:06:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629964; cv=none;
        d=google.com; s=arc-20260327;
        b=eCt+fHAeYUUJwC8QO8Isio97C8zfGqVKhAY+Wzay9NaImBb3D9lvITWXni97T5mUnH
         6nMFj2omM2jO3t3X2o7NcW4eJhux5LESJAYbDG0P/0bK5bv6SbvgTs10n8spyiD8fh6y
         62r3+slLF3rIcuiLZaT4sXwoiw+4nydDUmQwMdcB0/mcPAm4LGf1L7B/rOUgeetcdNKB
         JsKBnfL5eM4D4IdZwm03hrYx3wH/QC2gjAUO91cJhkluqJCHipY3E13k3Cw5AfATdTMR
         RaZWaQviKh5NmYTzwtWIHOtgmtL0gPaHCEXxfRn1pXiJqfdenu3cDsoinPo1CxQbcyn9
         9y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0yGO0nle6dWsSssSP9hU9J70E3ycwEl+Dc20fwXM0A=;
        fh=/pPl+AtCFmxZiyZR/RykXimroGjNaVwK9zY0L/Zy0qk=;
        b=OIIxljMrpMNQjH+nKUvrYY/FfLQ8guHHIdrS5rNMUDCjzpzaG/aNqQRpquUulGYY5F
         S+pL2VSGVRd3oCm0fBTujemjFFpiYAYLdjVxAz/Wydns1ht9goy8Am8sGCg+6THNCYmK
         sVYdpTbVmFOKGpmwjjgeAJJZszhsbB4ZwRXiC9bQu8dXAknGFfoSvcJwiT0viyfltO0X
         drNiaEohhr3vY0NbJxof4CaMU3y3BSUelLm6tLHfxUHao1DW4CXrf4EwRJFxQ9yaXd12
         xgeJLuV0Fyu6sBq7gcM/KqEh0pMoyUbquYnk5jls0swETc61kFw+vfVR/KKaM92GS/0m
         yKKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629964; x=1796234764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0yGO0nle6dWsSssSP9hU9J70E3ycwEl+Dc20fwXM0A=;
        b=0rDEbnNB2GJRsgUy6lUv/ntf0plwID5UbAeFHTUjOREZCwLw7zEg/DoGYO7NP2BX5w
         RfD1UG6MXcNgcwM8335YZFlxSusZNj6H1NIersHvTvZ8zgQJP5VdPbVMO4SiogkR9ISb
         AvlhBK3iDSMbek0uLdgeXC/8u5OY8v+Oui5AfSeEVNdo6Vs+OnDhu/MSr2Nrmj7qmui2
         3ehNL9HUU8Ki1r+cz1V8u3iEcf1kLbi5CZMuCLBts9vn5UCbiTO9Ntu2M9HxXSzrrqJw
         2xE+sFwHgONnSwG8B9NeQYziQ5j2f+mN+Spc9IsGbjSz5VRlLwfo2aGSe4kIyRKspCm7
         +ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629964; x=1796234764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0yGO0nle6dWsSssSP9hU9J70E3ycwEl+Dc20fwXM0A=;
        b=yXRGbEkafpJ7qsQfGTTtTHUNmHBMwGSXrW9m/SfYUDsk07MeY/pIOFAsXxCfVLrT6X
         K1kgPEiTqE/0VUjCPayt/ivOkG87wX3P3cwv9c/jeAzncfsOej6yV3Mb3IoqOyeY3YVx
         yrzgSmcVbTdUJnjMfG/X0r1unZifj9qmlqXie83Wod9o9XF2pSajjAnNEPNXCaSHCoM7
         QXV4DTXoq6fVaJFM7PfFVcGs3Mi8qFzizzhx93/NrPSNtliF+Fys7r964Yyu1pIRKaoS
         QNWvFz9BL6D5VBCMvm0ovtm3SPh+G6odxRLYwMP4eXhebMCwTKy+DsBDHXPHlgf5O9yJ
         u+8Q==
X-Forwarded-Encrypted: i=1; AL+hErFdym0un8kr1p43iQI0tKL99dJmqW402Jg43SR/VsSqBeuGxsFb8Cpjw7pHQk+PFjuaYHNNfDJAxe5WHno=@vger.kernel.org
X-Gm-Message-State: APuU4Z//mlwNX36GrMaBQLq2YaB+voFLMZr6ZC3O1jHtQumhM1T3ho9q
	b2S2S+UPr3PO4zQ3EeeVXqxTc5vCNSNimBKy0uSXP2V6HbVuTKKhQ61VhWF9CzMxp5Eqq8Yx43k
	m1evwsqWTTSpFNtmnzjysXZsBTqjl1JY=
X-Gm-Gg: AZFdTZfuBSE3Qz8eiJxzF/s5TOE9Q4I8VkDUFzQG5jrOpwZhP+E7cP8c26HkbSVv3rK
	sdUzXFLc0YUptPRCywm+bT5JQC24cNqX5luWj01f3Tx0Sr4SgQXnlDc2rCH4kgnWzPwfBDIvlC2
	ZGxEeDIiavdVgsXCMmR2u4lI+Omqv2sBs7PRDefN13jgYKvIb0AmbuPqM2g89A/Ix89tNQyOBTw
	7i757zXvEG9JOTBGse6B4Ebhy/IEJm0AcGR6yNJFxs6OFPvzpBCT/XAOnlzVqNpF4N96HswjeAW
	2l0MhVcI6/e705hemMzksJaKikeN49hqTGKzUVaglW6J7LQoiTWO7ZrqQVnGKjkXGprgL56ls10
	242D523vh1tCpLzRjVN+/XvEjAJa7jPyEWb35
X-Received: by 2002:a05:6512:33d1:b0:5c1:4aa3:cf96 with SMTP id
 2adb3069b0e04-5c1bc86cfdcmr4235686e87.14.1795629963996; Wed, 25 Nov 2026
 10:06:03 -0800 (PST)
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
 <CAKEwX=MLrDn55wmVKKba5=PcU+qFpkEbMmN2SjGTfTBiFKX8cw@mail.gmail.com>
 <awXr6iHBR54wBB05@google.com> <CACpmpodH3UUDLEze8=5v8LWgKnZWQVrQBhzSGJFY-PwEYmHEzQ@mail.gmail.com>
 <awYsDfYqrS2ldOTw@google.com> <CACpmpofsU3f=PVQF4moe6n=_qit1ZGyo4FMjyM-sVgumfyN0iw@mail.gmail.com>
 <awZt7P_p-GNZ3A2i@google.com> <CACpmpod_87WY_PcOsNmPZvFzmJyBtCpyvvq1a_BqmZgGmO1e5A@mail.gmail.com>
 <awcK9oNDbc1QFJr6@google.com>
In-Reply-To: <awcK9oNDbc1QFJr6@google.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Wed, 25 Nov 2026 10:05:51 -0800
X-Gm-Features: Aa3M54rQYU3bIxvHpI5Dlfnhm6qCWUiCqJ7E9nlnUc215LhQmCibH9zYugGNAEE
Message-ID: <CACpmpoenPZ_SqhxL70r8q09WBfrnqvPu3H+F8Tz3nVwO=rvUTw@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 8:31=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> [..]
> > > write_s would be calculated averaging the time in the ".. bytes / ..
> > > usecs" lines, and free_s by averaging the time from the ".. usecs to =
free
> > > memory" lines.
> > >
> > > In this run:
> > > write_s =3D 37.31 s
> > > free_s =3D 23.39 s
> > >
> > > With your patches, I got:
> > > write_s =3D 37.03 s
> > > free_s =3D 18.86 s
> >
> > I am not sure how useful it is to apply user-space gettimeofday()
> > results that time many higher level C code API, as an indicator of
> > zswap_store() performance.
>
> It is useful to see where the time is being spent, and it is consistent
> with the perf profiles.
>
> [..]
> > > You can see that the cycles spent on zswap_store() are almost the sam=
e,
> > > and the cycle reduction happens in zswap_invalidate().
> >
> > The cycles spent in zswap_store() should be normalized to the # of
> > zswpout events that these CPU cycles represent, for this to be a
> > reliable measure of latency improvement. There could be an increase in
> > reclaimed folios for any number of reasons, all of which are not
> > necessarily due to performance-improvement/degradation of
> > zswap_store() itself. IOW, more work for less latency per unit of work
> > is not always indicative of a performance degradation in this case.
> >
> > A realistic scenario would be that with zswap_store() becoming more
> > efficient, the 30 allocating threads cause more memory.high breaches,
> > that causes more zswpout..
> > This would cause more CPU cycles in zswap_store(), but the fact
> > remains that zswap_store() efficiency has improved due to batching.
>
> The zswpout number is almost identical: 45,796,107 vs 45,796,089.

Can you also share these vmstat/zswap stats for this run (baseline and
with patches):

 pswpin
 pswpout
 thp_swpout
 thp_swpout_fallback
 zswpin
 zswpout
 zswpwb
 pgmajfault
 2048kB-alloc
 2048kB-zswpout
 2048kB-swpout
 2048kB-swpout-fallback
 zswap_pool_total_size
 zswap_pool_limit_hit
 zswap_written_back_pages

Thanks.

>
> [..]
> > > > > If we want to address lock contention in zsmalloc freeing we shou=
ld address it as
> > > > > such, not by batching compression.
> > > >
> > > > Lock contention in zsmalloc seems like an independent optimization
> > > > that is good to solve. What I don't see is a way of explaining the
> > > > gains in this series based on zs_free() lock contention, and hence
> > > > drawing a questionable conclusion that this series does not optimiz=
e
> > > > zswap_store(), and further that batch compression is not attributin=
g
> > > > to the gains. I have provided ~10 reasons as to why the combined
> > > > zswap_store_pages() batching and zswap_compress() batching improves
> > > > zswap_store() performance in [2].
> > >
> > > See above. I think the performance improvement is a side effect of
> > > calling zs_store() in rapid succession for pages in the same folio, a=
nd
> > > more pages in the same folio ending up in the same zspage. As I
> > > previously mentioned, this happens because all pages in usemem end up=
 in
> > > the same size class.
> > >
> > > The right thing to do would be optimize the zs_free() path. I am look=
ing
> > > into batching zswap entries freeing, which I believe is the right pat=
h
> > > to optimize given those results.
> >
> > If I can restate what you are suggesting, and please correct me if I am=
 wrong:
> >
> > 1) [Data needed]: Normalized zswap_store() CPU cycles to # of zswpout
> > vmstat events in baseline and patched.
> >
> > 2) [Data needed]:  Normalized zs_free() CPU cycles to # of calls to zs_=
free().
> >
> > 3) If (2) confirms that zs_free() has become faster, then that is a
> > beneficial side effect of batching, per your analysis above.
>
> The number of zswap_store() and zs_free() calls is almost the same. So
> storing doesn't get faster, freeing does.
>
> > 4) Why are you suggesting that *instead* of acknowledging the
> > beneficial side-effects of zswap store/compress batching, you would
> > want to find another way to improve zs_free() latency by batching of
> > zswap entries freeing? I would imagine both need to happen. The zspage
> > locality side-effect isn't a contra-indicator to zswap compress
> > batching.
>
> 1. It is unlikely for realistic workloads to have folio where all pages
> compress to the same class.
>
> 2. Even if it happens in practice, we'd optimizing the wrong thing.
> Consecutive calls to zs_store() landing in the same zspage is an
> implementation detail of zsmalloc, and if it is something we want to
> enforce, we can do so in the correct layer (e.g. by adding per-CPU
> partial zspages like SLUB). The gains also depend on how different
> threads race, and the effect of cache locality on the specific CPU.
>
> You are basically proposing optimizing zs_free() for this scenario by
> batching zs_store() calls in hopes of landing compressed pages from a
> folio in the same zspage so that freeing gets faster. That's definitely
> not the way to do it.
>
> If the zsmalloc class lock is a bottleneck on the freeing side, we
> should address that problem directly.
>
> > I will run some experiments to quantify zswap_store() improvements
> > better, with compress batching.
>
> Feel free to, but we have been going back-and-forth on this a lot, and I
> am trying to make it clear that your time is better spent elsewhere.
