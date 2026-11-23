Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473106;
	b=E4z9YxZO+86kaDWlyKJoFSsDGdiYJ/YMi6+O16BCqdtJcoDdFuyg4TOnCmNj7IuZMj4X
	 j4KqnBc50hWWPqSw/zYxbzleAwjOurYsLuHELm9OPKwzYYLehjnFaQJI9YL/TH21wetW5
	 Ym55ZSTdpF70otu8mes7AlyC3xdsb/6Jpc2xpvE1fbGLvMk/Bg4HEloLNb/gkCeXyIVO7
	 LZY8tW0UkeIwNcExoQkFkeZ02gZZaLSh0hAw8LKdBllAGX/7gJsSuOh45YSILTAeblpHS
	 RamDep+nMN0emdUpnYjTnhFVgcukJ6eVONywWwCG655UiGmhEyclGSugDvg6W6uijVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vxMGbe5FaOFrEGMfmq39YEeJbVxbtwlJMdZhgTQG6dE=;
	b=cNKJmTJ7dzfKizobY4g6HbNd1AhnUgzm3XS/TsGboFIrMACt6lr44OQphdSUf3ergIGe
	 7iuRWCJBdoR+YtJ5qKaRY9n1DLnSygHdtRXvDrcuGvMbiyXBXG2c/xUwxHcbfp97gfzkz
	 zGQ9A6Me24+LlBW5lZo+UcSYn4wCjd6q1CQ5tVxNClr6SYOMU5PNjNBCnV+8Eb7uoUWCN
	 Unkl22CCwBPTO57jZzFQpxuWXVzpZwQu6bNl/XD3ZUuvGVJRoCtezu4JQXuTZfglsI/hc
	 EYMLmUXNJmie1OsX2Q2vDC/H74KRiMQS2sZTkBSPk0Cc2vfnd6mTbBcNDZ3GGyf0Rig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzPlHuKZ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19458606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19458606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzPlHuKZ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso2988770eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473105; x=1796077905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxMGbe5FaOFrEGMfmq39YEeJbVxbtwlJMdZhgTQG6dE=;
        b=KzPlHuKZisnZAqTv8PHS9cRJ9AEMo7rOicyFQdHLLDJFPtSRAOWQ/kZ7LfHPfr73xx
         qfgQMovLzYwCEjfu0qZDlHlvLvlrrafNdg+Bn0fH0qXkBtJGwxmZiBl9pvIhnqlv0rdL
         tIKseaEwTPr0qq1EuLMENYWfRaos+q8jY1b80GVixfVhmVN7kTpWHmOuQRfgeJXa4NRi
         3spGX5deR32vpKv++FCTheF2Gw1d4Y8t0mk7vQTkFVJAIDjyKJql32L0zpFSVHItx/Vc
         KM4I+3OAAC5uEKIvK4Jnk7sVWAl70DHYZkPwaMZCNYOTxu10rnr7pVO2/EmRm9ewR06W
         7frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473105; x=1796077905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxMGbe5FaOFrEGMfmq39YEeJbVxbtwlJMdZhgTQG6dE=;
        b=qGL5k5NjkCelpKe1FyqTpvDkD2mcQB+umIsBJkzSSxf05fBXOd2EQG/lQ5mcE3ACoJ
         H6OMYVN1o0rwvhctGhasbKxvwTnI8Hxikxbgf4ybzyjyTxTX0tHbW5qmtx9ZL9QdsDj8
         8D9ann9Usi672tcdyoWuV1VJYXMqG+FzI0k6det25P8MWOgcia7SE3KyC8U6ufQzsyxh
         3MeciHHdLWiaW/YLBm7YG4z0BlGwoPQyiuPg5qVKzOOJhKmJhcSX5VCZ0221mkJKXewj
         f26Lp9MJTeuliktMYUeWnl/t5HCxzfBvAV/iMZAc/SMV8UWQ761QFTarix9UU3OB/ojA
         +PxQ==
X-Forwarded-Encrypted: i=1; AL+hErEamJX9wYHnLhRG3Y3C6ckUWJvhsRZNP/JymuEeBra4oJYEzMR32Z2Vmuf6NdXRLCJv91koTXUAo8BOrrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u7b4C0iVQNtLuq7yR4w2eDWv6ZXILO4UaM3k+TcaatpMKLfy+
	wFPLPX/QIKDvfIzH2O8sW6Oc9wvFlgTXi3ysGb6L0cbznoTMMk8+6TjIOdzB
X-Gm-Gg: AZFdTZcvfcyhcTgy5xPL1hv0M2Hl65hypFu73fA2ZT17M1kH71VSHTI/iG1vsmA06jX
	KLaY9kmzmPHc+OZ7Hd9UNJjzjqIBzI1qPUzNKkFsd2r0bGMepfx8A+Wd0HX9jjZWKKkJlMTFJU+
	sSGRlTV4N2mki3iKFuuNvU15VA+EkxZrPkeTbPDR7+UaUE32xtbmUuOsJsWrZdDasQuevkzLfvG
	FQwtBLE61dsiQFpJJjAMI1a+4EtVtua904IYv1OFqiX3cSjJwvBphO80JAwThjILKx+iv2Uenc1
	qmNq6Hulku3rQq4yU6RxS4j9kyNtQnQXZc9b7tZzhRktBZi4aJgOfYsXxBzp3G5vRZar7rlv9rX
	ZG71ngvWu6DFICLuOETBT4wB7CHm/cxq5WUneK4+hfKdciZ7mSOXa8JcU6N3MiMVYyRvbNY4Z4D
	8fvilorircreD+HJvriKURGHLnkcdMbcY4TyhOkkIfweL5uz0supL8bxJyDFfSvYQlnAMubJtHf
	rJiUp+yQTWw9T6BrC16ivIVzURVcYvFiFy36zVlaXLxUasqjX6gZhRiFS1qzl76j2WegJ2HvgEV
	wKCSXuloa5MbYuVYjY64u3GzGGuraKcFk0rvAgFLXh3v3g+DQ++lt8ilHzsZ8qvwwtJDJSLpToX
	5kOHMlO3+2MRG0g==
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr15380222eec.25.1795473104914;
        Mon, 23 Nov 2026 14:31:44 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([106.205.242.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm45787611eec.10.2026.11.23.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:31:44 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 23 Nov 2026 17:31:36 -0500
Message-ID: <20261123223138.1165-1-atharvatiwarilinuxdev@gmail.com>
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
Changes in v4:
- Check for !do_wakeup in suspend to prevent breaking sd card in
  runtime pm
- Set card reader power to 0 on xhci_pci_remove
- Added blank line
- Fixed comment style

Changes in v3:
- Added changes at correct location
- Removed accidental usb-acpi code.

Changes in v2:
- Fixed grammatical errors.
- Added CONFIG_ACPI check
- Checked for xhci_suspend success before turning off power

Link to v3:
https://lore.kernel.org/all/20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/

 drivers/usb/host/xhci-pci.c | 28 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..b89dd83ec 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,19 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+#ifdef CONFIG_ACPI
+	/*
+	 * On Apple machines with a card reader, the reader is powered
+	 * off at boot. Evaluate SPWR(1) to turn it on, so it works at
+	 * boot. SPWR(0) turns it off again.
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
@@ -563,9 +577,14 @@ static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device
 	}
 }
 
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
@@ -750,6 +769,9 @@ void xhci_pci_remove(struct pci_dev *dev)
 
 	usb_hcd_pci_remove(dev);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		xhci_apple_card_reader_power(dev, 0);
+
 	/* Workaround for spurious wakeups at shutdown with HSW */
 	if (set_power_d3)
 		pci_set_power_state(dev, PCI_D3hot);
@@ -853,6 +875,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER) && !do_wakeup)
+		xhci_apple_card_reader_power(pdev, 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +920,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
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

