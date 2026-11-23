Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410907;
	b=WeIet0RZ24al1Gt3APHdgKrTaryQ8NcFPY0lJ7/Gx/QNGtKnBnkLuJGZt+gl1MkngZ1Q
	 QUoU6C0J6XPAIhhFftxEznLZEnQYA8xqU7vEpReHcCpqna/CHtzEfDV2sebWy+a7uVr5g
	 mbkwojQLk8y6NZuFioA98gTSypoGbs7PVFXTR5xjyMswmzA2NgRhmRHg4pTQtWz/Twxrk
	 m58cn9ppeZv5x0vLW7JeYeA6EupAxW2H7wRNkKPojou4lIpuaopNUbOJ8ijcg45S2CS00
	 aaciBJ9P3LUySNYHmFB3iBquIJR6M1c9rYTlTDQYGFLf94rsweLVstWxsRCQrnV3S+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J5+OMc5K2KdK1ae56gTLhAO90WfBUcBNNjJYpmWeE50=;
	b=SVxV1ZMEgm/fWD90Ku4BqvTB+xlrhwP/SPDH7Mg1EKg0u0WLO7mV7QV8QeFbQSuTxV+H
	 le6g233tzm8fUOMeK1iTJUIY69XaU3x1kh32A/oZiVwTZyap7trVMn8woMOOK0ADQMapu
	 ybR76aq6jTulIxX+MR2ZBWWhD9RVA/Ejog9gwCxIJcs4eD1capbIB+tr9WmyVMUcDYovE
	 C4/RchMIRl1aZ1ZLuAeloqfUW/WSy02OrwdOuLmoZq55jXOjYa6doV0pAzHTzrKFwtBbK
	 UI2O+QGhq3t/6SwwmmHD6S/sH8dy2GTieYkVcwsa8Jww2c7u1WYRa1ZekoC2NoOAwNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPGVhSQW;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E5F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPGVhSQW
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40312e2so6989565eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795410906; x=1796015706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5+OMc5K2KdK1ae56gTLhAO90WfBUcBNNjJYpmWeE50=;
        b=KPGVhSQWoM3Dw7qxCwP3mb4MYzlfW+rUvYdYTHytM7ncE7MXsVALLEQVIdyDlku17Q
         fo7OfXj0A9el03zWps8IXy67MXP1FgLqcGIPYhmOb5fXhjOzkUXYAy7cYS6fv9ox1e/r
         ED0L6Ou/Rjr9SkLN/FjeyLnySdeiTLXGFSYFTp8N3ks55pA2nHYg76WGuK4V7+gxSkEB
         o80IZ0wbASCBodH3OjEvbyh8lQf5zOmHtUBOoJSk05nYeIGSiWxaKaaARLmRDFT4HTq3
         F8niq9/PKEc5rKTuS7C8s+CmvKpv6v0WczbCffl9KusDjYRMcwHN5XRmzTmjskeVr5BS
         bS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410906; x=1796015706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5+OMc5K2KdK1ae56gTLhAO90WfBUcBNNjJYpmWeE50=;
        b=qbFApiu8v9XJa4pnMbI0qqPNSwftNbkIJac1+SOR9DLVDv/snt6eteCsCe8/H79hSE
         AFMtYPesi+mRHBExEBATXrMnt+coEnUK5kBH1xZ3KLFnnAMHXNcgtxE1NfYNiMxHp5M2
         wMWSlTrlNAqMKJ2iKtHhWj5UOh5Tva2SrIy9Mc1b4+OpHxWJ7roV6CmJin5pBtU1rp8z
         0TotYe219Kl5Ph0anuX3iuSf7AXK3e9KOQP0xNMy5AnVPqew2FrvwEg5kr52y60cRZ4P
         dJQA1Tyv4YWSV2nGLQ7enrlHPEtJvFYyLw0Fc7ObB/AN+JcztHn1DUH1HUO7BMFeQXAI
         U9AA==
X-Forwarded-Encrypted: i=1; AL+hErGbai1Bj57SxwUAApjNjUD5YsZ8bFUoByWgOM2XJZXVAqd9LmsAW+198bGyiV2Nf+EILzqqb7PTc8svTrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lVhDNt7dkqc+IwIPd01oXOaNhxaMvff6JSpmc0wdlu+BS/+Rl
	OKnJhmbjKz7D7qDPjviXiqcQNUESvc67yhcLPYbK8bT27hcpfMrxE4Q=
X-Gm-Gg: AZFdTZc3J7Wiiqs8hLB3e2uqz3wL0r8RivQSZWBjmOV+7H2qYYa/Wppm9ryqOVB1GYA
	y8mofRquzHurhaqDEp3wsQLwINJcITM71aGj3y4slUsMhdREQ677cZIBgQ9qJD4d0GiogLm0wQD
	IICBHs6nGrXIjb5S+ww4mO20YnL8T42nLo37Do9eRtb/hYTBS/abm1m4xNg697dgod/9Zp+l+mv
	SZJdzb+O/qFoE/BR1ClgqdWeXHiVPj9E6nXcxXzh8fBPWNc8hVeTlo5Jlgix0AlaESqgG97Mtz3
	vWj6Y9nug5DjN7nNKLbpdDk9vBJOeVhW7t6s0b3r8+0yI9nl72BN91ctc3prJcshQWKt0oepuTl
	EHNfoR73nr+Gs7Wso6bicK1w9lNR3yH2ngSsOnEfe3N7YyVifazyVD7Nh3FyMsSFD90auKhwsz2
	zTI5RpX2G2icGOT34G8NejjeibfeR/5lebl9MPkkllR+X4+8COvYYmdmy/XZDZTBuWcJr3/vVJo
	ujkqwPwy8ge9rlAAKzFYKzZwsmJER9zpHglD3LuQSV90YDQPsY/a/5WMRDeF7QoAqvqeNlpNcE8
	TPfm5/E6QAS98JffNG3nL91Cl++HdTwQMadEjiTnb9MA34WtYnU6c0dcByJPJ00+9TEHrBbChgT
	NoDOVw/Wy
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr11508796eec.28.1795410905706;
        Sun, 22 Nov 2026 21:15:05 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28238694eec.13.2026.11.22.21.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:15:05 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 23 Nov 2026 00:14:58 -0500
Message-ID: <20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add Power handling for Card readers on Apple systems using SPWR
ACPI method, SPWR(1) turns on the card reader, SPWR(0) turns off
the card reader, on newer systems SPWR just writes a variable in EC.
On previous systems it writes to GPIO pins.

Its also used by the macOS driver with the function
AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.

(This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
 But thats not confirmed)

(Tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v3:
- Added changes at correct location
- Removed accidental usb-acpi code.

Changes in v2:
- Fixed grammatical errors.
- Added CONFIG_ACPI check
- Checked for xhci_suspend success before turning off power

Link to v2:
https://lore.kernel.org/all/20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/

 drivers/usb/host/xhci-pci.c | 25 ++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..31961de97 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,18 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+#ifdef CONFIG_ACPI
+	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
+	 * off/on the card reader, And on boot the card reader is off, so we turn
+	 * it on.
+	 */
+	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
+			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
+		xhci->quirks |= XHCI_APPLE_CARD_READER_POWER;
+	}
+#endif /* CONFIG_ACPI */
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
@@ -562,10 +575,14 @@ static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device
 		}
 	}
 }
-
+static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on)
+{
+	acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", on);
+}
 #else
 static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
 static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device *hdev) { }
+static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on) { }
 #endif /* CONFIG_ACPI */
 
 /* called during probe() after chip reset completes */
@@ -853,6 +870,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER))
+		xhci_apple_card_reader_power(pdev, 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +915,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		xhci_apple_card_reader_power(pdev, 1);
+
 	return xhci_resume(xhci, power_lost, is_auto_resume);
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ec4bfeb48..579ddea52 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1652,6 +1652,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_APPLE_CARD_READER_POWER	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.55.0

