Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795458465;
	b=ScXYP8HZVP125Htpt84d/Jaayk0EsGR3q7hiXaNelgddvcZh3ckPw/hLqWy5lHfMdPJh
	 eVgLC13G8war+6a8dsO1nA3oVEWHSoCWL2th1PN7ux3r1WxghKvYTk/5oodiqWn2HUAOi
	 DsLfJkvCAKqxxkWslVDnYvK5mYZ2xV68Jb6zNt8JQWxktwAgM8oCt8oq7kLPFu7IasJLR
	 Iswzrnu1eXeHk/8L4xgGGEWT6rMA9sQbydTuN1hWFTtFPeVd8dMM5K4fg7L/9qItMyKht
	 3CF5r9K9/F5M8UPkvtgm7wdy8e8mVtgXC/OUBD2RvsRd2U/Jvj/RZLhUNJ7dESCJEng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
	b=rA1EixzZAja9/X0EtdCt8p7lTocaHqJeNWKFrnv7PiR+3pPCI1oWt47Wijh1vpXJJrTS
	 zpc+uj0y+eWHcHVkroRKxXSDHavFFm1N/sWoFcwptcOv1d3zs7fLse/f+5IQJPK7PmNTQ
	 KxzRyejueRAH+ayo5vPSxJ7rRFfB3i2Lr8pk9bW2TZYhJqfrks/w7RgGvfzUPnAhIyajf
	 PyiAzowbvv/OB3IMgzKEhqKC8Vr1lz0CDlxP2rhRSIW7EvP4YbAbehHff4180YTrmNdeR
	 xnoYk8dOyibcOLFXZlXkhVaFdUYbL5K6hPd/EDa3c2E7JvJNq5kRmrr2sMpEGTmPD7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HW+YiFhw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC5E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HW+YiFhw
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55c7445cf85so498971cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795458464; cv=none;
        d=google.com; s=arc-20260327;
        b=ao3xAlQBZOZQ5/19E/bZqwXV7vGMMGpS+xy1OL6kXnJSbqKV1M/VkcYpcOmQ6/gipe
         6M8NLVdO6MteLQDmTyQ0uBOYgEDHUBByAmUM2TX+TStxAqprfgL5A12VFUELlBvckklL
         YM9ybgFNzZjCgRHm7RrsAWGgniRCrLRTLOvDU6HZIxkILl4twFGpls0yEI8+J/jpwEUF
         E+iT83gDt4ggVZaN0a/+Ci12KuPDyZ/PuCM76M2sbM92QqhtP8rDtMEBETcKZDrlqc4+
         R/yeXPpJ3sOEPY8rrg2gqy81OUtKLmIG0ddwvdnUaLhYPSimAkEo8Bw3XlG6kksStB55
         0B6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
        fh=jK8DIoD6IFaSyYQ1wuQwp+H5i8LyIw5CCTpP/DZZN6U=;
        b=f2CPCQ4Mc1oatNwB1uxKa7M0Qpn5RaSDa3iXCEZwK6hXzPgkDMO1BZtUoJbd1yfT8j
         Li6NDKOxUN/hD2PAfBgleP4BzWn+84lwln3kbo7nTqUKFXLsY7Na4FUi4BTG0y7+ahX9
         9cR0TcRvicEFwa4L1olkPMsFrqwAmROGM5YJGG1Ve0SimgU/toycna6iQ/fkdWPmrmHY
         fgNDY0ql/YSC1DnX7TcB6OsQsS17BGiuDl3A8OlZccOfu28vcf7Y/g0oPi4TG4af3TBS
         Y9w1jBfJz/mT8P3vjk5K2pzWnl7vNfbtSNI1lUb8QMoVdCEsUZoeka9p//P9F1commMh
         A4+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795458464; x=1796063264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
        b=HW+YiFhwv7IxT2ad7gPZ/RR6jjeN6wZI2Aa0/UsnF7Jqo5otvkv5YXOWxzab0C0oPA
         WfiyRxlfVVq8PbrRBI5tBlH4jHBm+V88xLgAT3Fyp4E3u0Pm1zVXWuqfZp+s3W5J0DwO
         lyI5kcxGqdx0l2Cz9THrLsUgo0MGAeD70MstlEpKcR9tD/6iG3Smw1Z3nJVuzLJVIY3r
         rsjfp5reIgeJ/pWWnhQvj+h7Y5FvlebTs66BkuAwek1prpTIdwuGf3mpMBYjPhJbwJXr
         JBJuBTm73q1cGi7PUzA95q8nEAK5q4zZgOnxvjaoM0DbYjRKwOPMLjEjUwAMwXW9UQbf
         9rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458464; x=1796063264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mv59fVvaG8+1uwanG9a9AV3qrfmi8QzYRDjJgUgr+zg=;
        b=q+sdyFmPgQpghsOZeDfqtUeSGKB9GbkE/kXOnDnOS72lW81B5ZSKQzNiK6pGPcHPoe
         wCPsfxPQXy1Ss6oiOOrhc7knkpdhYWmZngaCzdSyYXbngPdRUOwP6vDl9lPFnRVFHBOJ
         yaVqLRCD8C0TO4GrwF886UlwyVZ9BuJrPtrHwOlNeTMJonvbY6IAdVjIBdC5IWA8VKGi
         kN9VT+P5G0rrVWUVuCISy7K5rJoCSirwimnAIHKlrneu2AwwgnMy/JT2Fvr9yhoYBb+N
         Ne9c6LVOWZ58gNX03JA3zfvkoIeKilk23MGBKMy+2EeL31e6J310ypziacZSz6Flc0aD
         lXOQ==
X-Forwarded-Encrypted: i=1; AL+hErEe2gSv+IHt49IaDUxYW0TW94m7jba8Phj3h+7mpV5VK2m5+XYjR0afprKuT9L9hQuly2AXX8GYUu8N2Sw=@vger.kernel.org
X-Gm-Message-State: APuU4Z80ZXRmHZeZ00DdblIbBzRwyuMWO9EXaOCJ+Q1RkiC5d9WgKj+W
	PN+tiONYJLl6ekap1uXPSBZcv9fNElbKADNYEO6Jw6/Zb64Pla7EkX/Kw/rYYMNjBUeBMHw5xXs
	1g6LmZrWicbc9orpEuAw19A7VqU7GpM1CqtcN88pP
X-Gm-Gg: AZFdTZdBWHA7RKqiFtvm7Llnhd0lfIqejepsrhMR1SPZRuDbGGwzUHVGYcmyqfNXYnA
	oN0ELriKSD0p9KfB/JNkQTToGsw8uetyLgfDJgdHLfqICW/OMWGm1EpDgeVGDUIASqGvIvQO1e8
	VTjClnZmQftQFdIWAZFKZVJDwI4dkIfiBIkslQQ4uwg5gUgc6j8aH3cRBfSbKuIpCPiSRCwvDzA
	gynU6C68cmRTo609JrkzaBHyM5tSnaHtnVhXr5eXMvbvGisCmK6IOz7aaUCnLwXHpiLA1G0sGTm
	P3yOpBPDpPnGS4Xo3yN+lGiUtW0WPERyS0kD4/naNbacPFGHEbYxKFqYyUFf0IjEYtCxho2ttnL
	sOuse7Q4F95NtEBiS1ZLWSJgIirAD0u0nKzMheQ==
X-Received: by 2002:a05:622a:994:b0:531:282:6560 with SMTP id
 d75a77b69052e-55d8906adc4mr41086201cf.15.1795458463690; Mon, 23 Nov 2026
 10:27:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113074125.4146687-1-aaupov@fb.com> <20261123175540.GE9176@e132581.arm.com>
In-Reply-To: <20261123175540.GE9176@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Nov 2026 10:27:32 -0800
X-Gm-Features: Aa3M54rkqvnpPz0DiXLf5e18ONtq5tQbgbU2y6PXCXZ-S06Dd1ce403DsJ35cTM
Message-ID: <CAP-5=fXh9zDsh6J=oyDKmxLVsOw-CA4vDYu4589eLdxLsOav4A@mail.gmail.com>
Subject: Re: [RFC] perf: SW strobing for AUX trace windows
To: Leo Yan <leo.yan@arm.com>
Cc: Amir Ayupov <aaupov@fb.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:55=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Nov 12, 2026 at 11:41:18PM -0800, Amir Ayupov wrote:
>
> [...]
>
> > pmu_pulse (coresight-only)
> > ----------------------------------------------
> >
> > The first attempt was to try to avoid perf/core entirely, and extend
> > a coresight config with pulsing ETE external output on every cycle
> > while tracing is enabled [1]. This way, pause event on TRCEXTOUTn
> > ends the window after exacly N traced cycles. The use of ETE external
> > output is pure coincidence, just a way to count cycles only while
> > tracing is enabled.
> >
> > However, the review has raised that the config is not self-contained
> > and requires a lot of checks to only enable it on capable HW:
> > - needs a helper in the arm64 PMUv3 header and a move of PMU
> >   definitions - needs arm64 maintainer's approval;
> > - only works on ETE whose PMU counts TRCEXTOUTn,
> > - the window is always measured in traced cycles;
> > - is restricted to ETM, doesn't help Intel PT,
> > - the further it is from a pure config change, the less understanding
> >   I have to support the patch series further.
> >
> > I decided to abandon that approach and ask for a better/more general
> > solution, hence this RFC.
>
> I saw you have sent CoreSight and PMU pulse v6, I will review it.
> It is a good improvement for me.
>
> > Option 3: cross-event "arming" (attr.aux_pause_armed)
> > ---------------------------------------------------------------------
> >
> > This extends aux-action with a new bit (aux_pause_armed):
> > - aux pause event period is set in an overflow of aux resume in group,
> > - restarts from the full period,
> > - on overflow, pauses aux tracing:
> >
> > This is the most flexible and general solution:
> > ```
> >   # resume every 10M cycles, trace 5000 cycles
> >   -e '{cs_etm/aux-action=3Dstart-paused/,
> >        cycles/aux-action=3Dresume,period=3D10000000/,
> >        cycles/aux-action=3Dpause-armed,period=3D5000,call-graph=3Dfp/}'
> >
> >   # resume on page faults, trace 100k instructions
> >   -e '{intel_pt/aux-action=3Dstart-paused/,
> >        page-faults/aux-action=3Dresume/,
> >        instructions/aux-action=3Dpause-armed,period=3D100000/}'
> > ```
>
> I am just wandering if we can extend a bit "aux-action" syntax to
> support delta value, something like:
>
>   -e '{cs_etm/aux-action=3Dstart-paused/,
>        cycles/aux-action=3Dresume,period=3D10000000/,
>        cycles/aux-action=3Dpause,period=3D+5000,call-graph=3Dfp/}'
>
> The + symbol indicates that the pause event occurs 5,000 cycles after
> the resume event.
>
> > Cons:
> > 1. the core has to keep a disarmed event stopped across group
> > scheduling, throttling, ioc_period, power mgmt.
> > 2. rearming happens in the overflow handler (in NMI/IRQ).
> > 3. Software pause events are not supported.
>
> Why here software pause event cannot be supported?
>
> > Question
> > ---------
> >
> > Does it sound reasonable for perf to support this, or it's better
> > to pursue pt/coresight-specific solutions? In the end, my use case
> > is about tracing.
>
> I think you are asking perf core maintainers to explore a proper way to
> move forward. If no feedback, it is good to send RFC series to
> demonstrate idea if you have a preference.
>
> > If yes, which option is preferable?
> > - Option 1 with restoring first period behavior that was already there,
> > - option 2 as cleaner fix,
> > - option 3 as completely general but with more core state to track,
> > - something else?
>
> Seems to me, if we extend a bit with "+" syntax, this can be general
> enough to benefit all AUX trace. And we don't need to introduce extra
> new interface.

Sorry, I hadn't seen the original email but this reply popped it up
the list. Could we extend the (BPF) filter format to support this use
case? Or maybe there is an overlap with the auto counter reload
extensions on Intel.

Thanks,
Ian

> Thanks,
> Leo
