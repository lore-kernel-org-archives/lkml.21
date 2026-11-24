Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506054;
	b=L8LUMd7EXesjNkaehOZ+xBvswkoYwNb4hUOxNYY1VB9xH/Lho/XQNGS4AIDZmLPaqRhR
	 R47TGuIIK5Fjfzoh4RCuN3Zxs3cq5ZMtB28n244eVbc9kUOKE+XHwNFgwMYpqmwlMawYt
	 nI8E8XOKXjJsCvZ/3oItXXomAUPSq2OyXnbTX6BvIEq2FDr+fvEunxnnreicDdHIF7zag
	 tycWn/zbvCyeWJdnMhq8gls6iMHrSmjW75UVMvUPaqaSrncZibS5f2e5YMeIYZBZ7kHSR
	 FCq8rG+YivT5ZKHlbSNaSijhc85erD9ujnwb8lOOau+aUPpnjDx830Btse4HsfV3Rsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
	b=MhzsCyPe9vENETDBjbv8DzJpnFV/tHx4Sxk8Mz1Q+/QW15N7t7pzxkdnKvr3TJGnJ1vD
	 3RqSlCcHBPHweNvvzv74x1ipcoVS2RECKPULQmKKbAxupZbTfCsilh9GX5FTb1Q4AYZLf
	 ESBqW5/qRWOcgzJkEEiBle1Jd7yn1Mse4NJFih77OKOzIbiX8ok0ea4HDMcb9fnz8JYVG
	 dLwvoejlQHZkg+uUCryoNlQ5qUZ9uHOSlo4S4f7FaJKLHo33pzEQEk1qqMtAIRa52ikS3
	 F6LTQuVcHkuu/O2upvkO5YiX7PlYDqMLunXBvEVmb9GTGjKGQEFXt8c7lOfqxe6Szkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QOBMnuCc;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC9606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCC9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QOBMnuCc
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2220335a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506054; x=1796110854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=QOBMnuCciKZxMC6+SJMbmUhhZCgddCHcgEcOm+CVxeRmCEd9IT2bxMyjdvPuIjIVyA
         RN9pXiRnP9Whj08zCnF6R/5nWYLsBk/VY4K8EV/mrDi2OPs+vpkMcPsyqP4ExND5yNq2
         ONa3jfHVqpAz16tLaH8KVa1Z7fsj4zlVXY95Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506054; x=1796110854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=g5RAvDCdrLqOB3WYHg+72oqKwAJJVa5xBfEMyzPJ1Zf5vzpIcrznp0ZcOsxhRrmvpn
         EQqkqWUfvd/seKrX/S7519oyatB/rtLLVaSNUySKAuNR2ry+uFDSiJFBAeL6WQ+mSIQW
         uWyCQ77Ply3DxE9q5VoAa9NhCaFQhSu/AwSWXaCTlzRC3oiAPRrGqEBWjcL7pAlA04UB
         lVdKZfjDTZtBu2u8kxcK0buNbh+6tdPZNWvdTLo/be1E/IMxSs4TnZoByOIxazWafYuj
         FvdKBYg9cwUbl/oM8pAvUzTK7JPA+K8MStY8BlPwwAPtXxHTGt2uevqISEFBgM7uOF5j
         sDJw==
X-Forwarded-Encrypted: i=1; AL+hErH7VCcu87007kYhiEIMbtBryCBKp+aUjMjjk+7Qi2+8+krC0gjgqe7mXpmqRsYu376jI+fWuHJUFJTBi1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YcZMwA8XtJAliCAwn8VdzSehW07IkyqaMP7AJUhYl3XlqM7g9
	+PdGSOCAQ5RmqlFkTjMIZGPSmTFhCKPXRrX9jC5WZ/JE7xwti8V2MF6VR5Dcwt/JWA==
X-Gm-Gg: AZFdTZf7YeBco6cTk5AgipqDa4aHMsobpz3JxW9Aeo4UvMDnUlqfuDPXupmKoeJqWjK
	DUxnGgJUDCGO2Nt93dNG0NM+dxoagVMGkd+fWt8pUGb+x3IbX44NAUBVGMUFLCRDMCQVK8adxuG
	R06yg15tvOLhiWsUi0zMhtxI3J1U3Ud5EZf9Q503scIQRMekZ91hKKYpwmC9b7SUp111fwCKdPj
	IwCdPK9iiZpkuypPjZq77mJVxIvEZoAFxsrXK008fKRAdqKN5rOAamXhlzOJb+ekgWyLMOGgMIh
	ErKlzSmn5hwbvO1mNMDtRdWbCuX9fHcxyObEOKTYoFWKYf8xVNH6TnZ6Br2XyPWG2Z0hq9OTLFH
	VaHX96iXDpTKRDl5T46m8KmIqwqessMQoCRPBKGXc/A4Pnip1aamjKvrW9f2n00mtpErqfnI34/
	paPAgQHJ0bZ+Uf7dAn5tOkWGkaIcch1qb6DZoA3bB03vsDf+jlFzpaECiwXP+8jqnQksErQHIyA
	tg6/yS7HDOKjZpPVGjOBa37KPH8bmxGyLNEtU2e21VMMPCRkEDPJhCISOJdKRmahkV3VdV/WfU8
	0bWjPzXTdjI9imkf2dMm+K1DTkacPymlWSB+cfTJ0rM+8OIbxP114BFbDJHS
X-Received: by 2002:a17:90b:5289:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b41c9080bamr13617140a91.32.1795506053661;
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde84cd5ed8sm3771777a12.10.2026.11.23.23.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
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
Subject: [PATCH RFT v3 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue, 24 Nov 2026 15:39:28 +0800
Message-ID: <20261124074041.115251-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
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

This is v3 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v2:
- Change drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and use mul_u32_u32() to avoid 32-bit overflow (Thomas)

Changes since v1:
- Add and use new drm_framebuffer_get_block_offset() helper (Thomas)


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


Please help test. The series is only compile tested on my end. The sun4i
changes should revert its behavior to before the drm_fb_dma_get_gem_addr()
helper was adopted. The imx/dcss changes should not have any behavioral
difference.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++------------
 drivers/gpu/drm/drm_framebuffer.c      | 46 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 119 insertions(+), 51 deletions(-)

-- 
2.56.1.809.ga0b61035b5-goog

