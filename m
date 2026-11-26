Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795673683;
	b=hHD/eZ6Ju5dT6iTl0QbkwwvDjYXQvZH6rArEWxPfWA1J4IG2HndRo5WPvFh4IUrAZYG+
	 QI8EP5pxg+10SY3E9HELgS+c3TJPpiC5bNuTqiP9/PcaVlU/NVJ8yZKKX5AAfPWlC+er+
	 5wq4etQIY8kO6vbFnUvXAeoEGiOFEe5ozYh3rE2VdSsnn7N10kdBrEhCFvzoV/am80iri
	 u9L32N5j5oTvYelBsi5H2l2oVZKZd4ZpntDxHMNOIcB7uZN4s+bmx8GjGzHAuYVvf2hXC
	 j6WNteY80uNjtiFdZjRfzVIz0bBxYb1fzST0CQzSLiEwvXt9y7tqap5/DjdARYPu1qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mUxr52qRZC0dlONq/XcMJQeDMgSpZAsaaLlrj7GG4BU=;
	b=oXR9Gcw8XFB7JC0PS+OC21ZJrkZgT4b17KDUHUTIz8oOohLmo+VMGcy8HLVgRoaPLrFY
	 3v0iC6nvDNgHtSECEYD3t0SWoRHfPeojYXn/QqbhDVEOyCLFO79edL+2JnGl/erg6+RLH
	 rJN9PMU//ZYXd6gV5w53EDCC/pOiVC+vGTB4mHDFPwde629CA/DUcP4P82fAHHuIzbffj
	 aqHNPOBfMkL/U9NJmng+WPRnpbHaANc4YsoymGoGqLuh2SjgwRua5r0sgCeMRNNvEuRvD
	 hRCO1Bx1/oGyoINCk5FI8D8A8bzEvnfvkBdVMeezRgD6nXdHgFAQB2m1GQU05jwNYSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KZG/mCR/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1490606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1490606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZG/mCR/
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55c4e670fc6so51700741cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795673682; cv=none;
        d=google.com; s=arc-20260327;
        b=B4LaTF5Y2GWYb9sd1vt65tIpCejELzTBdftcS+2itLb3PVnZfvwZDt4BBTp1yEeLAP
         z1dfc0sQfEqKPPnvrRhUH22M58lxhcq98soE57OT+boq4G2JEbZG2iY1UoNRoslHJ1eZ
         vfcot+GSiaIBCKZTrE3R2YoVCo7LEu1ZvrgxpP6xfXw1qFpRQQeoCp2D6wp7vX0Qmw/K
         RyzJW0AoAHES2vKEJisLxf0WFnT2XHdiYwtw80rX0gnTDVjE1Nx/APE7Bj6hDjQpCJsg
         tW/w/GSa2RxfM0s0vy07nJ8qo+Fdr1qIPjEdc9lDSVPVDUT4OEI80gb4rNmco7BCfoQ/
         v3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mUxr52qRZC0dlONq/XcMJQeDMgSpZAsaaLlrj7GG4BU=;
        fh=VL6wi/CynjBzNkPlWO/oc7wfAOHb8jBifGidsI+I9Xw=;
        b=ZK1BYpy7LztTnwTNfo8JO+1pkjkI+/HVQrWwJCuxIqEQMh6s6LCW5B/kxVbd8Zcb1z
         l6kFb33XcuMtgLqWypq6ou3S/3vKbaTLBmacqQG5eO1d0gJhTk9vgMj5EabfcGLUn2+c
         nxDaEW60QnK1Eqoxskc7rTfezUvDFJWsZ1wHZzFr8x20/RmRdrMQC6bv0nOHOED7QFQ8
         WMagqb6Q6xOKvX5pVThSsVeL7NGpLQqR+9/ygewTJdf8AGb3GmtILXK8vFk0kkGR3S3N
         Yl5Tg7kDK0GqZD8ahfovHMGAcgO7uBwUvvfJcKNzKNy9q5AJR8LJ7Jc6Pdp2ivztEWqq
         bxWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673682; x=1796278482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mUxr52qRZC0dlONq/XcMJQeDMgSpZAsaaLlrj7GG4BU=;
        b=KZG/mCR/6TjmN7B6AxcnQxGiT+DQNKv6+vrcj4AVehfzDV5wiHupOBRTOsJpKAM9cY
         811W/c+zxQK8iSVzpZyYCK6ibP2YJvSM78G+1hv7pe7k7sOrlLTT1GoNuGgzKcASUByl
         V6SoHMOTINXkxpftj8STkPqfsPQKyyGvH1Hf0mFxZ3i8+h3hp7LaB/n8aOPd0Jz+adi3
         HsNKzRyfevs/64ZJHdRTJUw1G6+ZerezBLf7oyaXNIRH6+Eo/lG1qdZXUdVOScCt8kNf
         LxYH0YfS6cv8+lVvPT5GY8sK+yBTBnkUTCa5oq2kqkGsq+hyl8EqlylfdkD5IeVInFw/
         iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673682; x=1796278482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUxr52qRZC0dlONq/XcMJQeDMgSpZAsaaLlrj7GG4BU=;
        b=kj6VbP80pVQg/i5GMZeFooO7fpkdZmOpwD467RGojXgq/0LJvdIFnMWL6dJwnJvyw9
         pKM2nb5Cp6A93fAJv30+b1NMvpduz0cJr+Xn4n4zgC/gXHhIdfKXCDp57ICC1WCJTJIi
         DDzMqoERYrGW3KhP9ZVu01z8mgCSMb4iBO90/01ihMWc0/2tQ1YUt+x8slG6cK1NMhta
         tJwfrPVXKcK7nYE0N6B2IUXxMVv06bRRa0OGED8sWUFmNmxi/h0jh5QyPR3/EtL3KGgl
         Yjul7tzAWh+AJHLOsBn4HEBy7OtYq/DoAIrvAGw7cU4+tFaXS1lEoQ7ez+QyyNU19WBg
         W8iQ==
X-Forwarded-Encrypted: i=1; AL+hErG+rVhlTXFzBM6JIIOrD3fPB+xsyWbvXSFlluS6/wYD3TcWCArWq2mI2x8oybpIPl5VjOqtYcHDWboZYhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3OF87PMpztXv2yHRsyHtEFttrNRDuTuHgjCPs8cPZXpHg/G/B
	oRF5IBC3kdjVJ4DB87mo8dnxitlQeTdR5M4YpIszhviNeQ+/TCar0UUKtKsIZVfHAaos0vFcUYl
	G+YJlEO8UJLBp8ye7eoFxRSvgoYTIB1c=
X-Gm-Gg: AZFdTZd6N/DWOut9CZ+hswPNazot1ft1giWawa6dFzoQ+GWqox/nlEYVgGCmRU3TSq4
	uMR2Ibd50dOTTidatMj1XVIKk/NbdSUoZ24hQx/y6RGfFRuEGv73FIaJ6gKvf2wpQOaxqOqTh9N
	AwOlE6Ey50H8CrKzxJgi/QpfG2pw+Wx6ntbffIfylBCzgNG9OpZzFejlKDGkcxlFRbCVy9HSdBY
	5dhuKcnPoh0o4qenARkNBh89ZfpR6mHPkxtD9LEQTe7NR7omt3YA4yMdZnWmcTLVnnbQyFa3a5s
	XRS7TY7/9RODdXbJ152GvaueTX2ndEhQbx2d9apPRlNDicAXC9MyertVETrKTqv9UYwvb2HSpie
	TPZv6zYMBqtHFgtYPh2IVRQSRziKDZkRxRhZWcQ==
X-Received: by 2002:a05:622a:5a1b:b0:535:384d:68ac with SMTP id
 d75a77b69052e-55d769e9f2bmr361688051cf.13.1795673681848; Wed, 25 Nov 2026
 22:14:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126055600.23172-1-artem122novak@gmail.com> <20261126060548.24746-1-artem122novak@gmail.com>
In-Reply-To: <20261126060548.24746-1-artem122novak@gmail.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Thu, 26 Nov 2026 00:14:30 -0600
X-Gm-Features: Aa3M54orCCMbRnFNTpSX_xCfn6m-xkAlUWoqql4WGvtI_DqQ-BUz3LNBOOon_yc
Message-ID: <CAPufuhZZ=VS0FsrxkK=Ba1kJot3Fp5TS5dxKUWs2o8TAotRdXw@mail.gmail.com>
Subject: Re: [PATCH v2] crypto: tcrypt: avoid 32-bit overflow in throughput calculation
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the confusion in v1.

I accidentally included the two Fixes: tags below.
On Wed, Nov 25, 2026 at 11:56=E2=80=AFPM Artem Novak <artem122novak@gmail.c=
om> wrote:
>> Fixes: fdaeb224e2bf ("crypto: tcrypt - Use pr_cont to print test results=
")
>> Fixes: 3e3dc25fe7d5 ("crypto: Resolve shadow warnings")
(they belong to other work),
which refer to unrelated changes rather than the commit that introduced the=
 bug;
I've corrected this in v2.

Best regards,
Artem

On Thu, Nov 26, 2026 at 12:05=E2=80=AFAM Artem Novak <artem122novak@gmail.c=
om> wrote:
>
> Cast bcount to u64 before multiplying by blen to prevent 32-bit
> overflow when calculating throughput on 32-bit architectures.
>
> Fixes: beb63da739f7 ("crypto: tcrypt - Add speed tests for async hashing"=
)
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  crypto/tcrypt.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
> index e6834bdde9b9..1e6132045c24 100644
> --- a/crypto/tcrypt.c
> +++ b/crypto/tcrypt.c
> @@ -28,6 +28,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/scatterlist.h>
> @@ -734,6 +735,7 @@ static int test_ahash_jiffies_digest(struct tcrypt_ah=
ash_request *treq,
>  {
>         struct ahash_request *req =3D treq->req;
>         unsigned long start, end;
> +       u64 bytes;
>         int bcount;
>         int ret;
>
> @@ -744,8 +746,9 @@ static int test_ahash_jiffies_digest(struct tcrypt_ah=
ash_request *treq,
>                         return ret;
>         }
>
> -       pr_cont("%6u opers/sec, %9lu bytes/sec\n",
> -               bcount / secs, ((long)bcount * blen) / secs);
> +       bytes =3D div_u64((u64)bcount * blen, secs);
> +       pr_cont("%6u opers/sec, %9llu bytes/sec\n",
> +               bcount / secs, (unsigned long long)bytes);
>
>         return 0;
>  }
> @@ -755,6 +758,7 @@ static int test_ahash_jiffies(struct tcrypt_ahash_req=
uest *treq, int blen,
>  {
>         struct ahash_request *req =3D treq->req;
>         unsigned long start, end;
> +       u64 bytes;
>         int bcount, pcount;
>         int ret;
>
> @@ -777,8 +781,9 @@ static int test_ahash_jiffies(struct tcrypt_ahash_req=
uest *treq, int blen,
>                         return ret;
>         }
>
> -       pr_cont("%6u opers/sec, %9lu bytes/sec\n",
> -               bcount / secs, ((long)bcount * blen) / secs);
> +       bytes =3D div_u64((u64)bcount * blen, secs);
> +       pr_cont("%6u opers/sec, %9llu bytes/sec\n",
> +               bcount / secs, (unsigned long long)bytes);
>
>         return 0;
>  }
> --
> 2.56.1
>
