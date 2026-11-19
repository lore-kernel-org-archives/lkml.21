Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110884;
	b=B0vvlVmY66Xy6fvTYLfAF+GEoDXMMm3v0NEX/CTGZvIp6Tmab9dzdh3muQFa+c5Kab6w
	 ugP0BhkJT5R64CtbWCGdUMB4Znu32oCcCJVLGyujRsCk25W8itIEsaoskAcPmHs/rKT9w
	 uidtAJsOR4qrWicBvxc0QMJyvfpOA/OqKsoj+VqAcmiZ5RC9VUsf5e7tRC/G0PJq6aQjU
	 LStmh70gK6b+fQ++EmyRtbVJa5zou2h3K+pVp62tg1LN3gbi6D7DHtD5yDHELXE9Hibym
	 vLlicjwnPrCEDacL4uP37PE6OsG4slmUi04rR9mR+sxtYkKbfog93qgG574Eip/RfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
	b=gonVxloQmdxNUNpRXyPEJACs1U8kifr51pl0JCvI2rG4v3XXvKxaFkc3wB45SfsV784D
	 SzqfP83yatbpowbEIQKOI2VnAzDNwY54e1roBC3lbotr2kMZaFrApe/fOdW+OW7aIVLiC
	 ANxorZpkqcM63wRe/r/GApdvi1VP8mFJ2Sz1bsqpCotokobXLL5Xt10xi8czXsYB+RDBp
	 1++c2eCOY6E4f9Ic/BsqESKj0sWSzukT+zdp2to8ZpZeaVtYBBg1m3ehgvNZQ1jl1C+3k
	 YCkyWnP/wFR2kUdv2zTqDOI6+aSTMOvAnVRZhYJhmlkSDufm0Z8xvAQby31gJVXpevw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpIGG3ec;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD2606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBD2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpIGG3ec
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb606491faso15012845e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110882; x=1795715682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=rpIGG3ecMQpmdMIQsUTxbxV66zUNK/f/19dIVWVwU3/oJ4PaOoC9+KJemj7x2k4djL
         zxeMC2V9asmii9hBL6NFC2BcFwV6NxrXUaZGj6tat8F917Xj3iQtISvnXM9aKpVUloqw
         IcTphOGaqGWGMyljARozybHAw1f3gYNAb69LNsEVHUPMJtQHhO3jCZkDCpdQHKdGyuqG
         6rwkX87bBw5XvbnbD5CCAOQ1371+AZuNpHp7YGk9iTEBt72lPSRRxNDofCoALHxOWFms
         WiX/7FYWjL8g2pD247dwZzYQJFHrNBDrtwzSc8YJd3E+y4vbFwM5q3L6A47paHJrbBPz
         uIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110882; x=1795715682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=ccp0cyWDG7l0cHr1PjBMlm9mjRtdwPW01sYCcBtpKClRjrtdABIOda4lNjipxCw6+B
         S+0mTK7jyvb7EeUorug3t2qSDe/oYh+Wa4jdwz2MegFu5KESqrJoJrR49wKUb8UfU2lY
         3fEn4IqC2WvB+JP/zqwJZoLZBkOqPEqOrKRK8Kc7OCtL5BYY0sLlVSeC/3nxddxDy5M/
         e5IOq/UkXUcQJMQVeRzI0A4MoSmDQ6Rh23AkuTMbi7dhCuy4ujZJSnFDEVYpWTFJjQ9d
         hbJ9iwzXko3QlkJF3E/odKq7sTE6dftTnOPFHoRXFg05bql+E5GHvWDZ4SAADPAIH9y9
         55yw==
X-Forwarded-Encrypted: i=1; AL+hErFFIi0vCCwPraAb8FA0yhvKcBUmhoPvWrlnSKKkn3n2fWt1p2nRFYUyNM/7W2cp+uYTzqOhl0pJRBvdBmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DcrOZIaA0yRmLLbjU1N5be2YI575tiQAGJse/POHY8P1nobeb
	z1d1pj8IDhgMYmUU3zxSSVTx+ow9FZIynFGZz50O3zM4+Z8EUxGWLEaX
X-Gm-Gg: AYBFou32XL0tg2gkm22VruD/8/kgJj8IqDCIy+IRfw/clZUNBMWVMscTqri6DjqK+zV
	wmEu+g9qA9F5LUfP5WfckzwDGqJBzRLst1eurEMqnrUTuoHnUGkwu6mP1Lwj6TKvqZZ6dKrIVXb
	FA7+Y8zegvGIyXmi5M5PDNVxc0o6C9Gn07wJ8/53sHyOcbWHQfYy4FGhJAi5PuiGtDwFY6EhEgi
	JnBOHk8iyuqur6HsP/kkXi/Ohytpp1B0JIP9YzipFzai76M0hO19ttRT+fWXpTYOHkhydpTd8wO
	vxIB7hYtk4+IgKWaLgKxi3GGv88H4eADrJRng6lp9NCr9SiY2gp91cFso1DFnYO4Gv30AsCCfw1
	4JLRPJu1jobIwhZ68vyaFDCQVatT3Cc44xSg6ObBn7/uXs3Agc35/2Pp3DRYL3uxQOaFPk+YsPw
	2rwCJcmkonDEY1DesetdzUaRuF4mPCDTp2Wc5Qt3o1jwF33qMNg3Zf49c27oBS+cCpPqXEM8H/q
	EVN5m/71mC0P+afq6zozErq1Vnxr4hVLgrnRfl1lQ2ZEOrJ2UmxQdBETK/u2CiZsFdznK62JBGV
	vSXtTTqGc7IiAFSxD+gB5u+cW5XeP5vj3O6YLYyc81q2Ze36avosPjuU4jWu3k0H2O59gvGC+YF
	IbR3ObS3Kq8zB/wnG8A19Kqz8XFWm8W0oEkLfkz3tOhB+d4YjYnD1s1BQYqHMG3OFp0E0m07L+a
	loKPIv0Y8kVb8Aw+b6ZT3Wh9IsHJqHNChOkGGOPQbaLphjIDq0gX8MlxHnTJ6DGZj1WwFtLI2tZ
	8vP7/mpfbkvF0jrTa4mKK5fYLrj23YJFUQV6pawfxc/jd+i770XFy0+
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr6842365e9.13.1795110881961;
        Thu, 19 Nov 2026 09:54:41 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:40 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/sun4i: update DE33 support
Date: Thu, 19 Nov 2026 18:54:32 +0100
Message-ID: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

This is second series out of three which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Issue with existing binding
is that it considers planes as resource which is hardwired to each mixer
as it was done on older Display Engine generations (DE3 and lower). That
is not the case anymore. This series introduces new driver for planes
management, which allows doing proper plane assignments.

Note that this series intentionally breaks existing H616 DE33 mixer
binding, which was released in v6.17. Old binding can't describe shared
planes, so second mixer can't be supported with it, and it never had any
user - there is no H616 Display Engine node in upstream DT, rest of H616
display pipeline is not upstream yet and no other known DT consumer
implements it. Reasons are documented in patch 4 and driver prints error
asking to update DT if old binding is detected (patch 5).

Patches 1-4 from v3 were already applied (clk patches to sunxi
clk-for-7.5, CSC and VI format patches to drm-misc-next). Plane driver
depends at runtime on commit 63a29fbb4ecd ("clk: sunxi-ng: de2: Export
register regmap for DE33") from sunxi tree, otherwise it defers probe.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v3:
- dropped already applied patches 1-4
- new patch 1: reject fractional source coordinates on channels
  without scaler (suggested by Chen-Yu)
- patch 3: mention in commit message that driver is hooked up only in
  last patch, update copyright year, drop unused of_graph.h include,
  use dev_err_probe() and MAX_DISP bound, collected Chen-Yu's R-b
- patch 4: collected Chen-Yu's and Rob's R-b
- patch 5: fix include order, use device_is_bound() under device lock,
  guard put_device() in error path, drop stale @map kernel-doc, rename
  planes platform device variable, mention missing scaling in commit
  message, collected Chen-Yu's R-b

Link to v3: https://lore.kernel.org/linux-sunxi/20261115061102.229680-1-jernej.skrabec@gmail.com/
Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (5):
  drm/sun4i: Reject fractional source coordinates without scaler
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 209 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 191 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  11 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  24 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  24 +-
 9 files changed, 486 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: 8e2afcd2b57990465f132367fd8fdc2e55c1adad
-- 
2.43.0

