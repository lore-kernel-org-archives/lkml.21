Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795194980;
	b=vDBD6fbVKD3X/c5qhXyyYJGgIiGP1rruFnV9QXzOk3mjUig1lrtqMIW4AK+3adUGDeAm
	 C5WL7WsMdyCl8fzSjimnx8CqdOTwjpA0skIxxLGovfVnVOx4Vn6Q7OsWLneLTYStcbmt/
	 XLkewhUHPRJbsm27b8ix8Xu+eX5F5UB/UyJuDIHjbHvi5k48jRrZc1Gy56286VhFJqUvR
	 TELQHwaHd3j5ikN7QREvFB75UT9Hnp/UFUJcDFUNBfpcVklLpkiwvcDTdGKxUx5p7E5ZX
	 b2qEA713miPTDNkLDHDLU1FyQsGtbNj6lY8ljg3AE7SNMzXKX7YrI4KRSz7ntbVg1FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
	b=3tvXGPM2YtIqCQz2vQ3B78za85o47sYzfUWqjuDlpuDvTRvaOqZWPUZ5EeehQbU/LXS/
	 +U40FLY5ndEPsRS4Tn3zHhfcjNtAg85oN6ju0vPvWW1ssE1FT3SXUVkwNRMl+fgafEQUp
	 39egoZIPPk//E9cMcehA1/1CvpaKuZKDo5Td8igytVMTEMMHgFNDljG7aabt7i/T9AEZg
	 78px5mBzmevuOSLS79o2UdXqS/ePM/n2hvtdiH/1a23ULnElzgQoIyV/iZSt2z2N02dPi
	 HVlulFcREoVxDy7gQAEJUecB5DJM1QXVnGhefNeuQTuELA9qxvv7dNyMepF9ujAYBFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QjPEm/jY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7079C606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7079C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QjPEm/jY
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55be673e029so300951cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795194979; cv=none;
        d=google.com; s=arc-20260327;
        b=AK5Jo0/m2IzSle56P306zesjkxMwYjEuGeyWlHosQCVhzEg7LnbnnftK96o3fEnPIK
         jVCltFEZ5/W8lkzFTngC5nCwZ2ocyiiWIcdJxOjs4y0bT4AwWPZtGJg8Rq8c8Qx1M36Q
         iYibOo+UWfCcWPLK0T+GO8+SYPdU5u1UYWKUC5bsx0RAwfaZTY2309ilwFE7IDF/0V5m
         XdNT8qC5uK76wNKu23ZjAqvSGk0gl3UAeUQOIRkHwDrdnWHM3y/CAZbeyXFgnZYFW8XM
         n5aYQwnqz+FM4BTJ++9bhbisoUm0wqagIqavr5Kj2mGy8yxQSwxeS7ifkfC38PL8hjx1
         EE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        fh=Gg3rHKf1MJzD3FBypZplYIUVwj17hUrtGTHP7qPAtRI=;
        b=KTgetnWCWs/u3cOzG9U/NnO2AxBt8kSWgEVrORkafzg2rwjOkMoer1Ltl9ysPNH9hA
         sb5nhtZy2RKM57wfoTWQYX6E1AYfGGACZP3lt46s1fTwKzcsznKSJsGh4WtJxswfSPKL
         XKb9kkzGAtu78BH886nEd3rH2Tim8rUy+A+vj5r7JF+rUGZc+bHdvMLZSG87VcuxFmY5
         A30HI0N1ZOek7qkzmwOA3GEBadvGoYdqp6sNLE32M3RonSxNI6W93qVymLOnf9fFmrJu
         +Atsjf/tUJqVtZ8BaPmTJbvoBX0biJtI1ppU7Gi1gFpc/uoTddpPvJHp3CjjS1Kk5DTq
         XNfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795194979; x=1795799779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        b=QjPEm/jYv7v5rK8laDVsh7i53DW3G6IExbAR3o8TpbRfwBMNNfxIf+FgL2MBlQXeFt
         QFDDMUF9M4BHGZF8L54/vY313d1QPJdu9OTWo5anjgafVFBCq3wYclPnL7i5xGlB3UWW
         P2mEu2Qzkq65B85940lRCMB5TCLuhmDYLQCuJ4TvZ63vG7FJl8dBFFjFSsgj/w6Ewx3g
         fQaPInJ/dH4H32egwRtRH+JFpw/+ywaSC+QLpvR5YX/n3dvyxh7+0gXu9Tjzhi4jEq9c
         DKUgsnZko1fKKooQ9w0R0y72E6TEsl0xREQnkA5RF2A8hKfMuufhRC/mP1xvc9jO2vEA
         IP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194979; x=1795799779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        b=ole/MxPXCZX5ZHIcV26GJJ6UQ8BgvKsFklyuOalE3L4uravd0jwN+hb95g8HnynlEO
         ZMw1WOFMpmKXxbXyzWJXN6weiqo2MU/aF2Gb5Ug78Ih3DErIXIIWrUZAbgSw8o2azHyk
         6ql3Sam0zYIUGrkeoV34Ob1BUDEuReOD49EgY9p5pm8AnBjlN/mvSFBC9/pJshVHZJbU
         V46VVwopfxj2dFVGjglnIn0BPHHpVthxTw9FJ1juAY36tWP81y4rGbZo77d2ftG5gOWF
         zdh6kCNcxOEdBcQzS+PjOHecqoHoYJhD9jfD/C4kV/rloXBUMlClPJGerDMQwl0XgGku
         GWmg==
X-Forwarded-Encrypted: i=1; AL+hErFUA345G7R2KHTgpkHi0sOxsVUGiZ1gNwoCabufKv/XoM4LE4uJogNUUpQ3i9h/x7FQSzAHPYrS3+7IErM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZGbXLWvOOVInU7Nlg1n5DQWlLZBOP5RhUTmJPirzOB8aqJHBM
	/5rr8cmCiFUX5upxi5f1MupuHhr75lqtTRRTX3ii4UlN5PDCK/1/j1MgP5xDthfqalSR+Ls4W/6
	j4fZnLLTGezGaBDdxwljKsk+OlCMTnI3iQ48NFTnD
X-Gm-Gg: AZFdTZe2zMz5Wlm750p1mVpSq1JuRb8SLU2faq8hwKB5qwPNU006aWM7VhGsOD4gycv
	BV1T8adQS5poAYgUD5X9Yb2t7cTZbUiVYfSREaWWohBslsIu2qnBAVvLjIENRJE+lepht+Tixgf
	UUkIsAR55gWFL2Cg/M65M/fTpjkFoeu/WFR3yS3vqsVKCW6nZK+A177QKzi3UAbPv2cL2jiZOK+
	ifm++cuK3aqT77jjJq7ngvJSGrH8zyUC9kVnERuZoiO2m2inwF8bKbFOVvjSObs+LpdbV/c2uY+
	yNNIDdh+YJrN/idf7ypnJyA8D6j3wYPxf3Qtyg8SV9e1gptcAdRsTDtUa/29945EG0xEMvY6P/l
	WawIiaSHqjwS87FyEns6OIOLVzSs88O655iCJ7VZkMffFTD6+au76cs3UJw==
X-Received: by 2002:a05:622a:5145:b0:55d:74e6:e03 with SMTP id
 d75a77b69052e-55d78c75bfdmr24228621cf.0.1795194978630; Fri, 20 Nov 2026
 09:16:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119171021.1535172-1-irogers@google.com> <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
In-Reply-To: <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:16:05 -0800
X-Gm-Features: Aa3M54riczv_KPXhd05XtH3JpnS1jtD7HRpnVfSKMpo6JVR0xKjJT_2YvUjV8_k
Message-ID: <CAP-5=fX3AE_XyUbiZx+7umZGH0ER_hjJwGs+g+Afxk4A8JuyLA@mail.gmail.com>
Subject: Re: [PATCH net] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Nov 19, 2026 at 09:10:21AM -0800, Ian Rogers wrote:
> > In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
> > return value of both tg3_readphy() calls on continue and never checks
> > err after the loop terminates. If MDIO reads fail across all 10
> > retries,
>
> If it fails 10 times, the hardware is dead, and there is no
> recovery. The best you can do is make the probe fail.

Agreed - propagating err out of tg3_phy_reset_5703_4_5() does make
probe fail via:

  tg3_init_one() -> tg3_get_invariants() -> tg3_phy_probe() -> tg3_phy_rese=
t()

rather than falling through and passing an uninitialized phy9_orig to
tg3_writephy() (which is an 'i32 noundef' UB in Clang -O2 IR when
CONFIG_INIT_STACK_NONE=3Dy).

> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>
> This clearly does not bother anybody.
>
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Fair point - sending this as [PATCH net] with Fixes: for stable was
wrong. The motivation is cleaning up Clang -Wconditional-uninitialized
warnings across allyesconfig so the warning can eventually be enabled.

Would you take this for net-next without the Fixes: tag (or a minimal
'phy9_orig =3D 0' initialization if you prefer not touching the old
control flow), or would you rather leave tg3 alone?

Thanks,
Ian

>         Andrew
>
