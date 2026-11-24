Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529955;
	b=t58OVe/uEDq3an5lLZCMkrKynvJOhw5/Y/e5q5t+KaOrfQZkXkq/eE4RhoSFFASXu/OI
	 IffNjmvkaA83ev73kVKkOCBz9ztEkvybZ5Vdc23PktbU4bSZoMqO+v9JrVABUmSa0w2bD
	 q4LKXRAFLB/FOIM610DkklySVCsMIyykpMBHVKy7Y683403D0b9AnugM5aqHpIh59GRY6
	 ALujCluSExo6TzzcLPAEnPWzePqRCC8RtXpadCA+WWITlMZvLOckY7UpQ6YXdryLaZIVF
	 IeYwpkLYKli0M+ds1FWM3/q/kfnzRN7qkMLLBrpzPaoaG8hLOAk8Nvjkh/bV+e+EM8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FMjmA3g58cbdRJH+TuZR8yvx5Ws9bbqbRFbDnHsAmms=;
	b=r+opwCrALrIPLj7xINCDuXmbhFANvbddrqoQEw/z2Z8ZRnbWWL87t5YBmGuNQxnsUUMj
	 c5tHF/63Qp4DDP/7ouSeecuQCaTcQm694+eiYRf1oDPBQbEcGtJtRPsRTOGm+Dwghm1xP
	 XzXlyHJz4i2BwpQDuRJIPsu7Sy2sdbjvTDLGUr5i9biFrYDyqa80lH6SvbPE0KDsxpk4h
	 MvTNflelVdMwmgln5Ni18yDoocefERx4S+juVgKhvg6uMHymo6yZKMgXYNDNC7P2Lvx6R
	 20lxvpRSqIxjbwNUKFkZlncJ43OVGI7cvVw16VB98X++0/CVkYJigvEjxClk2xr0lww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QarOh/H8";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QarOh/H8
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2628721f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529954; x=1796134754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMjmA3g58cbdRJH+TuZR8yvx5Ws9bbqbRFbDnHsAmms=;
        b=QarOh/H8Q+hpeRYIsNf53wUP5yaJ2sxmQ94xpRM2BCA/uWMjyLIrcxG3UB2tNCK4oo
         17Euf7alQ9ApFVO8yboqqLgtIZUXsMqn2FR4vygBFr5Egp5PomoJYAKndTcsWRtYlgBV
         r+GCdj6SJpkixUONfUoFQsr56m5Uk4ZBOI8B6+ypsnCw3u9mTOn8q74oXG1ZQXy1HbSn
         5uLN8wmSS/hb/ghAr47mB/GTf/5HgxtYsruiKIUeFmCkVGNZXN8wKpP7ueyXZoAnVPiA
         GqzMcpDgAY0L+jukJwGv52of3svJEyFru3ut2P+0EF15W0PFidh7tfFFq8r8NKPrIa5G
         kTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529954; x=1796134754;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMjmA3g58cbdRJH+TuZR8yvx5Ws9bbqbRFbDnHsAmms=;
        b=NRtS+5exQOLpa2DmBjT5WJeiq71bHG5ZHqaKXpD1do/N1cNX1DRiZpon37/4OvdH6x
         TUJEH+9kRschxVLPkV8GA1L/1Eku/+nmI95NbL/25RgXA/y27VabaAYK5N8GupxlluIu
         MmmPcEOeJlwBRPhP0XRY4wExpMD5JV114tHOp58L5TGhxAFD92XIU3iJcToMg/WIYXF9
         PZKVHG7VaUnRMI9zcFLuWGRcbx3PeX68tu+pC6NvkrU1HeOjzCWN1vKEAp/gKPFHUCnm
         GLCyKJmi//86lK+JBeCu9Cdao0Frv1xlk+fKtElvV/LLNmu8S/05k0xg3v//jMBdBBGQ
         vPqw==
X-Forwarded-Encrypted: i=1; AL+hErE2eesPQ6W/sdldqiYq52OxWw/oAOllI1BygElRhdb6bsevvIrKUquveZBtLJp2bn2mkiFJC/4w3gjz9E4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eqV03oJ4H0Tsx/zOyo0oJC8QvGw3F+y7WO5LyHdNSkSMiBp5E
	Mo1Ue3R/SAeLIOZMwnxBz6WfmxgMHEqb4ca9LWp7pJ+W8U7AfkkILHRb
X-Gm-Gg: AZFdTZf5Ro3Vit2DFgSlDCcxDU/BrYXcHTz47yibPvDRHNPn9YGJz6bqzsGwocxIjcl
	NGTRxhBnGf1Pa6+/H19TbiQlkX9ERkto+nl2dLrlkcuf7rCQosk5D7fWA6kJz/lbO8br4gImEp1
	DziZNG3owbdT+YIqc6vIPWX5QXD4JVfDzwGcmoj2+kZmMuKhToaY5Ua7vjqLKZWY51KqqpZu65H
	sS21YnBY9Q11cNj1Zs7o2+9aOBbopWy7GMQS2pzysDtL3R1ZKQ75rhbwo89vxCxknWSp5Kxooje
	2Rlx3b8ZmZG0DS78tyUD9bv1IgDDuUSCYOBaQUAi1zNJVZjv/f/jF38WD15mbgo8zukNkEoCZa/
	B8Kd+RzEBy91O4g44TdvdJtQck6sIbMLqbAEvS99ANgp1SNonoQK9C5bi6fECMO9Rak6APfUIez
	AwQbA/6aAULPaJ3ARLBwJu9Hj7bhW85pPWeXRa4Kic24cBgug9eQCQXeVjze3WDU6L8OclsBvm4
	y9p7tir7BchbFdlwWJL2+nKugkWZ9pUxqqjQZHQ/Zjl2bqlF5jl0G/oop5D/wUNkttCS2qaAAkM
	dWJQa2P/cHRVTREQOwBVD99lOgO6KU2peTqf/pKVZ/VitMRqR9PLN2Y8
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr29201059f8f.56.1795529953487;
        Tue, 24 Nov 2026 06:19:13 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm28994719f8f.3.2026.11.24.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:19:13 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/2] drm/panel: simple: Keep the enable GPIO as left by the bootloader
Date: Tue, 24 Nov 2026 15:19:08 +0100
Message-Id: <20261124141908.443764-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261124141908.443764-1-maximpedraza@gmail.com>
References: <20261124141908.443764-1-maximpedraza@gmail.com>
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

The enable GPIO is requested as output low at probe, which turns the
panel off and blanks a splash screen the bootloader left on it, even
when the display state is read out and kept.

Request it with GPIOD_ASIS instead, and set it as output when the panel
is powered up, since it may still be an input if the bootloader didn't
touch it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 33d954f3ee28..d9e74d778575 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -336,7 +336,7 @@ static int panel_simple_resume(struct device *dev)
 		return err;
 	}
 
-	gpiod_set_value_cansleep(p->enable_gpio, 1);
+	gpiod_direction_output(p->enable_gpio, 1);
 
 	if (p->desc->delay.prepare)
 		msleep(p->desc->delay.prepare);
@@ -682,7 +682,7 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 		return ERR_CAST(panel->supply);
 
 	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
-						     GPIOD_OUT_LOW);
+						     GPIOD_ASIS);
 	if (IS_ERR(panel->enable_gpio))
 		return dev_err_cast_probe(dev, panel->enable_gpio,
 					  "failed to request GPIO\n");
-- 
2.39.5

