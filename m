Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645535;
	b=Qyp+sBp9mDJ558vAdnrv+aBgNW0AKxzrpsYD164dOQ8pVCV1tEmZ7Z3me7qPbVrzGEog
	 VQ06n0yv+MNG3+AKjyEW31cWV+JsiPDF8gbnsJSIyVvjaq4cPICNwshCS7mT6UALYk675
	 MEOILmlH9fgzgRnmM9q12ZyoBQe/euHQAgpIBPJOv+pWZiZzqDp+Rl/A3f6myZKkPGc0o
	 Ys0PW8REbIYQI7IU9ibfPfg//9B0b2Oauxmir8CwhQ6afUNW16GAzuLGMJO5Iqu+7MabV
	 0BPP3wJH0ALRdL18p6TAjM+eECLN5VZric7vm4vjjhfVktkl4vrmpKOGyQbmFqwHrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCCssxDP7VqyjtjkkMxKeVZicY7ZW2acPhjksq1uY6w=;
	b=u0xIWBLMTkUukrI63cO0X5k/YV6CfKrUerLdIBo48KsuCKf80MORfzwsfshfA6WITGlb
	 mq6JcZ7kc2383UrUmYeWFebzJYH8iWtZCCBKTzMLgQxtr79Zsc3p5qKeLqceeo8oV2w+1
	 IgOkyD0qTGJjNPSDaNA4ZTTH3xZ+P1ra/v4v+KXNsKjqawxz60e34haMHGGygiRv4JCV7
	 UDHQrBzEUBzBc6llhpGSr2OCp1Ury6OOFaelAEYTCWDO4orh/bR+9o3m7dnuvb8UTf5sN
	 wfoR2LvYHp1OYFBvp9SqC7tJsQ1odQMnsFnDgGftjapD8IeGFsxoszm1hUxQDEaCVdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XHR3R2so;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9D60A3804
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C9D60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XHR3R2so
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9500867eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645534; x=1796250334; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCCssxDP7VqyjtjkkMxKeVZicY7ZW2acPhjksq1uY6w=;
        b=XHR3R2so1mn1uGUnq+aG6WGdaxLRQ2F2VsbqIuDb7Zo768ZuZhwuDtjO+A89l9Z8wI
         /FalLqpBrFlX/MxeG4FXcZ8lYx33htKbBDUKVatEp3EWI/ZLvkJmdS5RGPy/8Pw+q7s6
         qGrIA/noEH1eDbW8I8jd45Uxy5Nv6um8LqjOvRRA/NGbiAGbZFlgl2Eu5lc4HzxNAVmo
         gc/s/ATFmLfJYB6UHLrgavGZsS7kse110nyrDmqQOCM1q3dn3X7bjzn9uCcuDZgkqvHS
         XYi2gtXoC3gVDi2F6Q8qNN3NNZh5Q9AuG1RpnesRuWqyo+BTDNHM9N5Q3UegetrJtZje
         8xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645534; x=1796250334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCCssxDP7VqyjtjkkMxKeVZicY7ZW2acPhjksq1uY6w=;
        b=p97siTz1XloYnF08HP0UKmK7DFZ9mWnSx8PahLPWkrN+yIoH2n8sWFmy6Q7XVOUtp7
         ixSwgls4nPwcM6D1PfY3xdhggap/lZEbLyVJ5ctK4vRVAMwKYj6CbPyRttxWQ2lB2vdb
         d92OU3HJz5nPqfU58FkqcrFMTKH6whQiX9U3wnAUeDi5pWLeR9FtNOpl+O2JKSWFR74R
         pti5q6dyzRrs2qDQRLbpnbW1vqtH3OSi90nnfbGoXgRiLdFIoNspYr3bMBBe2SxJJNHX
         UVQVxvl7oG/J5+I5cCX+TcfAs9W3AhOZH1ZBO7hE90o/Yvc51Zuv7xNPK/PIZvv4pJ7n
         Rkug==
X-Forwarded-Encrypted: i=1; AL+hErHQsXGqyct17gbRObkDXb64IFg6s1cJh16seXOaKiEri6A01iVf1AirGeRLzXej4kOU6AqHaLOzMQA53b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mxuebcafcVPR0F0KiWLJWefjwsk1X2IBafGDL81bPUPWmYpuP
	USLkZUlE4FmtgSB5tqoAaeYfLIV/lf740gYo296+yT2lJzrdY4hdAM19uC3RIkIIJhycFWjXNkk
	s7A==
X-Received: from dycnn7.prod.google.com ([2002:a05:7301:1407:b0:384:71f1:1227])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d587:b0:381:d92e:ecab
 with SMTP id 5a478bee46e88-3856f25884emr17876278eec.11.1795645533582; Wed, 25
 Nov 2026 14:25:33 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:12 +0000
In-Reply-To: <20261125222513.1446099-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222513.1446099-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222513.1446099-3-elkin@google.com>
Subject: [PATCH 2/3] drm/sitronix: st7920: Check drm_dev_enter() in crtc
 atomic disable
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st7920_crtc_atomic_disable() ignores the return value of
drm_dev_enter(), allowing SPI power-off writes to proceed after the DRM
device has been unplugged and unconditionally calling drm_dev_exit().

Return early when drm_dev_enter() returns false.

Fixes: 88b09229f34a ("drm: Add driver for Sitronix ST7920 LCD displays")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/gpu/drm/sitronix/st7920.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
index 091e80d8bda5..ea4566009c4b 100644
--- a/drivers/gpu/drm/sitronix/st7920.c
+++ b/drivers/gpu/drm/sitronix/st7920.c
@@ -580,7 +580,8 @@ static void st7920_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct st7920_device *st7920 = drm_to_st7920(drm);
 	int idx;
 
-	drm_dev_enter(drm, &idx);
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	st7920_power_off(st7920, &err);
 
-- 
2.56.1.839.g22a8290db9-goog

