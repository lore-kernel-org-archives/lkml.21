Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615289;
	b=3nH5PHoUwhR067DuM0KRtTyk6L7Wth3fTHb2Seu3Pbbz9JRWMWgQsJox9BWUQTZZuouZ
	 aBzZjkSrQeTU1HWzrgYO65BiQW2RFACX4pjxkW77rTcCM3s7USNhlaAwyxhfzjsfPuMmX
	 vmuQXF831OH9d2tySp+o96926Jx8ZS13jYi6O0dca7uHqiVk7ennTnHhTW+FMxxfa7Yoz
	 LhQl4Jsnvol2DydEyBbN1DSKsgHlvvoGZuz9FsG5xn1jOpAdqCBFc9Qhr5ZDfl7qYDdM2
	 MtQrZ932jd4TRBEzeaCo1lBDSEo3csUIQaJAT+4jbXgvZurGukNTkChzwLxVOzR8XqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615289;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=OBgo843Exfwb4+Laio3HtLJbHVbIEd0kZbnqEwp+lU8=;
	b=Us255AVED4EEZAxSyYyzDaJO+F1KsyxAB9POa4ieKX0pN5t//1TAsOyAUgGxa6y76Kx3
	 oFzAU+ABWDWrSP5p9M2fTDoyAP4skGs+r0/3imNTej1T4zB4PnWxxrs1zkmTMg9xOOhKw
	 5+j/uJe6K0wz9EzuejHcCrxpSxlc0u7iyF9agaW0SXLDk5sU6nMMB5iuijZlbYVgTvVxP
	 R29KtpoUvjLif11FbXUfKPhbSiNVn2gBl+ZiLlPE2pSaeVCW7W3DEdiJpb8WsGXRIFEsG
	 pTIcv15n7v7g3EjA9q3o7mrOXq7qBkHX0gcUAObYFjVhPLltGtObcrH/n2yspU2Gybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GM+Gu5gn;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GM+Gu5gn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 481E61A17EE;
	Wed, 25 Nov 2026 14:01:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B16660480;
	Wed, 25 Nov 2026 14:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 336BA11E68F4F;
	Wed, 25 Nov 2026 15:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OBgo843Exfwb4+Laio3HtLJbHVbIEd0kZbnqEwp+lU8=;
	b=GM+Gu5gnZ+C9OKNExB2Ih52VUta0Z8Nf0NUtZFOoimy+52gKss9uPQlJ7cjs2ixdDLHDLw
	mIO7+4SDCGnT4/3r/pIfsXzuNL3cpg+MthoaQOEGfBzHunFVbhvzLhrCdF8rsTwO63Jmyu
	3fkwbTSccv3b7UUqJQ6WAwY5V96eiarRguc4JYniUCOYl/qe5WDXKhUa9Oto9em9ZV3ENi
	wMVYCDN/0tfjEaqhvgB1xkIWO21/kNvu+lm4vnKErAUe1EVpmI5gGCI9x6z9m9rqD3tvhk
	zg/VrpuyTNgzClm6gTHVIi5AyOfIpVY1VcFccXJLJrFNHjgrrUi+rFSqdZs0ZA==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v2 00/10] Move DRM helpers out of i915 driver
Date: Wed, 25 Nov 2026 15:01:04 +0100
Message-Id: <20261125-feat_move_i915_helper-v2-0-aa04d39bc415@bootlin.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACDqBmsC/3WNwQ6CMBAFf4X0bE23Faqe/A9DSKmLrAFK2tpoC
 P8uYDx6nOS9mYkF9ISBnbOJeUwUyA0LyF3GbGuGO3K6LcykkAUAFLxBE6veJazoBHnVYjei50L
 Zg1AajRSKLd/RY0OvzXstvxye9QNtXGXroqUQnX9v4QTr7tc4/mkk4IIXuQStGwVCm0vtXOxo2
 FvXs3Ke5w8QCraSzgAAAA==
X-Change-ID: 20261116-feat_move_i915_helper-03c4037ea203
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

This series moves several helpers from the i915 driver into the DRM
core helpers.

These helpers were first sent as a preparation for new DRM features in
the following patch series:
https://patch.msgid.link/20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com

However, as these features will take time to be discussed and accepted,
the preparation patches have been advised to be sent independently of
the original series.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v2:
- Split patch 7 for readability
- Fix a kdoc typo
- Fix a possible issue reported by sashiko
- Link to v1: https://patch.msgid.link/20261118-feat_move_i915_helper-v1-0-652177f3107a@bootlin.com

---
Kory Maincent (10):
      drm/dp: Move max DPRX link rate helper out of i915
      drm/dp: Move DPRX 128b/132b link rates helper out of i915
      drm/dp: Move DPRX 128b/132b support helper out of i915
      drm/dp: Move supported 128b/132b link rates helper out of i915
      drm/dp: Move DP sink link rates reading helper out of i915
      drm/dp: Make the DPRX link rates helpers static
      drm/dp: Add drm_dp_read_dpcd_supported_link_rates() helper
      drm/dp: Move eDP sink link rates reading helper out of i915
      drm/dp: Make the eDP supported link rates helper static
      drm: Move DSC capability reading helper out of i915

 drivers/gpu/drm/display/drm_dp_helper.c | 260 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 221 ++++++---------------------
 include/drm/display/drm_dp.h            |   3 +
 include/drm/display/drm_dp_helper.h     |  13 ++
 4 files changed, 318 insertions(+), 179 deletions(-)
---
base-commit: b79f6387fd1a9484448230f92502ec3c66e6c1de
change-id: 20261116-feat_move_i915_helper-03c4037ea203

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

