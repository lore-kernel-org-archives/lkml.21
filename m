Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599645;
	b=4etuH4dFKfHV9vqcVMe8Ua2Xpb4Sd4iYaNQ5CPjEI341EbkcrENvNzQUdYEVl2VBXvvN
	 aDyv3RCK9qOomosIn8nf89B8W9UTZOOpDdxE3ZFjGKDy+FI7tjdTJGWuTqLqf1YgdducA
	 EtkDuYe7iTKnGD5z+lk6fXW7PUkt0U6RTEOQwqhi5l3AScuZzcsA/RHx5bG31+sAtY8X0
	 IbopDJjW2wnqlLBbZ6a0+fWLOdofiC6erMr0RsXT1krmz3A7tj637ctS09vQYrBZ4GZOF
	 0p+25Ui+MxxPSgoVlRKKpqJUvdyWambGcELjOZTZrbewlCPaFT6zHp2LOjhYep5jQcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
	b=deGoxPiipMcO2qD1+zvaTVZoTbCm5xAo6uyDjBZsRnVEUDh+ClIaGqEXIv78xzNEEsOT
	 WLTamuEkMmDWFt/fld7q77ntmQ+W6bLTJv+qRuReq/DHm4kuWmsLSpkj+EmbjrZX875pq
	 hgxnCGhcNNfhzj04Y/1y19prh70bsSu8GpUa2lDk4vOkj+wtbzun+6Neu00Ubpu6FkEED
	 5krYFKNqJ7lIQQMAzVKHnlBw3Zkgan8UtmWSR3DZ67oEFLttX391Omot3kLxfiquRVNlr
	 pEUcArhwiGYqlNzSRkBeZSQ0U8ko3hB+Im0CJ6912zBZfSDNdLlL5pPeiuFIaLZzvEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USogZ0T7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED98606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED98606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USogZ0T7
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6e560e00a86so3635411eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599644; cv=none;
        d=google.com; s=arc-20260327;
        b=jGLeM2Y8FLpafLsBT0Ds0A8BwC/LeEed3aw7btxl1L1mCCbL/XBiILhMHh/xhEXK1/
         Mz5zINmKLOVKeICL23mCDVaLA7GHb+r3iE17jRhl8vRZUs75wq3Q5SqTrqXoQ3VeG8Hj
         Dx6GBsMQDcSKG2MVma/peclcDVPZYyqiDviIGZEPtjIoZAqkjUBsJusM+4jV4DyLrutk
         xb7m8GFSAQp4BxhIa8MkRvOScC7TWC987oxyiC1LS6yA4dfaaME3FdozKlch3HZSSY+Q
         WazhHPGKzzCCLQnZwwA4iu7eLjqZHulaMQHe9UxOSMWq33zumA0jejdjNhr+Rrw2zNGh
         dN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        fh=Ts9RNigEYSQkzON93+57IAyd/+l7ejDYk47AnkJHWSk=;
        b=HvftjIKpG/nupAD3/Qq9Wk/pgKtolvTmpNwEW5KS5hRWIz+qqH5gA7sB+MRMiwXND/
         FFjWVdvMbBZWxvh2wyO3/h85NUOMzg3e5IjbGrqyCEQejr5WEE0IpSKHtP0htx/9uB81
         9fMUljQDN/WG6SRAgVUPYu1hR4vmDNPWnhQwAaUKy2sXU0gT2hGWVD2uU2g5exx+TK5x
         1lNwWC7yVpv54Anj5fZ4HDhmXLmNfKsVDM0f7igqCSbqPmaVqJAE/n7NI3yPE1ZCKte/
         klbdKncOI/1K0L52+LOzPn6UVS0w19JY+skWg98vXPKPwuap+wQaLIccNsn56CJ/qejt
         g9MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599644; x=1796204444; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        b=USogZ0T7/+oVKbbiq10JBY6QO9BLjWfuL//cJGrm69dZzwe3xcxXYfejWFRKMykHAk
         JLbCM7dWn1b62yVI8kDtdjJ9tarlF05DXeEiA2BQyimghQfJ3fuol6EWB2R5Eoa6bUzM
         C9i36emuQHVamCvtmNtmFGKA8PGlc0pCFIHgvGVazJO0/a1o9s8WiLhfpIn3J7wWSQsc
         aew+7tayon+TGltP3Ort73UMToKHA/YL1b3IIuT/dXMd68X5mCt3ATymsx8R+q4YMvMR
         BCvRazhZYOuJ+MBQmEsw05DReJlUv3y8mSfzpgzDpJBVLz74ZGhYl55Xks0vpitxlOw9
         G2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599644; x=1796204444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        b=feXWPTBb0qHvoqiS7tgnUnZJk9Ze+XXJecfEUaZyPy+ColdIGCQSzqUz0bKXaymZtl
         BRtGwlE7o9l4ktg7fhJqrz/uDgPc4kzjd5Ab62+iH4BbOXh1WMOFvCHqW1Z7niB+EoQ9
         p3Zl+Z3k3PokJIGo9n7Iq/UqCFAkbRWDWCD53GM3jWjyZiqZtSQn636F1XUSUMEh8Kgl
         nmRjLowirM2GRiMdgpH2Lg3b6Vh3iTra/0R8S9Wh2UvKbryP43RZm8OD0ZB61sNTTmtl
         k3jMFLt6ls42RSXVCPsWBq00PzjFp3vQoRsdTKXLa5gpzKf0L4L7TSGLHWj4EqtAcmzJ
         i4Fg==
X-Forwarded-Encrypted: i=1; AL+hErHIAlYUPXKsOKV7VshpLsEMdRsU8feSJytLOi++RGiSGuTwIoDjQdfV97QxsbnjYaKxnFbsOha80H3Ddr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+iHgoZIUay+lGn0eZ+Gp+fPX2+qUoQ/fHPqLBiZRudkI7rbbt
	WVpKPeERHR9kXd4SpITu9dIfflis9UmxNzBAhC5M+VbFbYFowKq8EUmwq2yv32wzDe6q1GIC1eV
	uuXMH+xYXI87hdGBMKISooHodKppYpxk=
X-Gm-Gg: AZFdTZe+TnVL4cehddZpXbUEsec3c/V6gjGtU/C1yx5+7qfKOKLIjp5n5iCzpS6EyV0
	/DJ0dxSzvK7pZVIy9VmkS4V+6CFSagtOvemG0EL85ax8PIZr8Bgv0D3cAEYDMMzOf2LHmKXlZ8q
	aY8MZcBEr/VIidr+7bFQioibhpRUA3JB2mecWOGGTYf7dDJqc9CiqmKKPSyfdDljUHX3IeF4gE/
	JPXvwDLy+eqcOik4jVc2TMwgJdNQFSYtI1CYoEGecH7hHwtl9d8YyuOdUErqQhh2oyMRNBoV/El
	er/AExWGVB1y5gxwfqzwKqqv+sj12EbgpOzWWvYZb0F8eRemVubUpcelWMP4VIjxPozDahskDHZ
	RoEyZil6ecpOPOMMPbIFx/flUN6M0q9FbQCbN1l7oU+RrfWhdr/BUxyus32HRCUSib8xTsPyvg2
	gPaG0fVwef0Tq3awGDCDw2kKsa2Tp0XyquLTm9UcB06fUrfYgg710Xf365
X-Received: by 2002:a05:6820:740b:b0:71a:ff98:1734 with SMTP id
 006d021491bc7-71b395674efmr12396945eaf.45.1795599643823; Wed, 25 Nov 2026
 01:40:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com> <20261124.215747.1090155063373507910.tomo@flapping.org>
In-Reply-To: <20261124.215747.1090155063373507910.tomo@flapping.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Wed, 25 Nov 2026 18:40:32 +0900
X-Gm-Features: Aa3M54pIN7Z7-kOVJu80h62SthWObgtP2wcxlpS5G_JuF9aGWICvZzW1W-c0JhI
Message-ID: <CAGAB666qnAjFnf41PQmG5kWWSb+Au01OgspPhvREotLGXTYwXQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] rust: net: phy: suspend may run without phy_device->lock
To: FUJITA Tomonori <tomo@flapping.org>
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com, tmgross@umich.edu, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 21:57:47 +0900 (JST), FUJITA Tomonori wrote:
>
> On Tue, 17 Nov 2026 19:36:18 +0900
> SeungJong Ha <engineer.jjhama@gmail.com> wrote:
>
> > Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
> > the same claim but are called under other conditions, and have no users.
> > Patch 2 makes `Device` generic over a lock context and documents when
> > the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
> > the `MaybeLocked` one.
>
> Can we use &Device and &mut Device instead of the new context types?
[...]

Yes, that is simpler. I will do that in v4. Two things to check first:

- genphy_soft_reset() reads autoneg and writes suspended, so I would keep
  it on &mut self. soft_reset gets &mut Device, and the SAFETY comment
  says that the phy_mii_ioctl() path is outside the guarantee.

- read() and write() take the MDIO bus lock, and &Device cannot say
  more than that the phy_device->lock state is off limits.

  In read_mmd and write_mmd the bus lock is already held, so they
  deadlock. A test driver whose read_mmd calls dev.read() hangs as soon
  as the PHY binds, and lockdep reports recursive locking on
  bus->mdio_lock. The path is phy_probe() -> genphy_read_abilities() ->
  genphy_c45_read_eee_abilities() -> phy_read_mmd().

  In match_phy_device they reach a device that may be bound to another
  driver, which the netdev AI review pointed out on v1  [1].

  Do you still want to keep these callbacks with &Device and document
  this, or wait until they can get accessors that fit their context?

Best regards,
SeungJong

[1] https://lore.kernel.org/r/179454612500.2199510.688554972467066283@kernel.org
