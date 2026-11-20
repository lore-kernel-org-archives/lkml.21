Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795192747;
	b=WkcB5RLUumtn3HVZ6t6Q1DB0HWlADgOdndFuDyi6celh9q8D7t7wQt6zHKzl0nAvP0iv
	 FVh4fOeHHu3oOMlTlx8bsoGmuDzeW3cm4Ju1ISu85CLrKQHFFDzkyiBYggWuF8cDv1v2k
	 OZ1YtHMG4hAg3BD7LDb5Vdtrv+/uVU1c6pEHiyCjmigB5/uqZLRU1gYWucdsoZAIBh48F
	 oWHx9u56H6yXuB03VT3eW1uaFYcgsyqZxej/qbdxnJjpqoxk848KmuYzckpChD3dTWZwE
	 G/48thPmZFzvnRI9/OoqwT0b1cjkgqk0THecT++XpgjdgKnQhbuuCaCXNa9xpRhLuhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
	b=mAXgFFc5Vp2zsAQFp+4peWb6TTCs9qUht1ipmF24HUWtIbBW+kLKANuws+FHnbZK234Y
	 IYBF9IUBc7kSy7SoWiU7u4jjdnEPLr/59JLqzhjoBT6nSzAKzWckMDmb6Ft3ZL+LsrpRA
	 N+DnpJWUkHhOSAPrF8QHA3395nWHmU6nter6D9XCsprKgWGFxEmX54//Un4lZcUWl4Fp9
	 zIfX7tXcYjxRRH/bIC4/3W4qvROJufwVRwb7dcCBO0nc846fiuabMnSwLsUmpNqMOhnGS
	 +Ekty7Zl7x2k3FEcpx2xJspHNaDThLqbUY0VO9536Ua6GE4kpQjlVGR4bRsBaRQt8DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=exBV0BpG;
	arc=fail smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CAF606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3CAF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=exBV0BpG
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba4ce91e21so6949a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192745; cv=none;
        d=google.com; s=arc-20260327;
        b=HrzNLsLs8woo13J2RZQd410xavjlJ65w+URl3EG1pfhoYQItR/szi9+6mDWNKcIQmr
         8a3izE6b/UAI21iOhSB7eZp2b7ZguyCnQW+L2eejJ1W8ujilNa7TDxbclpGmSa8PdGHU
         LBbpvxRqHvK/Lmk+4mzHOhG+tSE2B7E4zvZdIhLlvaAryOmLhNMHoQgO9opqtwwZCzuv
         Jow+eWe/BixXWKKDNh2UNXGeXdG33otF7Rt633yxZvpj5o7pOEb26CEu48D1UWAD/tiH
         PTuodIAL3M2X/oJjt/RYyis92S/XRxvwJfO+ArVp6kR0zw4mQags8stDnOhHZ3/Xx7eQ
         Cuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
        fh=QDhsGEaAtdz5lpFhj7eLABQ2efHPr0/YQPVCQClhLnA=;
        b=OV6hYQ/ZvOi9RMFyBrW1RUuIUYb6LT83gmmENqnt+GHEWAxfWR5eY3FwrbKdXhbtfb
         Zz4bYB+lrIk0qDRiAMfqlxEZg9DTcukOqYMrazXVM1pZvqO5Mxw8ONY12lAQmKAC/ABB
         CT8SK+URx/Zs/qzExMaHSn0ec4aNAA5s8gV7uwXBpGFcy98y4QlxEbhRdEPsrTj+jPj1
         1fzwB4vZe/4wnn8xCASdydnZhGC2Dkrf6Sy/ETAbCi8MHZTC4hXPcxz0iDj109CfBa9z
         fVhvm1+lUKt0j/yOUKb2IywjSTqWbC3EarmXM3+2CP2g5u96E4zd5hQB9URVizQkOFi6
         Jh/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795192745; x=1795797545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
        b=exBV0BpGps5XdMiPxKLol86gpdtksfxwUBQOPNI/CX+Vjag7OL0AUTtUePEOEP8WrI
         RUlzfZV7tuY75+XXDgA2FE996IdeAwfOOQS71YLa3PVsYS5lYtvNykQXpLbu2IIk5Xo+
         a8hyM88U/z9KAR34tZG+Af7cXNA9wfKV2vvz43XNigXc3hnBJvtspPOn971ezY8WhRYk
         WGT7FhtNaw7YsBotMKoktHlPZY9bmmEaGf319WakY49a3oR3EgabQSfSpsLo6R3n4vGN
         xOyBFLseGL/E3NrU51a9p94L/ZXXx3Urm/HtJqUwhfNw4+eQb6KkyPFtmTNtcDHwyTsL
         BL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192745; x=1795797545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
        b=XFxPulYri69NoRl0GrE9DwwSf/9ejx+kyIo/e2yhzzfFAKkYmR3A+U6r3oqesiSGTC
         IfQvqEGNq8BwaNourm+jwIpZox3j3ZgU1SMBtWsjHXUzdblFBOE43++AmhJ5C3sYo/7n
         R80p9hQaRaOkuvz/rjiIKpcQei3ayF2H3IrHb4HrmBmf/kJ8bc3SIk2ApyBO80ii3iBN
         WFHzImjvD9lwEUE3wtQufwKr4LVVzVBVvEeBGEtIoXuxLtoPAeOcpLFKkSVhS9SDZcIx
         OfgfELZ/ZPTUyFEu6P8IoZv2u0YpCelHab8hjB4mMRcx+/fHGSh1FPziMN12PTOv1pxe
         cxsw==
X-Forwarded-Encrypted: i=1; AL+hErF1CULc+MkJ9O/2j0WKbBRsznCl66w82QjIpV+ZoWaMlwqLXRRio478B60HFVYZXCFabDSdcBHohlugn5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PtGVho/XgpDNJIyG4ekEsZkafT1zGvrSR8jmRxdTJjai1okre
	TAlPJlJjxaFazaOH9H7VaRRLe5bC3/PBHL4kaKyrUx3kA5Dx/AhFduIElr4aDqPUNMWmHP5NNT2
	wBaF2ZcCvowV1PDZ9VkYQVil0MoxhcBmi9dw67uqO
X-Gm-Gg: AZFdTZenwwP5eh/hRcomdwVh4pLdSAVmtVhXxBF8UhPsgCr8COu0SkcT2eoySrDIsxU
	OJG3AaWK7R5NnRkbn933Ouv0opWpqmRy5QW9uQuwSZGBbSFx+6sIPv3DySKVh544XFKGC6AYhco
	7ps+G3D8R1ArwUX0mdkBsqM+xgHDAHqDuHWIxVswL2eHHYwbzMG9RWLvBwCV9kTHaos5F2HJc+D
	h+m8JKomF4GSXswmVkK627zB9774RjJZJyA9+pEhgVcd1wXH92Et3ZNl8bPHar+sHp5yoMOI0y0
	BvHis8ZF3qL/WPgbkq4t6pvDqEguismRKRxIuu6O7jHEKWC4BvuQOWZtClEj+NJNs4o8ElBrC0q
	I1C2JGJQOt5pQAcBrsh/r08U0hEbXvWZbYt6wmQ==
X-Received: by 2002:a05:6402:c4c6:10b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6ba38153010mr103871a12.2.1795192744560; Fri, 20 Nov 2026
 08:39:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110183826.2927274-1-tariqt@nvidia.com> <b5305251-b758-45cf-a28d-406b04d8bccd@nvidia.com>
In-Reply-To: <b5305251-b758-45cf-a28d-406b04d8bccd@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 20 Nov 2026 08:38:52 -0800
X-Gm-Features: Aa3M54qvoBN2Yfkw1kEqj7wTtv_eM2s0F8mqRYMDR_EgYh3FvB_9-0cl5hbrfvs
Message-ID: <CAHS8izMhSVabXgMmNbHHLm8cYqW_EVQbpXME2z_tUEJuN2BTnA@mail.gmail.com>
Subject: Re: [PATCH net-next V2 00/13] net/mlx5e: Add netdev support for data direct
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>, 
	Erfan Sharafzadeh <erfansh@meta.com>, Gal Pressman <gal@nvidia.com>, 
	Jacob Keller <Jacob.e.keller@intel.com>, Kaifeng Wang <kaifengw@google.com>, 
	Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Stanislav Fomichev <sdf.kernel@gmail.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:39=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi all,
>
> On 10.11.26 19:38, Tariq Toukan wrote:
> [...]
> >
> >  .../ethernet/mellanox/mlx5/core/data_direct.c |   9 +-
> >  drivers/net/ethernet/mellanox/mlx5/core/en.h  |  14 +
> >  .../ethernet/mellanox/mlx5/core/en/params.c   |  18 +-
> >  .../ethernet/mellanox/mlx5/core/en/params.h   |   2 +
> >  .../mellanox/mlx5/core/en/reporter_rx.c       |   1 +
> >  .../mellanox/mlx5/core/en/reporter_tx.c       |   1 +
> >  .../ethernet/mellanox/mlx5/core/en_common.c   |  38 ++-
> >  .../ethernet/mellanox/mlx5/core/en_ethtool.c  |  67 +++++
> >  .../net/ethernet/mellanox/mlx5/core/en_main.c | 253 +++++++++++++++++-
> >  .../net/ethernet/mellanox/mlx5/core/en_rx.c   |  33 +--
> >  .../net/ethernet/mellanox/mlx5/core/en_tx.c   |   4 +-
> >  .../net/ethernet/mellanox/mlx5/core/main.c    |   1 +
> >  include/linux/mlx5/driver.h                   |   1 +
> >  include/net/netdev_queues.h                   |   1 +
> >  include/net/netmem.h                          |  24 ++
> >  net/core/devmem.c                             |  85 ++++++
> >  net/core/devmem.h                             |   6 +
> >  net/core/netdev_queues.c                      |  51 ++++
> While working on V3 I realized that keeping the core part in
> this series is not the best approach. Initially it made sense
> because the change was small.
>
> I think I should re-spin it in a separate series with netdevsim
> based selftests for the new APIs. I would base it on Mina's devmem
> leased queues unregister [1].
>
> Any reason not to?
>

I honestly wanted to comment that you should base it on the leased
queues series from me but didn't want to be annoying, especially
because I made you wait for the previous series.

My series creates binding->bind_dev, and binding->map_dev, and core
will (should) handle things correctly across both devices. This seems
perfect for you, because you have a bind device and a separate map
device and their lifetime is different.


--=20
Thanks,
Mina
