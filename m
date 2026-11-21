Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279117;
	b=SOFGLwLLrdoOtNWYO3vknGkpd2EWdqnaZtGQ6sXLfV260MRoUut0KKtiD0BA2hwcrWEk
	 FmzxHIxTSwmZoWvv6R3AyUONutGh9JbTjTAsd6R94NKWMFfSVTxSMN/g7QwTadnrr8nMJ
	 WnSIK38AOOM3TBYUfOpe7QdH4BySSLhZelOE9nqrUP6ZwcXQV4A//zD48TfEM+JBscGEi
	 dhy+hW2RuhlwYfp5v61O8coUtL8SxzohvzRVEKXNhEhkj1fs7t4JX/uw1DdJwhTUqs2TY
	 jeJG+HGhRqYvcPwEVoQXkn0G9n8kmGs3rduUX/w1xtlXfPcFsYm0LZ4g9TODL86LOvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W7RwPOrM34RBS0W4DzG8D6rusWopzOWgRex6lMhtHNY=;
	b=qEYdJOmz1rd6/8HTI0GGWO3zGWsIHdULlVQD/aqxXGTRvPnjzEvdwke5XDiOxbQ3P0MR
	 8TqHANCCV8pF+3RcKoOOYmlO7qogtX/2AMEjhgnJR/p+MCnrj+72XkAYlIZIHjZkL6p8O
	 vFXUrEE2M4B8HGE3VmtLSW6SbphASrMpIunBq+jnpKd0+YMMN4ZuDZORbtI/d4Aop7eVx
	 ziDWXTS5XKbYoQGIgnersjA/ICP2TzXzFVXkM/mfq5RfdEAp6QPAzFNMMEBljyztsGH/Q
	 HMYZg4KfHi9j4p3e5T/OUxdKVF5EVHa6BvF6X5x+czZh9d9z21g8TeJl8GP1olKdItQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZNuik/YS";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E0606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNuik/YS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so22815075e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279115; x=1795883915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7RwPOrM34RBS0W4DzG8D6rusWopzOWgRex6lMhtHNY=;
        b=ZNuik/YS9JNPz5cWnWS2upYyRtUpdcRtHxv/w/7HHAV+NbW7+83PTw537oWJIZRvAj
         HnCOxYxuMwiTxyRIe3GtT7EbMf/UyZDfaG8xSklOZZqijl7dU+iy4fc66NcR8OKvyZJS
         i0wJInutEKDYaNhDnO9GM7u6sgQbJIC5RVy6ih38dbOYDu47RHMzn0fW+NJNs8FWetgW
         4zI9LaC0bJr/Pl2UjyaDJoH7OxYwz3HcBiOdac/8LtUGHMRCQLGPASOVp/XLrQffTZU6
         3p4bjL6iDWRN4da6b44vEcfswgBXKT+8auQkGC52L/xpxhAdIbml8hIwa68rm8hCvplx
         BmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279115; x=1795883915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7RwPOrM34RBS0W4DzG8D6rusWopzOWgRex6lMhtHNY=;
        b=VYsZvtLC5IRLH/xrQn8lToA00A3gwjbkpUov+2F0y8OzGAErvbZZkL0it0rt5OVZVv
         pFTUnyfOmFGpNioXMM6bdwfCMnvN3+mN9nnLXDDqpP+W1Nz0tTRoD0qXqEXbcWUDQgjQ
         +qmhrUg0KUnaDhVrJaiC9sj90JFFmDoNyMylASQrnOH1UOgVZHsonNvorWWSc9Uga9tb
         OEDym3sGvMj7Zv7sqVcBUzXHeIRU7MAci5fZUHHXb1qQggafrv5hN6KLPrs94cydpwiV
         27mfPP+3dVTOUGWGx0BpUG5rXZg/52Qj7YkSrOM4GQeKjJR4XYwU/s8vOWTWwfVKrF6n
         3D/w==
X-Forwarded-Encrypted: i=1; AL+hErEUChi0zye0YjDBJJ+vbL5L0yZW7BMabhO9/j1Jno2G2x4GSb5KTXcEuH1OukT3RVcaTKkdQnnSe8sgP1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q9XvIwkKv7/GMhYl7Jx9RKlVYl5+tg+KLHOQNJoPyOKg4OSwF
	Od62qmy3/2zq3jfEkJgKXHX35+YlR2tS2JOto2mLc59mL6kqjHiWu1A7
X-Gm-Gg: AZFdTZcEoCYwhGjYgt/4quZ5GXSsSs1usMv1yX1jWzHyEKtPqCvXCRTpfM3Sm6LUzBt
	qeercc29vfUrCpeUJSeS3ERb2ep1bJIR239N4gAzWtDw4vyD7sBCbBqI32MIY0M8v/sTi60mU+Q
	eLZO8tEAsrMijTx/FTcdgOa/oVoArOPP9vg1lGf2gArtroxeClnnUkAa/lQunON5ogqGRmgQyZp
	B/Q8qz2QG9sXhlhNYz6eHdOIYmW7p+di1hYoIaydrTHRsN/qTDvVZ/in+FGWuaNaM6SVOdzABZs
	FsrtXSSxCoLnKjrXAwHK7kjucm3wFqJPB1yra8CJaFeNmW9DhVlPsTbFGGhfsWrfBwRGoJW0GII
	rtnI+DxN3QMF9dc0ZqKuoE/CWJSDeAi+KEB2uZktbnZ6A3qGYSE+7awsDITHMKnrHb+Hd4gmbjc
	Ihulv/oy/q5cWDY6CqB7xVmzD1cPHvvipTCxf3oCiPI7S6CbfSdXubKz1H0FAzBzI2HB1gxajXm
	e6SiYrwoLhRftgUu1ueZ8q80hv4rWTuRjr3qrZsTicGEtUBDgaO6qRXdFppYD0WOVq+nof12zKL
	U80ngIjhU52Ing0V/VeN7fr0UuNCxJvrFTCNXI9HicKBnlXudgeA5XCOgdw/M2xtD8bFrYJG
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr148088995e9.17.1795279115254;
        Sat, 21 Nov 2026 08:38:35 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da81f.dynamic.tele-ag.de. [5.61.168.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm313834635e9.13.2026.11.21.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:38:34 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Radu Rendec <radu@rendec.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH] irqchip/irq-bcm2712-mip: Drop MSI_CHIP_FLAG_SET_ACK
Date: Sat, 21 Nov 2026 16:38:09 +0000
Message-ID: <20261121163809.86620-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Commit f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in
msi_parent_ops") made the PCI MSI device chips ack through
irq_chip_ack_parent(). Neither the MIP middle chip nor the GIC below it
implements irq_ack, so any ack is a NULL pointer call.

The MIP vectors are handled by handle_fasteoi_irq(), which never acks,
so this only shows when mask_ack_irq() runs, e.g. when a chained
handler is removed. The RP1 driver does that on every teardown since
commit 82aa033fef52 ("misc: rp1: clear chained IRQ handlers on
teardown"), and the kernel panics:

  pc : 0x0
  lr : irq_chip_ack_parent+0x1c/0x28
  Call trace:
   __irq_do_set_handler+0x248/0x24c
   irq_set_chained_handler_and_data+0x6c/0x94
   rp1_unregister_interrupts+0x3c/0xa8

The MIP hierarchy has no use for an ack, like the drivers fixed by
commit fb0ea6e4878a ("irqchip: Drop MSI_CHIP_FLAG_SET_ACK from
unsuspecting MSI drivers").

Fixes: f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
The panic was reported on BCM2712 with 6.18.61 and later when the
rp1_pci probe fails (https://github.com/openwrt/openwrt/pull/26530#issuecomment-6975561491).
Tested on a Raspberry Pi CM5 with 6.18.64 and the Raspberry Pi
downstream patches: with this patch, unbinding and binding rp1_pci
again completes without a panic. Applies unchanged to v7.4-rc3 and
builds there without warnings (W=1, GCC 13 and clang 18).

 drivers/irqchip/irq-bcm2712-mip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
index 06a6ab627..12d9e3846 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -163,7 +163,7 @@ static const struct irq_domain_ops mip_middle_domain_ops = {
 static const struct msi_parent_ops mip_msi_parent_ops = {
 	.supported_flags	= MIP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= MIP_MSI_FLAGS_REQUIRED,
-	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PCI_MSI,
 	.prefix			= "MIP-MSI-",
-- 
2.43.0

