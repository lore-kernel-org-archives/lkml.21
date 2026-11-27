Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773280;
	b=V5I/uLr1aCIkp24PlAhDj/1uNNXtr5vxKnVM5TQHUft7jy0IG4krMvJ/NvUAMuWldwmO
	 slJCeyASCOTqDMO5ZHkmW/qgTm6tiY2FbgL7WXunXdRmaaaod7eKBLUtvh8eZgg5lvWZM
	 iiUPyJtejRP2r5iJww/jG1BwmBK8lG9ZI6B5A21yngQ7VuzNqKOcT9TT4hUjYkH+O684Z
	 h2/oXLbqCp6mYfOyC/OYTVqIO5g08Vt1CTA+LtSzCN/RJAN35ZBYsy7TQvZ/1qjfLn3vu
	 ikIFxOHWwzbIcXfw7W+Nu3liFSJTwV3E+Hk9QwEnzweNEtI8S9WyAiY8CafdTEAWsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
	b=i/G/ENawpfpZupwavqkqi2LILbJdcjB1xC4DqJzoCbk/wA+1h/2eP28jdeZhin5h0w0Y
	 87TGxX9pTAhCmXegjRGIDZtPzzb57d9bRJ39DqIN4HtK85Rx4ZjcuZw/N29UXxV13Bb/v
	 iDUnvQNdMFoBVipLygVeLfXf5O4kqfXgcXtoRe6AAcWhTKH0z5Tt8jnL9PWY30IMH4l2v
	 eUiSumUDkDrZIo+YEUzUgL4hn8/ckZeM8no4uAoMuzPwFOSEsbEiCpoFjgwwP2SgBH+7Q
	 yMYKaAzI+/pZmjV4sqb6OcQ2G2uTI5++bEEYnJ4SCmv5H0vRCfTNt9MFpk9aKuQsEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gF4N7eR6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395C606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1395C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gF4N7eR6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so63908675e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795773278; x=1796378078; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=gF4N7eR6wbYxwpQdFZRD8u17QtLAeOHIGciJxFGFH0qkLFvkBGSIn4zqV/9OUhTqk2
         FYuKv7WGQ3iuusTnIDVnRWlXfcm9AUa9E4borOHqUGVvpakVeRHFSjA7LPh4mADdfGkQ
         9XpGyPmX/jQubZVBdjszhdl4P2WDYuk9W4knbSftqmc79Rwlxo2hR4FCYOkOnOJuDsrW
         S84pjwAOq1EUSEIyhkZGtLuNEFo5ZWBYq4vRy8m52F8z9HTiFIw8XYNL2Gq+1TaZ3Ike
         gnRQ/HSdhJ7Xq9dplpKJd63EkMUZ0cBh4ordEUr4F0NALX62RlM1bBuSuofWgLjYav2K
         gT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773278; x=1796378078;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=kCVP6YpVBPqNHeavyaaWVT/gwZLGn4bHnbX5Fx/DbWvOJx9ftNivBoN4z4m8X6d3m1
         KXrfhrb1GhhiXx8c/5580GB6Y/MnATCDqmPqgk+QoeD6byx8EQwd7eGJqPc+8j7lA6nd
         2CYBpwtM+ZI/890ov05D2qlO4emcYSGDVbNRz678/6GPPSzMc5PGTeo7NTQ6PR/FjGYN
         dGRwrZPNf7AcJ984R6e+LrzgiSl2S1Uo/Th4ZDgc2ZphQ6iRdj3r8yZEfqPD3PTMtzoF
         ni1azpCZEhTooeyCZhlAa44RZvnIRgYIgte/pe0XrxPYfYuikDoWnwLltH0GB24twzve
         NHpg==
X-Forwarded-Encrypted: i=1; AL+hErHe7iI7xE3AAu7kY230U3B8oY9rwA3dIOCWyEJkwjEtTtUwj6GJrd1O7WYy/patCGjgRcVmHB6uw/uuqFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fqLIb+GQiPElWZ2B8xcs0dElhDjSLN9+wYrcUrS36KUzfHnJU
	89uwud/FIbazwpbDHqjURzEN+0ofhSOdCvgvm4hKns6dGoT7QC/nKBUirQdo1eZ3SBw=
X-Gm-Gg: AZFdTZf35pjkeA/DI9fV/BHkHFOcD2nIjjSNHfvRcAao4FX14msSPqKY132VwOqGxN/
	fmbItlerT8SXaGkZobkjfCwWW34PHeS56QUvujsoo7HQiVEYetQ06IneF3sUVndQOpzJNC/M2Og
	OX3UxrhjnmoFNKgELcAM0FlHgEPs1t+Lo7bfImskvsuaH3qfLz1FzCLkQqtnrsomIXqJs7kI3GP
	vSFfl4aFewUCvURbNQivPh1vQ4OMoF7P5Rwad4VTz+G+mU6cPW3z5XJjKByv8e1iQIIblkFvtsB
	hHiX+6eIt2AWJdfDzfRk6O7ZbkGna1wXgFCyetAeATqAclJ6Bah5iZZ3zG7xBWvf6jqRB/2S1dT
	r0/+wT8fl1P5j1TYoKRr67OeDkREZC+IPWnvskK0LuiVcl7+PC8xNl3O20Eh3y0t1hj8N3qEA6u
	GxsQ0JVo4gyr1u0IaFUii/RfBohwxxalsw37sZxpovVZC2+mLQcVue2mgWr8ghPzJYTnG4207Zf
	kI1lA3LA8mOIG0VmIADL4XEL9cLbaTTQmYfb0DkHp84EnTKuHBoURiwgXHAHVTOhwGKq1K17njB
	TWDwdQuhld94L6ydJeMTBsaFeL3eJDUwkLDGPThprS+LIObd
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr473789905e9.10.1795773278505;
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560118415e9.9.2026.11.27.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Andre Przywara
 <andre.przywara@arm.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alastair
 D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for
 Allwinner A733 GMAC210
In-Reply-To: <20261126064345.2569445-1-alastair@d-silva.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
 <20261126064345.2569445-1-alastair@d-silva.org>
Date: Fri, 27 Nov 2026 10:54:37 +0100
Message-ID: <1jik1iwqea.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 17:43, Alastair D'Silva <alastair@d-silva.org> wrote:

> Hi Jerome,
>
> While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
> two hardware differences that also affect this series:
>
> 1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
>    Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
>    CLK_OUT back to the MAC and stalls on 1 Gbps TX with
>    SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
>    matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
>    will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
>    boards work.
>
> 2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
>    With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
>    delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
>    top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
>    it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
>    0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
>    inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.
>
> I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
> series and address these in follow-on patches unless you intend to
> roll them into a v4.

Hi,

I'll resend the series soon. I don't think there was a major change
request on it. The way forward on the delay matter was not
entirely clear to me to be honest but I know a similar discussion was
happening on an Amlogic series. I need to check this pan out.

I'd suggest you build your changes on top this. I can't test your property
changes without the board so it is better if it comes from you.

>
> Thanks,
> Alastair

-- 
Jerome
