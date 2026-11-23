Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795403528;
	b=MtHuY70RJwnzm23hlkUJJLSjXuFZn8rBUltAAFM/FN+Yf3IVShbiCPZxcXJPXSiKnwmY
	 TVvocwZNZC11ldizr87UA5eLYGiQlOntduPSlxs7msLhR2yrhTqovKuXYHBt8zBpNbu2V
	 2v+mPB5q+MVVrSNEWs2oz1eU3l1Q78CGclIyR2QSLruLOB8oUc117dYlgQIyqGDGp00Ts
	 b+iOhXuOZXaGA1rkPeNcpHUu9XqTV79M/j4X0jstBi1dTdMu2cov7pLqyOeIeKBFvIWys
	 MxIpAoE5GTa6bO9Qim+T3Owam8pWfa4BWcmhVB4OStAHOQikN7HgGKTjJkwjkgz14Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
	b=ES8+D5f0nDkwlm1P6qWfLJue+x/w5V7tVGsjmlSh4ItvyK37JKoGyY55fK/4iZRiVFrM
	 4W1h2wHgmQQFNKUuiu9qJeq9I1saOjR3GK3/8JRATyRsBT8Lm4FQLGywUzFnEMs6I08Va
	 t1TSfq+h69tz22RmHDCNP+VkRNmCDPQ6cHsaak98UPomjORDXvdbg6tC3P/J5NP5eGrPP
	 MZcNce2kkJcYFvEAwemSNaTh39qEbbelpPJwquSU300QkzS4T+yBB0jXfsQCnRM568hU5
	 tWfvOSjmdR1ffrvvhy+1P+eSFJMWdUOX9RWY3intOcyXu3BEj5aHnKa8IZqjnho9eZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jARPTXN+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E00C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jARPTXN+
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8633b750a12so532933a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795403527; cv=none;
        d=google.com; s=arc-20260327;
        b=W+x2e4NuY2sc7yBlepoETIUTwDkcB3AjaVc9Lw4Fzw4vA+HOW5D14y9NmTbcqSd5zH
         2H/yUmoKwdAza5y6+cmfgf1oi8x6S6/Eqs4Dhm8WnntW7pthO0kiv3D62j+RKzHiG65E
         +OnnlZ3Wjwckx6MW0A1EXvPgYOsN3RdOfff+9uNOa/1SgLnQT73UDjW3xsG94AeAPRDw
         RviLw/Ue/6o290puDN4mkow0o/Zt4Usbl7AVQQIMdlnbAmFKujpDc79E07KBz1K8CAFc
         7U9rNuizXYGzIrqAy0iy+9dv1tUuW8ZDkXhc51tfEgyG8JRiNHNSC3MuqzsMuJ+C0UEt
         s2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        fh=DY9bCDE+Y31V8ATZWUZYVwPBK4w4NO+yRIuhNMikW4A=;
        b=ib3a5LnzBBaiY9ifqEqUy7cd2xf7gQVKO7//D53YtLxqcGl0KWcSQ/Y67JKywT2CxY
         qeG5Nx1J7S6f69Ae2TVcif1bEEvnQ6Ud5h/4B5aKHcjy8omMTocEZDZocDv7PE2CJ09p
         P87ujcPv8Efi5ticW7gEX07sPkdjHp8kDeuFMkqvOj3/TjqiVDxs3RERUTZN4TixM0WF
         HVD7IDTq3KeJMhUF6xEFBvG65KfsNCsDEs2cTf1r3Cs99cKFqexuY2QCJpQPEWfc8JC4
         hyb1aHR8ISfUGHMCydafa3fPX75y2/I1QZqwI6ILMbnjokgN2RaezAG2jnr0AcnhZCIM
         kwyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403527; x=1796008327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        b=jARPTXN+jk/1Wht2ZzTp8EPu1BBNoMz8Qsz7W+XMEPM4qSPogqmAhgHzkL3bS3CdKw
         1kHeeRhiAkiYQo4Z+K/Z25frEAf/LavMCOkJXzpO31iKPz5HzqF5nmHu/qcU6t3ESDsn
         Z9CaV0FKSVnPjA9srIhsNTPdEN0OQCKAQT3iZvIjsuFXgpsnVHfL0Z9rEHcHp9moy8Ez
         nVnTp0fXXEZbfbN2PlDtbnFmwWp3wDXlA+bnCUC/B4Tf0MwAk3qRs0qSkebtH1UpKJt0
         iCveyniyziPI5rq5Vli46XCg4DJH6uNLrKEcoUpsIJCpabtQgkBAW9v6TH6yxKbwqv36
         tnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403527; x=1796008327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        b=L0yJi0zmK5hLinguOWm6X3MPmswVNMez3PHR3s0WHRdq9IPD9xdYmtihfod00SjEZD
         UUEPW91lG5CmnrJQzWL6pQSO0YzIMsuu5TSZLzY/TuMR8BiwLwoBiFQlPOsBirRGxiJ2
         cwWw4PieSlujvGilRafgYd/Snw9Wi7E2Yr7UojbWwEe2Tx40yUDHdyLoEOYf5XfY5X+E
         UYQcDLYxT3w4tjZr2J00KQIQeScAZnIacRIB+VMLHzGBWer2/Id8B8VS7KCmnNUY5iTT
         SbPsjutKKw9LfhIaf6VCSb4cjXVkPsBV6pOe4mzCecyLUTdoSNme8SoCRmmRUhvx5Z2I
         4ACw==
X-Forwarded-Encrypted: i=1; AL+hErE4X7pR6UpUeT7pBiDIQqqrHtI8eDeJB+XRTT57Yeo6AUA2v5ATaN9/7VI4+XwIuPRtzpSaytbPJs1wMb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VwUSzngyaAmtiNgKPTPxfL32VvttTWgX9b4GaxhQau4lv7a2I
	YNCLZNQ8fZadmkS9CqEzcIIpBSXDx1nTJpViS717foHZ3ymxC9B30T2TzeQdJtYHsMOCGNozwl/
	woVhVvm0na/JNPV8tVetyplqYnTKUGOU=
X-Gm-Gg: AZFdTZd67SWf9kdeNuAGRbNuSdiPRxagz/JQeQeAXQF3WrD+PmYc/R7GaTphGCMkNVS
	nXCoi2205iDpJRymwDxVJPYAhfc5U9bodI6x/XR/BNexuwkPH62UKLI7wVRRdIqnrvNUb87p8kU
	4rLb9Hrh5Bs1GCeu3RBN9MFXBSml1KxneZD1UQqUoJiTjDcPGaMZ8rsE3RcTytidz7P7eiNA3Jk
	iTDWp6bqoPsnvp2AwRbHM5fKFK1y82MTvWwyVbXglmuyNaFtRRWRxCDMW5YV4WoTQ1Bg2lcLRMQ
	IoyzY+uNs/iFMizi1Jge+T5/MTvNO5knolFfYNknZQpRdH+mKghhPIhXLSFBDHWVH2SU0tgQ76l
	DaSdKoX++Mv4IMhzhX3mI7grkO3NvoZN9cf7BmzIsoczNm3iwzVSN6+iIyS+PCX5akZ562qRvux
	yYtFjHfvYA0wQrpT25jp/BhoQtKSomRFWKhymNc47263dtubY76K3yIx9S
X-Received: by 2002:a05:6820:809:b0:714:b51d:f512 with SMTP id
 006d021491bc7-71b39400ef8mr8589110eaf.17.1795403527106; Sun, 22 Nov 2026
 19:12:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com> <179513866237.3136.3197734576083995986@kernel.org>
In-Reply-To: <179513866237.3136.3197734576083995986@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 23 Nov 2026 12:11:55 +0900
X-Gm-Features: Aa3M54ounNdHIeJr4P5hKagxZM-CAo0cFkrf6E_mlmmljBCkgRjNgLAoGrLJ10M
Message-ID: <CAGAB667HcHxS-XboSz559SG3tT-RhVmZKt5McWoez8iwuUGq5A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over
 a lock context
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 20=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 10:37,=
 <netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:


> [Severity: Medium]
>
> Does this SAFETY comment justify the from_raw() call?
>
> The new Locked invariant says that no other thread accesses the
> lock-protected phy_device state for the lifetime of a &mut Device<Locked>=
.
> from_raw() now also requires the caller to be in the Ctx context.
>
> However, this comment and the Locked docs above both say that
> phy_mii_ioctl() reaches this callback without phydev->lock while the
> state machine may be running.
[...]
> Would one of these work instead?
>
> - take phydev->lock around phy_init_hw() in phy_mii_ioctl()
> - weaken the Locked invariant and drop the accessors that rely on it
> - give soft_reset a context that does not claim exclusive access

This is why the Locked docs list these exceptions. Taking phydev->lock
around phy_init_hw() in phy_mii_ioctl() does not look safe as is:
vsc85xx_config_init() takes the lock itself through vsc85xx_mac_if_set(),
so it would deadlock. Fixing that race belongs in phy_mii_ioctl() and
seems separate from this patch.

The other two options would change drivers: ax88796b_rust's soft_reset
needs genphy_soft_reset(), and the Locked callbacks need set_speed() and
the other field accessors. Documenting the exception is the minimal
compromise that keeps the abstraction usable without changing driver
code.

This series only separates the methods by lock context. Other contexts,
such as the device contexts (Bound, Core) of device::Device, are a
follow-up.

Best regards,
SeungJong Ha
