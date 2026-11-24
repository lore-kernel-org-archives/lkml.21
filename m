Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556820;
	b=F7blIMpHz6ZenZM1ftw6dT6h9KVeQHo+dkD+FK4sSwAGOy+BnaDLiRYQH/bwLhYs/TI2
	 W2EkNzoslVVl/5UlTNHueMnoQEanRl+W5343MqMxAOLII2e1Scg4DL70/pOR0Shz/1kSn
	 lKnOORuXt9XiHtRFguEC24TS3Duni2ToxfEkzfnZ/6z0zVKhE2KQqG5R2JNmJ+vPp5ywH
	 c+CIa9niC6Br/9pEGzVpbKteANcR2C/19OU/Cis5uK5rVe1AViz2m/PkskIM26KQRVVcu
	 5jLaxPegIXC8E9Dz+LrhG9BgZIY5A35GfXwJ/yg0SSq8LjI5c4q15YZXvwVL0CcYGfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FGbzPrH+xJoIPLYXvjSmWetHWVVd093lv1v7NFu6vPo=;
	b=Hww9tMv9YRka2EsZlJpWzsr6RDORz5kVtK7M10oS5G0y2XBVK3ZL7ak1/co+3qY907gu
	 Vb3bbdInrCwp5HAebYcqde6w57HY8VRrqC9ZdpsQ6jUW9MtwuiZSSABMVEL9iK4YcVHxH
	 ajjSfVBbNawBhL6+iHX8eTY/MInveGrbpuUa2KDIirw3QpOdZQzHAEa4tHKNxVPlH7dkV
	 qkuuJ6frScilyd7Q/nirdT+ZLH6+97NVa3yrpEE9nOkX0893XrIJjImOyMGwxV4jqrlK+
	 OVh6Z1wEC7U4eGi+nzhao6AY/hmrHNqNGRvD3xJLWgi1m9Vuj9WDBbolIWNqxu9Zt3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=StA1JVy9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E20606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=StA1JVy9
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e7fc8265aso60065046d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556818; cv=none;
        d=google.com; s=arc-20260327;
        b=QwB7694MLEKKXahGABXSWS60uCWKuk1347c/w665WvXwrU+/qaa3s7CywOkn71XVmB
         bNERHVh/UA4w2tEf4xlyYP6GauimAJbB3UZf8TJWQVZLEeXuKCkIj9s46o6gtrV8roI3
         FGaugqgD6Qho+CgW2fcI06GdaSjJQI681tO8FzUkHs4ZcZolwBTwZiZHVOwE8+vqiiUm
         YfsQFC6Ne93VWOfeE5McG4gu8LbF6xlwCLv6yRPbV+jOgfel+T32o2ColQg7c0y7i4nO
         J6xRcY7Cd9Lw31Z1PN3N94gRTGK5wnaaQZtQXL1KnpZxK2CCBZ5vWwkJLs9ticUpoBNj
         IH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGbzPrH+xJoIPLYXvjSmWetHWVVd093lv1v7NFu6vPo=;
        fh=0ic8o1K5ifx2RI1u2IHLSSxdDbJ5IqS4dtKd/2+cX9w=;
        b=bksH1mb5BjnmWookw4JZDpm8G0ORTqLt0KXmD/O1YQblNPrvl7P1+bu78PJXcZEB36
         Ew4yN3LnfZIR7Y8J0JUh27ITjPvQ+YlL5nU7NNP4/IMFN+VkYenDTfbDwTz8T9Ldt5tv
         HW4jnGD90iVK2lKpV52EmQX4b00MU1b3gZWSbRgVQj5RBU9ExJ2BzUWBjf1/RNkJoUiV
         wt5eI7m0rpDb3ahtoMZGVRVuhYNoE7R2qN4vc9PYisaDn9RAiJQY10lowNh+SY1HxR5+
         l6cfqAffMoyw1MzKqi5pKfnc/MFvzlCnzilA95ecu9VBiD6GVISa3/Xbj5y2owJKaPiC
         iHXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795556818; x=1796161618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FGbzPrH+xJoIPLYXvjSmWetHWVVd093lv1v7NFu6vPo=;
        b=StA1JVy9XpHc5CNPoCkhTYxJPY5nYrDYJf45NysPkn7jD/J2o8l27ESQJA2rWSNZIi
         9nCgiTcXM7E+AkOFIPilMW9REQzxpTWxagLMK+1OpNvqMVcS4z2fDkB/QbysHvjqh7s9
         clf/EE+S21FmnGb/WSx7Fcyv7MP5cESQLXqiAfTK7VpsMiF8H4af2s1XcZTh5tOCuzZX
         LZKY1KzTKScQ0DMGktv7vz2Pd9VjQRkobp7DxAPjV2SYkkwK9MbHXLhJZvbf0dSaXqGm
         I4iOLnFLsWD8kb6/skzYA+qS8SbjRIaJkWRtQEYpZDSN2NMSmf3nk2HBlKvKXQWtMU6m
         xfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556818; x=1796161618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGbzPrH+xJoIPLYXvjSmWetHWVVd093lv1v7NFu6vPo=;
        b=dwVKSDa0QIihxhkSnecrvjljLUrOb7nBAA64/xzC0qPXoLQ4ACBJxsp+ZTMTd4QFDC
         KrwH8UN6xKipcXQodY/J8HkALSg6gPW6EUaqQsHoFmsh/IEr3FfPyST4n4MsGYH8D7eN
         WSo+Zhk7ppdhJLGn/zawb46Cv32vAIDsQr9ydtXRtE+b87eTGa47QBdSkI/my0HeVZ4I
         Pv76s7zXBbefmyg8COgk9VEMwLPYRLT/BQgt67iSsV3MfEaaPXdKm7c30xMxy60O+nYG
         6cIG4CBga2P/wkudWXtoFbOYoKHDSNjccUB2BCHJhZJ7uy6AWJKc5HzRq4Tu2Lg10CU3
         O8Kg==
X-Forwarded-Encrypted: i=1; AL+hErHwvNvUEch3D8MDFxWkXZgTd6GlIgkInWo6ivmSoXQRuT1ytNJzU6/gqdt47pMpCBEYg0uQBXfraoEkEqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qGw93Ffubg7Lljgt8ORTay1D9HJmSlTagTXnLL08A0eZChxN6
	qpTCLbVJxuWdwXrnDvIY1yALArrtBJypMaGHTBcN6B3AcG+9MZ5iG2YRMkQjLt4dAb7XQIqX4ee
	RMdNQY0ArVQ9UpXClkJJIZflK2mnwldU88orAWYE=
X-Gm-Gg: AZFdTZfpyRNeohEVQTNWYwP8kFA/fp3SJM5NAoxFEYTAiYvBjLvEu2ORLL/OZpwz7zi
	VTixtuPnEkebUJEKeyF1l3xChrE+OQ7EvJnBzzc19bxbm8nU19vkKQxFtGa84xpVjo6CqTHizRG
	QJijMl/GcJUgm3t4hGHNLHLbzV+7KqiKxNvgbOrqFH74SgJmdKz3q2FzGXAK7JTmAtp0JlkxSW1
	CKkCHY8t21LX4NwQwt4vYhkbDiLe3ji/dWZp27JEDhAFSx6vBNk95sK5cAItSEzeqPgzX0THf/e
	dNYM2QNo5/kII8BUUha6O8dfUzeTwlznSBjwg8Meu/wLCCe0UVrFqlDLKe4+7b3FEZ89v2yiUDl
	c+Lq+I/AbwGyuPHc919jkwjvoOuApweOFojK2tm15WV9ZzQCw9ZnADDsj/GgjPNgUPfiU5MTJhn
	6RKQ4xdbiUDJkGzJBn5wRczclit1Nn8MtNmrwqvhKUo4dm29u6yJOJ2qDHYpAc66vq6AuNgmEAS
	Twk1efD21q8h0+JUlS7cXSeYQHxdvTMy2IKqQ==
X-Received: by 2002:a05:6214:528a:b0:921:2e36:b77e with SMTP id
 6a1803df08f44-92134b2bba0mr261321926d6.47.1795556818060; Tue, 24 Nov 2026
 13:46:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123140620.64393-1-astellman@stellman-greene.com> <cc93cdad-7458-488f-9a29-de24f364f1b1@linux.dev>
In-Reply-To: <cc93cdad-7458-488f-9a29-de24f364f1b1@linux.dev>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Tue, 24 Nov 2026 16:46:47 -0500
X-Gm-Features: Aa3M54qCXpHCmMW9B22M8mnwEs6RTptaR_9prAYtJl4015X3i-vlsHZUGKP_CA8
Message-ID: <CAChPuV8TBy8d7sbCLzNzFQKoich5O+yD=g6zzOg0bGaS786Tpg@mail.gmail.com>
Subject: Re: [PATCH rdma-rc] RDMA/rxe: Zero struct rxe_mmap_info on allocation
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I'll go through rxe for other unzeroed
allocations and send anything I find as separate patches.

On Tue, Nov 24, 2026 at 4:41=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
>
> =E5=9C=A8 2026/11/23 6:06, Andrew Stellman =E5=86=99=E9=81=93:
> > rxe_create_mmap_info() allocates the structure with kmalloc_obj() and
> > does not set info.pad. do_mmap_info() copies ip->info to userspace with
> > copy_to_user(), so the 4 pad bytes of struct mminfo come from
> > uninitialized kernel heap memory.
> >
> > On x86_64 v7.4-rc3 under QEMU with init_on_alloc=3D0, an unprivileged
> > user (CapEff 0) issued 300 CQ_CREATE ioctls on rxe0 and read the driver
> > response. After the guest had run ls -lR on /proc and /sys and read
> > /proc/*/status and /proc/*/stat, 101 of the 300 pads were nonzero. In a
> > separate boot with slub_debug=3DP, all 300 pads were 0x6b6b6b6b. With
> > this patch, all 300 pads were zero in both configurations.
> >
> > Allocate the structure with kzalloc_obj() so the pad is zero.
> >
> > The issue was found by Claude Opus 5.5 running Quality Playbook, an LLM=
-driven code review tool:
> > https://github.com/andrewstellman/quality-playbook
> > The fix and this changelog were drafted with Claude Sonnet 5.5 and revi=
ewed by me.
> >
> > Fixes: 8700e3e7c485 ("Soft RoCE driver")
> > Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
> > ---
> > A reproducer is available on request.
> >
> >   drivers/infiniband/sw/rxe/rxe_mmap.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/infiniband/sw/rxe/rxe_mmap.c b/drivers/infiniband/=
sw/rxe/rxe_mmap.c
> > index a4ead89cc..ac851f245 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_mmap.c
> > +++ b/drivers/infiniband/sw/rxe/rxe_mmap.c
> > @@ -102,7 +102,7 @@ struct rxe_mmap_info *rxe_create_mmap_info(struct r=
xe_dev *rxe, u32 size,
> >       if (!udata)
> >               return ERR_PTR(-EINVAL);
> >
> > -     ip =3D kmalloc_obj(*ip);
> > +     ip =3D kzalloc_obj(*ip);
>
> Nice catch, thanks a lot. Could you also check for other unzeroed memory
> allocations like this and fix them?
>
> Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>
>
> Zhu Yanjun
>
> >       if (!ip)
> >               return ERR_PTR(-ENOMEM);
> >
>
