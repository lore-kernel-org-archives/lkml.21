Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799011;
	b=U9FHDGsckiXXTlesqb0zQEuwzoLbaVdEKyfS5AO3TbmnRvTE1wluZ70gW8Nr5Jv8yTYd
	 cL27PaNUeJw+F+98bIuOyX+i5EhVGii2DQBzmOBrz2A16f9FBuPc3QMbZzwcH+4Qcte7Z
	 DflEhcO1oi2kgd0YAh5Pc4iS3NAGUE/Dsdij8+GuVrRkVWCq1/dBnGB89pCKkItbygDjt
	 PhWgloyu4opB6XBLOMX7EWjOgz6pw9JeDWutK99QzltXH5e2ANeEO/X7VBV/P+s6g8FES
	 eD3VIFukmP9wSir5LSNTnErZOvK+q/apOv9LThP20iKEMvsIkZBpyevh7oeniJqqEuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n/rsmG3FiGD5JF7kMgaJyBlIxTvJ/3kpRDtF2VUvB18=;
	b=EWv4MxDGt1ZNfpG15DFy3ff0Pn2dDktkErGsQzfLU/HyYXaNQIESS53qotFBPgXabZwE
	 ymTlD7sLVk2QzlUMDk4A2dlkhPiAelC7osZn49X7355BP85wWlnH5z2j0inFuEx9NzH2u
	 R+8DHVOAUpmeZOin3k5omRQG0RgsRGgza2JphHxQXxWlbgGTHqA+DdsEZZUHA5/n9kYd1
	 5kkzv60LvKQ1OCKejP/PfJ431PJUNySywNGE+U7EV4tk11yxLUraDAN5/Ru35bPsk4Zkk
	 CS9BH/Zm15dWhgP+E19nX7Rz4aQukfqyn7A6NhFmmE+VSKEximQBEwThJ/zifebGXAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztnZMdZO;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFDC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFDC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztnZMdZO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb67b3a18aso8272415e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799010; x=1796403810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/rsmG3FiGD5JF7kMgaJyBlIxTvJ/3kpRDtF2VUvB18=;
        b=ztnZMdZOX2jBt+ZK4PnUsmvjkbVGItNMycAKUDMByLEp5jSlSiLLjgcFFSUHF186at
         fw9mYPdfwDoh4XYlxvWX5jkysSxzMUF27VEFeRga+/FMPYGW7TmH9+tAPVxp5FhJSLxC
         IfT4FNIoKiOce25DsDklYDASSChvmvFv2RwCbVDJ1gDIAidadZaX+EQkwdQ6AqGU8X4P
         aoUoBMTc9JwJpi8ci05YHu3wQvMSfjd2TGC3yZMqHljZ9ooxHXIRRcHumdtZRB0pkyk+
         vRZtOE6pghMkTsJ4AYqgFrr0U9FJ7/cNZWNfLGnC1wd9SHxxvWGmx+SslBOuOFJNZD0/
         Q1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799010; x=1796403810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/rsmG3FiGD5JF7kMgaJyBlIxTvJ/3kpRDtF2VUvB18=;
        b=B9AfAxQfqz+Gh/FrBSf4R5AyWPKOX/y593WdFreS1eipbFhtLXulOI3kxvDlJCxUh/
         dyciP4pJga90DTOW8Ha/sOvswhHHwEgARZyZQysLNBlJVmkKZuJ0Vo46I4YK/F1J9Lqp
         r/gxNph21Nf6T+5/nsvJY7N8NxUBJJu6qUHVMXLNWAl91e9BmGLIsrfQOV65mDGj7eoZ
         ljKFl9LxaRufCiV9Uc6C6wwYjcEXB0lrftxD82Tok4KBZCC0B8g3hCLH1SpfvtgyIBv0
         SfK7h4P9/5HqgTEFmbhq9uTC7k4LlvYtOkxtvMYFIUs0IlVmPtmYmxt/PN+N4jYYNgNf
         Wmuw==
X-Forwarded-Encrypted: i=1; AL+hErEMeqJFfceM07RMK+6HSK4P0bya6bQEjRtvTlNsAP8RW6sg9z0WsO8K0y30TgqFVtTk2Gk7vvCpdlOQnJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q30YbQRWb8GOOUQYLqEQtXtp/qf+kq/p2EJnjDxBHcbcudcTB
	aUXJR8aJaABN+uURVEnzsFuiZtXbqCrE+7gO1PhR8By4+j3xMDNqBEow
X-Gm-Gg: AZFdTZcERiWT7edbJlaaPQUi8TD9rj+xTDk1nKfqXktkG+Mys5LhutTBai61oqTOLg4
	U7+zDsNIIwHc/+LURMHd54TdU355zYCpwl/LK4NHfXPMWnd9JjEYGBqsdnGVbY2cTZKsZLnp9sX
	Us2u0I7UxWgPtK4WPPS9igNAfW9ccrnbAigJJGe5/zvwGiRe+tD2KVoSwEDqm2NS/VYgfnu6HFd
	qCDs0w8XExe3TMbFKWiCMTgkzQPvgvJlV7trA8l4JSJXKQDfPCYNhdZr5Tw5h9wR2GiGKoaEYaZ
	I0fIlnKuvPMecBcOwdwi9+910tnnDhO7xlMBuyAT0WSpln2XGcnTgfA1Pi14zkTmhv7x6e1qzkl
	te/vqARavN22L+a/LytWwus2fUAe4YUylwdG7BAeYUIc+A9JV+tyUlBsLuey6mHSHYzkTqjez+7
	sIu587AC85U7NiiboWVZJCcSCzQzW7xGSztu5/kIw2laiGwm+bQO2bbZ/pcqbyfMCVyGcIL4FvF
	jZM8lEbAXlwg3JIOpB2GkEYflte60G52CZtMt9m/4fj++SO/j0vQCZd8gN1RvjqBfgW62IcGkwJ
	YNTyCrPOdtjCe95dHrs337uCDFHoz7xvcpaCCqb1sxnTgomlZuHZGtUzHXSglBq9ewezpw3IERV
	AzLb6ndPMw3CM586OBLu3
X-Received: by 2002:a05:600c:2909:b0:4bb:b39d:d447 with SMTP id 5b1f17b1804b1-4bbb39dd4famr49921115e9.1.1795799008808;
        Fri, 27 Nov 2026 09:03:28 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm607680575e9.2.2026.11.27.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:03:28 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	linux-crypto@vger.kernel.org (open list:QUALCOMM CRYPTO DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CRYPTO DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: qce - aead: unmap the scatterlist that was mapped
Date: Fri, 27 Nov 2026 18:01:59 +0100
Message-ID: <20261127170201.62667-2-fourier.thomas@gmail.com>
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

qce_aead_async_req_handle() maps rctx->src_sg, which for CCM with
src != dst is a table built by the driver and not req->src, but its
error path unmaps req->src. The mapping result is also checked with
"< 0" although dma_map_sg() returns 0 on failure.

Unmap rctx->src_sg like qce_aead_done() does and treat a zero return of
dma_map_sg() as an error.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 5c0ecc2e81ec ("crypto: qce - Fix some error handling path")
---
 drivers/crypto/qce/aead.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216..54cc6bb8fd4b 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -450,8 +450,8 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	if (diff_dst) {
 		src_nents = dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
-		if (src_nents < 0) {
-			ret = src_nents;
+		if (!src_nents) {
+			ret = -EIO;
 			goto error_unmap_dst;
 		}
 	} else {
@@ -478,7 +478,7 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
 error_unmap_dst:
 	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
-- 
2.53.0

