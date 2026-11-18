Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036878;
	b=wWFVSIAj+Pr1NK2Als6QSS2weizGG/nUOXsweLKBnK4Tr2yxoOJJaLSefCFrrrCR6AF0
	 UZTzn4B7EqCDcSThB1P1SqnR56yyfsFZkZu3HQxJH2cJqTduchlT9TVJeHChBwfZGGXUe
	 ag3arYxh+Gu0Z9aDECXRvpvRkzrKmYFQFu/tP0tHqCO+lrzQxPLWFDaqU0vlSkZuH339J
	 Wb82+lmNFuTLzUBSbja7d/hNijj8qN9HZkIUZckaM73ThZ/IcMM/3Fws9y19dHYTjb0Ow
	 NlzucuagiRCB2e4YsR04mg0QO22Kci3UNG0UmkHqet+0ho0KmTKeEq6sJB6nmL2+itg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ca1nIBMqrrLHE7ETNS2F+Z7D0jHo3mjnb9yE820o6xI=;
	b=2eK98q7JgxD01MdhYdoDFbcK06U11UfyobPVjRORobDs47TCN3D27C2EPxfIVL7k+YBn
	 iSUOhDqNIjWYlduhYs4g6HvGGUAVZpuYKmUsNjo3nkyFFFzz/PP7Af4Fi+H6T/M6x6LzL
	 R68pOPEVkbw87hMU10D609ADWeC/EHjbzerCZ4u2GNMBgOjVIm/t4ZyrmIfuUfez9+JET
	 ksH1Yeat3plL2QC7J8TzPsN3DrgxxG3ygnLoUeKNgtb4Cu5HmDigBkoGHqpysN4JCNp9g
	 w1eZi9+EGbq6k7opoDmTvpyh/pP1KPhDP+PO7D7FUSOOhq+JJSqtjfIZ/1jwQhzeQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9MvpOpM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFC60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BFC60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9MvpOpM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so7855365e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036877; x=1795641677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ca1nIBMqrrLHE7ETNS2F+Z7D0jHo3mjnb9yE820o6xI=;
        b=x9MvpOpMGJv0dY6WKoM5JghyqSy+AeRnxvfmvKZV9q/bAtIPceR62w4pWwcarpFeBy
         eQQyxH1W1V00n2CX0Mxs7kxHJhWvxjiiQmdY0KbYjiWBa7xSnbUDjNl9qWhvrjuLqmUv
         Xt8B6hieyrrd9GqmgXt/fy26/VJ/QdRSBmbH68bNRs1q13/ndfzjkW6QJviGjV8ankfn
         ocu3KGjGF/CEEiJMva0QkIElRdXN82IjpdX8a0wMXtRQxYTmpzOyP1XPCrZKcGTTsFn4
         htt1doU+dkW4OzqHm6UGy2EYK3aOLWzTESl+baXiVMUGvAezZXCK1dJbPZ79o2OJUdYW
         7qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036877; x=1795641677;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca1nIBMqrrLHE7ETNS2F+Z7D0jHo3mjnb9yE820o6xI=;
        b=p7XL+YuDRTwBDL4vgx+XkbVdJ9VDpNpShEY6gA0uMGhnt3sBN5qUEu9490l+gMyUSo
         gvTGUiT9VfFBYTPd8bYoS16cpxpCl0qchHdlJNZY9cGf1+0GzP0SEPRm4qZBOVlOfEdZ
         Ja7WhAjDnTf2KjUKqkIWZ2nBXsuQnwX1ZHRytH0/ypQf5X9YMe5AdcASy3TrOVzuR6eT
         pcpVPuggM9uUpKPvQ6WARNI4AOW3Svnxp4+6OdbfCvpJiwnznFNXlb4dNrqjpgfacjgR
         jdOqO6FkcNiS4OpXQjiAhKn7CFqxDPlg16uVQWXTYGatklOvpQFalBKbf62jhFJgOymG
         hUmA==
X-Forwarded-Encrypted: i=1; AL+hErF3jPebxqpu7gg64qUnCvGjSV4buEXbMaqhgegvSrcc6Fmjzy0ZWbhh+h6vutFTaUJ5BVl2Qq2VLjGu7aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8igbq37oIQj2+zWbhH9NAM8CaB3LTsB/+MOxfUwHkhJPvY7YBs
	J9IMM1XBcnHPVb74mPopIjajLGazclorQ2qlhxK7bLy50lkHy8jBqr8R
X-Gm-Gg: AYBFou0nr9/Rk9YP6UQ5dq1Dgmxw6kUzzsHW9C22JZvF4BP1chMMzWDeC6uUukm42AU
	0kwHyjH0h0NXDgdZhyLW3yIbTbbEPKcLQ6PDA33XrD7hNPNbetsEJztFLwa4Az2ys3LhZe4FWsm
	nQ+oQPeu8uhDHqyMBdHzE7TImrG17o+YnRzPlXzpVFuDqjxLJiKtrc4VXcklEvz1KtoyZDEhhmx
	XuJmLcf6f+THC5h63Had0y0Ird6IbVkIWkR7Uebi5A7yRyvOiJIchksuBi1NpciPNN1rbPE5PoE
	dtpKFQe7EAbgn0+7gCPDFqqgR+lAcbUMPud8HkwsquGySbtrIMBYICIdJXJkxyxftDTGz/r9NwJ
	i2mGOzbqRKEU38KpAQhZ10qCSwNlKEssAgvatntqO0vMY3DXjnjU7K7YMXfnUw8T/25pIcIrlUS
	mTLZ+LWm7u5+ZjaY1CM95tsk1YxNcF+mBX/1seHolBSrwgPeLZ20nKxp0/BvwNoEdhX7ZULRtlW
	z0mBIEpe3bUlEPiVejh7RL/NjnnG7e9NnU8D8v1CEXe+u0FFn/Nkyf6aVew8i+DhlYr12TwVYcC
	xCpwOXxhm3xdW9Z+l7MX8/tiNiiulvUOEKmsZgv/ylg0c7qqwBajWSY=
X-Received: by 2002:a05:600d:4:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb818d8df2mr30863675e9.23.1795036876600;
        Wed, 18 Nov 2026 13:21:16 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e513c28sm36914945e9.0.2026.11.18.13.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:21:15 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] drm/tilcdc: Implement state readout support
Date: Wed, 18 Nov 2026 22:21:14 +0100
Message-Id: <20261118212114.150992-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <avs2dagfmQkv00H0@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 16, 2026 at 06:12:50PM +0100, Maxime Ripard wrote:
> > - The channel order isn't stored, so RGB is reported for the adopted
> >   framebuffer. It doesn't change what's on screen.
>
> You mean RGB vs BGR? It's not available anywhere in a register?

Right, there's no swap bit in the LCDC. The order comes from the board
wiring, which the DT describes with blue-and-red-wiring, and the driver
already uses it to pick the format list. I'll use that in the readout
instead of always reporting RGB.

> > - tilcdc_crtc_mode_fixup() is undone to get the requested mode, but a
> >   positive sync can't be told from a mode that doesn't specify it.
>
> That's suprising as well, the polairity of signals is typically stored
> somewhere in a register.

It is, in RASTER_TIMING_2 (INVERT_HSYNC and INVERT_VSYNC), so the actual
polarity is read back fine. What's lost is the difference between a mode
that asks for DRM_MODE_FLAG_PHSYNC and one with no polarity flag at all:
both end up with the same register value, and the readout can only pick
one of them. I'll reword the commit message.

> You need to give some leeway there. It's unlikely you'll ever going to
> be an exact match for the mode being used due to clock rounding.
> [...]
> We handle that in tidss by looking for the closest rate match and see if
> it falls into the specified tolerance
> (dispc_find_closest_refresh_rate_from_clk). I always thought of it as
> something that could be turned into a helper, and it's what you should
> be using here.

Makes sense, I'll use the same approach in tilcdc, and see if it can be
turned into a common helper along the way.

> That part is
> https://lore.kernel.org/all/20261116-drm-no-more-config-reset-v2-43-0bb471f4d1e0@kernel.org/
> with hw_reset that sashiko pointed out

Ok, I'll drop it from my patch and base on top of that one.

Thanks,
Màxim
