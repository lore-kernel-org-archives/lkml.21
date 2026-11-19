Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101362;
	b=Rt0nLYHVcypZCW/Bat0qWN2cxe6t/O7fbAO7WuNJTE5xpXjvxOdCxJqw7x/ISbGxD3TE
	 fOyIW/da7x0ZgozOIGHPDfpXgoXO2yt+HkP2x9ZnFSHpaA5PnS8+jc2oyCxUJC3bff8uo
	 wSyeKGPsL1IXbP5HfP4pNjJklH7/8tlGJqbWMaRmOQ3ZbBj4u4UFBfNteBEeCV5Au+REq
	 nsKSeqyJ8QipTie6OUgaMa3FVg2AhOo3C1YIKpTKx6/k48Co2Gruc2W0RqyDl3lTmjqt9
	 KVkn0wr3QoWa/+Tv7l2Tp29qyBqbYJwnSSp5d6ifhdnhG5oHNXkF502pO2PlBRzzYfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
	b=pore0iwWB1Ws1Os6E9ti7FmN9/sic95lt9CWaWcRXx5ACRKgmqYqSVe6xmafFaTDpOei
	 9qsd+ij797/xTxPZnsN+D+F/awc0G7+sr3ArQfoXKapmY0g72PUfBT9PabaJiRO3XqJ7r
	 /VnxS6DOLD0A1WX5vBaS6RGoAEV7tqE37NcPto30lMmD71stW7VDfIG2sov1rPKkjGGy/
	 lrB4uyKyOsqyyskU40i9K+TuAvSi173xDqqqFx3brQ26gJSl0wJ2tXt8Angr9odh0Ysgo
	 Nka8sSSFj7o4m3Ohp/OvGeB4LMHQlYpN4IK+a5OmnQKr0+ZianT+2R6oIy6PQSnq6rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b="Y/7BXFDF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB9160A262C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB9160A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Y/7BXFDF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28190135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101360; cv=none;
        d=google.com; s=arc-20260327;
        b=QsC/HALd2bf6k6cdSB3sOPEPnL3cJiha/vx8fNokb7ZxW4Yk7+yuwbFpde1pirGkAa
         rXPHmA2lIrmZfNn2STKpum8SCefjCTeIp48PA621uLYm93fdm8eWClCQ0rDe1Q6Al56A
         XT0a5otdZqHGTQqUph3rtnRigI1PbzluAiBom3d0w//ph2PCezu5XGbW7seGwLgXu9Mf
         ducqeY0wjnP1JhfEVUtnhyRbMk4xU6Ac+/QVo/Maxkqw/QTm6ld4NI8EnHtQs3Ea5mFs
         e3CnSzjwi3f12hLpF2q48MqSEHrm9HVBX235ZXPhSXl1/3Fu5OSPx8+Qv+FqhRKcVoau
         3bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        fh=B2k6BHo/DYzhDj/PRky6wZShgkiEwDh4tt6ThUBEmcw=;
        b=WWtzeUZElSf6wEhy8PUpNhpu2/xNm+OUqXtk/tCYcJPQ31epDoeNNZDQQX5TWWNOpQ
         MlALj6FMUTYFxO5s1dEpzX5PjDpNEvyhqn6MMlQru7ePFjGCxEud/hfEU5UvL0GXFwr1
         /8lO5IdacsOt9HXXPaIHFkp9qKagqClDuF8oBYMeIBqzTe+6AifZnbDxtc53i5qeV8IZ
         hmqqkG+ALyd5JZL7GJK8VmU+B2yPcD22wzvB4RE9fm9VTgBBcnb/Z0RxuJOIIeRXrVP1
         aFMDPtIAXDlsrtQF8Ve3W7xeD8vehdH2iq3ReQXT3X6LhHssNowEJHk1QuISXgVQKpUr
         yyTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101360; x=1795706160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=Y/7BXFDFr1bGIG2x4Lt3VSrQn3Y0/QVTTrA2wo/fUw2iVbTA3APTCRfT40/2q2iQh7
         25IfsocTo667Lsc5CQV/KUBrDZWxk549Zk5Xx71LQOjHZJ43Q6xKkm/C9XGf6MvEvLvH
         lkPsAJv33Gw+AR8f2GypSHuUCb6NWUOkI1KEOvDtA6s5vpg7bX42AmFtXMyTLwuDlztC
         8ORuCyUXOwQGwzMQRpFTPg5s81btq5BuiFpaHHQ9rOF2I3w+gC/FZuUd58+tfa/CELJ5
         McZUFyE+11VnhhxJ7eD0whTebuSxSWbSIlExg3BsbCtiOY4E8XH/UrTfqgCc8YfBLR7p
         d35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101360; x=1795706160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=BBlF/o/Kf4mLMrCKZ8vhs4W5vtnj/WycQn8ZFCKUySGMo0c++GAW4KC6gMcLI366Gn
         ftCI0rvYoOzf+UtuSRPm2hG5O5i2P/NXiqYX63xOyP1KrUEVXmUT5qesRLrcuExGmxNR
         UbIlWD5SheqghtSsTZS/DigpsvhzOjte4bSik4KQ5hVYRgeBl0W2M8Uxdwq8hTvxujIF
         JxgfTqGKzUvunwDMJgAvUbPq/gtFDGyoSTq5dAaX6QQDdMH9hqGJIO/e1dQLLGNdX/yv
         NyA2SuvHRwRv7Lvq9KN15UyEFBgDXOr7RKqfLZKZ1Ai9AaNnsgXr+aIvHSoXPXIRlmcd
         /uVA==
X-Forwarded-Encrypted: i=1; AL+hErHqhnXS0UHaa8wzjkAuFSKDvlk97IZGY1TEaL/gFPSbrazyQQPHYl11VDi5AlqzQjDFUK1MkztcHLKiYSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CBGdMCgq71leSfgtEKVx0XUrYV01uPftjhZymEyKR4Nc+de4L
	lejdnfd451YSqSNBUSBEopFgyPXuD5816mtfXvyIlVdbLv5V/AG4RYCiIPnV4KEbTP57WzKOvoI
	92mIZi1l3LMC9V51C6C2vlKDVFcd4JRM/qsa3zbB8FQ==
X-Gm-Gg: AYBFou1JuIwjRmOpB8/RZPH50qaO3wKiEYCONXLUUGuWneoLWfNI5jouhPlOK9acAZe
	6GDoXaEUZLB9O0pQ2BxJUqj1ctocGfdrS6x7udijax3UOeYOGy6m7i5QEmR+PjwsJPI5hVLU592
	dwoH4Rv0SGW506hp2HqVdlObTObrxT3GB0PwAN20k++xs6PzZfVH7dFSaERtCookhVnzhvmEWdF
	bxwTqkgwnpPMZa6IfnzvgtmKwhdVXJhvRyoxs106tyDc4ZFUeQ7EOThgnC2h9r4FbAZ2/enLnp3
	Sm0RfvUDHLd/yE3j5uaizXuyKuEQDm2h3JUmQOd4VELKQaLSJHcIyKWLe1KKbhfOiusGxp0RZ5d
	RMl4iyqy4oP9II23pwhS46qnHRsVQRhZEa/d77y3fprgI1neZGWV7r0xd2QNqdJ0JlEUdjKbfGs
	ZMkGe+dXle8x6S60fOOM9SqAkfS/dYhGvsFoApg6c/g2Nh0SY9wXofFlPBsQRzDoyNmpqs4Q/G3
	MJM
X-Received: by 2002:a05:600c:c106:b0:4bb:87be:c138 with SMTP id
 5b1f17b1804b1-4bb87bec13fmr12856555e9.32.1795101360089; Thu, 19 Nov 2026
 07:16:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:45:48 +0530
X-Gm-Features: Aa3M54riNYPYm1hR-WMNehgnqK1cKsrsmx9wlvpLX0ldc8qDneAu48N6AszDino
Message-ID: <CAAhSdy1QdF3rA3bkKsdOe-pPV+JekgUeFB2LOirCTf3L_qjK_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> RISCV CTR extension supports a maximum depth of 256 last branch records.
> Currently remove_loops() can only process 127 entries at max. This leads
> to samples with more than 127 entries being skipped. This change simply
> updates the remove_loops() logic to be able to process 256 entries.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-2-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

I think you accidentally picked "Link:" and "Signed-off-by:" myself.
Please drop these lines from all patches.

Typically, the "Link:" and the following "Signed-off-by:" is added by
"b4 am -l -s" options so as a contributor don't use "-l -s" options
when using "b4 am".

> ---
>  tools/perf/util/machine.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index 076d167380f2..f1efd1120a95 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2334,25 +2334,32 @@ static void save_iterations(struct iterations *it=
er,
>                 iter->cycles +=3D be[i].flags.cycles;
>  }
>
> -#define CHASHSZ 127
> -#define CHASHBITS 7
> -#define NO_ENTRY 0xff
> +#define CHASHBITS 8
> +#define NO_ENTRY 0xffU
>
> -#define PERF_MAX_BRANCH_DEPTH 127
> +#define PERF_MAX_BRANCH_DEPTH 256
>
>  /* Remove loops. */
> +/* Note: Last entry (i=3D=3Dff) will never be checked against NO_ENTRY
> + * so it's safe to have an unsigned char array to process 256 entries
> + * without causing clash between last entry and NO_ENTRY value.
> + */
>  static int remove_loops(struct branch_entry *l, int nr,
>                         struct iterations *iter)
>  {
>         int i, j, off;
> -       unsigned char chash[CHASHSZ];
> +       unsigned char chash[PERF_MAX_BRANCH_DEPTH];
>
>         memset(chash, NO_ENTRY, sizeof(chash));
>
> -       BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
> +       BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
>
>         for (i =3D 0; i < nr; i++) {
> -               int h =3D hash_64(l[i].from, CHASHBITS) % CHASHSZ;
> +               /* Remainder division by PERF_MAX_BRANCH_DEPTH is not
> +                * needed as hash_64 will anyway limit the hash
> +                * to CHASHBITS
> +                */
> +               int h =3D hash_64(l[i].from, CHASHBITS);
>
>                 /* no collision handling for now */
>                 if (chash[h] =3D=3D NO_ENTRY) {
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
