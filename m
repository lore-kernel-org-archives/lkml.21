Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450854;
	b=rP7zVIdY9AimupBl7ey7+m21PXPYccfe8y7QyY3jiIMf2IoWQm4eYilRObjYr6NHNZmp
	 HzLrjxkzbaYFB3seX8WBrQ/c7zujB18ImlIpz2XOHZXSU738kFBq8DTMLlk9ocoIaw/A0
	 QxK/TYnbfbEd1R9VGwqomikrxtdbLJuoTsRX0UnuoonI12LVAtVY9+YqIV4KcjkwZOYdh
	 QrrqBYPrTnZwGr73yKIUvshkHl4DcaFSZbfVp3VhSonLKfgTzZM8lCwyuVwJ1erkVQ0hD
	 eaXaDySJWnQ6EbMmr0SkEEJYNN3iHR1537Eff5OrRUtISzgESaZKYgFoo9bxeDdoFuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:X-Mailer;
	bh=t89LhzLisMCNxYeOykwfFUDFLNVUHJz2Tt5nBABIp9s=;
	b=ge+jX1HF82Clk8ZbQkvO+gGd+BhRl8NnVO2a4cZcx8A15gAanerg69ACyLjzHhSxpfQr
	 vSHKCuOve4rMqOQwZtbwztlorxLPO89c9n7rnxRyx+qdxOi6IfxclxKmNCzNoDav4Vudg
	 QHP8VjQpxo+KewO7kSFBJE3k8bcicrq0hLWxdatIo+GCgKhzZftn6MX73AESxQuS3l/Me
	 ldAf09T0Dq8BOtr9K5+8XsB/jz/mcwBh1D2Z6jNIj1nC1z6ervL+ip/DClxkJB1NJP1I7
	 i8s5mftDPRiEwPKVfafeil/9ECFGe7AfxorNay9H/HenKJUaRfHcpKQ+YDHfibXuMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bK3USgdM;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91154606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91154606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bK3USgdM
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so33950655e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450852; x=1796055652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t89LhzLisMCNxYeOykwfFUDFLNVUHJz2Tt5nBABIp9s=;
        b=bK3USgdM3nxIw1oepMtWLcNQeNFOSuJ6ayguYY+RBx12+XBUCuWkC1mfFmMfUny4z2
         v/Tj2vJRnhoOoug7AmoX7/9m22bTNH+yut6yI++hRN+3VA44QYRHO3xf/qpZahLOBUYn
         1g2W45xJLoizLGFWMKvkVO9/8mvGxeAyYknxDzD8Ml02xMXUt1JZy2atCVx+E5tq2Y+M
         +Mqb4JackqL0WGZq106L4/jcYks3BSY0OSZhE1E26dkSvFvnkWJj5HbQSeOH3KRth/pp
         Lbf1FhEjaVQfYrv3yz3b6qfISVmBNuRGEP/lBej02AfsAojgaAvL0dB6KoThl2lhoU+D
         Cybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450852; x=1796055652;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t89LhzLisMCNxYeOykwfFUDFLNVUHJz2Tt5nBABIp9s=;
        b=Z1kHSkjQF2zHoUHB9B9O2aAm4nXQFdul/YqCxHPhb3x/0Xwfo+h6ZD87mLeHioiG9x
         qwTv96Nxy3UnXG7SFBAhwCUWgFsjPtp0vS0uaYeIR79K/ipQ3/v/N+Aitv2IHJ8akZvc
         ONrWG5XsM6ixRYtgPHcmuP4Ujn4LA5z9gPqtkGix7cmoLaiXF9xc2IPTYIR1g3kgCfoR
         Z2EBEdmiPYeXfChmhWkHUnBycEgi3Fjn16g2bYeb6tfqjO/Zxap62Vypy0FCU3p4vXvN
         bVS+8Y5qXyOPkt8/QtuSoCXuwh+6QbFCjvPg0QSRBpd9jaEnTVbzJ8ArYboEIs5ljOhd
         UChA==
X-Forwarded-Encrypted: i=1; AL+hErFT54OX4Iso1UzmxWhaHVTVISWEjzk0EYNcxe4DYChSZjZV9rADc1LqmqCc8LOXK4zZIXUe+x0trjYI43k=@vger.kernel.org
X-Gm-Message-State: APuU4Z881yhjK3COs3Uls1FQYDyHJYizDwvg58DFhjZZrJ1scC4xwXuc
	SO+qTxu5rtPTYF9YUHsME1aS9b6G3IWld0CwJo4qlmFO1hhEsrp9HxUx
X-Gm-Gg: AZFdTZfyyYbMaBDHAhoqyKvdP9tx2du5Tb6Z0M/rgF34COoRNjEHfeQxZdZNWbN/UgD
	sWFgaQzlIPu+Y6C1RYuDt4QOCTL0zigdrbtPJ2YjAt4bBlxSgTve1803b6s8MV8gO5JaC+zptAn
	epiPLKyRq6+ii+o7asacfZTfL8pDjppI1YsJfIa5SJWwuL4r+XxmJ8NnX/dzDKpQs2cyp/XUECQ
	zrokTrJara4da49kdPt3q4ycTc7bQ+Lp3OT0zKijFlfFhd65sHpTkWu2ny1x9eYhwL1gYLOLYUB
	SL0rL8t96ahxLE8XrT7sl03rnlhqtOi+Yen8EGGi8qA2PoM7NJKcOiXBq7V0H2Za15NOxnYgvrP
	B+PMiQiixJkivF7PsSTNPmncZQbXRGhg7Zc+GZmM3eF2cVQFoeQSq4DxrjtyZCSfinSFTUAZyOD
	Drd1enJyJthbXxj1BS3pUuItOt8CZaULyIb5aZL/Rb6NN+bitj+G1r/kQqcfR/or5rmLBa/+7QV
	UKoQUZcIEdBeSZXGHysjBz1JoCKqkjMBUtctoSL8vQdRYkyu3uIo/llpLP7pwJufiqIlRa19ic9
	yN4jPeqnFLB+cV0GTEqxtEamo/YgX7C7XP9s23KlIRlzHlrA/eV4ZW+/rN1YIQ==
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr237876905e9.4.1795450851663;
        Mon, 23 Nov 2026 08:20:51 -0800 (PST)
Received: from [10.56.169.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm18863696f8f.35.2026.11.23.08.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:20:51 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH RESEND 0/4] drm/vkms: speed up composition with a
 precomputed gamma LUT
Date: Mon, 23 Nov 2026 17:20:25 +0100
Message-Id: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

Four patches: a fix so that a frame takes the gamma LUT from the state it
is built from, a table that turns applying it into a lookup, a test, and
the CI entries that can go once the timeouts are gone.

apply_lut() samples the gamma LUT: every channel of every pixel gets a
fixed-point index and an interpolation between two neighbouring entries.
On a 1024x768 mode that is 2.36 million interpolations per frame, and
kms_plane@pixel-format takes 160.1-167.8 s while
pixel-format-source-clamping takes 78.9-83.8 s, over ten runs each. CI
lists both as Timeout in drivers/gpu/drm/ci/xfails/vkms-none-fails.txt.

A channel value is a u16, so a channel has only 65536 possible outputs.
Patch 2 computes them once per LUT change into three tables (384 KiB) and
applies the LUT by indexing them, which leaves the composed output
bit-identical to the interpolated path. The two subtests take 4.87-4.90 s
and 9.70-9.84 s.

Patch 1 is the fix I posted on 22 October
(<20261022215803.621996-1-oaroraetimis@gmail.com>), and patch 2 builds on
it. Patch 4 removes the two xfail entries and has to be merged with patch
2: on its own the subtests still time out.

The other approach I considered. drm_fixp_msbset() computes fls64() with a
62-step loop; replacing it with fls64() is three lines, needs no memory,
no cache and no lifetime, and returns the same values. In a userspace copy
of the same functions the LUT phase goes from 153.9 ms to 10.5 ms per
frame, ~15x, where the tables give 0.9 ms, ~170x. I have not measured the
subtests with it, so I have no wall clock for it. It is not part of this
series.

---
Oarora Etimis (4):
      drm/vkms: use the gamma LUT of the state being composed
      drm/vkms: precompute the gamma LUT for every channel value
      drm/vkms: add a KUnit test for the precomputed LUT table
      drm/ci: drop the kms_plane pixel-format xfails for vkms

 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  2 -
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 54 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          | 47 ++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_composer.h          |  3 ++
 drivers/gpu/drm/vkms/vkms_crtc.c              | 24 ++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  6 +++
 6 files changed, 125 insertions(+), 11 deletions(-)
---
base-commit: 33ed26235db93162935d1719bc6f538c384a2fd8
change-id: 20261108-lut-4fde3dee44ce

Best regards,
--
Oarora Etimis <oaroraetimis@gmail.com>
-- 
Oarora Etimis <oaroraetimis@gmail.com>

