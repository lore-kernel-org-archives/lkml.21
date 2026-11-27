Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785226;
	b=Yt7fcb0ZYhmCis2lJJUwHi/gYkYG9OEwgPaNraqYDjJM7xMbMs+nhgEGlg60Iu4667lR
	 KFghAXNj65o3aC7Ifn47X9YT4TfZ5Yz5zh8QKK2rlMi7L3g3lUSWh9xExF4mDDorVBsV4
	 NWDWagZ/1Ni2mHAiYTK5dNGeLEyGyVZ+SfOPFuNRmVH7GtLq06uK7WiblVOJ6EYH7+FRH
	 /pGBxUmmJ2uO0Lmy3lDmiYGtsdaPBcCgnxPQy7PJVGSP02G/yVyYaNlLLvax4ElXRhpKU
	 jvkVLXPN/1F1bLq0pyfodU3/LuQSv9ktbOtIFX6QG+kRO76uw01MpjQ/V2kCxkztq1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hNWabw4nxUb8ENdJySInwJA0GptiMni+FAIWtGgWdow=;
	b=4lErDGN849dbANA5YIaRyhaNkc2SFBHN7WHR9ScGwviW8o4otbL9sIXDqAH1k8HzotVd
	 HPsJOXe364L7yud7jjGCQ7QgQ6n96B95jIuWXsKbdKCO47uZmMRMX01hCJqhWEuQUY8R8
	 B6sAspwHadkfu2hvnThY5yxFDbqecKJ7U94pfKTlHZ94MR89W8Z6Ipe3AKosTeSmslt3T
	 Ul2wAEIaOJesnnplhckvDtxCBhFMPUX/aA/f7OBVAinJbVngAYRznrzoIIS8AP5wopZP8
	 wkC5UV9ff/+RxXUbwf+HvnBSwBXQCMA68ZYLXRXnrNwW6G8IRf38X3zh+t91oVmAlQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yZEeMrMA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3563D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yZEeMrMA
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso11596901a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795785224; cv=none;
        d=google.com; s=arc-20260327;
        b=TjtB55oLLbCbEMi9ybGQSBrrcgW83iTk8lQqJhHHOkU62lJ3bE6MH9x7FKv3mQG4MG
         88tW79bjP3qyTawFhXI25JgqtU+s+XCvU644FY+nYOsjghVdzNWWC65MuOEeMeFLgvQS
         r2uYGrlgSTe8BhgPbuQKvNuqdhQzhpbaf1l2oCFeXmHeuB/Fkr5zhwaYbN0mRK67kgrv
         LgjsYxPzdbKvwAzI+KIl91cEUMB/SRNSfYWNdakRTR6u5xDEqG0BcC4MvIn40KoF25iq
         SOh42oextfPUVNyakt+rTMw2VuKuGNSPmkhJJmh5OreUwyIN1b2q12j0dVZbEJhWF80/
         Q4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hNWabw4nxUb8ENdJySInwJA0GptiMni+FAIWtGgWdow=;
        fh=wh142GqgoNAW8XzWtH5rX0sR9Ty8B91QaGHR7A+YWhI=;
        b=PCnaM18vjTWuOTg+hVMqGr7kCcwnIDH5wDQBdbtnid0vHp1cvJEbWM9e5od0p7FY1I
         +/0E3uNx1fiDx0m6KIvfUrDyinYVxMwuPfu6JL1eAIEKX+V7I6V4Ld1JVTxDyW/i/lS1
         cgSMRfkk2UlZOJZnoe+SUoQcPAjLXYpJ2mF20g9+QaFb6eChvg0nHe/X5tT71v7S+oVV
         LBOix4ytnfQBRfjhNLWBZxO3YRNzhMrxW0uHdiDlaGPtysfmuAL7dQQv4EPQIyYH+vsS
         ZoIzoWQKn892gcPeLZbJoKq4Ffr79Nf0aE/7og3v3lFzlg9nHP8kziJcNmK+tTydEayY
         hjGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795785224; x=1796390024; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNWabw4nxUb8ENdJySInwJA0GptiMni+FAIWtGgWdow=;
        b=yZEeMrMAZq8Fwel90W8sHTdc/jwbekf56cDoe6m/fcsMQ1hax9s49wW6weHTvSJD1y
         UHXs8/UizlBJwSG6HJbdr/6ZG4/6+uWSc6IecTbsGvOiYRNnXNkYxpj/x9yVkMwHsRbw
         gRHivY3F05x8kwcF6fmwJ8uN63fmE7knIRrjjRG8fr/ABB0PI2+PIleGLCSkmKszx767
         q4rDs6NSljKrR/1PoAC4EAyPnllDN+Pmm1w2tE6up3xDukrlPM3hGVxz9nBj1TOm7Lgb
         GvNg85giHbTBxQl4yWqWLui0ecygSdpXdgk1/exkcWJa+zXZHc6f3a93nCEj2T5DK3kT
         zQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785224; x=1796390024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hNWabw4nxUb8ENdJySInwJA0GptiMni+FAIWtGgWdow=;
        b=ViCRpfuTi1ZauFAZsvlIZ9E9F3B5dDTq0zalvMHz+nqrmMo5QLNd9zfRKVLcwJbV7/
         LOm8C2Ss1uByotXn9jEMUSq7G0aFshV6hT61Q8sHpwPa1ChJeU3MJryo+gSrsorJDKAc
         FK8MMIAhlM8mgeNQfmDYraSQScrV/OWfpssxMl3SbOA5HK9+w1MjlP7Hol1epzVDCjdL
         F8kATML/yMn+hptAV9YuFY1qBsd9Sbxn3Pz9OXuyceQ8q79pxjJLbfh6QT8m1+E8UNqG
         cXTl+PoL7pxxE2RC43SMuonpgRsRtaNneWwkvfcQpHswc8OTBE/Ii48Id7ovu7U3ER5P
         xr4A==
X-Forwarded-Encrypted: i=1; AL+hErFvedJeDupa0S/Dw2O3ijtH66g+upm/AK9uTII8YEa+d/bO3O8IvFNct/8L1xohmSJlm2U9imt4iXboZSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uy9UXDLks13q6VWTOMmoZ1hz5EbVHZ96ZVX24GNoHemjyFolB
	ZGlFZYmW7Kz8J9Ofwe0mU/v7L7gUwBxWdJuFXu/dFHdnKkkknmZ5MhtcqrvPIeE1vi20mzcSeVR
	/GeML+v/7Ho7LRUeRngsEQhrYYhGPTJbsMVXpykuy9w==
X-Gm-Gg: AZFdTZdno8kRZgenVuHmnyjI6FdlkpZMRTed9JUf5Gj6BX9uVXNirX5SL9Q0b7o2MDf
	Mau74+WOqgJtRUjJIRJ9bt0SPliETvHxRhRWtwbEDaLr8GTfd6M5qsRazzqDsKsvYCpHapbvzoc
	2sPi/dj1oLn0cpH98eZLhpZxreOKMF81CyAJdLLEYvo0eKlKzvk10g9PJYwJVuQd7liltBdaaS1
	mRRNjCYttNcRRsSAXQ6m/ma0p8b+b5eZnTEYBY8wNg6OipOznVkcdpA7uTbq1waOA+ZRfWd3OkQ
	9g4ismVtG+V8+wkot12pydjMRZNTxZbXE+uSQZonDauOdbjQk/unGkrLI7ETUDUA59NWMWnYDIo
	O+j4Rtnzj9s9UYclPMelKlGedGieLqRyx3Sr+vrzXY56KnbgQ5dN8AgMbh+fQb3WVkWEFRlxaK6
	Q9Cb16BqC3G8xcQsU=
X-Received: by 2002:a05:6402:2745:b0:6ba:1347:5cf with SMTP id
 4fb4d7f45d1cf-6ba37cc07e6mr17802110a12.2.1795785224363; Fri, 27 Nov 2026
 05:13:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127111316.3321502-1-christian.loehle@arm.com> <20261127111316.3321502-3-christian.loehle@arm.com>
In-Reply-To: <20261127111316.3321502-3-christian.loehle@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Nov 2026 14:13:32 +0100
X-Gm-Features: Aa3M54rTsBd7ED_JB7iaZ06NrrNIH1JX0kuqb8jdk_nWtHSlsjeDspV1H3Pjjro
Message-ID: <CAKfTPtBJdk86ozXXu89WyV+_An5bm5aMqLqF9V5ht=kp2k2Kmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@kernel.org, peterz@infradead.org, qyousef@layalina.io, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com, 
	kayracizmeci@gmail.com, wvw@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Nov 2026 at 12:13, Christian Loehle <christian.loehle@arm.com> wrote:
>
> From: Qais Yousef <qyousef@layalina.io>
>
> We already have uclamp_rq_is_idle(), but it wasn't used everywhere.
> Replace open coding with the function and add new wrapper to set and
> clear the flag which enhances readability.
>
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/core.c  | 14 +++++++-------
>  kernel/sched/sched.h | 10 ++++++++++
>  2 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index fadad7d3f3a2..4bbb095a6d19 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1644,7 +1644,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
>          * max-clamp.
>          */
>         if (clamp_id == UCLAMP_MAX) {
> -               rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
> +               uclamp_rq_set_idle(rq);
>                 return clamp_value;
>         }
>
> @@ -1655,7 +1655,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
>                                      unsigned int clamp_value)
>  {
>         /* Reset max-clamp retention only on idle exit */
> -       if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
> +       if (!uclamp_rq_is_idle(rq))
>                 return;
>
>         uclamp_rq_set(rq, clamp_id, clamp_value);
> @@ -1882,8 +1882,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
>                 uclamp_rq_inc_id(rq, p, clamp_id);
>
>         /* Reset clamp idle holding when there is one RUNNABLE task */
> -       if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
> -               rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
> +       if (uclamp_rq_is_idle(rq))
> +               uclamp_rq_clear_idle(rq);
>  }
>
>  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
> @@ -1922,8 +1922,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
>          * Make sure to clear the idle flag if we've transiently reached 0
>          * active tasks on rq.
>          */
> -       if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
> -               rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
> +       if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
> +               uclamp_rq_clear_idle(rq);
>  }
>
>  static inline void
> @@ -2114,7 +2114,7 @@ static void __init init_uclamp_rq(struct rq *rq)
>                 };
>         }
>
> -       rq->uclamp_flags = UCLAMP_FLAG_IDLE;
> +       uclamp_rq_set_idle(rq);
>  }
>
>  static void __init init_uclamp(void)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 804c70317637..982d47fbe9b7 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3799,6 +3799,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
>         WRITE_ONCE(rq->uclamp[clamp_id].value, value);
>  }
>
> +static inline void uclamp_rq_set_idle(struct rq *rq)
> +{
> +       rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
> +}
> +
> +static inline void uclamp_rq_clear_idle(struct rq *rq)
> +{
> +       rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
> +}
> +
>  static inline bool uclamp_rq_is_idle(struct rq *rq)
>  {
>         return rq->uclamp_flags & UCLAMP_FLAG_IDLE;
> --
> 2.34.1
>
