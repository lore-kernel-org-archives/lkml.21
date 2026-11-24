Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529484;
	b=DWH5UNHffCXNJya1cQfb1YGPdf0JX1EaosjuraarCFD7aNlJsf9aaD5fnjN6/GrvxPLy
	 JQNWS31aM5MGLNHwquh7RtDJnzonBkeda8PmHpXXeBlmjKiFeezjImbyeMzI6dVy8DOyC
	 TxqMSy9F6hotyj/RtPK1lXmZPXjFqX5mhpXsxjLMacD5WEaFMvrPrW/ltjXg+8oRdhgeu
	 UVxRN8xnhIRQ/Vi4Zf1gAXfnjo/T8CFylPAoMaR0rPGmgHofY/CHF+difNzT+f5DSagnA
	 r0OA5jfIR6+cbVLlU4/Ldm0e3AITJLrf+X6+HXfYzrURZCgTgCMtuViXhzkewwIOhLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iCvyfFUl0IzhjF6ZOx8Uvl3XeIM4nkq47bTo1+RuUoc=;
	b=GLQtT3hv0rAm08bFE4HgjVSGqM5zKZxtNYYb6sYaCeEdr/knzUo2/DHKS6jAro2KzgH9
	 2evAn1pvy/YClP/dHIjSy4VqQRz9NfWWK4EJMGE+zBD24DIzqxAY53YZLJPEbnFL0hm4i
	 uE8a6yFRljWs0ip8WJi1MzmerxCWU7hSbun0bui9jUEKHsRhOxblTHMJec19M/yRlNGps
	 ul/S6y0aJU36PR7IJUSrj8fnUgOkDutojiAlm+If/t/pmN/v4oh0AXUJG4snMbOnGUqjH
	 PZMCFZwygbSu5Ci9m0vVZuAGykyG5U3ghheTZsqi+CbLYDP5SPvPlZDpLiwQ+CAb21w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dozp4m4O;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2801606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2801606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dozp4m4O
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so29524955e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529482; x=1796134282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iCvyfFUl0IzhjF6ZOx8Uvl3XeIM4nkq47bTo1+RuUoc=;
        b=Dozp4m4OBi1yvFU90tSqp+6aDcPZOrX/MQchEUIwamqpL2wbPjprpIEI+DhA05IY3J
         IDqoI3D+FsBq8Gpl2M3Agnetcc9Si0kel6/T663e7euWOS2uHLBpwz2KrKCiMNk94MD6
         2/QDujPzBjl/Ot3pgBPRsUru19itTQNbeQ1txuFIORiEKmaq3ZwNlyn1TrCYL7FNx7JB
         Jeeg+T/Q2YN42OUS6TN1lY3nbbGUddAFrNbXPVIeQK8JWcVXJizXSzQ4ykRlMzKIo+tI
         sutLKfzUb2cyirMhQVuvaklnoULE71zL3c7TZr0imL0otXyCwOpE1qQoYZV1w+VyJ4FB
         nELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529482; x=1796134282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCvyfFUl0IzhjF6ZOx8Uvl3XeIM4nkq47bTo1+RuUoc=;
        b=O5hbad/I2V15d8ekgIvVQSDxt//ZxWOP4yPi9lPTUztwydvT/p/dQUYie9IhfFNmva
         zZ/H5Ucn4OmvcC5AD1VsuBW3GyOD5EU0sMWNtc5VfKvo+dTD7sA6rvYov7vJe8QProGI
         69UalZRc8/NA/3q9QLCvRWOsAZQaD+0EsB1MnECYx65fWgHUwMtVpePGff02oNk/f9Wb
         h7DVBKv0vejTzcSNUJuepSLmPjCkBju3qANZtBVNTWd4bjFbOWOi772TaT70P+b8Msq/
         9AOiYPXwisIXiazcwCvRymp6XIwPfRHUxio63EP6wiQl3S0dn6Hym/4ErRRqEpzkHrsg
         jXlQ==
X-Forwarded-Encrypted: i=1; AL+hErEYG3pa4m2lKNnUpSWk0VFvd67H1Cdjr2yUvjmxsyF20DNYL94HDvpCmQpdkEbQ4WIF3LUbiSUyy0q3h60=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PTjnz8YMPlFosvr6KtsXXSVbP2WdMdqJbWp7YOltDzgU4dPPV
	jpcD8eXpoRqK2z8QOywgq+nEToJhCVAVgFS/OfPn25AFHe2Jat5QZfiJ
X-Gm-Gg: AZFdTZcqeL5c2zPwnTbz9si5r1lQJ3qMgLH4c9efB9ZEczUq72eDGz0pcQktqIbQdFR
	mcF6+oq5s2jWZHDfIDFBjQGuKpluSvsUNxuZw7Aa7hMiCg4rNGAyADVDCxR9aGPGGq0WZrItBTA
	dJqBcj1zWyiYAUe//n89+g6dQCy25h/Jlgnp+amJ0u39Oj5c+A2+GVhgHL0nHBE4HSV0IfsxxB+
	mUZnoeN1V8+zQ/0XdenHzUqoV//iOiqOf6ghpiagkO87zpdR+68kzXCrOEItug17aiDk/YbU+FU
	u0+7g+gvO4LNsOdZ6FGZe0E8G85J10Kbbi85KirONzhLrPhJG47yx4FlYZ0FcpS+mYCTevuLIzu
	J+6uXHNVCynwA49kQFF60nfM99JIAqjrkf3HEn6PpnUxhWLoOtlaKgCImNWOKd3oMzr+6lVZHjY
	vXcJzRsHcgPlA6s+myCHAc39JKMcWkiI0sMLaSoVcKNZ5t+RPKOt6+jolqG29WjsOnPJ9HLKNE/
	jD9k6YidI5k3w/okmN2yhvsd1N6zZ45RdpV3zLtynCftkInRrqv2KWwtt5tlB/eJVbldYMwt6hG
	5MU2fLbu4HQPIM/bk0fJ8QCp79aQxzQ9dX3Xfr8vygmzGbByTRy5ubw=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr287311235e9.9.1795529482013;
        Tue, 24 Nov 2026 06:11:22 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm27952654f8f.38.2026.11.24.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:11:21 -0800 (PST)
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
Date: Tue, 24 Nov 2026 15:11:19 +0100
Message-Id: <20261124141119.441163-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118212114.150992-1-maximpedraza@gmail.com>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat> <20261118212114.150992-1-maximpedraza@gmail.com>
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

On Wed, Nov 18, 2026 at 10:21:14PM +0100, Màxim Pedraza Padilla wrote:
> Makes sense, I'll use the same approach in tilcdc, and see if it can be
> turned into a common helper along the way.

A follow-up on this one, now that I've rebased on v9. I ended up doing
it differently, so I'd rather explain why before sending the next
version.

The tidss approach rounds the clock to the closest standard refresh rate.
Panels driven by tilcdc often don't use one: with the timings from its
datasheet, the panel on this board runs at 56.8 Hz (33.3 MHz), which would
be read back as 60 Hz and 35.19 MHz. The adopted mode would then never
match the panel mode, even with U-Boot programming exactly the same one.

So the readout keeps the actual rate (rounded to the nearest kHz), and
tilcdc's CRTC compare hook accepts a 1% difference on the pixel clock
before calling drm_atomic_helper_crtc_compare_state(). That's what the
leeway is needed for: tilcdc_crtc_set_clk() only gets as close as the
clock tree allows. I checked it with modesets at 20 pixel clocks between
16.9 and 45 MHz: the PLL misses some of them by up to 0.015%, which the
exact comparison reported as mismatches, and they all pass now.

Testing on v9 also found a bug in my readout: re-enabling the CRTC
(ACTIVE=0 then 1) with the adopted framebuffer crashed in set_scanout(),
since it has no GEM object. It now keeps the DMA address the bootloader
programmed.

The rest of the comments are addressed as discussed: the format follows
blue-and-red-wiring, the panel describes its polarity in the DT, and the
initial state comes from your no-more-config-reset patch. With v9 all the
comparison warnings I reported are gone.

I'll send the next version on top of v9 and that patch.

Thanks,
Màxim
