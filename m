Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729480;
	b=o266rxRdjHvUzBu7GJt9Zr9JVz6zuRrgpTA+Ha7VPE/d1KSZW9J4bfXpJsKKF3lthnwg
	 CspyTXUN3hYdJta612oQ9otCHdoPbvorvsvqHgCn4x+LASUFeafpWvJIkwKXdKignraLF
	 WpsDDf3CozzCKtoW5SLVC89UdfTYTTsOBvEPvAkP2HT5OVjruQx5s7NfNN+kEWuSjQEhm
	 c6A3Q55dDWWmn07TSI8zVl1nq/CMqDl9V0zbFMC8pm+SSse44TFT05yRfTegsFxWL74qE
	 mtcm8+J9PrMJR5muw+TnbkNthh4zaPINhHzbbzB8zYPdexz+uYLSszGQloaPAwWiI3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
	b=R+OB1dmXowp7H6HQRrlo9eg0U2nfNa+Bp6xDqerXH1UBE4wYcExP6Asf5MJVgtIcsn7G
	 dX0+nY35yEojrJa83Hz2Aspmo1hloZHLzgApC0ovyEaVIq/58n3ftiNYnkLpoQWSUhgEM
	 TfeLUwsU9nid7VXwSlXCIfCkunxsgwvYUqrvda3Qiu1ousvhIKDOriS2Jz3lcULFfTlej
	 5+yxZmWUnyXfNDpFCvuhJP5M0Wk/rU1d/pfYr0qHMswjg3PzdibGdG12LQDmS/ixegpdv
	 0+4cPfV8A1XgSP4ZAeZdZSAhdPm0HHnuSSWy2tUJEl8/aSiXs+qDp7jD3UNpD6qsMzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahmvJj+l;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C296606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C296606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahmvJj+l
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so6155462f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729478; x=1796334278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=ahmvJj+l26DjdYSWBB2FpOZI2aMDuDqgj/e/4KEe75QAMAoNsUWO8PiCWFY7GBaMGj
         3QUpIM7Sq7EHNx+r3L1ucf2DWFGIStRoXkRmdpIsLx6Ba3jqyKI6qSzd9KJx21zc2kmf
         tSvTW9siYOZyeOiQu4ma5JoGC3ojVeOXGvsxskw/ri1BXaU0GXx8exI8632VCj3Buk86
         v2I19wXg/XJWNabH/+ZpeN8gepMO6bVB1X/Uc9mZSmvE44p7iDz50T2n/Y+PgMEndp4I
         cj601tddDir+7JWHQYL/9sNZh5++BuPpIYVKX2dxKvFq7H2raEeBZLvMr6lyh3w5gohK
         w+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729478; x=1796334278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=KeIq+mWpRr9Rd0WOYqiCRWupn+If+GWlb7ooUm1Wz7cTMe6ZDcoBv4qR8COEx1duR0
         B5c6eOuqnnSXQVFGQPxCBSA9d2lRPXZqvOHtL5zmujSdU6BkLa+HoNslUBZxJzELAYBM
         dqmtjNa0C7A0gR9149/FpS8NOKc+KOvJVbrE9KFI1rWkD5Kq4abK/XV/GaeGyCQpby5u
         SelDyKxxMjP6/8AdeC6jYUylajSnNb/T47IFlTIeqjQ9CVy2yJxutbcxcK5vPGrGiRwd
         TAubJVWo/vfFbuqDIPjB5BwshC+VIxujPJQCgJuKkH5Xbo1dbVaSY6GMhxw/Qraepxgv
         WGng==
X-Forwarded-Encrypted: i=1; AL+hErGJkgP0zoxa+Mvb60V6fBJRDJrrR1WSKwX31hSB+dA8vOyiUAPvL1KlXuFN34ai9D0GGpl51aGYfo40VXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FEzNNEC01YXeN/1IMCz1MXtLkfSC/Hnll7M1gEL/hYAMP+Z7F
	t7ii5DGtIiOnEwuShxWVLpjoPSny02jAgtk2RtEctn71lVAAUJepcgg2
X-Gm-Gg: AZFdTZeaOfs4ZZ4xWjQCIBCE+VIH3ihkCmkWSbFKFyT6bzfnlDcMjdGMQHc9me+kOcH
	GIme60miKslp7I91lnZPGAL5eq5bWpguSZAdofZ7oPGe7SSyhglD2S9rcJZ3NAdWpvWdfpUnau7
	rPeodJivLUNMyJG65aNhDstbshTHQEm/9lQ8JR9tu4JYmlrLPPZWaplYIGMWrko7wOasHtszd3x
	rUqZb+5gafj1kTzdOX7wl4x64y3ogH6ehihmjdm0H5Q3TEZP4bd5GzQe5+aoSxNSmuZqnq0nMxD
	VdrGJCtX1q8cWxkLqPxmcVwy0860iUGET5iB+BSoMsx+pcAOJCPUVjZ4umPSlP2Qvt4fWGogZp9
	uERaMHFg1sWS3VPj2UUvKh2c7pKGNNzed/nEb+jwfcAq3TM+y6bwyrGVZNBRON/xuWX+w+ARzie
	SLYK8fIBFxr7Zkoe+KOFu68PNoOz81+LRv3/2v6W1n6PAiStHRis7oNVvQ91NypAWiCTr12kiFo
	/863GBCqu5vemm/q7oFvhR/S3ViZek0Bne5gckZ5XUnzyvLCDb3EHWR704FTUegg/Xbp1hokDA6
	zO607kxSYFCHUL0+zEnhRXtMaf4wx26W3o2LXYf1VGj4sZI3p+p3A5K/zAqxYXqek5JQX2Q0jmE
	9CNMh/Q4D3eRP4L+aE7lbVgSW+Ekt5e/MOUvYIwPfOJ9zOYO8q2kPAKIxNcKqUeyPGjsfwR20bc
	Qs6qhhI3lYfkKhWy8ewWkM6ni6z2i5bGdQs07t42CFEOOhzSANctCRpG+qSDiqJNqjbGCL7cAy9
	wSqxb0YFg5BFJldph00hYl5q7SKx+/vffDV49X1WpOu7ryGyEpwbEiDp7i5WuM=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr44566145f8f.9.1795729478381;
        Thu, 26 Nov 2026 13:44:38 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] drm/sun4i: Add H616 display pipeline support
Date: Thu, 26 Nov 2026 22:44:22 +0100
Message-ID: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds the remaining bits for the H616 display pipeline:
TCON TOP, TCON LCD (R40 style) and TCON TV support, HDMI PHY, display
engine compatible, DT nodes and HDMI enablement on several boards.

TCON LCD support also covers SoCs with the same die and full LCD
outputs, like T507: both TCON LCDs share one LVDS reset, so it is now
requested as shared, and TCON LCD1 programs the second LVDS PHY. TCON
TOP now also routes LCD TCONs to the LCD pins explicitly. Dual
link LVDS is not supported by the driver yet. As on R40, only two of
the four TCONs can be enabled at the same time, since there are two
mixers.

HDMI PHY tables follow the BSP: PLL settings per TMDS clock band, like
on H6, and BSP specific values at CEA clocks, including their 1000/1001
variants.

The series is based on linux-next, since DT patches touch boards which
were changed in sunxi dt-for-7.5.

Tested on T95 Max (X96 Mate DT) with a 4K monitor and with a HDMI
capture device: picture captured and checked at 25.175, 27, 40, 65,
80.14, 88.75, 108, 119, 148.5, 178.2 and 297 MHz. 4K60 at 594 and
593.41 MHz shows a clean picture on the monitor, which reports
scrambling, lock and no character errors over SCDC (channel 0, the only
one it reports).
All capture device EDID modes set and checked twice, plus 15 hotplug
cycles.
An earlier version of these patches was tested on MYD-YT507H (T507)
with an LVDS panel on TCON LCD0 and HDMI working at the same time.
Shared LVDS reset and TCON LCD1 (second LVDS PHY) changes are build
tested only.

Best regards,
Jernej

Jernej Skrabec (11):
  dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
  dt-bindings: display: Add H616 display engine compatibles
  drm/sun4i: Add support for H616 TCON TOP
  drm/sun4i: tcon: Request LVDS reset as shared
  drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
  drm/sun4i: tcon: Add support for R40 LCD
  drm/sun4i: Add H616 TCON TV support
  drm/sun4i: Add support for H616 HDMI PHY
  drm/sun4i: Add compatible for H616 display engine
  arm64: dts: allwinner: h616: Add display pipeline
  arm64: dts: allwinner: h616: Enable HDMI on several boards

 .../bus/allwinner,sun50i-a64-de2.yaml         |  20 +-
 .../allwinner,sun4i-a10-display-engine.yaml   |   4 +-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  11 +
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |   4 +
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |   1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  33 ++
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |  30 ++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |  25 ++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |   5 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |  30 ++
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |   5 +
 .../sun50i-h618-transpeed-8k618-t.dts         |  30 ++
 .../sun50i-h618-yuzukihd-chameleon.dts        |  30 ++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  67 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   2 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        | 170 +++++++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |  15 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h        |   3 +-
 20 files changed, 895 insertions(+), 11 deletions(-)


base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
-- 
2.43.0

