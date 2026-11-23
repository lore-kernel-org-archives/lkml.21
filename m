Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431337;
	b=1YiRvTSB0/mbLqCRi9ULbSK1zo2vFyLRT65GNALlBe7AvcP1TnKmCtVmU0iQ4f5H6doL
	 x3G4hcRgdwltTNJzoHUvfkIdpR8YWCDmirQskiybomANrlL4gwqHoBaDywxs1dBCSNlMm
	 YWlqo7drxKgIo/tN95Ph0KpWg0mf8MTgxm8485EJfqFrrUg5Hy830xy4hcvrImnbx+kZu
	 GUx1cxmi2wECEeqq4RWZjGOhFRjq2Y2qRsQ+iUav3mgVc5zv6cYJj/gE+rKowwWGkOQwS
	 KEVkjoKH1A3hMtlbUbKMaqA2KmURGqDSdqfk9Fqq2GlmNgPufacJXb7YWpNc0Tg485A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=T3sb7Ptp8raMgEjUcbiNjen+AWYmPSXzPSHe2BRivVk=;
	b=SNzDvpj4DyXkYnWmC8JWHVSCV/EBndyhG/8wl1sKSX1FJaSn8VNT6Njc+sQGuQcq0wlc
	 OtorG5Gp2IN/KoU0MHWHdxgKKuCBBqKEwK3+YNkk6b4R7MFGAFNVggm1+CXPYWvDkNsrQ
	 KzkE20oU8ZmXgWgzmHrXMjvuplOrVT7JupSAsi0w8Gl8rDwDPlX7Gyd4KVUjDO+W+euZD
	 TfFL7bktDM8tlSqZHYnli+1uQoDV/aBajKaDcwm/Abrb48J9+zyTkXGvpvfRNvhHdoeLA
	 hAEkGVr2ZDjFTCBgZvIaSsPji9X2CvW3fl15PgMX/gLTGIIYCewOIDHyOeJV4jf13eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVEVhES4;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B168606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B168606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVEVhES4
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so2160506f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431335; x=1796036135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T3sb7Ptp8raMgEjUcbiNjen+AWYmPSXzPSHe2BRivVk=;
        b=NVEVhES4dqzXO13tBtn55qANGcrz31khfBdyCWkNMueWZq3aIfQTVoNQCzO0nZtIBl
         VLDkfFrzMBWVTBke2pcbZ1Xkjnsfafy8zf8RXMydzT6knSUMG0lZ3lq7/YMEGq0lE8S+
         r3P/V4kRpKZyKiSHkdxL1gt7VbQoqsRfHp1kUWSxRkWMjnwF4L96Ux3D4I08lq6clGQX
         ZMZ/+81MY17j/N2twAuysqblBoHLipZKMV+ikiGHSbM40FJ1RTS8wh1+bViVEoIBpzQY
         jEu0wpcS2WQJzSgYPUi5bczXpUAw3EKEA34CksU136Soy3ZQaKmUYaEmXsPQG8mktGsj
         v1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431335; x=1796036135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3sb7Ptp8raMgEjUcbiNjen+AWYmPSXzPSHe2BRivVk=;
        b=DbblcvFN6Uh/tb8UKBhIdFJaZgCuQFlTBipBzy0+dlDAqICMb0po8DbO7KqZy8MXY4
         vMxPeS9+rOdJfyPXcSHaekMo8OHSBmoqWa7by18e8o2X7qVorStHuwa590yc1u6l1CIg
         CO+80uSD9eVVfzAsJkgJBon3BLnZ0+mJ0RdP1QCG+uBSdFAkyv94+qIzhIYaA+GXbsZS
         +kS0WQj3Qw2CU5nnEBu4JhSlCtOSZAO2YIIyFI1yKn77IvRgsOSm+AvCRexBaLlGKqB6
         Zau9Gguo46h0hDZ3D5rFL2x0YSIUU3APvRAvHSqjyQ5Gbfn+JYsTjaPPBQykkKJr75/3
         V8vw==
X-Forwarded-Encrypted: i=1; AL+hErHyEOS2kuZTQejCh8r7+VySHYE4dl+8uXbpKGbKJmUUArtoDK6NEtXGb8gDK44aTH33CFKGqnlOLJBP28Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B2GAGbV03aWzdYSHy7L/lZ7XSYhJpPW+KihFdT7+L+06/AqMh
	86GgHC3nqwHB7UmS1fXazUa7vbzsJXamq6DDWepy9mo5ytyA+XQFUy+U
X-Gm-Gg: AZFdTZeFU+qxH8mYafA9XZwKh/ZMTWHvMsG9ZUgERSm8B/8HcaSRSWxRHLxSYuc6AxT
	Rk+y0pqjixcR632c35Lp/ejZ8EF/aneWt2Ki3e8FtkisiuEIuAI9aZ3U1GiTYaBko9l5xz4NKf1
	b+G2OicZRCoeyeE9HRGqw8WSIwa5wSFUwJDbdHcWCSQJlzeMXPhfwUsKPIeQ98MhFWNmp3bqCRw
	6oHp8VViw0Y68IwNYd5EpQ8O8Pt6izW8BVwG21FBrWvo/4PAMP5YJMkVJIrR1goPq6z/UsRSwTs
	oFasSdGAldoFc1T2crTo7fCHc452K/m+l3yhPO3BjMeBf3VOpvg9HJKXuEoZguT/Qcn556sm6f4
	+EoFXVSGmVZzWVXYRi7OcPCGRP4gSR9SXBZVAP9d9+ABOZU9ywSRyJI3ZjWvklQzMrF05euYqQG
	LaWyGuGGGrRj6UzMgbFYWV8fhxT24Jvbf+LmDKK3CXIKfu5Q/PXZbz332Q2QlSQiMhidhrgnpQu
	VR0RLiIp64kT6wmUYtiGnRbvjoaD7PtSQbMaumCe7GtWof+l7hGMe2acUAwoa926mPdm+q0Mudd
	CmVSu2MKz4jzuEta8yZ3ACcZhzdolKZLRA+zxuRDnnzlv7QcACCGEC+Q
X-Received: by 2002:a05:6000:2383:b0:492:aff5:da4d with SMTP id ffacd0b85a97d-4aa545e244fmr32329698f8f.7.1795431335383;
        Mon, 23 Nov 2026 02:55:35 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm21977304f8f.54.2026.11.23.02.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:55:34 -0800 (PST)
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
Date: Mon, 23 Nov 2026 11:55:32 +0100
Message-Id: <20261123105532.21980-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <awBShK7cjwT5LTLg@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat> <20261118212114.150992-1-maximpedraza@gmail.com> <awBShK7cjwT5LTLg@houat>
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

On Fri, Nov 20, 2026 at 03:01:50PM +0100, Maxime Ripard wrote:
> I think the real solution in this case is to fix the panel to report its
> polarity properly.

Agreed. The panel datasheet specifies negative HSYNC and VSYNC, and the
timings in this board's DT didn't say so. U-Boot programs both as active
low (IHS and IVS set in RASTER_TIMING_2).

Adding vsync-active = <0> works as expected. hsync-active = <0> doesn't,
though: tilcdc_crtc_mode_fixup() flips the HSYNC polarity of the adjusted
mode, so DRM_MODE_FLAG_NHSYNC ends up with IHS cleared, i.e. an active
high HSYNC pin according to the AM335x TRM (SPRUH73L, table 13-26). With
no HSYNC flag at all the pin is active low, matching both the panel and
U-Boot, and the readout matches the DT mode.

The fixup comment says the LCDC aligns VS on the second edge of HS, but I
couldn't find anything about it in the TRM. Do you know if it's still
needed? If it is, I guess the readout should keep undoing it; if not, a
fix there would let the DT describe the panel as it is.

Thanks,
Màxim
