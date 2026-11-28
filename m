Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886157;
	b=ftNSzQPrPmjfedr84Fz2FNM2zTyP51HW6ccGbvmKAMjrfEFjix2i3zSr585VWADFYCla
	 UWa/6xQAtgM7CHeREmAumD5tBCiS2+PB0LPfPcBY1E2OW+o4tEYDpleBFsjO8kJuEtTBU
	 AxWjKmC0bFPNZXsA0oy1OYPPZJsY3HhBFKkhxAK8Y1aDGg9eRdPs9TYAGwfwPJjfTEUdQ
	 R6+8KlYAXBOXrJ8bNghZWzyPp8hrc2eKEr9fkMxS9ynD8EUbsxvXMxfuUnpJ7Hkkumupe
	 9Hm5n7MbR+GZWRKoCuXucpBOs92qFaQDk6UP0JJcizey5+7kvhshyWlhvLMO4M37jbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=c1vMoZUCJw13vyPeszb282xZTnsQv5ULf0cnvYycJTE=;
	b=13uIrWxmhsfw2nZ2+6C0bolbDjWobp7W+wDzqBX9o4H2sB9GzXA2H89qWRczFxEVLUuM
	 qB1OOV9S4VZetyKnRbvFcVIikJPJo2PYUom7t5/G+CToD4rEUbog3HfslhWUWF4kWkPME
	 +u90InAfl3Wq574AytRfd4sFOewvQxI6tjlI7JElj+evY5CQhJDP6yzV7AX/FQeDGPpwC
	 fQslkjZW2TnClEaoj6lvFGvMIAbZa+1MSHtKEUNfFNZYZOQj4nEMUc08J2rq5UdgyiSLm
	 FaDg02qXZ5Y8cGzr0/RVkwvfQDV+OiEYrGrr1JvW3UsDz/8RiDRHq3oGHX931CmZ/Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsOJRP2l;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968B606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4968B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsOJRP2l
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso5711210f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886156; x=1796490956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1vMoZUCJw13vyPeszb282xZTnsQv5ULf0cnvYycJTE=;
        b=YsOJRP2lRll8G8MCYoMPOmjWhaaabbWpYfQvDf0fc55S1KQ4yXS1f/lCnco7XlDDF5
         6kf/dHx3V9M9ke2i5SAb/Mq0PSDpO4C9i4d1pj5bRNLSM57wd9F9BNmFkznrzwKQ3A6j
         J2VxHKN3G3MQIHGld6n47CLYALjA63T3Qy2r5lnciB8sI4ZBvt+2FhNTyKLVzybze6fT
         oUbyVl/ta+SW0znTvwu+duxfi33hMMo/WQqg8TnGJQ24f8cw+84gCB7yXpmKHNClOVTK
         Lbt/QxrKNgrqPNPWSUH+nZAuWvcURVHoBqZDt1J9JDpvvZfBhe/4wsULHOmOHnQIc0/M
         9reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886156; x=1796490956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1vMoZUCJw13vyPeszb282xZTnsQv5ULf0cnvYycJTE=;
        b=1cE6wPt789XYhE9Y1Q2Z23ZEZVYPqGxNCkufEV5btF6XWfsKPIKZe4Dd1SrVKG4t3A
         ynOAB/GxznSKSjL4j+XzQRO7U9KEPLe0wM7R5CtQv0Ht27kLtmyiYssNPqmIVwv8gmoP
         7Ak1MiZTYXvHc6eQ/PAcU8JUH4EDpBdzlNhvgWfKfrQjmuaEjBIfD5S9TFgDRH2CXvTW
         s3ZHiaO/2c1SDX0d8V2r5jLh4wkbbkggx6Bfi59IJmZc4pvx74rbf+1LIRU1ArdRqyjN
         hxri0A7ukgLxvJWadTBdGelLHje4Rau6IPDzUycWHZe9LjjCPOlxbKir5l4ZvhlOW5xq
         5euA==
X-Forwarded-Encrypted: i=1; AL+hErGXVcaTCtuz3WKnROQGBoWVz6JwskNH79fZqOb78ip3ClVafI+cTXAS1wqbbEsl8eZUvPnRbPezUZf4hDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tDhada4ZFi4Ak2J+/vx3f6oLFQuL5B5yMknJVVqL2uULEqekE
	e9f66R+zl70tkkGszartSDLSBxKsx+Xz5nD8S/LPXLmJtFLTVWNirYaA
X-Gm-Gg: AZFdTZeeonuaiEsedXdWck+9RZwIPM1hqfyeouy9mWJimts9/QSySriRhF5pICy+cPr
	u58uAJYCSyvntaWebE9a99WiBHhyE6a2k7oLRqlaOQFlJ0OQ2GFg3sT7hw/zJlZYG0FBsAf/M+A
	Yf34uLBJYiltLk+RAfplAx3Cpc3fON0yYjIWKTP38a9AcxUPoCFOAIQrZLEOHIph7h83vH1r4k+
	yzVpuGAg5doQczUEpvsky0/CzDuXvLrEWID86kPF6qLRwMBUBF97Ej+VT+XR9nVKXyuN7GlRToU
	h6mf/VaeM6kN0rF8OvHoRSJ06j65vo0uyskwcfVXVVv4sOQ8WmQ+juW79vcqx+GIuVpe6PhLhzx
	AZoHfsWMzMGBbvRN5YjbpFbbBbct8Yj0/KoXXYvLa00VOmfjrw3QRaZcXg+Ka0Dp9YqmfpQr6MN
	B8Op3ole33g+7RMzMzBfiiC04H8G6CmNnILeiIynKYA+u9CN0xM2vl26ZSFD54mOAH+UhgJdOxk
	/Uv+kuFjlj2tf56PESXeDcEP3YHC5L/SmUDExGztJeD2DpQZWwUFcYwWeMwZch9GUpeztTtMQ+/
	7U561XViMyDG4cwRxvrwyKPlsLHsVhihti7RUQ==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr55055874f8f.34.1795886155636;
        Sat, 28 Nov 2026 09:15:55 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:15:55 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:20 +0100
Subject: [PATCH 2/7] drm/vkms: free the colorop whose initialization failed
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
Message-Id: <20261128-colorop-v1-2-dd79919f822b@gmail.com>
References: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
In-Reply-To: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Alex Hung <alex.hung@amd.com>, 
 Robert Mader <robert.mader@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>, 
 Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The error path of vkms_initialize_color_pipeline() walks ops[0..i-1],
but ops[i] is already allocated when its drm_plane_colorop_*_init()
call fails, so it leaks.

Include it in the walk.

Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 9424b1994239..ed557a1c6a05 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -126,7 +126,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 	return 0;
 
 cleanup:
-	for (j = 0; j < i; j++) {
+	for (j = 0; j <= i && j < ARRAY_SIZE(ops); j++) {
 		if (ops[j]) {
 			drm_colorop_cleanup(ops[j]);
 			kfree(ops[j]);

-- 
2.56.1

