Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122019;
	b=kEgC7RyI26KPCjylWSfPfoMzm7n++MCO1wzIX1ARTQbvndNmvLhYnO4122SpVbb2IFUE
	 nerly+ZqMdIzEQ8DZDIFW79/P8X96n4CmBWmm4XcOJ/g0GcVM3EdzXekh8d2DdNqDZxLB
	 Mt1awdnFNEV7JImM5U/yye8oNLtcU48vRsfxN5ScC9sH5MzDoEhg9QG8mSYhLvs60UvD4
	 L3pwzMCeqVxRq2iCmQKKtZMShWRKDOnFI7oETHcuqqWnrl+KILQ3BdxXuPw1e5ISiKoWi
	 a8dpEtAbIVgSuw0cEVRIWIe9LzX1BesPOo0kVqozuDaL/bCw/RKBLEAbKIiwWtE6G9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JkuoV3LRaclOhWnPJXkciWhUMBiml87NgupXy23O0DU=;
	b=W1pSyE0jfMfvfnFm+Q4xOvp3r0qOa4V+pRD/pQs6kM4KkSnB6fNBeDrsae+ZkhV1ZuVu
	 GbYG+RE1Sv+pEWu3IJu3R7+MK4FaXb2H7L3fA5VQuwQaap/OONU3hehYFTHFSBg7yO8Xr
	 b9NehH8YKTsZUqww02iDqTFsonL4Hn761YpPylFWqweYegTZS/W1RVCEJV2cVPPzIatnO
	 7s1mSgWMCMunNbsmUeqA8EdjSJ0nBe5z69/v/ABo7YkEV8yu8xVWiP9KOH2jt5cDhtG0Y
	 j0Is976fYSEhPujLIX0JhFJpDw0YmEwuyb/Zr19mty+zZKGJe/izjW/OU5X3d4l3QXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jAvWjkuN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6B7606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6B7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jAvWjkuN
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so34114366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795122017; cv=none;
        d=google.com; s=arc-20260327;
        b=O7YqxjqPM3bCJSHASy3uDTezE7bgfG1GWyrvvGU+OaWHWBFSVpR/wdsv3Yiw7dHU74
         CYJ+145g4G8jI3Zs42acmv87CpM92QuFCZxJpIbHvHlamLmvX4zMHeTtz/rxHiyL7YPh
         DF5gniC3ELqqwvtqnxH0EzhidURoGtZPwT+msJid54KDZjVfc9kg6e2XG1sYEaLuymjJ
         9UiF7TzNdLActnjXHkGoe2nkEnrnj07ysKFimrDmyuQe3kYgmufi21pSdUsrm+M0lgZ/
         M4zHKjIsZRV0DaohQuZbJczyf4KKgjBuTujLK18lHGOjv6DHt72NhC7Ml4cv3cIeIBIY
         CB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JkuoV3LRaclOhWnPJXkciWhUMBiml87NgupXy23O0DU=;
        fh=uEVj91ZpKCrZUa8X2L+uIjYbA5nYD/sFtiB/W8tVk54=;
        b=ZXaGfe72A8mRhxFjfDD8Dlq7vbMCdprETyRrv/jQy3k7NM+iHw/4GYTXoAIzjHMZn0
         jyq5WMKDafBugMiV9HsiUdRPICKcziqh0qhGq37+M42i8KhoymSKNDMMzQyXAxa9Oxib
         xf/IpVLQibJX53xO90PiezzMeAvkE/4VUQ09Fs5C0t7wMwksFkc6Reo+OXBcg0YWDNzE
         TeFVkmrqWsuZeCNB+m2iX93xb46O9Gq0mKkDJfOqaXD04w6Ilyspo22jv/ftLhHsy3lF
         psj+2nCx5QIo0fJHt6+srCJTznJzWx91AjOPTAuhDZLkCetQ9yxD4Zby2Gu9WUFttu/O
         PrbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795122017; x=1795726817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkuoV3LRaclOhWnPJXkciWhUMBiml87NgupXy23O0DU=;
        b=jAvWjkuNAupqKsyBP9t5uXo48nSNrEIBrmNsChdIOU81a/yQ0R5MrZcjwXA3MdRs4E
         b3uUGcYXNcHush/OIc2HQaWMim8bVtbOHSWfcjf2j00VytHML3+xPIZojDMSzq4OwrgY
         S9Kj35FkGewfC8XKD+a2hVhrIvciGkHfzKV3n8Wa7FjZK6VC9tlMWZ2FSK54RZA7DTBC
         yXjBysmXPNO6sXdeQQgNREm3YHQEwdHKkBX/JQjgJVN3Gfca2KXNzIg2x21Fp7YYipr/
         aMGl21QRE4IwCjBz+hMpGHsQcCgI145vmsCG0CndBHNVFrGvzJI2/y4sguMnG7WdrHC6
         upUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122017; x=1795726817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkuoV3LRaclOhWnPJXkciWhUMBiml87NgupXy23O0DU=;
        b=tKtrQNOMmaLiDQgefXncVLNqb1i9orie1lMG8m/yzkBXmLtUNySf+fT+NisowYB1Bk
         vD1KHJzhsBpUXR9J/XeFUKixqqsSUE+X0WYbMqfFTjWeB0nVjEIOBYUaf4JoWVdV//JR
         AkoBHK8E4NUMbvnBOo0Y7LQLI9vEZGyk+zGo6oyzOMC4ddvlU37UlDEr6wqrKc4H6nRD
         pTYARD/i7/Dj0YIJ3FMODiJd/A5oAGm2w4mGq4upo3C/uCAW63quQsxdjgbU/KPzpUmb
         KWQBjCCm4tSwF4Ckf1YrkZLAavqL8zJbS1Kyc7pnvQjuc7ElTGvOsFbHRio2+N6TJIy4
         s6Fw==
X-Forwarded-Encrypted: i=1; AL+hErGQ9xhoO1fWeOTbgRZgwHwr7lNrPxnCfOqaETjCOGQnTkEvxmH9rPyT/EdTKMN92e5StA5lxJks112rvXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XytSfQ1+v5ysXhEs9eADcSWosMWxwtoaw5pWpcuSslkQlrleF
	OgGdeDH0xZXXfHl+pfjhTr+VoMvXowaOUS4hlt/QOkTA69cMc1yp022Kx/eCwEdh6AZWmZo8+mQ
	nYI+1i3PyxzeCemrSTf2nfdlJnBw0ZN49bEgAQKQ=
X-Gm-Gg: AYBFou3qZl+Pwkjow4qIDe4UjMprXsW26YR7QXPWZNMm/bga+RP3G0qhUOxJz6VMl44
	MNQ+3Ii0oDq+3ZzEG09NQRoJJFhQk7mSCPP7BjFtTsQrdUdcXn7Q6WbcxL5Dr273mILAedw+zdA
	0firEuR4odtidgqKqhcb4nJoKY1XzOXXpOlZENsvnvtle2/3kN+hgKh6bRmbuwODxHJsup7bIAF
	NmT0QwOkHpqcaMdYmo7XihQI/OmuFZ2XjBqQv5jde4sm7HuB29RYK/rHpenXIMTmLsJXxUv15i8
	hGNzWPOb31UTsxHuO0zTWBHJFa8Sd3Do2nLEPO8CvVL5XUqnMsNRq2/K9S8oojEcdXSUxfR1UZF
	nnbJwSUyssNXuZDe4SZhpi8HxMb4mriWHM37GnTn9tJrzNWL7U01ybQhh0jNXPlJxGw==
X-Received: by 2002:a17:906:6690:b0:c50:55ad:ee74 with SMTP id
 a640c23a62f3a-c513a847118mr94076066b.26.1795122016402; Thu, 19 Nov 2026
 13:00:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-perf_revert_prefer_large_alloc-v1-1-5fb431bbd624@arm.com>
 <57c34e26-3048-474d-8e74-f65799e32ff4@arm.com> <CALJ9ZPNWcDtajO+Luhxe1K3af64mPRFQSjvfvNornyFFkam-+g@mail.gmail.com>
 <CALJ9ZPO9XxF-kz5K67Jg8RtpiEmK7XFU3e+xDak6LyV_We7yBQ@mail.gmail.com>
 <307b4d48-00f2-40dc-bf3f-ffa0f2f58d33@arm.com> <20261118165702.GX9176@e132581.arm.com>
 <5909a504-0534-4f6a-8925-bb18f24eca0e@arm.com>
In-Reply-To: <5909a504-0534-4f6a-8925-bb18f24eca0e@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 19 Nov 2026 13:00:03 -0800
X-Gm-Features: AclHuK9FisnGtjXm-SFirgfztprvPOSno_qtl5fCAJTkLA5lJGL5x4nGHHFxvf0
Message-ID: <CALJ9ZPObeFj0mm8ahwCa-ePYHXU2nE=hvPW97bStH2mX7RvqnA@mail.gmail.com>
Subject: Re: [PATCH] Revert "perf/aux: Allocate non-contiguous AUX pages by default"
To: Dev Jain <dev.jain@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
	Michiel van Tol <michiel.vantol@arm.com>, coresight@lists.linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:43=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 18/11/26 10:27 pm, Leo Yan wrote:
> > On Sun, Nov 15, 2026 at 08:32:16PM +0530, Dev Jain wrote:
> >
> > [...]
> >
> >>> 1. Make opportunistic high-order AUX allocations no-reclaim:
> >>>    When !(event->pmu->capabilities & PERF_PMU_CAP_AUX_NO_SG) and
> >>>    order > 0, clear __GFP_RECLAIM (and add __GFP_NOMEMALLOC, matching
> >>>    SLUB's allocate_slab() and GFP_TRANSHUGE_LIGHT):
> >>>
> >>>      gfp_t gfp =3D PERF_AUX_GFP;
> >>>
> >>>      if (order && !has_no_sg)
> >>>              gfp =3D (PERF_AUX_GFP | __GFP_NOMEMALLOC) & ~__GFP_RECLA=
IM;
> >>
> >> Thanks for your reply.
> >>
> >> This looks like the correct solution. Note commit 0e05a469c294
> >> ("mm/page_alloc: avoid direct reclaim and compaction for costly __GFP_=
NORETRY allocations")
> >> post which the regression you report should reduce drastically. It onl=
y
> >> removes GFP_DIRECT_RECLAIM flag, I assume you are seeing latency even
> >> due to reclaim/compaction daemon wakeups.
> >>
> >> So instead of enhancing this commit even more by making a page-allocat=
or
> >> change, I would rather make your proposed change on the perf side to
> >> keep it simple. This should completely solve the problem.
> >
> > Thanks a lot, Dev!
> >
> > The revert (526d945ad9c0) and 0e05a469c294 are now in mainline. My test=
s
> > show significantly lower PSI on v7.4-rc3, consistent with the expected
> > benefit of 0e05a469c294.
> >
> > The following PSI some values are totals in milliseconds across runs
> > 2-10 (nine runs), excluding the first run of each case to avoid
> > glitches caused by its proximity to lauching the pressure workload:
> >
> >   Memory usage    v7.4-rc1    v7.4-rc3    rc3 + perf patch [1]
> >   90%                0.000       0.000               0.000
> >   95%               21.781       0.000               2.061
> >   100%              27.946       0.000               0.000
> >
> > My perf patch [1] reduces pageoutrun and compact_daemon_wake, but
> > increases pgscan_kswapd at 95%. The following totals compare v7.4-rc3
>
> Exactly what I expected. I would say to not complicate with GFP_RETRY_MAY=
FAIL
> and keep it simple.
>
>
> > and v7.4-rc + my patch, also across runs 2-10:
> >
> >   Usage    pageoutrun    compact_daemon_wake    pgscan_kswapd
> >   90%        58 -> 0               57 -> 0       1,932 -> 0
> >   95%         3 -> 2                2 -> 1       9,664 -> 148,079
> >   100%       40 -> 1               40 -> 0      11,616 -> 1,918
> >
> > I would wait for Yabin's testing before deciding whether to proceed
> > with the additional perf changes. In my patch, changing order 0 to
> > __GFP_RETRY_MAYFAIL needs care: it may reduce allocation failures when
> > free memory is scarce, at the cost of longer reclaim stalls and
> > higher PSI.
> >
> > Yabin, could you test the current mainline (or backport
> > 526d945ad9c0/0e05a469c294) and confirm whether it resolves the PSI issu=
e
> > on Android? If still see the reclaim pressure or observe AUX allocation
> > failures, it may also be worth testing patch [1].
> >

Hi Leo, Dev,

I tested on an arm64 Android Pixel device (4 KiB pages, 12 GiB RAM +
6 GiB zram, TRBE & SPE) using an Android kernel patched locally to match
v7.4-rc3's rb_alloc_aux() / __alloc_pages_slowpath() behavior
(526d945ad9c0, 669872181549, 53a9b4646f67, 0e05a469c294).

v7.4-rc3 alone still causes heavy PSI and compaction/reclaim stalls on
Android, while patch [1] keeping __GFP_NORETRY fixes it completely.

compact-bench (90/95/99%, 10 runs each =3D 30 runs, 4 MiB/CPU TRBE AUX,
0 allocation failures; system-wide PSI since Android sets
cgroup_disable=3Dpressure):

  Config             PSI some(ms)  cmp_stall  allocstall  daemon_wake
sp_kswapd_wk
  order-0                  297.76          0           0            0
           0
  revert                 2,578.00      3,957       1,984           17
          28
  v7.4-rc3-sim           1,840.29        522         161           14
          21
  rc3 + [1]                270.77          0           0            0
           0
  rc3 + [1]-noretry         41.78          0           0            0
           1

Even when order-3 pages are still plentiful (e.g. 95%, where order-3
never failed and cmp_stall/allocstall were 0), v7.4-rc3-sim still
woke kswapd/kcompactd for failed orders 4..9 on 10/10 runs (7
kcompactd wakes), producing 895.48 ms PSI vs. 2.87 ms with
[1]-noretry.

When order-3 does run out (99% Run 1), v7.4-rc3-sim bypasses
0e05a469c294 and hits 521 direct compactions / 161 direct reclaims
(Runs 2..10 dropped to 1/0 by reusing freed AUX pages; that only
helps when traces run back-to-back in a short window, which doesn't
match our use case on Android).

Under a realistic Android fragmentation test (incompressible zram
pages, unmovable pages, re-fragmented between runs), v7.4-rc3-sim also
triggered an lmkd kill (TRBE) and direct compaction/reclaim stalls
(SPE), all 0 with [1]-noretry.

When unfragmented, [1]-noretry still allocates 100% order-9 (2 MiB)
chunks for both TRBE and SPE.

So I agree with Dev to drop __GFP_RETRY_MAYFAIL and keep __GFP_NORETRY
  (0 allocation failures and lower PSI). Please proceed with v2 of [1]
keeping __GFP_NORETRY (and avoid backporting 526d945ad9c0 to
stable without it).

Thanks,
Yabin

> > Thanks,
> > Leo
> >
> > [1] https://lore.kernel.org/lkml/20261109-perf_aux_alloc_optimize_psi-v=
1-1-d56ac4bf3ef5@arm.com/
>
