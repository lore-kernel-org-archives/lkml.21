Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098874;
	b=kDuKiWnSoUYu0V5gcNUT/BM35Dpe15O81sSMwQdlGnsQi/Yx6WveKo+BxvaImA9XPpTS
	 8gM5coiSD3nlOyitdoQtfhBcf0U4M1e3ochr28GdfgK4QKEcMiHM1bNjH0VNrr1e+D9jD
	 Y1H/+gjR7fVH6gBrjj5dexZmBnuJ7P5oByEGkEnQQjLJ4aLf5kkUgo0eWw4UXWsjQdWQX
	 QQV/9UXoCW/ZZR/Lwa8CBfAa+TMs0NUwiFIZuM7Ay0dyhrdr+oJ7Nb8VGpUy0wzWOuJ+C
	 6E9TCW7VeZ+KkisYAe0smjP4eAHtjU+dEyWOti+DQUaajhy7WPPt2gf9rXhfR/lFVDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098874;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=pRSb81b3SBt/FIt43Arxg2bmJQWR+BvxXkEGFDTOslw=;
	b=QsAyqXxN3/OcrgKPiGfCDQTnclohB6xRoU3WKCMnEMPzpzPhMKa4hrnE/3AAfp24tenG
	 ALfYETSV4fUdtrH+SJj5XVQWNzqvgF4u1BmTGhpkk10PHYebUQwggqRDyIH7h8oC4yGsB
	 +2PFaWEn01hXmFU/xws+HPoTUYs09vT8rIdAFZ9QO0jjgETQ/YtbOog3zfIaDCU/1ZBSw
	 fM3VhAX3n1W+TBcsdP8WPVtKp/YflLGUBg6ckSJ5oqmvz3tRUVgPQcZhqrlcLu3TSNFQ5
	 nSNB7YtmYfQORrQcntR2QlvguL2v+0HJ+4SyeoGq8NHBDX797xGsb7I8Wb1/cenH75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FHwnYEQp;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Md64GCvx;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C53606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C53606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FHwnYEQp;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Md64GCvx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795098872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pRSb81b3SBt/FIt43Arxg2bmJQWR+BvxXkEGFDTOslw=;
	b=FHwnYEQpwqQg5JZrOA99DMfLExGyeQLEt6Ea6UvVwbzDc85Ksf1SPJquUwb7Ah4rzGJAGZ
	iSXaUdaEhrnMSpTz599BSQNE+oRRQIgmXPAmjO0sJrMtIGIqjQnA737w3jQpej34FsMy0m
	r7OrlksJ7CHwWk8X1BV9rvbHuP/ujzE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-IF5vCuvxMqWRxaxvosbqCA-1; Thu, 19 Nov 2026 09:34:28 -0500
X-MC-Unique: IF5vCuvxMqWRxaxvosbqCA-1
X-Mimecast-MFC-AGG-ID: IF5vCuvxMqWRxaxvosbqCA_1795098867
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a17741243eso13012035e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795098867; x=1795703667; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRSb81b3SBt/FIt43Arxg2bmJQWR+BvxXkEGFDTOslw=;
        b=Md64GCvxyBZDRn5mCYHNz71AC25E8VoHfMfxpv0bXdzR0XCCIMr0oiJ39GDqbwgtCU
         +9SoaflDf858GzO/o8b50QgQJMH2cJks85pKByrtyk5mm3lODVKxok+8md6BNSnziimv
         0JbK/EkGhUFvok7GzixYQpL+frRHurWAvLdn018Z9Wmmtl2LkAQ8brW5xwcSNPV2MJhs
         aXo72Z1UavBjsC/1ijNHvRAaTr2S+4AM2qjNF3XpWhG5WW7SOo4c6PnVio1smWQuBso6
         DfjzB2WJPaRPF9/qhfkz06LJcGYWbX6BzzQDVgzngL1N208J3UPgARs1VnFEQRkPOfwK
         MdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098867; x=1795703667;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pRSb81b3SBt/FIt43Arxg2bmJQWR+BvxXkEGFDTOslw=;
        b=NOdGnXV+dYgJEZjZYoXed7nzf9EqqcZXLCaRx/sMpZa+Kz29c3CMxP8umknr6GpUJn
         MhqHWSXuixtRuGRcjc1fc5wGlzmXoFMZENDUvFfb/lEVlZ0I3JOBegXFjuiLSBdpHqNK
         7y/Hc2G9Os5TnG1Z7H4wVTI7HwPE03LSYaAMvLHhRVHdTHZw4uh88ryLOAP6jCwLwR8N
         abY2uSYvrf1ZNkAfhlz/POnXu9fppNNRm3koJ+xBzbOAmBQBgEfWb5iEDQRCZM0M7Kw1
         3Z9zF8WivNBW8mWMXPTE1qyRbH9ASBllrwauae7dnm3piLg9NEIF1VnOwucKlMhWxWrK
         OhuA==
X-Forwarded-Encrypted: i=1; AL+hErHuAwS4KM7g253Rwk4XsN2ea+IbNZt/RckXte3UMNRjIY0hQzypJbYBKi4pb4mLzm/eESy4EPlYcFx03hA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TXRa9/aMxT6dI9UP4bHvwcPQ+P9LV8TjVwIiilFtOPkDW0q4e
	wM+FSqwovn2ihYyX15p9XvAPRRynTh1eL+8nUorRJl0AK+pOq7zTMIgQoOaHD1Z9Vl4poB8DvnQ
	QQytZ9aUxT3qCHTLNVutM7CnzYCGq6xbLDxHAwbg2JJ2xXsaDVjsL5+THreaCk5lD2K0bPFAfPf
	cPSTs=
X-Gm-Gg: AYBFou1v/gfApJbpdeL/rwf4BhdPusPP9G7X92HF/NEc3Ba1CtWGp3x0595WgvFtkUz
	bs2SVq3Bq5EXqwV1P9E47JCbYvUX7VUhAqt6iEs3Qp83gpnRMmK3QQJb+AiCt861YUhcgfO+iqJ
	ZoKBOLCSK3OsZcjXJGpkK+tWFo7BHivuoo0KOxJiiJ7mY+BCqOe5ZNLvyuZM07epeqPJs8/Yf6u
	9ztvQnycm4bnM18pccSMKiSrWark9bhERWaud+XcIWlkyn0GI6muH1UhsbAK+8HLSjMdeXBowr2
	u4NUcp3nO+Di2GAzul4OMUtLZmL6RPx1kv+xBcYvj66xZcWKTJoaeG8OUqKiWHipECxR2t2Zp3p
	ir63x5NeE4ytCVJY9E5X8MoGnhfF3EzhJkYL4HSIjqi45e07WwpvAXD9SyiqKyCw4KtEWoOOHjX
	56
X-Received: by 2002:a05:600c:19d2:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb7d5d65ffmr131047145e9.3.1795098866810;
        Thu, 19 Nov 2026 06:34:26 -0800 (PST)
X-Received: by 2002:a05:600c:19d2:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb7d5d65ffmr131046695e9.3.1795098866415;
        Thu, 19 Nov 2026 06:34:26 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm52062595e9.0.2026.11.19.06.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:34:25 -0800 (PST)
Message-ID: <825843fdfe962bc03b360d686773ca82f2502d60.camel@redhat.com>
Subject: Re: [PATCH v8 02/14] rv: Fix ha_monitor timer and invariant
 underflow
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
Date: Thu, 19 Nov 2026 15:34:23 +0100
In-Reply-To: <f373c9fd1652b4c5789fddd83a18b9e6e350c588.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
	 <f373c9fd1652b4c5789fddd83a18b9e6e350c588.1793900349.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 01:49 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> ha_start_timer_ns() and ha_start_timer_jiffy() compute the remaining
> budget as expire - passed.=C2=A0 Once the elapsed time passed exceeds the
> budget expire (e.g. a state transition after the invariant should have
> fired, before the timer callback ran), the unsigned subtraction
> underflows to a huge value and the timer is scheduled far into the
> future instead of expiring immediately, so the monitor stops enforcing
> the budget.
>=20
> ha_check_invariant_ns() computes store >=3D time_ns - expire_ns, which
> underflows when the system uptime is still below expire_ns (a monitor
> armed early in boot with a large budget), reporting a false violation.
>=20
> Clamp the timer remainder to 0 (fire immediately) when passed >=3D expire=
,
> and rewrite the invariant check as store + expire_ns >=3D time_ns so
> neither side can underflow.=C2=A0 Both timer flavours (jiffy and hrtimer)=
 are
> fixed.
>=20
> Fixes: f5587d1b6ec9 ("rv: Add Hybrid Automata monitor type")
> Fixes: ab2900ae252b ("rv: Simplify hybrid automata monitors's clock
> variables")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---

Minor nits on the comments that you added since last time, you can keep my
review tag.

> =C2=A0include/rv/ha_monitor.h | 29 ++++++++++++++++++++++++-----
> =C2=A01 file changed, 24 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index 93ac99ff7f1d..ebb7f91e3447 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -351,7 +351,11 @@ static inline void ha_reset_clk_ns(struct ha_monitor
> *ha_mon, enum envs env, u64
> =C2=A0static inline bool ha_check_invariant_ns(struct ha_monitor *ha_mon,=
 enum envs
> env,
> =C2=A0=09=09=09=09=09 u64 time_ns, u64 expire_ns)
> =C2=A0{
> -=09return READ_ONCE(ha_mon->env_store[env]) >=3D time_ns - expire_ns;
> +=09/*
> +=09 * Compare as store + expire >=3D time to avoid underflow when the
> +=09 * system uptime is still below expire_ns (early boot, large budget).
> +=09 */

This comment isn't necessary, please instruct your LLMs not to mention how =
the
code use to look before they touched it. There are commit messages for that=
. And
I wouldn't get too technical on the code there, the diff speaks clearly eno=
ugh.

> +=09return READ_ONCE(ha_mon->env_store[env]) + expire_ns >=3D time_ns;
> =C2=A0}

Why don't you do the same in ha_check_invariant_jiffy() ?

> =C2=A0/*
> =C2=A0 * ha_invariant_passed_ns - prepare the invariant and return the ti=
me since
> reset
> @@ -410,6 +414,17 @@ static inline void ha_inv_to_guard(struct ha_monitor
> *ha_mon, enum envs env,
> =C2=A0=09WRITE_ONCE(ha_mon->env_store[env], READ_ONCE(ha_mon->env_store[e=
nv])
> - value);
> =C2=A0}
> =C2=A0
> +/*
> + * ha_time_left - time left before expire, 0 once it already passed
> + *
> + * A plain expire - passed underflows and would arm the timer far in the
> + * future.=C2=A0 Unit-agnostic: callers pass ns or jiffies consistently.

This second paragraph is also redundant. It's clear what you aim to do and =
I'd
say the fact it doesn't have a unit in the name means it doesn't require on=
e
(from the code it's fairly obvious anyway).

Thanks,
Gabriele

> + */
> +static inline u64 ha_time_left(u64 passed, u64 expire)
> +{
> +=09return passed < expire ? expire - passed : 0;
> +}
> +
> =C2=A0#if HA_TIMER_TYPE =3D=3D HA_TIMER_WHEEL
> =C2=A0/*
> =C2=A0 * Helper functions to handle the monitor timer.
> @@ -439,15 +454,17 @@ static inline void ha_start_timer_jiffy(struct
> ha_monitor *ha_mon, enum envs env
> =C2=A0{
> =C2=A0=09u64 passed =3D ha_invariant_passed_jiffy(ha_mon, env, time_ns);
> =C2=A0
> -=09mod_timer(&ha_mon->timer, get_jiffies_64() + expire - passed);
> +=09mod_timer(&ha_mon->timer,
> +=09=09=C2=A0 get_jiffies_64() + ha_time_left(passed, expire));
> =C2=A0}
> =C2=A0static inline void ha_start_timer_ns(struct ha_monitor *ha_mon, enu=
m envs
> env,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 u64 expire, u64 time_ns)
> =C2=A0{
> =C2=A0=09u64 passed =3D ha_invariant_passed_ns(ha_mon, env, time_ns);
> +=09u64 delay =3D ha_time_left(passed, expire);
> =C2=A0
> =C2=A0=09ha_start_timer_jiffy(ha_mon, ENV_MAX_STORED,
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 nsecs_to_jiffies(expire - passed + TIC=
K_NSEC -
> 1), time_ns);
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 nsecs_to_jiffies(delay + TICK_NSEC - 1=
),
> time_ns);
> =C2=A0}
> =C2=A0/*
> =C2=A0 * ha_cancel_timer - Cancel the timer
> @@ -494,7 +511,8 @@ static inline void ha_start_timer_ns(struct ha_monito=
r
> *ha_mon, enum envs env,
> =C2=A0
> =C2=A0=09if (RV_MON_TYPE =3D=3D RV_MON_PER_CPU)
> =C2=A0=09=09mode |=3D HRTIMER_MODE_PINNED;
> -=09hrtimer_start(&ha_mon->hrtimer, ns_to_ktime(expire - passed), mode);
> +=09hrtimer_start(&ha_mon->hrtimer,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns_to_ktime(ha_time_left(passed, ex=
pire)), mode);
> =C2=A0}
> =C2=A0static inline void ha_start_timer_jiffy(struct ha_monitor *ha_mon, =
enum envs
> env,
> =C2=A0=09=09=09=09=09u64 expire, u64 time_ns)
> @@ -502,7 +520,8 @@ static inline void ha_start_timer_jiffy(struct ha_mon=
itor
> *ha_mon, enum envs env
> =C2=A0=09u64 passed =3D ha_invariant_passed_jiffy(ha_mon, env, time_ns);
> =C2=A0
> =C2=A0=09ha_start_timer_ns(ha_mon, ENV_MAX_STORED,
> -=09=09=09=C2=A0 jiffies_to_nsecs(expire - passed), time_ns);
> +=09=09=09=C2=A0 jiffies_to_nsecs(ha_time_left(passed, expire)),
> +=09=09=09=C2=A0 time_ns);
> =C2=A0}
> =C2=A0/*
> =C2=A0 * ha_cancel_timer - Cancel the timer

