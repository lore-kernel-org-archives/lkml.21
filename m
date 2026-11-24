Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553449;
	b=3ZOcqrFhp8Oq0wC5ztVHTzej+7gjHzzNKTvLCXZ2U0PmpEEqCs/bwQHMG8a6gLok3Dpr
	 aTEH3d/ywiyE7OO8qW27XepnsOIbdcfPC8dH1IBb1Ku7KgwrgeKl6V9A46Kh/wIPceFFE
	 DT134zmRm4yY3ojXgcOw1v2ivOEEZoJ9AMYZdeqskFxb5KJ+8pZMqutJqIxxWSQhKOW1y
	 MpoxPwOpIIVyKlx2jyVyLenaTzB+f2k4GxscMQa8QXG6X2b07cn90Mj2LrdOIu4aDQAKF
	 giZzM5JbZmYNwat3+luTnO7E38dhEYg0WCiAU5R2ZS29iFYFbsnzJtLznS/GFQMRUAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
	b=xUq9kkNaxqPX6PnkrVHoXYFgcJQCP/2r1jtxlqMuhmFsA/qkcB+4s2YbAA+W7vSo38df
	 qVO9uZmrnpBHIj854XLpoLs4EHFtSJqCmOD6IpQG/LO6qKAdj0QTy15Jt0+6586mY5idH
	 tYE8q/0dywVeVhhE1SqXZagcNITr/qvRui/XTKqzcYBvq9zYEvAOLRkMlLzZfUIJ/TUaG
	 9TcfptZXM+6VR+oyGgG+kRAsHi/Y1KqMOR8LmzCEJnGcX8jmw35GDHiqNpye6LuLGAvnx
	 UuH0c/062Iq3sTZv5iSSbGvdlyq3eVPeG4D8H8QIWxn6StXDDqfKTN1O0A9IONKhZ6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ESkkoTdj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ESkkoTdj
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4e246acc2so35918967b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553448; cv=none;
        d=google.com; s=arc-20260327;
        b=RwIGOBsh1sKyfOqdG1fBqBEyn6JMvXWVhfVplht2fwgwS0G3sZ5goOH7NLkdxhbqZu
         ZmGaNagxDEV4DcCe3YNeuaMEY6PvRLCGqKZwzhtiIFZvzsUUP0SwnO5uKH/zJhuZSwMm
         93xGviS4tmLiwWpCrHYD/fNZtB+XP9Epkh+FX/ABlk3ZDIpSOvbWcM3ZO7wj4un6ETtS
         R03UbgdqeEVQYsMt/2ez+0wsGVps+MIA2gaY42+/bxuB9SVI2pleLRuSFAzazu14g1wK
         hJ/H9KmRtvLX7qY/L2+58ezsdwB7PwgB4jUS2TQVBH0YZLLQzV9EkaQ5Iqer5ABkVI2F
         miNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        fh=rqU5hSJnC7EYImDmFBqadLbifUlRJ0I7fBYGn0Jx8QA=;
        b=VpCPY/OYLvSaR+1ptzHO76FuT7NBBkX2NLpPy31aZYt/Mg7/rNxAaRBW+/4YpfD1Ps
         NZbUn+bvbkgC6VxyeAoOmxQzsZ9eGUB4U1mAYfBHzxLcMeUfFs4axTr0/MVk3Bvxi7fG
         /DNm5gXfTKCr84Epa80RpuGSWbz7FHkLGDY1wQvK8fRh80LTsh+3lZYhE1VY0glrv3K+
         9Ixrysc11YrZokH45WWAa0CFA43CmPtAI74GCkwPWk/TrVDFPZ1ybbyZWi2uugz2wst5
         zYaU4LX8MAdoC9ZpkI29EaXpL63MyJRLJAqKDLyHJsqGw+X+tSw+5xFZ2l/1TqBuXltd
         3BTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553448; x=1796158248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=ESkkoTdjbwmuFdjAfks9Lc+duJRqosDcUvfCEui/zJv26FMbm5Huy3zKeShC5aDRAh
         2K2WOrvfiXnnc6HpXf6tuOUk89LdpKhOA2e/r4vl+z+qCGbYfg1wHLUbyi8fM3zREajb
         zZC53UGAUMlLt77yEAG0Eg3aMM6euBGA7Ff2Ab8/qsdjQb0bqSbsSXNj26XO6S3z6iPt
         FzFr3Rlao3sSgf+V1rkWdPSS/bHGvujI0lCTFB5iN8Mx1MR/nSh6Hay1ei/Odci72sBE
         odfpXRYmBgWpYqt9roq3gJy6fiULArMr4+1loQL6IwHs1c6ScfKWAT17gdDE+cqQ0lAv
         7WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553448; x=1796158248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=k39PDKIs/KuHBQ1h5j+DTcb+LWQE8AXUWxm7P/Zlu9NTSqz6YZteotY0A/SrjMDXtR
         G0i5/gofFgLbXrDcC9/xwxcjuvVwXixkVhYUgwrC+YFnZgsZXM1CqkTrsH1Y2VQEmbo8
         78wjg+6H0xE/avxr410widxVid0HdO7siv7umYRTSPTQgiPGOh3X0Ev0IU7a/5QdhNoF
         dKl94s5IotK5T43qtL3cFxyJ7vuRWiSrbBXhQQD1X/nQQqdXKcH2PrPXYC2+rzhCiprM
         XreH7PxFNGtNOEzCGMdLAXQoMU3zwIRhQpRL+ZH67tXYzvBwv0mGYJ00G+3FaFM1kRxf
         3j6w==
X-Forwarded-Encrypted: i=1; AL+hErGHsC8oufeOLEfQvCrJIjD8bHw2345RLNZ/NSyfqIIK9lIRyuGDyr/ivLRaaDpbVyse6+iz9WyRydHd5wY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5BmfnU9Bt7bTI02wt/QVHFyjmN9rC57HAWAu4ki46FaMPxDQH
	uRAT5ed0ru8wJKT7ARGtMyQPoiA3X0Y/QpCX7GGcPUzVsIxASNE0aaX503ufDuNT66vU7aIU/WJ
	JVRkw2D/yFYzg9FaNi/lkJNhX5YFvnTo=
X-Gm-Gg: AZFdTZfa7+FBPaoVkHegmXxIBPRCCkjchug2Sn2Td06UKBPspdb8Vo+1WEOZHYpBJZf
	0GOU901+TUVju3vUynMWXJICDEpFdfTUoe20JSmpJpkaHoST1W8g/uF93nCgBoPsGTTmQasaoG9
	xZAWa/Iq2tAbiprHmZnXtLQtY4qiKPDoKBCacIkMoVhMeN6kt6kmTuEKfy37zVTZk7ExEfQWTOA
	kAlmMjq/5lrt1lABYCIzOxvX7ZtfJZu8PaRdmcAVGUJXHXSILGOfatsxQp6Gk/n2GJ1dp44ukgP
	Tprf/llifRffZ8tp8uBUXgzTqYOsW6HjP6lHj1IM31fh1VN0cTritDQ++AdHVJRNksq+tvSWMKw
	pSmmBLg7AH9rt9DO+s+HoW+5u04U8h1JoicaCBt4LoV4t0lF1Q7uPSsGb0en2Tl9Qgr7lhDLb0q
	VakP0CdN5+jLXWdoY=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr64922377b3.35.1795553448224; Tue, 24 Nov 2026
 12:50:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
In-Reply-To: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:50:37 +0100
X-Gm-Features: Aa3M54qQgZtHIRJ2rEKu9YwpwMfEmR_bHT9xQyRDCd8xOxY9i9IjLVm41ypmXlU
Message-ID: <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: iav@iav.lv
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Tue, Nov 17, 2026 at 1:54=E2=80=AFAM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
>
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
>
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
>
> Set the data path bits only when the PHY the MAC attaches sits on the
> internal bus. Look the PHY up with fwnode_get_phy_node(), as stmmac
> does, so phy-handle and the deprecated phy and phy-device all count.
>
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
sorry, I'm late to the party.

I have just reviewed Lucas patch [0] which adds Ethernet support for the T7=
 SoC.
He kept the internal MDIO mux path disabled by default, so boards
using it will have to enable it.
Have you tested that approach as well? If not: it would be great if
you could investigate the pros/cons of your approach vs. Lucas'
approach.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20261121213102.143130-1-tanure@li=
nux.com/T/#ma3b325147d6277c4d95dff83cf5bfcb75c1477d0
