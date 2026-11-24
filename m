Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553118;
	b=w1/y1anmzg9J1uPl8QHfLuZmc4hIQ92Ifllvx53gxOJsKmgunUSgSvCH/b8q8p9NBvHl
	 QRYHJwdx/HywmOZpiu4xFP40begqImc06jeuYNDOM+KUouMd1VmF67V7eDmtIBSOK/emm
	 iKHPgJLgtnLOrW4VzRB8jKCiGRHBpEmli0kH5NC0NsEAyFK7y3vFtufCvRmDpzc68xWiZ
	 +XPwJDNDfVFgYH/m6kpN4Vz6aDytlutdPl9lrFEMGDnKXKpNM5Fav4MFa7BUNvEJH93Pn
	 cll1b5gfVq0qnID3LrbCbMkNpKM0CjN/RbYdCE8/PJJSL48WyF+XuMU6yvYJlYKcgng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ul/eaXDe8p6w/1jXk7D4O5GkkvQEdYd258eHwZDOOIs=;
	b=Pz5x/LMWtbq/XNuy4ZVwzaadJdHCCuOtiTkEAkQJ3AArSEltYV9auIfRgiyz8sCynd36
	 K0ChmW0py/AGZbUAQvgu5NbmN75GsExcFUD5j/RK2Fx48O0v6BCzc9SE1FJ9/8zHPrlSq
	 NRylsbM44XcYMhuendRt/rnUYfVC+fqrVsOybJCVQ0/r/qRzJu+uyaknmmK5CTzkGQEpL
	 wCGCx/Wv5qa9noxYnk+/NG9jCae1OXVJQyZqjkNPazjukFTKwu90yjXVfbETsZJNsts+o
	 E8ZTL3LO7n0E6Gm9QqMGK16GgyAxDvcLF4ODbyJTjFvHq7VzhtTYXUHYkos5SA6fvog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCn08jhD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF7606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FF7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCn08jhD
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a358881793so2588421f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553117; cv=none;
        d=google.com; s=arc-20260327;
        b=V/v8OFJGZT1dU6xOrg95XXRumOr25aD9YqsVTRwENtvXzezfZPeSWGwMVIj22UI2wC
         qwtPoWPcM4igkiq71k8KVu8wn3P5j+6+qUgwfTOsRfcN1L3WhRwxzQkuZyBKqzgBEUS0
         OB2HGuDm+O0K/j3VCSOTijdBlCpiPB7x80mU4u3aTbTc8Au0ouAKgiP66T+X7uFc3vmN
         /7msZ+SugkWtP6WMawvLW7HvutbCEWiPpA7MhoG8zTpKxi6sloaqTwVRXpzlXO1wKIkV
         sbnlYdeAvqlc+3QmtRutI5WIMSflxawUwSxKuGvNviKkaYfr5mlb4XQ20SYLlcXnux4C
         +MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ul/eaXDe8p6w/1jXk7D4O5GkkvQEdYd258eHwZDOOIs=;
        fh=Sbz9jXGgJnGRRS8bcQpxCFmxYCGy15Zq3h+rW/DkLQ0=;
        b=WOG3xtWinQPji+k1xJxqTbEgCS8XYBQ+AHIT7QPB6uX6rF+KKB7YXzfxv2Cz5J04VK
         4v70i4aPyHRjL2pCLL3ce5OiWKvDYWMraLIeRvdtR6+dTiElYaHaMsCg9PkSLDJD9Dbt
         akvBEBdvtwa/PtUeL3JStmIz1xv/E0ewoRgc8z05f/aGyRejs+Vs4VKmwtI7698RZ/nt
         YDARBzdPlc1fUYLT7kvziLvNwD0UN7OQASenR3djAs1o4jSQwgVL9mqr5io6s9fc6Saq
         7/nm+ppmE3T1Sfs6nMmL1/1/HjCo1NUov4tGIhj7s51rbmjoldVSEWvLpMNNBQEaHikG
         GGlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795553117; x=1796157917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul/eaXDe8p6w/1jXk7D4O5GkkvQEdYd258eHwZDOOIs=;
        b=BCn08jhD6dcYbL56FcmbIIqgSM3gcFwqBKX9r6iUjsIpRs4WjR+nWaRsTDMQXV5nvf
         0kFxr/r4fBMk843u4DR3ThQfMWFDWQXi85yEKZOwQpFqeJFrfokTeb3yGCpaJXJEKRHD
         qi6uzJcqiK1gwuwHOty1ibHtqyAUbAcGoTpb2nvCRwR/qx1ua29ambFTT2LJ67u/1dqp
         jRZtngHp/I4LBrn5n5iV3/TyL6e97093+e4xAL8+WsEQPCH5S7WtTfYO0li5xffoWl8u
         WwKAPyTNxUqObsAl26U8ceWbBAMG1kPhocd05VVev/25Km61QfRwcUIzr/sHXiFfQ/4D
         UiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553117; x=1796157917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul/eaXDe8p6w/1jXk7D4O5GkkvQEdYd258eHwZDOOIs=;
        b=Kv9zYHk3garlAel0HBayU6B/tGcU1dFRe0OrZSxhq7+TXT5YLO0hUx/Rou2VntkNh8
         Z7phj22oQ7D3i7VSumP4dUCPHwmRA1t1wc/tVDbDe23gboQwBNOSn5uNyZbXl7WrfDQE
         1Z5RWtKr7IHmUwiHP/B/DXMIUF07NQMJ68tGg0Kc3K9YnVN2mlZvsNSit6YaQYzLaiyR
         uTm0I2n9HTV2lhd/LnEauAjAPLiq/WPVaUvis6iWBDwvO34MUhzCUenREba/1p1irIrs
         06qF7AHDmuqsz4uzYWHzijbPFvRL5uDpEGza4mhWb4v69QfrFFvcT2KV/dkK/ySodE5u
         hSDg==
X-Forwarded-Encrypted: i=1; AL+hErGahVb5/vs2Hq3XOAN14FHrvLvYwYpfVRqlw6g0hicsLQZlAkgjSiPB4pQ9c98LiL3T2/tVf/mSlgp5Psw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/McGhT4GvAfpgMdaagDwyf8hurOecj5nSUtINYEgAqXzMRrYPO
	Aa8rF0cVx8h5tC2Ao7TbhAJANmcGuCbzXNcNG368KYTyAwZXsZNZOpmOP/3/zTgoKbja8l7oMaM
	1z0JQArXW1T1A6UJx5u395Z5r67ndhYA=
X-Gm-Gg: AZFdTZdn+UZHxPiIMb4hZf+Re3WR832o8DeuhItFKahhumnPcRyMI0sCO8t9YybO8EV
	Nfkwp16aAvug7Q7UYvGcbcekvtTVe4i41NMBJgIAPzS4VRhih6ggZJAOHR5v2RwoeAH4x3WZJl5
	TAkeSDiZrII2nbiJDp6UrgkbLOu9ZgafjcGSNU49r8eB/IlcNNvp27r9qXvZ4iNNkjIxnyAvBRM
	mV+Si6eLeOAKv6bx/+Q8kNrobJ50xhdG3LnOssEMuBMv+heJpt8ril/HvdD/J4a9VACeyou4Vfc
	a7raEXT6qDSuE/1qTV9dczHmfrSGDr3ilKpr0sCBUtpmNQ8qrHZ4RgV5Ptfw8pY3d0C4LjQfKXQ
	T5oEeqoUFY78Tdrv9h5wqsL1c7MCi++nAP02+SxNDRKaKkyAeQ4lyz+jLfFrG3xIc4ohm5rSyHw
	zQwoCAAnM4XVc6cWSh7g==
X-Received: by 2002:a05:6000:188b:b0:4af:e519:ccd7 with SMTP id
 ffacd0b85a97d-4afe519cf33mr19369322f8f.3.1795553116730; Tue, 24 Nov 2026
 12:45:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124091252.567037-1-thnkslprpt@gmail.com>
In-Reply-To: <20261124091252.567037-1-thnkslprpt@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 12:45:05 -0800
X-Gm-Features: Aa3M54oO4ObFmmKWLKbGgp6jmNEjafbKXGnZR5o2jDkMklXDyCwW4aie0WGn2gQ
Message-ID: <CAEf4BzbfJtEfZtzScW4Gy2UM+7fCV2stzNX19T03fYcYN09wPQ@mail.gmail.com>
Subject: Re: [PATCH v2] uprobes: avoid postponing return-probe SRCU lease expiration
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org, 
	andrii@kernel.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:13=E2=80=AFAM Avi Weiss <thnkslprpt@gmail.com> wr=
ote:
>
> prepare_uretprobe() reprograms the per-task return-instance timer on ever=
y
> successfully installed return probe. If a traced outer function remains
> active while nested traced calls arrive more frequently than the timeout,
> the shared timer keeps moving forward and the outer instance can hold its
> SRCU read-side lease indefinitely. This delays unrelated synchronous upro=
be
> unregister operations that wait for the same SRCU grace period.
>
> Keep the first pending expiry by arming the per-task timer only when it i=
s
> not pending. prepare_uretprobe() is the only rearming producer for the
> current task's timer. Order return-instance publication before the pendin=
g
> check, and order the timer core's detach before the callback reads the
> return-instance list. These full barriers prevent both sides from missing
> an instance at the expiry boundary.
>
> Fixes: dd1a7567784e ("uprobes: SRCU-protect uretprobe lifetime (with time=
out)")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> v2:
>  - use timer_pending() and add_timer() for the per-task single producer
>  - explain the actual store/load ordering for the full barriers
>
>  kernel/events/uprobes.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index caf444762a27..838e0080ae1b 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -2052,6 +2052,13 @@ static void ri_timer(struct timer_list *timer)
>          */
>         raw_write_seqcount_begin(&utask->ri_seqcount);
>
> +       /*
> +        * expire_timers() calls detach_timer() before invoking us.
> +        * Order its pending-state store before loading return_instances.
> +        * A publisher that saw the timer pending must be visible here.
> +        */
> +       smp_mb();
> +
>         for_each_ret_instance_rcu(ri, utask->return_instances)
>                 hprobe_expire(&ri->hprobe, false);
>
> @@ -2304,7 +2311,16 @@ static void prepare_uretprobe(struct uprobe *uprob=
e, struct pt_regs *regs,
>         ri->next =3D utask->return_instances;
>         rcu_assign_pointer(utask->return_instances, ri);
>
> -       mod_timer(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
> +       /*
> +        * Order the return-instance store before timer_pending() loads
> +        * the pending state. Either the callback sees this instance or
> +        * we rearm the timer.
> +        */
> +       smp_mb();
> +       if (!timer_pending(&utask->ri_timer)) {
> +               utask->ri_timer.expires =3D jiffies + RI_TIMER_PERIOD;
> +               add_timer(&utask->ri_timer);
> +       }
>
>         return;
>  free:
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
