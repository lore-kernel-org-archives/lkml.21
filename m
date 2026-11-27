Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797227;
	b=zQc/1Hzwj2E6+PCHFSFi5wjHFl0Uf68kEObNVeh6YiYdhGpBK2yIi7VZSgGC+FcxZYKQ
	 LX/KvN+LwtlL94nIr32amMbJ5dBdRRV2P4rhRLprM2IFoORb0pC5CdvI94Ebo723/n6Rj
	 LG+wKhmPKU4NltFU5eVuGIUjlpW6NiIoBFtCEuoZuZck0dThkKTC0WhHxOO8TqjaTsxBk
	 SF7gQ/Ol0quOfAFeKMM080BiwsuOSojel1YOXY2UQJKtp4wy6yUbIgr2wxBqOx6ortlR+
	 WnmCxc4lz+gEE0Oqe6/JrpJDCGWumsUdR6lSCE3awCkwM5C9SwLsk+Ovqt/mOZP4OpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1XLQrZEkqD3KAW0Mn/q6lYR9t6l5fJC8NHgRNhvLrQ4=;
	b=2BAZuzMASIm1NEe20NWJ1L93fFr5ftOKw3h8LbQvjmeAUqEDdKsu+LCDaa433ThUQwjY
	 /uw6yxbY55yyrJNmIrYzLdlQdMiTIHICMu0P1WwuzT4RwcryogcJmC3v95FDecaNrwYsK
	 bXxgApz+uyA3QEyYQ1itKLPZbAHAI3zx17ZBBd0ivNrtGs1YEBpwBFzAenY37Sw//p9Yw
	 XwWuHkznZv7kDWImPE2mgC7AaFJvXZcXSiYn2pV/dMPXB2V2QscVkz7yTAUE67BmykfeX
	 bz1w7c86b6OqfQCs5wW0USpyn9U9XRNaLQIMNozqOP3X3e3X9z+n18MBEqkv3vOG5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POAI2t6Y;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CF7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POAI2t6Y
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a440c9e13aso593217f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797225; x=1796402025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XLQrZEkqD3KAW0Mn/q6lYR9t6l5fJC8NHgRNhvLrQ4=;
        b=POAI2t6Yksv847KU/d1+a8CxhS+qXpwb2cp+WIMr5z3BjZ7EansvWNFXz4RoxU/OeQ
         F7WWlduc5aSQCN+8bBhexnPNVoJ3qsKXuEvhvWJ83Kq3u3FvA9uwjVMw5MCwoHIKcWeW
         rMDsZtIM8JVDPjEIWQzfW14A1pvwwe+CevWBQic+kfA5pixJVT/NCYAi/aR+KOoBNvUB
         IjGiX6b+Q3ICYcwrQ0hrYqzimfLejme1OYvbM7z74bt3NFhImSxOOfLkhxiDiqbeyCCO
         fCf9BmobxjVS53HeNfEg9hU5ibJ12l9b7kqfHTQ/wYhITX7a0qKmpl2Q+qiljRJZWboS
         EumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797225; x=1796402025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XLQrZEkqD3KAW0Mn/q6lYR9t6l5fJC8NHgRNhvLrQ4=;
        b=kLAYdkevlVtevtJrc/jf79kCCVbwGRuFMXWg7E3iL4/SDhOAJdur2lYW0/3LwmeWtp
         XFdcC15KGzsDF4of6/8UnW8GwryoM5MwAchxr+E7hCLu7UsJKhjrGZzZwu0zMSaeS5Xw
         NbKvgolWRYBjTsB+vg4yltSw561pRvVyDuDf6TKneFD/5wfZwre9qu4i6/1D5UmtqXwR
         kepDAen2W3Y0ikWGGgfsQ5QS4DEXi3jQTHWO1hvOuHoSJr0x2hU/XpHR56vtA26DP62H
         /XQ4mgnVzBE5UJAB6WMqinvQiJ/zM8MvYln1TntdZRfZeOfVZInLv1rQkM92vzjpe4++
         dh6Q==
X-Forwarded-Encrypted: i=1; AL+hErEGnXJpg1dxs48o4YS4+xHKk9t3iiT/Txm8YeYRnCE8xr61N1qwZlnL+UqbM7pUwVsefCcNOUrNf4BgDw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BpD0Y5HtQc9yWzepySgF0V1BhafWQY2YrtuFa0Ob1x7qGQFm6
	3tRTzmonKPQU7m9R/0HNpB8l5TboXKyYpnfweeIv5yVO0yYKMF0EzHBD
X-Gm-Gg: AZFdTZejM4/P26EVvUHhIrfys/BhzYhsr6gKeYNhHpOJ/08s2DSsH+Fb6CsR25BH+Vi
	MedWFH5QSp+QKZ7VyZjlPEXl+NXDj0EfP/5ah196YzqjD6LER5zzBKujCvbBuo4szNmltvdIYG3
	UvjxpeD3oKNbqq6/ahTFjqtpDWO+6aR3LSq6uy1dGsVEkwbfWDJueql1Xj4Y7dsB0FobjOC8f+B
	nhtD3oYxZDZ+dK0ImvcfYFWNAnaN3/HCcPGLysqSa4F1ZVeUad3Pl1gW8h9EsL5DgtB2N8nCNyh
	L27ZqIsPQNIOkXVn05w+uW/V2g4f2O4bPqCJEDGqdrJBK+nzcRurf27IBZnNFU0lVN1oaoRO7A5
	DbS0j3j4JCc9FVRUNqU1YEmhLkurhOioRGoDcJJGIGEjQ7+6gweQJt5hRlFokdbYG1O2XSmpASb
	7OL3PC4AZtCrfUeM9FKizLkGPX6/eYEiiBMexg6f65fkGXRNwnviTTe6gjZ0f+QfT3RoL0KK90Y
	r6woGVkpFzR+DjZSxvx2mubTzXGBN4DXdaqW715L4GZnQxY1GAwDv7HcKf0FDhvNkoZwF6+m3s0
	ArD4LfVnYURsZxBstTxW4CpBXNuEOM6a7OpPpHQTG90a1O163wDv1708G0Yq50lZHVx01MEhPWd
	Gr13vqnIa19Sqt5T11yg=
X-Received: by 2002:a5d:5f88:0:b0:4a3:45b4:f0cc with SMTP id ffacd0b85a97d-4abb253e271mr45139769f8f.3.1795797224935;
        Fri, 27 Nov 2026 08:33:44 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm50425276f8f.29.2026.11.27.08.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:33:44 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Harsh Jain <harsh@chelsio.com>,
	linux-crypto@vger.kernel.org (open list:CXGB4 CRYPTO DRIVER (chcr)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: chelsio - unmap the IV with its mapped size
Date: Fri, 27 Nov 2026 17:31:49 +0100
Message-ID: <20261127163151.59138-2-fourier.thomas@gmail.com>
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

chcr_aead_dma_map() maps reqctx->iv with IV + reqctx->b0_len bytes, but
when mapping the source or destination scatterlist fails its error path
unmaps only IV bytes. For CCM b0_len is not zero, so the unmap may leave
parts of the buffer mapped. This may violate safety garuaties provided
by IOMMU for example.

Unmap with IV + reqctx->b0_len, as chcr_aead_dma_unmap() does.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 4262c98aab95 ("crypto: chelsio - Remove separate buffer used for DMA map B0 block in CCM")
---
 drivers/crypto/chelsio/chcr_algo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index e2f2b2a6200e..ca4bde6b7b1f 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -2544,7 +2544,8 @@ int chcr_aead_dma_map(struct device *dev,
 
 	return 0;
 err:
-	dma_unmap_single(dev, reqctx->iv_dma, IV, DMA_BIDIRECTIONAL);
+	dma_unmap_single(dev, reqctx->iv_dma, IV + reqctx->b0_len,
+			 DMA_BIDIRECTIONAL);
 	return -ENOMEM;
 }
 
-- 
2.53.0

