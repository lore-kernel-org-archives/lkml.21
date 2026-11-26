Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688636;
	b=VvckLvQw8mldwYzuLx+WqFGl3DQWzvtjfW5HOGiVwHz9zR4ud5KFcQMyuBh38rhxNb4+
	 b9WETY7GyRKKAFuOPZxBmC3uY0UBrD54Znma6wMunaMIy6f5euH6Gvk+BVHxUJA+J3SHE
	 SlgzMPG4MXM5iSQxlBNS9+vbsRFt3Aieb4MqZ45BeUJk2AWZG9xg0LjX47aWiDcM/KSIl
	 vM09s7d7yHCd1FCxV6FF4eb3T1UI2B7qVpuDVK2UVPhfpgFebXxhpEHxypVdmoke1IGRR
	 1CVGD23oGxY5mKhAMJuFQ4C66Eq0S8QagqAaivgckXrxgxruk072tRIbjNuylfWQuJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rMMXxpimWD9ofCyboRprDPWf9DrBJJ1w7n/6Xi+aArM=;
	b=K5izu0PTCZYB2qeRMNxhwzPfYpwQttmjb+YwisK2kKxk52svyaxZmN1G5wEKBmSyoqaZ
	 YV0soLAdCp2kjG8Swwn2PHQWjpfp+3cHQelFc5fEjTSRTGyYtO3qIUK4NFUADaZaRGvtQ
	 sSRPebB9L6DBICXcBIhVwdLOlCHAMKfrjDSdKrV+64jV9jVn6ANJZ/LpVTqxkR06JNjmZ
	 qJhl9MaSfVkOFzwot7NsRY2UXLYmb3+VKrTr34O6+XvXRD4s2v8GFaJMFJfXWVEAeI6u9
	 TV6fCSey/BWhalFyiBjXxEWH8kPUq0jD/OlKsk0wrQAb8WmvoEON7Yx+WbsM73UdI6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJ94yukw;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AED606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32AED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJ94yukw
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df3912dd2so366348f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688633; x=1796293433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMMXxpimWD9ofCyboRprDPWf9DrBJJ1w7n/6Xi+aArM=;
        b=SJ94yukwkU6sMA6rz0bgsiXlOP+iVPbAn46JDIJ91amM6cugBTCk2bllt6+Pm6/3a+
         it9nJPOQ+6mxCSq+mSdDEv8CuNV8Q/pUQVCFpmSs43SHUMj7nrkgytTue+U8ML059Ges
         ADsNwD/2Ka4qopeoFdPpEdGZmThAtESHCzppDfZS3TFEQpfWe+UwjNXZ6PnFinlsxTAZ
         ERiOykkRLnXghsiatReIZYKx6Uugk0XYcKOb85xOzCmqIv/UoSE++P2WJSIcxhc6EA1L
         nnWrFYccFgl8WqzRU9BS41jUClwJbVuVY1ASuN4Kxqh/0krZ5PCxylY+Mj3WIz0A8DB8
         b1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688633; x=1796293433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMMXxpimWD9ofCyboRprDPWf9DrBJJ1w7n/6Xi+aArM=;
        b=jp8619Zk4mf/ADBHDnUGy8zdGE0/rsike+FE6y84DNECt7gST4pYIAXKLLaZIQ+bmr
         f5zaJw2rEAxL7irtxt0eMXkIwSjIhLwHMcifGBtJd9Ib0wPNlgf+Twh9TcYGAyRdL/iu
         ur6RxtEOvAIGSK1id/XcfA5exY/9X9+SLtSNvyafw70gCTDjL9/TpIzQw0oaKbc7tKhn
         NquRJlb0cezlp/wM0hr3I6SwlhD/yzIiy/oirIzjvaUGDhVEYmjRYTMjzYU/f4/fbdyd
         FN2pTl4bdiVbV+BRJIWDiOntvUDGAF0d3VX95RWilpyHs6TDgHrL2+gC+oOkj1DbEZuI
         yddw==
X-Forwarded-Encrypted: i=1; AL+hErHw6yNP6wHnqMuVQX4GwA5KPgdH5H+iMNil0CzwQWSv0TLI7NOGA+meyr37t7NMh0XY8HqUTcLnp93wuDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ulZjwLo6s053dTOUXNlJF5/ObEXIVkFEqR7Tksa0oYhbnEcyu
	8vU1gNRMIepNxbjWV9yWS6yEECU5t4Egnbh6dY1RfZtN2pBVPeme7hiS
X-Gm-Gg: AZFdTZcH0eZMP1hTXhUi1OklCd5jNjAb9m6LJZcw9f2Y4CxUntXMXVBfZpJx5hwWG8S
	ttc6rMbj+UtTqgNdWybHi0kfK2SXClsHDwks94gz0ZufR18f1ITJQIMY8qjqA6AdHfaEA72mSxX
	uqWp+Kxnq+1WqBoAPRFmFo80Q8SsOJCxQP4YcWKt92/irwECZTJbIh6EO7IAVFj0t/4QPp8pfYd
	TWhucdOt12hfY4rD+7c1YKMrOM3fPK8Uk20f8p+kSjm8p9ZRK02KsjZRcwgbKb/gcLwFdOVDxJt
	VMoOicJnt4cuHMjbfeCrPHf1IDYhNOY7KQSefskP8ETXItPE9bfonrb0uXSTWmAtuKSd9bzKftU
	cWqagjXOg4ggh7usSSyjtOfgUJ0qVlIfWi0xi2fKwyNztsOTE2A6VLlAfPJZlgu9H1Quglu3NPN
	+4nv8d6cg/e3SopQHZ2tsrxNEo1pkYk1BwKmRiP4RthVGRz+QO0XnbHIGMyDHl91uWJcM1XcjUG
	Bfx8G/vv1rRjq9MVR0X+pZsFEiCRAC32DrkCh7ddC+M2fW/VveDe9JomVN76N1p2ic2fqjyu9FR
	MLS85TB6vq3vUlCZsrDLfFYNHxOju5bxVRfYeuhgaaVTP6PSNUXZWJGkCFVYS6xkl4ECHN9iCCC
	rbtLjh8NmdzJiSKZCZ8M=
X-Received: by 2002:a05:6000:2f87:b0:48f:bb47:3d68 with SMTP id ffacd0b85a97d-4abaae41e22mr39403565f8f.1.1795688633319;
        Thu, 26 Nov 2026 02:23:53 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39802210f8f.52.2026.11.26.02.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:23:52 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@deeprootsystems.com>,
	"G, Manjunath Kondaiah" <manjugk@ti.com>,
	linux-omap@vger.kernel.org (open list:OMAP1 SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: omap1: Fix request_irq() leak
Date: Thu, 26 Nov 2026 11:19:44 +0100
Message-ID: <20261126101947.28547-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

omap_system_dma_probe() requests one IRQ per channel with request_irq().
If an error occurs afterwards, probe returns without freeing the
requested IRQs. As dma_chan is allocated with devm_kcalloc, it is freed
if probe() fails. If one of the allocated IRQ is called, it dereferences
dma_chan causing a use after free.

Use devm_request_irq() to make cleanup automatic.

Fixes: f31cc9622d75 ("OMAP: DMA: Convert DMA library into platform driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/arm/mach-omap1/omap-dma.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
index aebe5e55ff60..b0b46e7ec6b7 100644
--- a/arch/arm/mach-omap1/omap-dma.c
+++ b/arch/arm/mach-omap1/omap-dma.c
@@ -800,9 +800,9 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 		if (dma_irq == INT_DMA_LCD)
 			continue;
 
-		ret = request_irq(dma_irq,
-				omap1_dma_irq_handler, 0, "DMA",
-				(void *) (ch + 1));
+		ret = devm_request_irq(&pdev->dev, dma_irq,
+				       omap1_dma_irq_handler, 0, "DMA",
+				       (void *) (ch + 1));
 		if (ret != 0)
 			goto exit_dma_irq_fail;
 	}
@@ -820,19 +820,8 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void omap_system_dma_remove(struct platform_device *pdev)
-{
-	int dma_irq, irq_rel = 0;
-
-	for ( ; irq_rel < dma_chan_count; irq_rel++) {
-		dma_irq = platform_get_irq(pdev, irq_rel);
-		free_irq(dma_irq, (void *)(irq_rel + 1));
-	}
-}
-
 static struct platform_driver omap_system_dma_driver = {
 	.probe		= omap_system_dma_probe,
-	.remove		= omap_system_dma_remove,
 	.driver		= {
 		.name	= "omap_dma_system"
 	},
-- 
2.53.0

