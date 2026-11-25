Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629990;
	b=Fe0W+1eDkak4HNncEnpNf3n4Mql7GytmQYkvK733J8SBn4a3lKoEbl+5L1MgRFeurulV
	 Gkx0x06s/ap/9nbPkTX4HYVfHPyue9r47kOSW0EJUKRW9uJTpoQ6mZJ8u0oh7/Jx/TWbx
	 XOkcOYgc27+3fLD+wAwETC63uelWj2mo5Ka3sXbmbmoAgZs2bioDDDjfaXHieG8Kao6a6
	 53PbGMcvyxboe98aSVgDAiJ3MwsP+bdVeuknFqf2/Fvy2V/XsEyRNUIDaHEu9M7RJnPZT
	 31zSbV1iS4EVU9jJPYHxRkOS0xMakkFqtYQFSwdlsz7a3gkYv2bzGKGpgPu7Tt4jayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
	b=WkryK38VhGJmWkeJyjm8TVkwp9UWy9pkZydbvpOmhJYCNGU4kcLDX0FUkuKqqXqsIsZ7
	 iagQsmB48A8GEvP2LYyHvFWVg/Aqjr4G/x2avC5j+WpfMaVQEMiedcQOPHXtGAsV7fWoI
	 qWFMxJdAIb6NK935nzrfKx71YZu5p3cchCl3qRlTHX5VT4NYxscQI9tvafZ4lJrb7uz3I
	 navTs5g/dFHSG05JCQd0c4HLjQ7NJ2jvVKHAhOvybab0O1UTzI3DK1LEaIBx+nx6wXjZ/
	 oqpubs7Ew7J4jeVgMl9g6MJi3Pil4W3bIz/rSBmWDzx9nP3eWhO1hxvfgnP0KyJY/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zyta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MZQyx7Aw;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5588606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5588606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zyta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MZQyx7Aw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c40aa03ded8so595448766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629987; x=1796234787; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
        b=MZQyx7Aw1yftmiBWabC/QSynSQ2btqBm0v8OyNkHWZv64JqKf9W902SkZgzZN1biGm
         YzGOPVSut6q/vnrFT8H+ZQcvx78qEUmNu7hePFQap3iEJJo8w/6LInFlTltPwevJQodc
         HgcDVRskAbFEPeJcaxyYTEG77uYbhpfkNDYJJ2HyOH5B/dkpPFLGmWU567EsQj6TFjEY
         xjM3dHS8OQyAsXbUIcl8ml8YIoTi0Xxf0lb/94JYTho4gohdAg2xkvnkXuU5qKrB9qI6
         y4slDRjEkg9qr11Dd573ztnb+2D9jOLNNlbZZwccRdAzkimlXxVGvVlPNaNgFa7Ud3Sc
         zdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629987; x=1796234787;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
        b=K/cKbyXxgATiQvh/1DABKbV/aZRKMTPGhrDfb8ceVFnaCraJX1TL8VOk/EXmt8XSjr
         ap3d67aiHsVyWhJmMdfvxaz3L1VvNYL4FacxdokuoU3lO+BfRP8Y1/r5GMk0QKkjsCJv
         O3UJU8nzqpVlSkqy76qes1U3Ic6G2C1b4Ign1YYDrHa1pY55B/SOikZoGPMrCyCt2kmt
         fyzwFSivIeaKYWoel00rvaaS70l31qr63qFIQTrnrJNLl4XShV2D6vokMBX2uPyBSXL7
         AaqLR0kWmyE5IZEiNPlic9o79V3ZaY//ksGEiqgOrusDf8cCv7YSEaMhyPz96rf167bf
         7hqA==
X-Forwarded-Encrypted: i=1; AL+hErFFuw4XM0Ffjo7jYclPLB/3UQZw4FZybbLxCNUZBBVbt1i8LWzV2gIwWqVl0anRf+fOknxSSS0xQm3upng=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EjEvuxnsROwe7QO6VC9zsH0Usiu8HstD6ujayn5bv4Q4pzE9J
	NXtFd/07UzcG0Mlz2GpOGkLyQnEzBxW/tL7281L8Xn6MF3VNeVPTw1WD/1A5GOTMeJSG9WoRrw=
	=
X-Received: from ejc14-n2.prod.google.com ([2002:a05:6938:a00e:20b0:c50:6127:2777])
 (user=zyta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2da8:b0:c51:9abe:f3b4
 with SMTP id a640c23a62f3a-c519abef596mr491882666b.6.1795629986942; Wed, 25
 Nov 2026 10:06:26 -0800 (PST)
Date: Wed, 25 Nov 2026 18:06:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125180620.578175-1-zyta@google.com>
Subject: [PATCH] irqchip/mediatek: Add OF and HAS_IOMEM dependencies for MTK_IRQ
From: Zyta Szpak <zyta@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	oe-kbuild-all@lists.linux.dev, Zyta Szpak <zyta@google.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Enabling COMPILE_TEST for CONFIG_MTK_IRQ allows building irq-mtk-cirq.c
without CONFIG_OF enabled, which causes of_match_node() to expand to
NULL and triggers a W=1 compiler warning:

  drivers/irqchip/irq-mtk-cirq.c:292:34: warning: unused variable 'mtk_cirq_of_match' [-Wunused-const-variable]

Both irq-mtk-sysirq and irq-mtk-cirq are Device Tree-only MMIO drivers
using IRQCHIP_DECLARE() and of_iomap(), so building them without OF or
HAS_IOMEM serves no purpose and can fail on !HAS_IOMEM configurations.

Add explicit dependencies on OF and HAS_IOMEM to CONFIG_MTK_IRQ.

Fixes: 702ae15488ce ("irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117144350.wOuBa9ZW-lkp@intel.com/
Signed-off-by: Zyta Szpak <zyta@google.com>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 90daedb7554a..9e6658289ae0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -795,6 +795,7 @@ config MST_IRQ
 
 config MTK_IRQ
 	bool "MediaTek Interrupt Controller"
+	depends on OF && HAS_IOMEM
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	default ARCH_MEDIATEK
 	select IRQ_DOMAIN

base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
-- 
2.56.1.839.g22a8290db9-goog

