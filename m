Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629716;
	b=lEf/KiAbbaxElemDWDjD/4UuRVXAEsics+azD7pcE1aimTwARpZfUarPK+YCpWe+wUrG
	 vVgPAzpRJ5iF7ibXDcSS1XCrUPOnIIkcWvxmkXhFg33LABx4FP/BQzmXgKl0QEZeJ8tuu
	 Tp5tODkQv3zcy7wJJqDSfmjkOYTho32gne3j1tGfDj96UpNY6iEFJO63ZrwZYiI+xB2Rp
	 7dmMOE418N3vKry6F6rAEXycn3LSA1YgmLJbkA+ih4O5Q+T1Yby6gihWeeZgU2n5vV6eZ
	 hvyDyeguPnM1V6f09sifdN2nVq914FY/SINTE+7zhuTCYk0uUuNCMt3qmZgjn8hwdCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
	b=mCUWIskS+EUU+V4fNah1is5VglI3YdP/+YaZVjca0weZrDT2wxcpVH+6rkBg6eUmHOfg
	 0hdt4R90qnH7R35QjM5lueK6p5FTxkmS5Uf2x+95tB9aRr5i6qgadSo72P9mpTqtLJfVc
	 CIIoQ6wX+N9VSYm6F6v6QGCmkp7r6v643gpfF6kUZ2RR8szpxvmNh3YCjP1iox356Tzci
	 vXooDyKAFL4qFbhTLRbWD3CcTiEMaoiZIByFWgz/y8w5s3V2q2wNbDp0A7sXG16Z5d+dD
	 oT1HzUmQBmEg6noe7FFV1GYztDLKJ3xzaeGxhWeTJDPrmCoFZFwcdyp3GR6U9J4EVLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1AqyQGAv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E667606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E667606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1AqyQGAv
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c51a14bd405so193099766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629715; cv=none;
        d=google.com; s=arc-20260327;
        b=MNkuyXXFtOj6PWMJncSPSiLXL68sDiU71YSs8Nap76CwuzqKlmx93aR9asDnqC0fM7
         t5ywRrY5HJ0+omsJQrVJ+z90Rs9D8bDnTsiEdUv6JUb6zNU9CJpoAzfOVZxAUHPtPISj
         LuAbu3O+NEBGnKCnw8/Cksxcccih1hp3vY1T01IK+uO53mcHlebSKcJISMXTMXDRMBdb
         W19huGM0HZKU2q80QcpDn84nv+gXiFWnRFm5Mil/NK8N+kGwru5Bc2Ew7bRKSTNdvZrI
         UnbviQwnqtvQpkBWqABzeIf58tajZcsS6ZF8DSCgC7G7HswpYA9I59WVrgllfHvsBxeG
         kqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        fh=2uXX74qriN/lau7iar9y3HfA66l2PrhNVYA1Wcpvdfo=;
        b=Y5UIIpG/M1sJMK6tkeVV/Yd/OihK9Nxzwbya66t7LnNY1WiABJNiuDWn8FG1llteCe
         NpQmk9y6nBpC3Zux0Wa2S7FNjP2NQVUTdbokltzKj2dPTOuRM5iKbrmzkIPnfs9axaD9
         5QPorU9wLyM5HHItkfy6uASwskeXp71fIv9HbTb+JpCJfbuMD4cS0ZHfCk6LyUDa+XR3
         jdjApfEcxcha4R3/gdhG6QZw4SVvWvGWnaD6J+97ADRN91aPmIa/mMcgMgyXPwQHxPug
         6BpNcUQUWsJzpOibpnIMRJWcMdwyKL5THYeqjBMbHX9k6qzpMWYuQae2cDvNKaBiOEqi
         F1UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795629715; x=1796234515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=1AqyQGAv6vzNOGgyTFy57snW4o9MHPbh6PVD20GCOIDqqla4H5Xj8jdM6bYO1leusE
         2mp+XMhR/FKdsAuBX0p/3OHWwu7RNsfkfIzdMpFiDHK595hc//oXEYUIrpvvqL5WpUVO
         jAyhWBT8DyonHOSVtxH/BlFAXUHwx5/D639tu7i9xAMGKzj2w43x9OEJLSxenJTlRUKn
         MUr/6UR5LpXcQ6gLYSbTiEtXiu/ubRrYEmAKVXs4URYv7JkSehXOuC8/L+pEqAxzzkaV
         W/I+oX9Ww2JLF8g9gJOmscxkLb3ckyB6CdR09xndpPt3j/vbKQwpJ58eQYfmBMB+LVB9
         ARwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629715; x=1796234515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=AWTO6Oefn0DquSBxtZAYd3u9yT1sr4W/+J3/ho0ZD/KGvyN/YLqN1zomg0Qmwqcc/8
         unDacRgJEwLML6ZFW4OMmn0ZWFmnctehSO/vhqGjXNdDwcQMeZiilkTBTVNa7ZHYTgI1
         pE9zSdGo5QW/8LJd3DnTacBhg4cW4YJm9xTCQpJGZe9rWEO+VEgbkNqc0vGyRIUMOCWe
         3NwZWqxzWqZyYZMwvxVo5bdLH0DQaVTjRnaUBthqVb8WbEIUzD31iUBsrhIrqCqstFq/
         J1k2xkQKf1OHVwoCKZssg7YbioBjZ7LWxKb0nIMmB00j+RceV3+wJMGeqc5c2Tde7Jo5
         axTA==
X-Forwarded-Encrypted: i=1; AL+hErFE1U3LyCXaORXA8UA6AyCe88l3cAqDA2h+p/7XmlJVd5vO5HqYq9NrC215CfTCXJ7f6Wp7Iwz+3frkxfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8diA70fSGDILREWgrS9KSCKD5a21hXhFbuu4PSKnCi4ueKWLhX
	Vkv44PolrNdNNTeveg7RsLSTwEn4t+PSwmA5coQxGK5eM5eFkn3F1+vhfYAe8PRdN6TDD1avi8N
	7FmQHIatRBVAo9hucoiSWypvEMWWoUpxxzY9su8fL+Q==
X-Gm-Gg: AZFdTZdVFZGILfetj3YqWEeZ2460cRv7w6fs+6LKvPyZiNWcw0AgXH0EajUgOZZpc43
	x5ePX166TkmevpkHeam7mpbcuw+xw1vgT/L1TtXFro+slhpCl/2h06pUePfcJfl/RbweKtuOLgL
	zjwZUAYLwpCYhPB7yG4VTDf1yTY5h4wiM0LuME68rL1sw/IpqbFMKAUzaMhgGtYhpnHULxQ+KAm
	mKTL+OuirbZWQCPF6GMJDiYm6gTP4iT3TwpoF/TUtpP6y7qdRlgabwLUDGBa0Ie8laHc+qgAez7
	KBjY/jpUPjabMgUzNtDpN3UnjhcnjMFZxaD0XbIZMt3sTFVyvLMA8gbk7xBnbzKi6uBE7J2RT1Q
	BzWz3p2QRpUKp9JE7FVxPLPirVhwMn3XFAriXdumB3SeushxagQSslVqFFoEv9QBfsKhS
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c513ac496d8mr1123543566b.44.1795629714600; Wed, 25 Nov 2026
 10:01:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch> <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
 <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
In-Reply-To: <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 22:01:39 +0400
X-Gm-Features: Aa3M54rXKAuPqQg_Ygp0o8wODv5WUBqheLR9BXAdmhPLGte_-jSen4aa0CPalg8
Message-ID: <CAKTNdwHugVHb7hBzKHdorrCNmBanZ+k21GdMJieD7=_Z7446bg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 8:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > That way of_get_mac_address_nvmem() just works, so the MAC driver jus=
t
> > > needs to call of_get_mac_address() or of_get_ethdev_address().
> >
> > They still need to relax the size check as done by patch 2/5 in this
> > series, because the CPUID cell is 16 bytes long. Srinivas rejected a
> > prior version of this series that attempted to return cell contents of
> > different sizes depending on the use case. Currently any cell size !=3D
> > ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.
>
> Ah! I had not looked at the whole series.
>
> Having to change the core like this is an argument for doing it in the
> MAC driver. It asked for a MAC address. What it got back is not a MAC
> address if it does not have 6 octets.
>
> Please throw this all away and do it in the MAC driver. If there are
> multiple RealTek MAC drivers involved, you can put it into a little
> library and share it across the drivers.
>
> It is actually an interesting idea. Maybe it should be placed in
> of_net.c, so other drivers can use it. How generic is it having a CPU
> ID in the OTP? Are there other vendors doing it?

From a quick overview, Allwinner does a similar thing [1] by reading a
"SID" from its eFuses, and Amlogic [2] by reading its secure-monitor
serial number - so it's a reasonably common pattern. Everyone uses
their own derivation functions though.

I think I could try and add another branch in of_net.c to parse an
NVMEM cell called e.g. "unique-id" with platform-specified derivation
functions selected by the cell's compatible string. Then derive the
MAC index from the OF alias, so that the phandle argument can go away,
and the numbering cannot drift apart. Will send a v5 with that
approach if it works out.

[1] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/board/sunxi/board=
.c#L783-L828
[2] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/arch/arm/mach-mes=
on/board-common.c#L79-L107

Best regards,
Alexey
