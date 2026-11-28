Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847953;
	b=cVDgXg0Q3Iow0RJ+aVG5ZB4vmhq6jZkXEdYIU6D6rPj9+FyCYrP6Ep+JZ4fYBY6xlwa6
	 4w6r6TpS+wI9dA2+G+dWSXKaRQj5u+x44a0x/PXEQ2c2VpA0AyZe1kCZv2D+tyR2ErDKP
	 TQGZRymNiCiAsFx16jt4l9NdT1frNu7ihWBjwukX+9JeevysqcxTeIQfJM3UxQp4tNjya
	 ZGrtKR9W9ksbD2DemTzWEHQtsFh4w3t5jB166zZV4ADlP28e5QdLu/JvdCtcyDb8qTY+o
	 j/cGg76oSQ1N3E/Mb/pm3Vy0LVVfOhSiwOrDPJ7YMi/kncKjlYDY4cHRK/odC+NSe6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o9eubjqyEqSUf1SnweeCwXHyF/MyfNmZC7QvIQ6aTX4=;
	b=5h04yo7n7TmpffH9hqiSELo0dl8XTcYIfCVs1czcNTwnvXuonlnXdzfMRX6OjDkNpcvH
	 hIrZzYJ/4aeWbCnRijBq1lEkgx/GVvY1whcCcnGOGcMZZSZqzfD9y/fOemx6fUZuM9xrK
	 3QMl//vCHC7PzM0il19H2S2awQjkgs0dBHT40BdPdBf9TXrkqWftp+/mn4pY3JEqKMrql
	 QcKIyVBVyrpok66yI1fLdyXAoo85DRky1cSQ+KFy98lAU40IlyuBNLSaCZam5ofU9K51w
	 B9qPP1dAWv5ukcv1U2yPXZQdVDIWnUIqX2yh/BFUuPH1n2IOE6zgoJMEUOzEJMX3ZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=DveYEf03;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7138606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7138606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=DveYEf03
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070781f63so4177304b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795847952; x=1796452752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9eubjqyEqSUf1SnweeCwXHyF/MyfNmZC7QvIQ6aTX4=;
        b=DveYEf03UdRFqSA72iitCoAvJkzkywIaMvL8lKlJoeuj5W+NJmm+3cE5wK8/XPqH3a
         cVQTIrdCVMJlLrSrGViTqs8hKf7C4reqhDM09Uk6DV/ALAlwYK+SOggutxvwJ33wKt4D
         8eFS/enJc8b7niEZ4Mv+cPHpqxvwYGR/0Jee8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795847952; x=1796452752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9eubjqyEqSUf1SnweeCwXHyF/MyfNmZC7QvIQ6aTX4=;
        b=0zaOrfubjnW5UlxpCQXp9qd6F+F+342mI056Ly02Rs4lX4nZJjMVpJyk3pB0WPu90+
         xuzHcEeZ1ZKC5SoQxOhgzba6492IRXwLZsWaoxq835vypzVI5ut1rU7Ctd1hL2hkUfSF
         MJdw51meD/x99hi/cAFYNs0AJ8C3pGvpZToWb1c4OcESPRlKY0WkRg3bT9xkXS8Y4OSe
         krRzxRg42mCpTGLglNUW/WZi3K8F0fzZBSQ2gwtyUWZT1AO/aVvT5yMMWYOMofxOZIuF
         EaE1+CUXRlVhLNwTWxwVN2EtZN71T8e5tAhxfNwFKIbwIvZjCM9ogaQN6qxuyZQqfOmz
         1GuA==
X-Forwarded-Encrypted: i=1; AL+hErEmYPq+comlstYSw+MzR8cwq685c7s7imLhklGmUflj+cHDkfQF3lYqG4lPLUiAMrWDExePYRoDWr+l/JA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VKME7vZS+CjzB3EiX8f0nbTYBf/VvjJwbX7UfmRoYLkG7bRw3
	qPJwOgpJv1keSKvWIfqL/tx4m8bkNdsMO4yjOX2wsj/yunYD4oOGdSjcofN18God6y8=
X-Gm-Gg: AZFdTZepLcOtdmcbFO3y8EVaNH7cxxzQ++kQLMy9/ykzczEEK1aucpDg94bxKpBdBat
	cO9vyArYHQB4cuqKsfvWivqzURqp6OxN3kRLgeht1obyRSp4bbbbPQ+WzdAfnEq1uZhpd1N4Rzt
	IfpdK0BnkW3W3ByTsLq+29sYARk+txpwhP8w4SYfrtdxAGB/41mD5ISs5mnFKzX1h1yeTGV+/xc
	5R4gKwSadVFUSI/ApgjuDtHHRSRc5rBfQ8vEe9d+wrkNe2dm9FJ96jUhkbDeTNm7yBwyYQ0DnjX
	xotryhBGp85BpOoPRVoI0KfW50KjSF8wuiUryojlUbw69M0WGhoSVQV4GqNakSS1LcBLbXw4w9h
	rBm6nRkKqeD2ahF3mz2OHbJcerCoPCxrGzjqEugLpLggpMGVk62GOcaYs3aYnd1e5Wnkon/TMo1
	0y0U5qQ7QAjGe5FyXmJd+v4+r4b/kGli/o92i+h99r2eJZKZEnD/1efEcxy9myTZ6zV8bziU+er
	/ZRkayXW7OD4gX/9zGwcUZintIGw6GCVFOJIVzEGg8wG9IoKRqkW1FlE8ersyYc7RBmrHob4iLd
	Gm8YfIbY2hIqNqHAWoAm/p2IY0rgTvx5PWVGJtPdCd/Yez2y0M/FGc4URlyUFBNHLocuC8c/hCG
	Jc4leIDGYP2v0NXQZwkwMPKpk+63VJf+zfw==
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr24975744b3a.36.1795847952011;
        Fri, 27 Nov 2026 22:39:12 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm13939838b3a.2.2026.11.27.22.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:39:11 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Haoming Gao <Naixumogu@whut.edu.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] accel/rocket: Skip CPU cache sync when prep_bo wait fails
Date: Sat, 28 Nov 2026 15:38:43 +0900
Message-ID: <20261128063844.1537615-4-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
References: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
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

rocket_ioctl_prep_bo() calls dma_sync_sgtable_for_cpu() unconditionally,
even when dma_resv_wait_timeout() fails with -ETIMEDOUT, -EBUSY, or
-ERESTARTSYS.

When the wait fails, the NPU may still be performing DMA on the buffer.
Syncing the scatter-gather table for CPU access while the device still
owns the buffer violates DMA ownership rules and can corrupt in-flight
DMA data.

Only sync the buffer for CPU access when the wait succeeds.

Fixes: 525ad89dd904 ("accel/rocket: Add IOCTLs for synchronizing memory accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index e52fc6ea7cf0..dddaf9d2fbc8 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -171,9 +171,11 @@ int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *fi
 	else if (ret > 0)
 		ret = 0;
 
-	shmem_obj = &to_rocket_bo(gem_obj)->base;
-
-	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+	if (!ret) {
+		shmem_obj = &to_rocket_bo(gem_obj)->base;
+		dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt,
+					 DMA_BIDIRECTIONAL);
+	}
 
 	drm_gem_object_put(gem_obj);
 
-- 
2.53.0

