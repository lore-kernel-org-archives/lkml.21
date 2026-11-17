Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946275;
	b=aHK/lCYstgWfRmVySh/h0LT4UlFWyO+eTMPXmNxiJNBpXoJb699WThEj3+4y6jvyz01e
	 M/btCLV8Uhrf3UjUXE2gdQztWxWmwcTDrmQcReBbDxPMEUMU1/C0hl+XwNZFJD/snPnPN
	 M8bZF/aUgulWS2C1Ub43rf4p6MZgIWZAUdyVGEgucURUyhAYShTrvhRjVZuTBjYJooxo1
	 BQUyXtccuCjqeoMV4o8wZ8hP8KLANSqGGfkGoWWRMPncqLhBxIQL47k0QxzbrVU3iOUTt
	 Ojvf4q330gAyo1FgkPFNOwfvRfZGWGMjoIX06nQNkrIY286q+WorF3ZCScnuCJsmIBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
	b=Hn3CH88X6QeHR4P2hHqtd7zG3kuW9ppArOGzZRw/Hbbw1KwaFbDjbYm14a9m7CJ9nlBs
	 1wgR5CachTSLq4eqrfmRC6ZL6p9GqUHgYc+vbRSTQ9QtZzqmDHLOsu4AAzczvTrbhE88B
	 nFRreck4lUvJTNjUtwcgGIZ3355T2LK7nc+rkLACCGWjZu4luavMEmN7RiHqABlbDNr/3
	 BztXs7V8yotLXnzcYYb+3L+mOOjb3H679Q4hKbxTGi5uhuHPwPVaP/nFE7x0RYWOuIfi8
	 16xB3Jy5RMVzNDcmQp0hKw7WIhcmW5T+/Xtcr72OP0KrqMH86C0GKcGh8BlqWEIb6Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qUYi/5Le";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067DA606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 067DA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUYi/5Le
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so491222a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946273; cv=none;
        d=google.com; s=arc-20260327;
        b=aJ7YHMKu23G2YO/OZMAKrDJVGDOwln+pn6vtofbbg1TEC/x8nRzAl/qSfAHglA9VOd
         n4JH/8GVJI2O6gRpKrPzpmYMtUkljd1s4KoigOjLnrHbB8Z++djzp2CTMt/5qnLxIC7y
         pPO2wbEtMzhoQgJGZ6nkGMyt4vFAch3REOhEyO2ntjBsF4ESv6kyJzFhmQs9o9Dt9pXf
         pBUvrEKzDTFMbSyoUNAWht9j7/FRGb/oIPgYhITQ8L4q/PfJ4D/TrUcNhDwLk7izDQmA
         mTS9JL6zmDuDZNmwgRQ5/LR7nJYSp/JvKU3FS7U9fzZ7owoycGQ0rbUmxLRzKihoqUWx
         fiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        fh=DAaWMAuPSkDVRKFnok8/3qwr+Tyb8Av5gkcHsriARos=;
        b=R0TsFqBDi2Rszk5VIhUyo7jnf6h+QLVslmsoTTg7DbT48xr+w/H2g79hP9KW9AKUeY
         KmOf+IpUZK55DusgNYSr5Omk+7Mul7Ql19esm0puNkLKuw7X5NOksUBgL94X62W2MI2p
         cq0qGbF6f4Y37bZWurohKcdtS5omrw67ZLBXUPG6V2DjpsJ7Tdv3PhlAD2gZD8Fwo0Dn
         aSBAJrOnGVi+R2PEMxWH3oDCBAiGgRdeZg/S5YZNBEumsUqT/RWeZUXR742tYirhK+fT
         gYkQLMbT1SyfNqXcqPc58cpCn7SbhcDzeFKVj8PTsIBr42ZEqsalZR6XIpGAazEza3kl
         An4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946273; x=1795551073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=qUYi/5LegcyQhwlyDIHJSec0Wq3K+2MDjMtllRf2GD5+J5Uig/9eXAdGiQqKo8/rkQ
         UZY0yqFZJmXO5C+fY26YLqJTbicpoAFPaJne0z8tdr73jeA/O2peN0eoZQcjhpUXqVvW
         tAguCwDvHD48dKuWDUvRTubsfVcr5EjJrOWnWZ/j5/NTQVb87KZo5z9P8J1rVPZL7Y1c
         HhM6ygFFx0bpOQOkzjfHIHOd/Wp8IxoLnVzNadw9xrLc0YiACFGTCSdIxM2ydYHCOQ0A
         4Ikl7srSRBUzfzX30kFmwKpbgGeBSk4v5zhjeQwEF8VcqpIO+zaYvtltHJ2V41XuVmtM
         Xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946273; x=1795551073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=MG2Gdss6v+6ofQTxBeeAi3luOGjQKi1exJpjgI8SNZMeZWegyMKm0Hr+SLcxm5tqzC
         /LvGN8zD8RFFYVEOn/QOyCen1fK39m+sdDrvQGQM84dBoPDKusskzf1Z1NA4y/LpRyet
         SAKaBgmCiZpTPZv4foDdvcyDU1F0EQQiWW35vHmh2fMfyHxqHVp2gxKhpfxorMmoS3mG
         sddqI3ZpWgto18eLTAiT/8bAMh5pu2MOw19EvrwGlWdb5Jv0QQceic8I287Owg5B0dfN
         aZbhZPXKNd/1qzkVOe/ubAgBvCjnDnnX3MRVHSpUp9xZX4aPhRcj7eAeKwsZQNswARBo
         8JLQ==
X-Forwarded-Encrypted: i=1; AL+hErEgHVcs2BdMyqnZpu21AdlDzqZQA5VlS1BAPyjwRwB0nF2IXHHJrRdviTSNQaASIDACG2XLby+d+YYSgx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Za3tYk2+mOgAnG0zkYwlDIPw6Exd+Lxlg2aoo3fvTHcYheCAL
	22iIfcMN+t2r3ZyE1HN1LUTITKxERt0/QM+XYr2C54jizR5ie0rdQZrXdaCY7ieVWJASQrC2d1W
	vkFbN+0TY1URNCjmIyr2ortSfZJDws+4=
X-Gm-Gg: AYBFou2adBVAOyveRdCcE6WHZ7gptNKFrT5xa8H87d9Yc+k5X98iN9VcBxNRBH5FrV9
	/hgHLy2xmnEW+odW+oK+y2QGt2BCJvgd2z20oZnnVjoDnRrMnHP0SV3A9wjuqMH72XUEY3tT1rq
	+DNHr1fKZ0iVqD+kLc8C+EJYG0W0siDP1yOTgo+FO7OVdnYGbflZ/HbR2g9p3zUxkWhl3AF/FfE
	A3bsN4+skp3QIgmmQCoaj58MDYjR8WDrcEAvN0ZVyQ9RN6gmBDWB+a4wMRJmAoG/wmcD+Ha81GH
	Pohvg7+oOPNJAVxJtYklHYjhLlKRGqy1RJj5IaoPOF3WK3tqEWEL1kc2lN0ofWzJcw6YlP+2dSi
	gBaZvAmsceE9pVHRvIgUVSp1G5ihZfxj4DaERsOp1aUCrYLL2XSucx9CXOfJN8Jjaq8BWzSHjm8
	7iCpCpF3Swx6WNgWttyKZXezNb
X-Received: by 2002:a05:6402:1598:b0:6b7:164a:7228 with SMTP id
 4fb4d7f45d1cf-6b888111f83mr296086a12.41.1794946273014; Tue, 17 Nov 2026
 12:11:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com> <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 21:11:01 +0100
X-Gm-Features: AclHuK_Xa5-PlkYMr0Ybe8c0xscp1fzE_6udpNRIkvpkKayBgek5aLFyZAumq5Y
Message-ID: <CA+=Fv5SFdf9Gr0zTGXJSW0GVB0eFoyp4a6PCWQ4PY2q3LGZTcw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] alpha: marvel: fix the environmental subpacket layout
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 7:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
>  arch/alpha/kernel/err_marvel.c   | 30 +++++++++++++++++++-----------
>  2 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/er=
r_ev7.h
> index ab17e6333764..5d30af0221fb 100644
> --- a/arch/alpha/include/asm/err_ev7.h
> +++ b/arch/alpha/include/asm/err_ev7.h
> @@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
>   *        class PAL (14), type POWER_SUPPLY (14)
>   *        class PAL (14), type LAN (15)
>   *        class PAL (14), type HOT_PLUG (16)
> + *
> + * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packe=
t.
>   */
>  struct ev7_pal_environmental_subpacket {
>         u16 cabinet;
>         u16 drawer;
>         u16 reserved1[2];
> -       u8 module_type;
> -       u8 unit_id;             /* unit reporting condition */
> -       u8 reserved2;
> -       u8 condition;           /* condition reported       */
> +       u16 pe;
> +       u16 sensor;
> +       u16 reserved2;
> +       u16 state;              /* EV7_ENV_STATE_* */
>  };
>
> +#define EV7_ENV_STATE_OK       0
> +#define EV7_ENV_STATE_WARNING  1
> +#define EV7_ENV_STATE_FAULT    2
> +#define EV7_ENV_STATE_UNKNOWN  0xfffe
> +#define EV7_ENV_STATE_REMOVED  0xffff
> +
>  /*
>   * Convert environmental type to index
>   */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index c0c0ccefc467..9304ae74877d 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,21 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
> +#ifdef CONFIG_VERBOSE_MCHECK
> +static const char *
> +marvel_env_state(u16 state)
> +{
> +       switch (state) {
> +       case EV7_ENV_STATE_OK:          return "ok";
> +       case EV7_ENV_STATE_WARNING:     return "warning";
> +       case EV7_ENV_STATE_FAULT:       return "fault";
> +       case EV7_ENV_STATE_UNKNOWN:     return "unknown";
> +       case EV7_ENV_STATE_REMOVED:     return "removed";
> +       default:                        return "unrecognized";
> +       }
> +}
> +#endif /* CONFIG_VERBOSE_MCHECK */
> +
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +65,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
ubpackets)
>                 if (!env)
>                         continue;
>
> -               printk("%s**%s event (cabinet %d, drawer %d)\n",
> -                      err_print_prefix,
> -                      ev_packets[i].name,
> -                      env->cabinet,
> -                      env->drawer);
> -               printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
> -                      "Condition 0x%x\n",
> -                      err_print_prefix,
> -                      env->module_type,
> -                      env->unit_id,
> -                      env->condition);
> +               printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %=
u, state %#x)\n",
> +                      err_print_prefix, ev_packets[i].name,
> +                      marvel_env_state(env->state), env->cabinet,
> +                      env->drawer, env->pe, env->sensor, env->state);
>         }
>  #endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
> --
> 2.56.1
>

Thanks, this builds on its own now with VERBOSE_MCHECK=3Dn.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
