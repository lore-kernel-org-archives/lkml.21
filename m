Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613515;
	b=h8jQ6JGsEFuNi3WDRSvjkMQZ/gXpBZSxPLZ//62aDQS21PrcAQfS8HN+SugZaPtSr6RT
	 jI99lo0sYNlt+Ls8w0FJLHi2oPbiZq9xU7EWLwjkrzK0T3rCaVXfC0yzbSAwCdAwySmtU
	 dggdv2xhUG9c79n2tKMoYOfbzIpKzS/epigZPDhd6UZR0i4HnaU7QJdLYZUlHBU9kx3sp
	 QvKYGmDhUsGtxTeUtzH4lDk8w9hch/1OCxo8C6H5oZiuRJewIopnid0g0/j8F54QaaHSh
	 Qz4xFrH4m+s6HiKAYka9lz3v+weJosmT23jd36J4IsK5dqsZTng1dd/YQfYugBWMFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kUd8mtuTeF2l1knNzHoNf1IiFpWulU/A3oJSHuGeAWQ=;
	b=q0jDhyRuqrkSBAenzAfeSUKqOkGJyhTl26LogQj0kFS6NStLV5VsaykFlOvkndeYCzBd
	 oeT/nDerxrpBIlD4rt9GZyH2u8aH5neEOl0n+k9fbw3p0bBWJOC4X3pwPhdP/npIiHB0+
	 SntnUKe6MUpgCKs1/Iz1NKnPPLP1I1QMH6TPyOQfC78hwjSz9ARH6RLXEqv5C6xpDTBRI
	 BVWlI0GBNQv5arBSmB+jshawJm1nPLICClUiFrn9TGiDnDJOHYYSacOROLHS/NJT3d0/r
	 M2qJ0fNrvDuEAgWsLayAnqeOk4GliEz1YEbEMygOIiuNG025ftJbKkLNNckh5M1UcUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxOzZtxn;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A667E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxOzZtxn
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c511cdd5a82so687320166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795613513; x=1796218313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUd8mtuTeF2l1knNzHoNf1IiFpWulU/A3oJSHuGeAWQ=;
        b=IxOzZtxnZhnZ9AWXrTLKifGN4uBAKUmxZcUbpmHyGA4Asm4Ix/ESxrRjScl7KIs9fs
         Ur6DYOmToXlLSjQOMjufbfUz/2xaWvmFsJrvnMZkwa8w3GYuXATrFMOn0sAQctokTiEv
         hq4YjrWl5dN1kYBCqKSMf0S53luC2fJNmaH81xQ+ls1rYzH44YOT+hucYivL6lOg75An
         0vDYJMEafzNPHk0SnuprqOMK/lXw1tVEP1LQvNpMydQoLzYGqjPdrKefpRzAsCdgdF04
         wAYPpmbsgovwwMEFMNcet0Q3B+QxpZT86Sz0B2Va2d4plhQ8yioXo4rI96lWnqelcYA9
         Epiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613513; x=1796218313;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUd8mtuTeF2l1knNzHoNf1IiFpWulU/A3oJSHuGeAWQ=;
        b=WI1N5qfo5hLaa2aRLer3tg21zkJvAKTSyaCdMGvo80MM8KzzhWScMvyMmdbXQEm+Yk
         DFmaoqSsjviE62hztFhBGHfbwaPkKgAFE4Hsx/ZIrk01KbMehDF8pzb6Dih3Uck5k1iR
         z0XV9nuhVn0CXNuTaqpSPp24i65jurgENv6OW3v9su4qaPVh65tSaWvXzrgWalgan86w
         0BYkEUKoXVsXNlR/Yr2lRZmUQ38VsvMdHriNtW9gk3gjn4Q5W8VzlbOhZffvl/V9m91s
         TAHanDhJdTu/cgBRWUyyWiCGdHBz0bYcRf8W4vWFaWuMjdTESus5wfn6p1U+zDM4GO67
         i3+w==
X-Forwarded-Encrypted: i=1; AL+hErHFuxdx1bqBT46oiEd6pPmTwmnqBpqeAT/7IrHnUjwNMNV3H+2zpQREUX1vw2ntJVwvMy4KxkQWB3OKnME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lLWfT7sG6LC5MT3L8Tq08uIL4w8BHm0Wqq5+8BHligG88b90f
	cL/PRsU/SJ/eQlXZ1Ss0JlanfqGPln1zvcBoPUMkY8NvmpWthiv58cXc
X-Gm-Gg: AZFdTZcQ02RJBHcZh+CWXwoxov6mE5dvRfg/6EQPeFlc42u32o9ZUlQIxk7vRIZ9WvK
	RqS+j813WOjqGKE0JYMRBVStMhUnCoSEG1+YHy8aQwXGF18tKeaNixq60xdTHyotgoMk5Xs+jSq
	MPnLBPsUapWDGBfINK/yLee3k+qQbvJWgt6ZKw3ImVdderM2g4HI3HBWMSO6cKaiX6Ux0KdUF0v
	48JGbBsklhKhHyPNEBrDf7L+mfyYsHnKI0wto3/3LEUxECVbHhRetFnyGRTGceC7qsxic/R3PSd
	1Mmr0kSxpZfubSboqNMWRSlN9ZUKQLrnAJLMhSh4q8onHZqCve/fNrz7dLY3n49Go6upBGCnJSY
	M2RK3FImgWxL035BL7TKF9zIIAAfJceU80moYfjLPmyNrhLwYhFLaepQ3qsyXGHoirK1lQSEEBd
	pUXd96CPyfc+jEZ9yHBN3V6aqRaqL36K3WbkFEAKIq38ljvkqW5lrFZo1DbW+Q2cv2VE88qVAkj
	UW96sOslXjct0lN0COa76tCYzlJpxhkNbtd3N5M6PMX+a+uqr1Vqx4mhyiVAir5bidZCzEll4JT
	JP2cSYomK/Ohyz0XrltpjbgyU4I/ghCMlKonUnwOGsTMfnWB92JDTRI=
X-Received: by 2002:a17:907:7fa1:b0:c45:c030:732a with SMTP id a640c23a62f3a-c513ac6169emr1443388666b.35.1795613512746;
        Wed, 25 Nov 2026 05:31:52 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm35814912f8f.1.2026.11.25.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:31:52 -0800 (PST)
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
Date: Wed, 25 Nov 2026 14:31:49 +0100
Message-Id: <20261125133150.507558-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <awau4IF7KE7hUg6U@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat> <20261118212114.150992-1-maximpedraza@gmail.com> <20261124141119.441163-1-maximpedraza@gmail.com> <awau4IF7KE7hUg6U@houat>
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

On Wed, Nov 25, 2026 at 11:07:17AM +0100, Maxime Ripard wrote:
> > The tidss approach rounds the clock to the closest standard refresh rate.
> > Panels driven by tilcdc often don't use one: with the timings from its
> > datasheet, the panel on this board runs at 56.8 Hz (33.3 MHz), which would
> > be read back as 60 Hz and 35.19 MHz. The adopted mode would then never
> > match the panel mode, even with U-Boot programming exactly the same one.
>
> This is *very* surprising. Do you have the datasheet available somewhere?

You were right to be surprised, I got it wrong, sorry. The datasheet
counts the sync pulse within the back porch: a line is 1056 clocks
(800 + 46 + 210) and a frame 525 lines (480 + 23 + 22), so 60.06 Hz at
33.3 MHz. The board DT added the sync lengths on top of the porches,
hence the 56.8 Hz. The bootloader had the same mistake, and also ran the
panel at 16.94 MHz.

With the timings fixed, and the bootloader programming the same mode as
the kernel, the readout adopts exactly the DT mode (33300 kHz, 60 Hz),
and the first commit from userspace with that mode doesn't need a
modeset at all.

> > So the readout keeps the actual rate (rounded to the nearest kHz), and
> > tilcdc's CRTC compare hook accepts a 1% difference on the pixel clock
> > before calling drm_atomic_helper_crtc_compare_state(). [...]
>
> Yes, that's why we need the above mentionned helper, and more generally
> why a lot of drivers allow some deviation from the clock.

If it helps, I can write that helper: dispc_find_closest_refresh_rate_from_clk()
turned into a DRM helper, with the tolerance as a parameter since drivers
want different ones (5% for tidss, 0.5% for most). Something like:

	int drm_mode_set_clock_from_rate(struct drm_display_mode *mode,
					 unsigned long rate,
					 unsigned int tolerance);

with the tolerance in per mille, so 0.5% can be expressed. It would fill
mode->clock with the ideal clock of the closest standard refresh rate, or
return an error if none is close enough. tidss would then use it, and so
would tilcdc instead of its own compare hook. I'm also fine with you
folding it into your series if you'd rather do it yourself, just let me
know.

> > Testing on v9 also found a bug in my readout: re-enabling the CRTC
> > (ACTIVE=0 then 1) with the adopted framebuffer crashed in set_scanout(),
> > since it has no GEM object. It now keeps the DMA address the bootloader
> > programmed.
>
> It should be fixed in v10, I'm now creating a gem object.

Great, I'll drop it when rebasing on v10.

Thanks,
Màxim
