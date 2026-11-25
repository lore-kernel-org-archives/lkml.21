Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621361;
	b=EeBj1Qci/HGjVoZbuJmTMM3172uk0f5UZpQ1WHest3yIJGu0cMUNcZYxOeIu6k3Ilx2h
	 YsMSv3qaf7AwD8lYHCElmMXjvtgNQP8IQ984lfllYRe9cmNVlXY8oa3sYQO86A0i+behV
	 mgoWNz5NpT8MTrqb1AKwvuYB353xMLni3ONSEen8p2CWdgg9oM6rU+Efi1OX+dJ8nuGsO
	 Vp1wJLAVUYlalu1G+TM8cDrkpG/MEYzU701ygSZLi57w53wZAAnDFmMD4fl8QzZba626y
	 ojaP0HDOm7KIkpp76b1w1aFVS13xkmn1eZgFWDv8qHmdST8tL1FPyoQi5RuMELetmXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621361;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=hZ6aFvwj2O387fKbMKxhHV3O1W/lkVQrorBhCvcytw8=;
	b=DkVx1ZLGOddx/ICy2GIwJxRADKydbWD3HMbaTlnOPpIEys33iSvfLSpzImnjMrKaPoRp
	 jMWRxEcIdmP1yDr8Mhe8r2KNpGR3l2xwWezcpybQftjs0rsu2WTaSUe+pGUo7fgIYHTz+
	 kcXHOtGNCETGyXgRj7U4ZpPvyb7BM92OvDfIMWnKbkQdO/PVhlZIELIVS7XmLnN8r5oNX
	 /b1yen3ROgdmMS2XE37vg0nGRA4NmmTL+ItAxg2THWge+Rx69kHqG7JYYhi9M4nOUX3u0
	 MNY1K7X+IA2MXDQOIu90t5GZPv3IM510FKfPT5c7vX1ZnXeTg28lyCsQDFMLT4coE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=q+fsZSKh;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DCD606BF44
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DCD606BF44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=q+fsZSKh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F4AC4E41780;
	Wed, 25 Nov 2026 15:42:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43BAD60480;
	Wed, 25 Nov 2026 15:42:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8E6B11E6A0D7;
	Wed, 25 Nov 2026 16:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795621357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hZ6aFvwj2O387fKbMKxhHV3O1W/lkVQrorBhCvcytw8=;
	b=q+fsZSKhmVhhOWJkMw2q14k3bPgEMKg5HdhwEEz3LR96EPw0iXwIMqIVyvv8PYHEMKQihD
	9NF8jyP9rWsuJpbVdK6GC3YZQu2bVdKKLjmZrVVp6Bj20f7k0wS+dcwe/P7ni0/tRKpPDn
	ybHlyCbBycJMuSYCk6RScCUI4bm4BNohsM9LMVpZGTYM+GSQ+i2Lnm7zntlVsi/pyklNMt
	SEEjMepX6imJjbTmvuJGIRSUbDXugT4MY9m3KUT29TIzuRV6ZEniEtI92BKPcNFoGY+5al
	Z9VS8iQtwkerSG7h/SmjF4240uznnGzbMDI2Sc1dUStN6i1uEaNj6x7qpKSiAw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Damon Ding <damon.ding@rock-chips.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Thorsten Blum <blum@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111164243.77775-2-blum@kernel.org>
References: <20261111164243.77775-2-blum@kernel.org>
Subject: Re: [PATCH RESEND] drm/bridge: analogix_dp: Use
 str_supported_unsupported() helper
Message-Id: <179562135215.656989.6398184433108139062.b4-ty@b4>
Date: Wed, 25 Nov 2026 16:42:32 +0100
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
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 11 Nov 2026 17:42:41 +0100, Thorsten Blum wrote:
> Replace hard-coded strings with the str_supported_unsupported() helper.
> This unifies the output and helps the linker with deduplication, which
> can result in a smaller binary.

Applied, thanks!

[1/1] drm/bridge: analogix_dp: Use str_supported_unsupported() helper
      commit: aad74288f6bf622e5560cf83564fa1b3891e2a95

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


