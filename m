Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677205;
	b=Oj2+XQJtWZHe+nzwY0Am7jpDrrzjAP7Dv40h5MCmfFzmV+4OtVj1aUpGZ8KeBRpGxqzt
	 6Il6fb/WlmfX50+lt09Fos3dsbX7i2HtY+FfiKpvvYZVLV5PozlZw+c2r1hocExLd06CK
	 1FOCCblmfHk42naA05UOmsMGjzNLYQZQhapOlIQh1Cia1gB9MtTjLUJp7N70UYBdxpXiV
	 kZqmtJNBJ/ARLRN/W3jJXfn9zQe+Dd3H+0lkbQa65Whjri0dRm/6+7h+Bo7Y2xJqv9rVs
	 soFAjhpsZxbLqJZNne+EOUu18JbrrA/oPqr8NW6Huon4jItU84HaQ/dgCKUjLs8ieRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
	b=CeuXQoo/M5OaxmOzN44xanhpA2FFcLZC2SEHR9sciW032OvXEXfIFAXAb8+yklQ/+rtd
	 2E8zXV2kZAOtKzdciHa7BWlWS8Z49Q1e3BPdsZi5Sm9ALnzwpFH8QO0ZbU1SNO5D9SILK
	 aeBfkpG3Z7wbQo9cz6/2YO5gTikx40U3zfDMC72vyU6EmnRuRdBYiDOstdVAvHIT8H0Bi
	 IU9SBmg2vNBB2UVtwvm4pZgQzFDktFMDTM6lAHHf+nlqSet2XcGL10B9KJqpxTjcTCKvb
	 jsA1zTiavzzaDYvhOBTCXqab4ZBW6GMr33aK+eQ0AyFZg1Kgnnlxh251BiXZejQ4QdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bU+Df60Y;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD738606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD738606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bU+Df60Y
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02ee04378so53414985ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677204; x=1796282004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
        b=bU+Df60YGEL9Xw8jU5yte+Bju99danPXhDVhmB7HifPnc8E1+sQpWUyau3v2dcvXKN
         Gl6+ufOgDlFQZhryJre3ySdkdmcthTmK+deNmQrw+hTUjgpAzhFkB4rqBFPitKaS/mwu
         e19rGU3gCaKoRFJhMwoojwEXbgfFmCxoaVsuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677204; x=1796282004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
        b=TUmegMUg90ss4X/e8QZQX7O4IUQ2Kbnc/U4ccyzivrIgsKEYXbFblNzCcWkxwWZ2eZ
         p2lvZX3xvrTZEEzteksuc1PzhTOFJcKHMx+NEofvKkBBsSf7pfI3smxUzBsTTHAX9Bit
         NFuzOrP120w8jL51oCXdfRjlMkmjyBI+Q7lATczRX3RrBsGSH8uBq9Wmu/dARcgZ9XrD
         OFpEo+zE/bEmD302kLDmEQ8oDeVKMul1UlGzpuvHAkg6RbkMrkUTkA+QVzejZDMr4rsy
         e3mbxDi4ee+VPXdOZe6v54LwrD4Z57L+5WGXEYWMMZsYJtVcRPo7JOP2iH9Hr8XGAtIh
         l6FQ==
X-Forwarded-Encrypted: i=1; AL+hErEseshG/AJNb8Vw5YmsY4e+QWvtMpZlD7I7eMTKueK8IQDikBVzIvdqTd3CGKC1sskvu7J2VHzyCVkRJbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5mIih1xycqSOpQm+T12lbuc7eIH0GzDOzRL/MfzQ2vgGm7GRw
	CRrE5ZxdND1ANW1+GlMKPdJkLZ0IiRFnkOTMkWrblmCWM5GXnMsXa8Y4mG8F656GsA==
X-Gm-Gg: AZFdTZfLwu4Ofnzdu4vr6wMXcMPjRqQPBch4dGzaLq47rHBnAH4TZz2/evAZrBF5jgQ
	4cLyg2ralHdsit41Z7mRqdadjhJtWjsu9+J8rmFzeKt97+azsieKeNzTjkraJYCsQUSwJUNJ2pq
	s9KafYsgq4ByPp/RengqN6CxQ+WW+0yFEd1tCaaLjkVyhAFX8mznvAomYrw0D6GZPt5OMV0E8p6
	lT67L0iQjJB5+MWG5BLUfKrpY0elX/0wfAj981x88XsWAeduWyq5Wgy+cDK1XFfkmmcWizPE9Zg
	JjQn6cUUl7Hptb+gWfHx5R49kLDF77s+ZJTmrzOM71u3CvzeTfxJjXlw2d83UgsXGC55VqBJtNR
	Ct1nfPcAjFCEAfcQJKBsN1+Go4bQCgdGUB+OcjJlEuzDjGQDyGrFW250RKdTs+1Ii6SyoLdhSiT
	WMHNLtuqP1q/ejTlgS43a/Ho4m0k4NRMzn8m11nKJUCmcC0lN29TM82CFxFnL8D9o+8l8ZURlC5
	LmaVwFDU1GCwxP+vYo3+skGSWTCMfQ135mCLM7Lh65Cuag7BAwMdgkihl5L9QrI2DxsiFCCwxlY
	r8YgC2E2L8izP8/xAjMEVE5raSYZIZMC29sd6tH7D3q2Xk2+kgmnM/RM3DHh
X-Received: by 2002:a17:902:ef45:b0:2ed:8bce:aa38 with SMTP id d9443c01a7336-2f03efb1064mr209959425ad.3.1795677204222;
        Wed, 25 Nov 2026 23:13:24 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120016sm99270965ad.58.2026.11.25.23.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:23 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v4 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Thu, 26 Nov 2026 15:12:48 +0800
Message-ID: <20261126071314.253890-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

Hi,

This is v4 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v3:
- Expanded drm_fb_dma_get_gem_clipped_addr() kernel-doc to explain clipping
  and added an inline comment highlighting the clipped source coordinates
  (Thomas)
- Collected Reviewed-by tags on patches 1-3 and Tested-by on patch 3
  (Thomas, Jernej)
- Link to v3: https://lore.kernel.org/all/20261124074041.115251-1-wenst@chromium.org/

Changes since v2:
- Changed drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and used mul_u32_u32() to avoid 32-bit overflow (Thomas)
- Link to v2: https://lore.kernel.org/all/20260916033327.3054126-1-wenst@chromium.org/

Changes since v1:
- Added and used new drm_framebuffer_get_block_offset() helper (Thomas)
- Link to v1: https://lore.kernel.org/all/20260908090745.1089143-1-wenst@chromium.org/


This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

While at it, also pull out the offset calculation of drm_fb_dma_get_gem_addr()
into a separate helper in drm_framebuffer.[ch], thereby separating
responsibilities.

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address. Two other drivers were also touched.


Patch 1 adds a new helper to return the byte offset into a framebuffer
for the start of the pixel block of the given pixel coordinates.

Patch 2 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 3 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 4 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 5 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper. Existing behavior, which might be
wrong, is preserved.


Patches 1-3 are reviewed and the sun4i changes (patch 3) have been tested
by Jernej. Please help review and test the imx/dc and imx/dcss changes
(patches 4 and 5), which are only compile tested on my end. The imx/dcss
changes should not have any behavioral difference.

My plan is to merge patches 1-3 in a couple days. Patches 4 and 5 can be
merged after they have been tested.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 74 ++++++++++++++++----------
 drivers/gpu/drm/drm_framebuffer.c      | 46 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 +++++-------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 132 insertions(+), 51 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

