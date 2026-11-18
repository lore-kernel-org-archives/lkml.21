Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990552;
	b=1hamXzJAJkEYpuswR+xk9DiLXXVqhcNbTSTWO327AjifVWblh9CsXALSJLCf3JPupTzk
	 U65mufdfNS40KTRnLQ72Y6vuKa+wgrmjpJXi8CgxhKKILFblsrPmwtpskAAWDIqCAQwAO
	 K4ZiSaHblAbyd1BHiakeGjUUf13DGIwAbq0Dt7bsYqZfuM8lF3IMDHMiIeDmtgjfHohe6
	 jjjk2BLj3jSiOZSjAHOJPQGNxegco9b2g68JbSQGR0H8ZZ3nQnPK6MemFTph3gJ3yHh7N
	 ogHMVmhad3wB8rWMOXr9ZIdpn9hFWQtmM+n+3714CNniCeon6Lj+y/shmJqi3uZO9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
	b=FvsInyK00qoii4rymczfcicJL4azgmjJoVxAF5dv+UPHHg7iksMhejqER6CjmCnCaSPg
	 73ra4t6oFWInfm4npNIJp/mjwJ1zEhYpyYxd7lmh5EJk1AlZl/quY7ZFHS0Q7pOjnz9R2
	 w9+1N9ndOR5vRPeA5JRT1wg4EdI4aLHeJ+JDBXScSRmaKWqa1RanhTKOCZBHXFephMdt7
	 CqKdpEu7QCDQKt4GbI6wLZ2jGflCJ5ZFsi6WmIxXZcQd27Yh4Bm2O8t8p89a9bHXSdQHe
	 J4RaFUTp82HIXKQUuff+5uYHtX+avac0a2fmzlHnj5WN9JSqDbHMe5VNMPi91nZwtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuk7bWkz;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231D8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 231D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuk7bWkz
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso610439b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990550; x=1795595350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
        b=cuk7bWkzMMm5x76oCo5yGlxbnQnQQiyj/9+xGoCzHelgE73VaiREeZ0xkR0PSNGHJH
         uti9RHNYBagVOenN4MN74Me5QLp2oOkcGTF5V0ONhIs5tiaxkzKrT1A2PZZVPwDMIiiR
         qLZjgeuXhf9lkh+8XBcA+IzR0jzsfhovUOj0FuStEWGRZROhZqsSvCXk0ZTla4gm6//5
         hoYC/VKHwjXxoLEPPxrDD9M1brVnmFax6vsf+zog4J+M1HKuFuruvVzLrYugEPVZryxM
         cxKM/7M6CxXo6S2C77W5PioobfmhLP8nUlhY+9YL8nyK2nQ6qrtNL8vyAaALRvaQjEwm
         BfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990550; x=1795595350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
        b=PRiHJO2EDVi8WlBq01tiDWRyD6fA7vsqsUjDPhdbrgk/L6arBDd9rg8inE82cRyk++
         qt1wxqzcLqKAgUmSLx13O7R42GPZQrSyImFzcNJxI6S27AMrXHu8h7e6RqmPwiq7ZpzO
         IIuOb2NCi5iagDSGfeVYcyd/WRvfvFRDhGLKLkCJ4EbcA7Li6ezzqtEoY3uDAwtufHYz
         BNLGucmJ9Q6BOYRYVMraJ3eiScEpw7iSzYCGSCo/xo9pOE9pVHDXklefqzjzXV0Kc3yt
         H+EDdVujM6PqCmq+7zbMb8aP5HVx0eUI0qO7rleH4hK9yWb5ZKF4UTofdj5mMgQ0hsM6
         Ze+Q==
X-Forwarded-Encrypted: i=1; AL+hErEhD8ul8N9aF7gpJrm5HYsdWY1Q7HYf0vNqAYOIGjFgwn6J3HRKt5oph7yLa3KJ6CT0+8KJ1II4GFL7x0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PQQSMoIg6B8g5HYo60HUUn0ZX/H3oGD7qH1YMqQUJr2OxYpxr
	RamNyzNsb+DbrV0xpbC284G4sUBQg+2pRPo5/QjoZbvDhw17EGLeQUw3
X-Gm-Gg: AYBFou3EjnyxD8peKbpOXG+nm1OYe8Iffa1C8s6Qhd/jLNrkhLvq7BYSbzgOcUUO6Am
	j3iO3cmmhyPRAl8LULS+vFZWYnLOHX3fLFtLxI3bOtSJawi96alLFVVG8Dym/WXvL5EYJRjv8Lu
	Gpzao6wpqYkVAgd4XsvbTT7eutYzAfe2G+5b4nxgbc96OzymC9+S0M+fVJUYiyW21f6B5MVxGc9
	fKSGZqNy2KzzJulM4HDul3Md2KbPuaVv/U9aLir2p4lnQD2Om7+QP/a2GV6pKHtBdBCLYyFDh/G
	X6FZTZc+GFni3R5JeIOy9mdloDNt2xfK/PO8wSbCcWIaTiZ1MeWA/+Uq5uyzEh2g0jJ6h7GPDVB
	dCelCn4kX48kOWx5wRbhMRob79KOrNrhvLdvYyppQpT5e+Fzfx+LIYZNweYMXTiEOqAPw0fNRpI
	8RpcrGR46FlRaoxUz7NW4lnAPgrQNumz/gsthV0v7Rkh2yzNP1P45ugHrusVR13kZ9ue9YaAm7N
	EbJJwAq/pBsC3+C1xmljU/Lf/as1YilNvK2JGsUK8XPARgQRTAUoXDVhQQ+VvIoqRm6W3NfIOlH
	5GPtauYZwdj/5aHyD/kwXCNnaM6v/CBrsFofKmSRigDIJkv9Pg==
X-Received: by 2002:a05:6a00:1da0:b0:899:5183:acdb with SMTP id d2e1a72fcca58-8c5d0f24a1fmr1572117b3a.1.1794990550197;
        Wed, 18 Nov 2026 00:29:10 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35db4esm784426b3a.35.2026.11.18.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:29:09 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] dmaengine: stm32-dmamux: don't resume runtime PM under a spinlock
Date: Wed, 18 Nov 2026 17:28:53 +0900
Message-ID: <20261118082853.926607-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
holding dmamux->lock with interrupts disabled. The runtime-resume
callback stm32_dmamux_runtime_resume() calls clk_prepare_enable(), which
can sleep, and the device is not marked pm_runtime_irq_safe(), so this
can sleep in atomic context.

The lock does not protect anything here: the dma_inuse bitmap is already
updated under the lock earlier in the function, and this second critical
section only wraps the pm_runtime call. Drop the lock around it.

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/dma/stm32/stm32-dmamux.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 57318715d9f3..890328b3d302 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	}
 
 	/* Set dma request */
-	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		spin_unlock_irqrestore(&dmamux->lock, flags);
+	if (ret < 0)
 		goto err_put_dma_spec_np;
-	}
-	spin_unlock_irqrestore(&dmamux->lock, flags);
 
 	mux->request = dma_spec->args[0];
 
-- 
2.43.0

