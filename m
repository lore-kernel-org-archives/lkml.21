Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435976;
	b=putoBJEQZdXMP7w5+HHlA/ot8A0njW1rvfvXXw98VJhJLHQzpdkR8wPXdIvfNatEf2/s
	 0wDeVNI4Eo/Jup/NcPYRoSA4T6waUovtT5yE44H+SPI2IKjbDf7V3TMhehdd7hzbW6ivd
	 YpgEXhOYeMo20WgaJuMkGXJR1DkUe6LRB1P3AlWF0otVZiyCIWcpS1kgeRfiCSzFgZSAG
	 mR2xRKfFWoQ9l6RRUtosi1dHj4Dd2qDa6HQuN4D8rYwmwa+7na3GMMUlF8w5WuGoGFaMr
	 Ai465LQRdg+ounkfa+7mfRtpvVGpveZPiREP7xREtKUXS7yDRVwFeqipqK/ertZuCHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
	b=KKr3YhbrbO37ax9YU4rs9/eW8qYYPf0vFdjbTj9ZlnczXSB1ZGxaqBNuutghdMfeiimM
	 ingJthQGUssFqpneR9N+jdtbg2go/7Rv7+U469iasvKRGIpBScN14RncM8N3hRAZwh6Cu
	 s2k6Oe7jG4OjwORdfJD++Mx1a7lR9SVn2N4IBXSpMbkUsZyK447ChCcT1X8RkMb9Y9Xio
	 ujrkJn0t3v9+YlWTSudsA11CVkRX0nMO6v6L39h+bG3sxl13BeXUfJtXLWQ5Jb8PyA2cu
	 73sGoejcvLo1QDFqUA74swkdEygqOPMEq6YxzqvKF5CIXHBXOOQUab+n68p04NW9+/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WTRBxD68;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735CE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WTRBxD68
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04fab527eso22543825ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795435975; x=1796040775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=WTRBxD68mxmBMUDeAcOF2tKZEqSYLCNUPKR85w6u7MFXIi2cEY8cj7JgvwVfUVamf3
         P3Pzqoy8IB5bJg5Jvw1kPnvb0djMTIY/9w0jM5vY8oNuUqKdI3XLEYS4gpwgxNBfynhg
         s6mqbd87klkVJZHdWFt+1ocI8nSEQWDirNwAIo63O0wD6JTmO06YpbWx5miMMvVj0ZtG
         9O7l4vC0eza5ltf6pB7NAQUiisSQ/gpbfSqbv5jhENm7GSI2lP7+ZygOgxOdLIzN8evb
         GQAzNieO5N6KyvouZSRIDKMLvt//iHVrhPhfu2Szrgk4pGaHElaecKWP9dD0HMS40oKB
         Vd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435975; x=1796040775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=h60lPeskxZsuGhFCHE6MlQNWDuFgYpJkyDUvrqFBINRZdj6ddyc0WZ1Erf//AIMCDw
         vlWyuOGU39VUvqo5YFMzxSDoav2GX9b42LB9q/WHtvD1LLC/i8qo0sLVrnZUsP4r/ABZ
         ZD5d//RzVL2+xvdftuNtnTaoKRWTuNrVdk6ul9lEEhP+kjWKe4osGHXl/E2tqmfo5TUq
         shmbTP85Oen0xwMTwmz8YKyieWGfM3DE1tPHufK4y92Y+kG2HXby65b46Wt0oaFkGE0U
         asofFKtIXST9lpqPZ6Us6LPJihML+YvMLQNsmz2Dqqw50LDTlZwDIusiMcINRnCSi+Oy
         0dlw==
X-Forwarded-Encrypted: i=1; AL+hErFRvNHta2HViDxk2k3IotXduzCrMqqJG4DYKnoFtibN7qDtA9zts5K0RShXG6fH6Zjb5jo2x1x36eLOnTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z94FSYVYvQzIpR48dx1c5R3nnGR+anQ/uf/KL4Ax0Hi9Ifm8foO
	+H3+sjHwx9IE26pz0s8vJAhK3p8m5sOCQK1pUBVCR1ei8Js0BUtsZKzAVGa76BAKyyZSXmX2QwJ
	kQF2w+btsYE4=
X-Gm-Gg: AZFdTZfxCHW/gH9sRTVPFoBmr+oN3se42obtk50/pny/dZree2RMHA0d8vekHBgAKBU
	XPeo/+WXAcSdr6GbOuQ7NHQLA7A4pIiND6TsHZ6Kht6yKLK94ccMSk4f0i9JebIJt7z79c6O77i
	x3cfX/jL/pP8Fq9k4a/zABV7r3wRgvD6JVJaoYHu3LR6jue5vOfq5YwJf6D0/Oa6GLwXLWCMAdJ
	je4fUzJt8cTAZZVP3qLZE160Lz4M9ufSuNqgiWBoygii65McwiZGVqnLS/0eFDQR+H1Tto+6iOV
	jhYPza3ryL0NNvDuNyZ56D/FTQBvtb5S0hXgAcaJqdv10iboKdWby8saz1g5ZIUh/X1MoSFGkT1
	1QQoGeAG1e/SUekOXQGq223kMeKEfPz+6Zzgvq8FrVaiSmSnGpJUeqKCf2PrlYSjkueNvrFSqAx
	NM3L6tf0VDFi0RX7GoJKrwmDKdtunWH+FRezW1B2jZ7WiRAb5B25mHYJkwEOPPgkhnM5vwNvBUh
	Vq4FxwOBFHvtrgYhoCiV3lSklb4MteuaITbImLQ4Jc2cVgHv4pCyzE5bTqPHaJYfi6A4w8LaKTz
	Lr/yBEADurK4B2q5bgK7wgI4TMDhwMSTKnZAvSMUa9xRiI8ALg2UujyUaQEDE1UsePR/TSbkJLc
	E1ntdeesWqZSoAzMPxQ==
X-Received: by 2002:a17:903:1ce:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2f03f1ea636mr110975425ad.25.1795435974723;
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm12731675ad.37.2026.11.23.04.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Mon, 23 Nov 2026 19:12:49 +0700
Message-ID: <20261123121249.43867-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
References: <cover.1793669297.git.jjc@jclark.com> <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 12:37:43PM +0100, Thorsten Leemhuis wrote:
> James, Alan, what happened to this? Looks like it feel through the
> cracks after Alan's "This is all starting to sound very complicated and
> fragile.  Isn't there any way to simplify it?" later in the thread,
> which was more than two weeks ago. Or was this regression fixed and I
> just missed it?

It's not fixed yet. After Alan's comment I dropped the pre_probe
approach. v4 instead had onboard_usb_dev call the generic driver's
operations itself, so that it can defer before the hub is configured
(Johan's first suggestion). Alan acked the USB core patch. v5 is the
current version, sent on 2026-11-07:

https://lore.kernel.org/all/cover.1794018128.git.jjc@jclark.com/

My understanding is that patch 2 is waiting for a review from Matthias,
as onboard_usb_dev maintainer.

> Side note: another regression bisected to the above mentioned culprit
> was reported recently:
>
> gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
> https://lore.kernel.org/all/20261115-hc4-gpio-shared-od-1@iav.lv/
>
> Doesn't look related from a quick look, but well, at the same time I
> wonder if there is some subtle connection.

I don't think they're related.

James
