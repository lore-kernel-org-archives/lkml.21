Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361464;
	b=L+lDLUrChGxKwJW+eaYVKZfyiND7sWVSeMDkZixg84bNtOWQrrEythUxXYwahBD0IXQP
	 33GyvHuiQhs7R7NkNVytj0zi8GYCK5m2/9f+JLkM0Yan8xurNi7Rp0lmwLpqS7dJYueZ1
	 f0APTDXn5twqXaQqBKreOVhRImLTpJ98UriPE53Ap5138C8N+JasI4Ke/yZijOXkXXul8
	 I/TzhoqTuP9JqexBim38br8fnM3y9GIfoJtJ1wkvrHSV++17qF32HpvjNZwQSVcrdr738
	 vptQ9YIV/kHhtnpb6/uuKU4GvwOz3xEBez3EAD1SkZmE47/dsftsjzAzkhbKemWGOZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
	b=sCaqJN+86ZVpnHHV/5ORHPtKJxh7TvK6RBojn4ilaiyNwXvl7DfJoG+NYECYFezk6PqQ
	 m+mVcG9D2hHL7+8/2LHFOWM0rQlX0waCEcwp1Y1LoKnGT0DRWfPIAxMUPGlEb0vbH7+1X
	 Wy3AWNUnsbNvddZlfhsanClwsyxr6l0nCx8q9qk+OL4FIbWijwWC4YgSidl0wdaH/qVtW
	 7PNFdsBePhdM8u2cyE6g3oB5wNaSgRCrk24gQXQshipb52ItyBoKIZhD1bp2eXga9RLbb
	 YGb5k03fiKUfEnQ/hbDGs1H6gGSD0f5Fss9Ppns2gX8wMXeXPRlzQ9HBezXzl+4i4ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=b8y7HYgs;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A08606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A08606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=b8y7HYgs
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23577565e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361462; x=1795966262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
        b=b8y7HYgscrLoJcq3QIFYMPwrxE4gZsjdPc41fJ9pH0LmR2QATaze4McWUL+eliEG6e
         8/mO6fWjRnR2rsURVu84hLG6u/lFOZ2YHEsd2u/PSLRAGUryc4zI+1n8P/d1XMp5OGQT
         vY8CPIHe3Yu2oZz2pSf7egE6ytlzoHbtTZE8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361462; x=1795966262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
        b=CCgb4LCXFT+X7j2uYPJduFNzqrCqE0pvJ7z2hHLTJ0lTrhuSskwcqAE29c3IwcTaqC
         ZuQsQSpt4xKTxXnoSB9K/MpcvNgiLz/0M3ZUBpQvH8cFGlteI86jjxAyjr1d4PcP+0Q1
         s63N2ZGD8DVyJpZbcS0+OBuRT3uH0Ov2CrrB/WRah5v787aqtdTsCvu486ZJYmDj/g6W
         fekap6ocZ0KuGN0ojGcqiriUUwWm1LXDY8xRJQAbudjcLsiS8ENlPIyoQnllqn4GJ8H7
         1P9z4auN5bOtmw1NfkGo+/YDhXp/PkqmhEaTN89DblqdX/cBqZYuVmrXOJo80EbmCoUm
         hi4w==
X-Forwarded-Encrypted: i=1; AL+hErEUljwL4tytsmLf7faP787JjVGD6i29TXzHxlMJykw3WR8mnmZAwxQEUUk7HBPKK0ikN7sIbMuG609BzYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z804vHGmo7GnlWnCn/YJcvQ9rLEu7j2DDYi0Id1S7edslWa75CU
	oMIuxow9WYdl5WQz14G5b88JwLjYuIkpWSlKJ1kDietCLnacD3An1+mTuc6hlbOKUCY=
X-Gm-Gg: AZFdTZcYCHNJAUOl9y8uuN9U2CSInsoqbfAbR51+1q+zhTjwf03U9ZwEtjslIEaM+Z4
	ac75EgSjZgzo4SMmQxgLKZryj2ddZ9ow+kVAp8MdonwN4Dg9mbiPt88obZK1sMsL8lFNvA9Q0q4
	EFdhaQKiG0kz8xFcveYy8YkBNEa26y1LzZKCn3wmMyjE/CvgpKED60ErEhkHBZnqn9+uAt+ySkL
	76xky5LfqmACs9sIR1UN8xPnv+JRpG0ORiLFc1yPHxWcj1T33M03QqnnSE4ZSqLa16C8RjIlU9a
	8HTy4helTJ4pM7dmsqXrO8N//fFkLoUlv7Ib0QSsubPPsSGkW589TVy3XBrFmL0jr1X5+FwMgy/
	hF/oXFCi2orXfsppsFcSzmGFVM5uXXTiQOouBJh0UDSfR2++ENq9mhARPja+18VL989r8Fi4eg/
	/zuoXwnJilxc98xQ5rEO5YBTaM1csM4411Cb82NLFUIPXlgQ/C/znjy5Hixyn7BuW2TakFw0ZYF
	t1S7onhL6KxgC1oRZp2Pnmi9DhpwCoLILB4eem3+fShVaeyzC7GawvNX2/vFsAXadDBAldgQGbu
	k0Tm2S+vOjhLivavB6tmInVwJZRsGiORStV75RiPokFIy2GIjWIiXmmPIkKXac/DXtzhXZgAiSr
	ZDdHSXSLavFb72pZLaRC21BqfU8ELaYleeT62rNFltcJKfyEvPFOTEnQjUo8izVlm6L9Qp1WuPK
	3q61Il1NHLx7xAVfpaiUBJhqYfMA==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr186394735e9.31.1795361462157;
        Sun, 22 Nov 2026 07:31:02 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/8] drm/mxsfb: Switch to drm_mode_config_create_initial_state()
Date: Sun, 22 Nov 2026 16:30:04 +0100
Message-ID: <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
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

The hardware state is read out only when the initial state is created
with drm_mode_config_create_initial_state().

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 038f5c896dcb..c8bc79264361 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -322,7 +322,11 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->mode_config.funcs		= &mxsfb_mode_config_funcs;
 	drm->mode_config.helper_private	= &mxsfb_mode_config_helpers;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret) {
+		dev_err(drm->dev, "Failed to create initial state\n");
+		goto err_vblank;
+	}
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.43.0

