Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886804;
	b=DejPOg+lczlBu7SreIGAZg7rcru5SJWhKzZAgcxm6nC54DLe/M2Ub9pglGPiLlWn7oNZ
	 danUpLSLR8+M/gCCTlJ2iF06jHbPMdQbqPcnHJhfr5OXbSFAP9MSHV1+uVbpAmo1h3od1
	 VlTb3uJy+Y9KA+0cloRE8L7j6Fyigdi9AigvHNKBd83mDPPjhU88OncTc9ZHptEI7rFPI
	 6NdzsutRAyfyluE1qL24hDV+Cj9OQElH3YkpYPWRI3aBVzDvN8kdnLtIxetsn+xRM0G2s
	 qCQiygG2BBJKHeVKfIpKWAdaD4f7+T2dKZUzMgreNW4KHsVMqq8DBQubVayI8YGKtBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886804;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Px40m0YjZ0/FcREAQzSI37lydK8nL5M7PoD7PHIoihE=;
	b=jkdjNa/kwPmqKEwaPLOGljZZwyVCv9ulKLBDt0lqiTehQO+zdy74bf2xzGCtfsoLwfKQ
	 yQPfaHlw+7Bf7Rbx+ZVIAQYFYfYR68ARs6Si5Rf5qNybDR4dzZ/ByE6kwhbegkW86baxT
	 JHpwGmvPRzS1oTnWF1hXmcESIhEYh2TyjLdYuYnXki6iq/+uo0A9KY+6hdez8UvjFbxeh
	 i80VH07IHyU4HwYy6R0uMxaHqJ9AGm0p2G0hTmfq/gZWdbcIyMA0Sc+p21V3XbudBwIgD
	 zGmG6whL0XzehFhTV3lWe1A6f8tL2uydhoF0PyEjsYj9Znmdt/QRboOQaYlyO/cwyyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV6Hj2qj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AD606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV6Hj2qj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886804;
	b=YgOxigUqDfJUJGGH2aukitl/SiQEg/XVXoJYYKndCEDn90cKM9WxpG6Zms50jhg0Jzpo
	 JclnS4rALnNAJg8zyJFTEj25208EhE7h4J/eesT2joURt5fF7YFgG4Ihei01cPs0Xc0CL
	 oEdycUdRiJdFAt0mTOffvnQ8326scQAMcpiW1cFL2uzd3JviycAK9XSnV4dSQCLQuqmPB
	 hXsW/Xz8g0jzEcUQJ9neKziouwS/DIZMjIUwkFF2sUCDVQRWMDrPvNi8chxvImSN6TDfO
	 F6SyNcpxe5YtjVOKK1AMdrYqrZdok4sUrvvb/AMkehojCKqoSzsmKg1KprAbDIunWUg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886804;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Px40m0YjZ0/FcREAQzSI37lydK8nL5M7PoD7PHIoihE=;
	b=09PVkEVqkhq2ZSzqvF+IjAqpv0VYGgA73yVX46zaVSXm0VnUSUf4EG6ZNj+e2dOBAB9a
	 TUyoG9yHAls0Lk/XCBK1tXP0aDT5dbXWqs/miILab9CqmzZyANWckyj7nGbi4ChtjXSU2
	 pAdNU9wAXjfgST6Q/FFOy0cUpK0y5tZt2OKT3C7/isaSxEBiVuHTWKUI2fQF/R+JQvfmx
	 ccLFUoiWUd4BZWCtfEmMrCLEsGwGn+K17KZdoC8erp2J992sFelXZO5JLOhSLXXiGfSAH
	 RX2Zd57ybAJdFxyd5Mz1qnhNNLN3fiseTJ/lglXGGdu7dbNgALiOz7iblykP2ensh7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D78381F0089B;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886804;
	bh=Px40m0YjZ0/FcREAQzSI37lydK8nL5M7PoD7PHIoihE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NV6Hj2qjCnQQ4v4FUOR1r/TkSOCjE/yxYYdKDb++6iRG85FDUAjJE5f8ljaB4aKRE
	 f16yTlpHIXUAsv45wLj9QxOBT+du+bC6ZJgyBxOa7OssR8ovst3ABetbdT/EK18wQt
	 D3oUMDxCTP0rinXnmfOTape/eln16HhYQXz8W3u3b7wIfl585El9uvuMfOCYjSWqoX
	 px6etkkURiVkhYtHqCoud+6ndHKNDDBhpvXPih34bLtCgYuS5DrDGRsBBO7icIy28W
	 rgQ2Tn6MtW6qJDhRll3So1fsKXAg2gxbayQs5XbRSKK95FAyZAVli8JdsyydhmWXOj
	 BEz1SAxQ923oA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 60D674E173;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:35 +0000
Subject: [PATCH v5 04/17] drm/panfrost: Don't take a reference on a mapping
 that is being freed
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
Message-Id: <20261128-panfrost-long-jobs-v5-4-e7d62045a676@gmail.com>
References: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
In-Reply-To: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=1091;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=DRy+Ft25cf0YsAswanqBu0wCkKWVe6G3uWYwsT/P0E0=;
 b=0wScwfnCs5vnBVKPMRup4vi+ZsugAvfbNfaAMLjLirdbsYmHLZESiIj8++8VlcnCmrbkgb5bA
 xiAltXXe6CYAyEuxy712nFOkmEYC7Fkr+GwuzsBg/4kC5Xy9d2GJS+F
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A mapping stays in the drm_mm after its last reference is dropped, so
a GPU fault can revive it with kref_get(). Use kref_get_unless_zero().
Not reproduced.

Fixes: bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/sashiko-outbox-206570@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: shorter commit message.
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index faa62643c..789a64fd3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -576,7 +576,8 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 		    offset < (node->start + node->size)) {
 			mapping = drm_mm_node_to_panfrost_mapping(node);
 
-			kref_get(&mapping->refcount);
+			if (!kref_get_unless_zero(&mapping->refcount))
+				mapping = NULL;
 			break;
 		}
 	}

-- 
2.55.0


