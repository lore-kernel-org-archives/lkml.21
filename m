Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050713;
	b=3OZEPXeT07jtWFSpxJhsGzA59vxtsrwmimiujBGr0/ENMTaV2weNFCjThVlcIjT3UxNi
	 GWqBFnK/mHmUQ+TAiO67Wjp7d/e2ogfzI4k/fpBiO7wpTTZjSdBjKM2mZ+0h+Tm36s4tS
	 dnqZ86JApx1XzlmZ+J4exdKfFBXJxRQ2tVgmNvibBO2IydonsUjTkuOJQ+/kQOvwXXwgL
	 oKTsw5zyKn177UO/0OSARUr2KdDV/xB/ODnwXWFc797xz70lZL2G/nNhenrDPXZcB85gw
	 GdaigmUs/GqbQ5vzbKHn3e86jhX5msC2f3h42T6wTX7qDvQq9lCDOlbflq9YMyjhcgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P6BTWEWXY/BTGnn2IlV1PnrmMbfZ4BbNEeQU2kMUSc0=;
	b=zdl66CXKfLu4dWq2STIGdNRV8SfhFoPg+J3XkgN1svSgf4gmpTDv5uaNmnlavBk+tdCC
	 Pd1O9WS9mGkF4grbpf81gDdnZfEGE3vESt8sf83/UrnGaSHw60iOKh05odtKx3S2QRofX
	 4svkkwEdfloTS1LCxxy8P8yTRl6d9KnuwvawUn8vLfkMS3cIv6TiMkNlKvEHmRhr6EIok
	 eBfAz1On6Hz0QiPUp5slXMqQxLC99zxWFbWOej3S6+HqTjSMRoat39Uyua1t3p+7d7UVc
	 8x6p7Hqgc72yg+kRqv1FCZR3LlL8CTYg9g9zD7FOEcdu56EfwEuYZ1XibNdi2xgODKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyEHgRFU;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B7606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874B7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyEHgRFU
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94959217274so205895385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050712; x=1795655512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6BTWEWXY/BTGnn2IlV1PnrmMbfZ4BbNEeQU2kMUSc0=;
        b=gyEHgRFUkJ+UsPkeoeGPODWwKMbVrqkBK0FayhT92WGavId8qlkZIT/p+5bitB74uy
         7G7HAGKN402yq93Xh4NXEDgv/Z61MkEkc54xZuhLJeTUYVYSbsv+ggO2oR7gY+X894UW
         bsuMT2R6vTfQF4gqwpDQr53uP3x0InZNf2KWvO/QvwZuI+0JV3oRtXlMUJADp398gLNt
         6YVQg8AamkRgGIcUtQvLhJOYL84BYMaKEwdkZGhAZV8iz6Bnf3lsOnHDJBcd96XjkeFz
         4kfYamV1loyZ9dDrnF5V2WHAt1Pt3s0FNl5DLa68LsPZ0ss1sYJhTG8GfzkSrMJzAjbd
         r+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050712; x=1795655512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6BTWEWXY/BTGnn2IlV1PnrmMbfZ4BbNEeQU2kMUSc0=;
        b=d5dsJfhckXz85MCkF/FfFcFMdoadje8WyYrqJ2SRjMa/JzxLB2XyyX2yvYtUdT456+
         6g3c6+Exb9HbnubvDDy8G/nYDB9feE/Va2xupwF6iRG8mr/+psZpiT8BW00F9ZDX6gXz
         v4HfWDUF5sGp/bOrqRFDUihD+K9R3Ulh/O4GEQ9Dh6gzg+AFM0545okNZEkHQeuinsuA
         zfeC+pkY9knTbbTqQYcxroMO623rhuhviJ/bqWljpeXwOyMtAp6b4EMmOWvjVtOnbviu
         fqp5VTwDnD9hJxMT74zJCvlyeanmlJWx8yGknyvOBx2UGafkxATzBeZWp8Jwz3cKf82I
         m4zg==
X-Forwarded-Encrypted: i=1; AL+hErE+l8MHmv26gNKu0oD9Qdyrl3C2mSYH/Ov/iNn2GPO+Uh6wrqjZgNMMMVd/MpE87kw7JQ+qAqKCr6DzBpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oo6PUfuGY4aqzsLwNzhWFctYhWlaAMXw7BmiBvipBF5pj1M5C
	9P6lpgS5NecOkZlycWrAukJU9TUClcQAM06BuS157AsqHulSMWZk7lb6
X-Gm-Gg: AYBFou1YMCtHdybXkkdE6+znQUF92goeh7NeTGkO0xb5oTeN2GqjwXfHVsRgLm/gm66
	P04QNlSUtIWp0i2wMxVmE1D/m7dKXXUfdrmeE8uILjcnPTKiZoe1XpgvWVKGP0wVhoPqkg1100z
	AOUR703hPn5nhdTSmrkOUF4WCXLGOGZs4ffFT26O+sp2iO3jygVclgXFo9hBanxCvBBOK1k4PDe
	uxczXyHHnuirQ2NCd0XAXNlPrS5EkO5+GN7X929dGpdc9P/Rea5TS9Px4cKdvSWPYme9M3aedJG
	vMynk+Dg2V0c5PzoC/jFmOyaJSMQLzbscnBc0MTzPz/EqFLhdlUnrX40dKQ3o80/c8gQLWaot04
	paWN8uzC0kJWsqI/cggMqAsuFl+0PJTChAfRV4kxw0j9b0O7OlQAU4mtNEaTIjvf7/3NE/Nc0zV
	MlG1rGhOz+8D3UKJBF+0k6tUcdaPjrws9tRCMesLojLht/y4X/lAxjTDb63YSDgCunMTP/Z7BPQ
	dp0S6a+9HiHA0ZMyo+fRSnCfMWDNZtUgG+0uhCD3FSsLiNMKuXuXN7Bg9gOAZfIxODBQ3tv6YMT
	XaxhUCI/j8p/yeOnKWjoYx9YJXu4cml0C/v+ar5V//amgIynRUmv3GmhPv7MspLH33XsTvqlzL5
	Z
X-Received: by 2002:a05:620a:1d0b:b0:945:d148:657a with SMTP id af79cd13be357-9499957e77dmr772314685a.24.1795050712252;
        Wed, 18 Nov 2026 17:11:52 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm35809866d6.16.2026.11.18.17.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:11:51 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] xen/virtio: Fix use-after-free of grant DMA data after rebind
Date: Wed, 18 Nov 2026 20:11:49 -0500
Message-ID: <20261119011149.534095-1-lcy8047@gmail.com>
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

When the device is unbound, devres frees its grant DMA data but leaves
the entry in xen_grant_dma_devices. On rebind, the remaining entry
causes xen_grant_setup_dma_ops() to skip setup. Since x86 retains
dev->dma_ops across unbind, subsequent DMA operations access the freed
data.

Register a devres action to erase the entry before freeing the data.

Fixes: 61367688f1fb ("xen/virtio: enable grant based virtio on x86")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Tested in QEMU with KVM Xen HVM emulation (xen-version=0x4000a) and
CONFIG_XEN_VIRTIO_FORCE_GRANT=y, using a virtio-keyboard-pci device with
iommu_platform=on. Unbinding and rebinding virtio-pci through sysfs
triggers a KASAN slab-use-after-free in xen_grant_dma_alloc() before
this patch and no report after it.

 drivers/xen/grant-dma-ops.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 5fcafa4c344f..784413e6d282 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -66,6 +66,15 @@ static int store_xen_grant_dma_data(struct device *dev,
 	return ret;
 }
 
+static void remove_xen_grant_dma_data(void *dev)
+{
+	unsigned long flags;
+
+	xa_lock_irqsave(&xen_grant_dma_devices, flags);
+	__xa_erase(&xen_grant_dma_devices, (unsigned long)dev);
+	xa_unlock_irqrestore(&xen_grant_dma_devices, flags);
+}
+
 /*
  * DMA ops for Xen frontends (e.g. virtio).
  *
@@ -396,6 +405,9 @@ static void xen_grant_setup_dma_ops(struct device *dev, domid_t backend_domid)
 		goto err;
 	}
 
+	if (devm_add_action_or_reset(dev, remove_xen_grant_dma_data, dev))
+		goto err;
+
 	dev->dma_ops = &xen_grant_dma_ops;
 
 	return;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

