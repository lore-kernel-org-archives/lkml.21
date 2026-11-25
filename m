Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612494;
	b=F5xkgmwFzRuKhTm/tJTOSh/HR6D372AYvVGFUzd9pETImjbpb/s/lqNizgYJ+EZ07y8g
	 2mqcQ+FnzHTuOu+OrBBbZT8UemlEfgA5Twd7lz6cMNuXaQ7IAJ89PaeVI7hrqcOiQlpd2
	 FdWJ6hIBMPkqzDrz/D8CvTw9ou3cOAhERu18pGCHd1JemLkJQHUvLI0zSIcHQNQZafBOP
	 otn9aRSFv6eXLP5ON3PDNPX0MOunRnNWyCkd+GeYXW1Wf+lgZuP7we6ZkHX60TM1K5P9q
	 T/3xFxlROIsJPnxRORuFuyvIpw5VtpUAyB8pWGQHkTHvuI1QeuIfFwOClrF63pDRXSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
	b=kj63MUsDVZ1/Qkxbou2IL2quAShRIqJTTzot+o38+B1brwFRKD5NYS60odhoew712Njh
	 nEDhuFLbsKAM4/+Nz+L/khFQTQnTjz+XmiiguVnc+ZQEzpkB5V+HyZ6dsgaWbiYdmh0/q
	 ir9JtfbFtueefjTpJF0TlEDULWJ9siTJeTXEwqF/CoBUYUNrnIVjuGbU3J3ilvUz3sEvg
	 c1P2JvzRhRPu8C4tZrjmAJslDR8hbAuQrK7idtOsfMb7sfyTYKsjp+HEB9OPiVOK74dXv
	 BR9HMZJWsecSCwiSWLraPyGwM0S3jmtRC88ADRqYpXQ424B2oUDaeBTQTpIX69vuiBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SQtVpwNq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAC606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CAC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SQtVpwNq
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5133831027so818236566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612493; cv=none;
        d=google.com; s=arc-20260327;
        b=JLbpmANS1MLTucqOtrnBHGkaK/enPuh24QRo8uP+/GN4YKP4uYpEPaKX3niiyMOT4r
         k2SbHa/6fekLnQPwpfauy9mlzc3aC8QhbRBxl3XTfeptf2973ClyKqrJul+hFRGDpIVM
         F8hLYtrwxvDeXKT2S/wHO5Z9aoQnxX8iA/lobYMa6G2yDN9+HW3TbcEzIwZeHdC/Pz4i
         EJzVepcqEdeMkroaFjDMIZaqpZrzTUM/gPmxkZkOXxJzROuSGm0fw9EsqYWJUyw+g/0e
         oCErpONE8tEWXcP/gGpwVG8hPy4YUESmiwSbqBzIakWxYv9qCVQ9CY/9a0B3DdsVvgoB
         asqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        fh=R9KPgBGZhH5WFcXRJIRRBcgKswhWbSzTLA1b0Vc3KIQ=;
        b=IyU+JDacZx30dB8NZnBr91OuBs0YH33MPDu64Sx9lfzAqMQ0m2163EVoa6Ik/9OHnb
         0JcnyyrxS9jCoo/7y+0VQ1MCOENNfVQ0bZv/MFld5zlUuK5+umjurh1L8Ng6Rev7l5TX
         RS7zwmtxFPip19h1n4nV8LMpj2xpfTQ2JA6+Byic96fXu+v2uc42Sm3NZjv6ZajuCfKC
         I3upttOfqIevM7I9IPYdNNMDYmirjHdDQNe1NLYpwazB6XvNlnXiMUIOAi9iqan5cLm/
         gn0k4mHp5zTwbcbt+6nhq5cJym6U5zOhfRpULBZhiKBfbDnfFzEpXmhUz4epNq5G3cj5
         rNdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795612493; x=1796217293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        b=SQtVpwNqC59M3VVfa1dfoE/sHfHGz4A9t3U5kjHMDgLzJ/LAFCY5PizY0zTwKdadfJ
         O5ndt6idAZjUViDyFaIvEIf8PjRYdeEJFTenPhqxD4KS9aPKfpOMnuTLEhg3AkAWFtLb
         C5Ymg14tXaFwlcuhdcnd7dGuMWOyoF95OQ0QdQje9wpaUvQsnSy5dKhyiokeJ6ja7Iw9
         +zk02GJZi2Wlz6yoDfQWZ/vdkaQsq5UB2BtV1yJAYqfUJRYjcsv3oW54uKvJOZv2uChN
         f+AE+YTe+od53xhnjSMY71A2eUBacbOYKi4eu6oeZ84A/p08jqOhFnP6cS/QI+9QYTOp
         pzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612493; x=1796217293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        b=Ed68DN3jwXreOxfNH7NMOOEuOVIs8+gNKTRlQ7bQn/hTQu82ha4L84S5kMHBlWWeNs
         oI6m/XfE4NsoyYrCxiJXAgNzU/FxjRH1hfI8bnWzwuwPJvqAIVQ8CehqHsAhF7UosW6R
         Pl0szAfov+B6SS7p/KMu4W9xpjKUK9lILUA3abAW2DaWPJsuRUKpTZwIlc8giXURAtZB
         lzg/Uo52AJVH5VjURbDpJBEikB+m4IGFStibrUGeZW1OpuM3tb8VhFFVvOCy6z1X/Ip5
         5f5xFFqNqByQG2RYrdoPz3Q4McMzzVZJnYtWk/KTzwalIJaWQTQCIwY9uSFr5Z8TmmNX
         ik+w==
X-Forwarded-Encrypted: i=1; AL+hErFDa0yonLSz5wRuF2ea0ndjcETy0u1+WyjxVdEfU/syw6N1NU2MXIhEyyz3LPXjN8KR4+0Gsk+p2B0Aq7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zFwl2Hho0XSzjzbSTONBfaY2cdeyedi7a3q5vHakdrwBHXBAK
	7K+1Vl4mtQT7b7mcPiGniM2mL+p3PfAH4GBw0+4FxDtH3nLX6yfU2rXd9/JhY02KtITBvvU+wHM
	G4R06f+9rsqqqxDuWvOELt3fN4DuYWUal2wq7VT0Qww==
X-Gm-Gg: AZFdTZeTC7cnTIi/EJxcFHlFz0hzioMOYAPsFcIIYGoQTATqPLO0OFpffAKTBSt2LKl
	uaersfAUddVdR5STsNKO5KEFk7CMEZVPsUiK9Es2YVxLEuzxUGMST0MiN8YLHoHpBoqceIamssy
	TgQ6uwxmMOIzy9+dhdZnsL/gTNgVKyyPZ8tzT/Wq4hJsHmVXvBrEwPP+6aMBFmPDJr/8oMCoh3U
	tmZeWxtUAlwGfGe4O+4z1adkGcjAQHlBVJRDstS8uvo8nevPvV0Un4vtXjhTvH1V9/bniFx9rw6
	t3F44sgCnnbOGE4rWPKl7OTzp4QxIFbvU9EnCQMLcTlSIPkMWSSM5oz+p0db4j44wRWJLdsY2gy
	ZZas3Zjred+n2vvLFnn6RnhS/cYN+PUukBAnnpeDixPCrSlTJK+vwx2S0Lh0tREOlCpuhM5c=
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id
 a640c23a62f3a-c513a5da8d0mr1423705266b.12.1795612492588; Wed, 25 Nov 2026
 05:14:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118184729.2302130-1-m-malladi@ti.com> <20261118184729.2302130-3-m-malladi@ti.com>
 <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com> <20261125113634.GT31322@horms.kernel.org>
In-Reply-To: <20261125113634.GT31322@horms.kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 25 Nov 2026 14:14:41 +0100
X-Gm-Features: Aa3M54q0E3DE8nTpapJpm6hmEWKXKOUeQTw9rDRWi3Vp2mEG2fUlO9gFRZDhhqk
Message-ID: <CAAofZF7tvsfkjjZY6e8Y7P-ddNnR=XQfLAGysrpq1yp0rRGrjA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
To: Simon Horman <horms@kernel.org>
Cc: Meghana Malladi <m-malladi@ti.com>, kees+treewide@kernel.org, 
	laixiangwu@cmss.chinamobile.com, philippe.schenker@impulsing.ch, 
	haokexin@gmail.com, devnexen@gmail.com, jacob.e.keller@intel.com, 
	sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org, 
	daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org, 
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:36=E2=80=AFPM Simon Horman <horms@kernel.org> wr=
ote:
> [...]
> Thanks Marco,
>
> That may be good general advice.
> But for networking code the explicit approach taken by this patch
> is still preferred.
>
>   Using device-managed and cleanup.h constructs
>
>   Netdev remains skeptical about promises of all =E2=80=9Cauto-cleanup=E2=
=80=9D APIs,
>   including even devm_ helpers, historically. They are not the preferred
>   style of implementation, merely an acceptable one.
>
>   Use of guard() is discouraged within any function longer than 20 lines,
>   scoped_guard() is considered more readable. Using normal lock/unlock is
>   still (weakly) preferred.
>
>   Low level cleanup constructs (such as __free()) can be used when buildi=
ng
>   APIs and helpers, especially scoped iterators. However, direct use of
>   __free() within networking core and drivers is discouraged. Similar
>   guidance applies to declaring variables mid-function.
>
>   Link: https://docs.kernel.org/process/maintainer-netdev.html#using-devi=
ce-managed-and-cleanup-h-constructs

Ah, thanks for making me note that!

--=20

Marco Crivellari

SUSE Labs
