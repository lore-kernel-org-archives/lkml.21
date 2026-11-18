Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795015857;
	b=O4OkWguK7LEpbTV/SCBA19Zl97cg/dodGgmUxdjVgMPQRT+I37ZaKsRoWx7wdDcTD8Yg
	 unKTBddxUioLaXlAvt9sWnTE2fjJ9qWNzklZ3GMjG5U0sP2bc8pLf9/io/qZGSPEfvjwt
	 gi1vVHnoVUJpFW2/57X9QOrL0QYZ6L12sIt1y85WydyVIl67J5mioBKeAg1aNmTSiDMzj
	 Nit8I2rGlhHy05tqb4CMeK77IJ6G9HiDwp37gGWpEDXj+7zmOJ9aDky4YyAXxuMQaTEv7
	 sv5dmzM6kILK+87wCgzqwVtUAruhr5YY15OMxWyyt0XdnstObqTONPmaIloGdrpPkYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+Xz1C017ymLO9hgq7KEyWm6sW1MShiwQwE7JYVF8fkA=;
	b=bNlhCprWADG6BPbFL6VynoQDVip/0xzW6Ya3W/QyTnQox6s2pBMAayqPjaD68dzHnAGU
	 z8NhTV3drnkuL2jdd8xmqQEn4Ha2CbTnMNodxXODY3b60t41v7B3K8lRtXYDL7B+hKEll
	 wnbYZXz3QH/3Z71SBrifnXpPKEYaSsdN7PkSoTB2AJ5cwuUMPHD4YFVDjXrTuJuqzci22
	 NMWJy9limtSxppxIhgtubreHQ/cIEvzKQGVaMRLfgTtqM6El1MEiQCQKphAle5UZRVWHA
	 XZHc1W5Tuy9w+nD9opOLTK65ntzhfMwY7QZyHp/sScxk8xdzLD4VYg7XPEvMpZICWJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="au7k/hmt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEB60A263E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BEB60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=au7k/hmt
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67921b515a7so1132064d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795015856; cv=none;
        d=google.com; s=arc-20260327;
        b=fAESGgt+Adc2ft5l7+E72tVQI0Dex+Mb70YFiThYp9GBl+8J7+1106dpItpGym4Qex
         svyC9tOSp+83kZOcCp6KDpJ0mvBu3Rz9qXGz/8XmEYFYfeKeWEwYi9PxI5t4Eg4tHyld
         3hj0I2LNiBRh7hAekmuDk/MBo5LQv7k1yBkNZgG0mhvtXMX87qYfl47UZ4OgoxxfHo9D
         aXNGK1czNTnYYZc9dWmUCOKlt8WT8NKqk7lry4D8V+Vp9Dep7dq7yAKUpc+4hjLzF+yU
         UedX/8vWu8J1chA7fB83lxXWHJJWfNgINPj+6a59WUwvxzCExc6pBGnN31ey0UNcSKXH
         cL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Xz1C017ymLO9hgq7KEyWm6sW1MShiwQwE7JYVF8fkA=;
        fh=je7K/diSt8Wn46c6UQrBj3wvRlRUslhd9FdK7vaNqhs=;
        b=MrJzTtyksY9AwrsDiXPVsMmmm9Kd2V4kSv6BawOCK1RiMBt4h5rYK0cdvrHqmw6Ybs
         IsXppmPJJkgMRiG7KtZErenCvVmJUOvAQQLrpoFbWLawsHjwjbkgPw03748qBdnRGz7D
         93WauWr+8KA/w3neP2zF5Obs3lBIzO4Pqvf6u+qeo8J/g4pwqMuGSIkcK4f5Mzb5JaER
         ywapQq6in2EV96MlVdCAZ3t07rVgHIyKEGfNFjGRcPx3h97Ykbs6Q7l16U+HQF42S8Mp
         /B8Gx1d3pDrWh1Ff9nhnsEgQcBxZpFbxM9hjq1c9BV0/RZItMCPIleZn1einDP67mfRi
         baBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015856; x=1795620656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Xz1C017ymLO9hgq7KEyWm6sW1MShiwQwE7JYVF8fkA=;
        b=au7k/hmt3dNcQJeuLnCasKnnvRlLwmTOljKeyMLlzjM1GHNcKu194NrxiYCGiFF0mj
         78g5ZaJ8PS0yjW/GGTRzL7DsNrASwAJ50Eoida5AVRX6cewpV3B346sQHpymdAVX4x7j
         Ay+XQdoDDgNTw7zSVXorw/kbJPIJShLp4YAyTY7y0n6W9iM7mLKrXBYABXqSn2Z/GxLj
         qf24Ztnts9fi5Yvd0pF+QO1CV2LirTUVaV5kPG7iV/6pvV6k40bmxPNHJqltpCbu340M
         vW5MBMzJCo6h9+92WlJC09s1wowqvSinedQ/x3pOg08iJvjZjhSwcB32pyLUYv21s75g
         zZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015856; x=1795620656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Xz1C017ymLO9hgq7KEyWm6sW1MShiwQwE7JYVF8fkA=;
        b=VxKKnHWlGYwX9qFbgB2LTK6lADW0nU/PaiQoX9NzNPWiApCdNCC/uKAQQg9w6StDP3
         Ql7tPkn288iabRs8JNS4h77o1Kzn9wMhKRRcUFwWdOAEL57nqR6JJutiiMHBplzL1sdz
         PrAB5fqGvX9yuFUWP/gFLR1s1Ci23loot/DqhL+HdfIxm/1ZaVc64CvvtcQPz5n6krLT
         FrWzxLplLXgtQ8+Sr8nT9IayoS+ycIUBjDS5c9gDHS9vMHgGdvRgtsJB/GoOnNHcZ0up
         vs/03c0lGuThHjj5lnCegl0sCn5hEIHQPDlHJY6yJk25JR8ElSWpSajNcZ15U4IIgnQ9
         g3Yg==
X-Forwarded-Encrypted: i=1; AL+hErFbITYMlfhrU78y8XliHsLbC/VWKkIPEDJtadVe+VqbtJxOVR+dB9erWIE24tzEDyHr8jnphU++ZFJ582g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vcCoKun7mJqzZQMzYdAjA0cqv50Zb87qYJI0jarqZdSsZVdqn
	fdZC8awvn2qQRvhKgRYUq5bs2h0ttyXwq5h6J1RdZPMdcxmRiH4e/Dt30E3J2VBsZkqEZR/AKHI
	Y6yIvPVdqihce8yUx8vf+CjUZih//scs=
X-Gm-Gg: AZFdTZev+L4JVaQJnUPSXtbbWyj8bnoVE7FuZq/C9gVtIIfzV6C35UH9JVbeBKfwBYR
	G/Ilaocf8+n3FoCnNrtmvfeAwX247WA7+SYyeHfRndngU7SBSN4jjuOhupXArVCtQnn4W50mrZo
	6H0n0tOyrTOLAeM+j1Uet0lZOQgmc358CzLG9ca2YYW9neJYJkK6dKnJtDABSVInOhCol/dCTZQ
	eQEOI9CMJ+uE5dK7szIJbXNlqK1IyzApI6QY4qC6jR2iiGQ3dCBo5tMsufwAGmjPehQItM4SjiO
	bj9yEvCXke8V0cAotOPPmdNNORlsr1ViUzVC4sA2bgh3vp1sxTRtMDVje58RxWCImBLl4c89PcZ
	dqspJNFl+HILqHkHFd+ws3fH8dDidMgoDc0ds5Uu90SV9xg6rpW/01IfKOQAPBAHINxLY8BpNH9
	OzygxA40XdZnLM
X-Received: by 2002:a05:690e:439b:b0:67d:baf9:1177 with SMTP id
 956f58d0204a3-67dd3fd1358mr759846d50.92.1795015855865; Wed, 18 Nov 2026
 07:30:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-lklm-sysctl-jiffie-ms-conv-v1-1-bb60e5101418@kernel.org>
In-Reply-To: <20261118-lklm-sysctl-jiffie-ms-conv-v1-1-bb60e5101418@kernel.org>
From: Avi <thnkslprpt@gmail.com>
Date: Wed, 18 Nov 2026 17:30:18 +0200
X-Gm-Features: AclHuK9DRL_s0-U3TWLYfTvqu_BtkWemOXrNvLU1rSt43oTwN_qLP_s8-uU_9Ho
Message-ID: <CA+jvY9F5TYcaa4FfWgTAAyunbbJ7R5+11OrZS4c2h9WXbu06Hg@mail.gmail.com>
Subject: Re: [PATCH] sysctl: Do jiffy / ms conversion in ulong space
To: Joel Granados <joel.granados@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Look sensible Joel - thanks.

On Wed, Nov 18, 2026 at 3:45=E2=80=AFPM Joel Granados <joel.granados@kernel=
.org> wrote:
>
> Replace jiffies_to_msecs & msecs_to_jiffies calls with sysctl specific
> converters. Removes the need to handle overflow corner cases when moving
> to and from the unsigned int and the unsigned long spaces.
>
> Handle the unsigned long overflow in the sysctl specific converters
> (sysctl_jiffies_to_msecs & sysctl_msecs_to_jiffies). The unsigned int
> overflow is handled in the generic sysctl int converters (e.g.
> proc_int_u2k_conv_uop).
>
> Round up on writes and down on reads for both unsigned int and unsigned
> long types.
>
> This is the behavior being fixed:
>
> SUL=3D"/proc/sys/net/rxrpc/idle_conn_fast_expiry"
> SSI=3D"/proc/sys/debug/test_sysctl/int_ms_jiffies"
>
> 1. Before
>     # HZ =3D 300, CONFIG_TEST_SYSCTL=3Dy & CONFIG_AF_RXRPC=3Dy
>     echo 1 > $SSI; cat $SSI           # -> 4
>     echo 4 > $SSI; cat $SSI           # -> 7
>     echo 7 > $SSI; cat $SSI           # -> 10
>     echo 10 > $SSI; cat $SSI          # -> 10
>
>     echo 4 > $SUL; cat $SUL           # -> 3
>     echo 3 > $SUL; cat $SUL           # echo: write error: Invalid argume=
nt
>
>     # HZ =3D 100, CONFIG_TEST_SYSCTL=3Dy & CONFIG_AF_RXRPC=3Dy
>     echo 2147483648 > $SUL; cat $SUL  # -> 4294967276
>     echo 5000000000 > $SUL; cat $SUL  # -> 4294967276
>
> 2. Now
>     # HZ =3D 300, CONFIG_TEST_SYSCTL=3Dy & CONFIG_AF_RXRPC=3Dy
>     echo 1 > $SSI; cat $SSI           # -> 3
>     echo 3 > $SSI; cat $SSI           # -> 3
>     echo 4 > $SSI; cat $SSI           # -> 6
>     echo 6 > $SSI; cat $SSI           # -> 6
>     echo 7 > $SSI; cat $SSI           # -> 10
>     echo 10 > $SSI; cat $SSI          # -> 10
>
>     echo 4 > $SUL; cat $SUL           # -> 6
>     echo 6 > $SUL; cat $SUL           # -> 6
>
>     # HZ =3D 100, CONFIG_TEST_SYSCTL=3Dy & CONFIG_AF_RXRPC=3Dy
>     echo 2147483648 > $SUL; cat $SUL  # -> 2147483650
>     echo 5000000000 > $SUL; cat $SUL  # -> 5000000000
>
> Fixes: afdf35cfae0d ("sysctl: Fix type truncation in sysctl_msec_to_jiffi=
es")
> Fixes: b96b5c6708ea ("sysctl: Replace do_proc_do{int,ulong,uint}vec with =
do_proc_vec")
>
> Reported-by: Avi Weiss <thnkslprpt@gmail.com>
> Link: https://lore.kernel.org/all/20261102111516.1398262-2-thnkslprpt@gma=
il.com
> Signed-off-by: Joel Granados <joel.granados@kernel.org>
> ---
> Avi:
>
> This is how it will be upstreamed. In case you have any opinions.
>
> Best
> ---
>  kernel/time/jiffies.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/time/jiffies.c b/kernel/time/jiffies.c
> index af1c69bf0c23dbcf1788e951dd9872167388bd1c..b861dc860d3452b59868128ec=
83340eab9e18a39 100644
> --- a/kernel/time/jiffies.c
> +++ b/kernel/time/jiffies.c
> @@ -137,11 +137,19 @@ static int sysctl_k2u_int_conv_userhz(bool *negp, u=
long *u_ptr, const int *k_ptr
>         return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_t=
o_clock_t);
>  }
>
> +/*
> + * Calc ms <-> jiffies conversions for sysctls in unsigned long arithmet=
ic.
> + * Think hard about using the non-sysctl converters (msecs_to_jiffies &
> + * jiffies_to_msecs) as the interaction between ulong and uint is not tr=
ivial.
> + */
>  static ulong sysctl_msecs_to_jiffies(const ulong val)
>  {
> -       if (val > jiffies_to_msecs(MAX_JIFFY_OFFSET))
> -               return MAX_JIFFY_OFFSET;
> -       return msecs_to_jiffies(val);
> +       ulong secs =3D val / MSEC_PER_SEC;
> +
> +       if (secs >=3D ULONG_MAX / HZ)
> +               return ULONG_MAX;
> +
> +       return secs * HZ + DIV_ROUND_UP((val % MSEC_PER_SEC) * HZ, MSEC_P=
ER_SEC);
>  }
>
>  static int sysctl_u2k_int_conv_ms(const bool *negp, const ulong *u_ptr, =
int *k_ptr)
> @@ -151,7 +159,12 @@ static int sysctl_u2k_int_conv_ms(const bool *negp, =
const ulong *u_ptr, int *k_p
>
>  static ulong sysctl_jiffies_to_msecs(const ulong val)
>  {
> -       return jiffies_to_msecs(val);
> +       ulong secs =3D val / HZ;
> +
> +       if (secs >=3D ULONG_MAX / MSEC_PER_SEC)
> +               return ULONG_MAX;
> +
> +       return secs * MSEC_PER_SEC + (val % HZ) * MSEC_PER_SEC / HZ;
>  }
>
>  static int sysctl_k2u_int_conv_ms(bool *negp, ulong *u_ptr, const int *k=
_ptr)
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261118-lklm-sysctl-jiffie-ms-conv-708b96e4590e
>
> Best regards,
> --
> Joel Granados <joel.granados@kernel.org>
>
>
