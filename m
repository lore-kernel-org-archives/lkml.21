Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409060;
	b=5EVaQuqDSg05B/tsv/zAO1Fu1Hj1vM1kZruB5ICv6IZ8C+b1eKoDCj3R0VrHRGM2OZHS
	 KWmu/FRbkQzHnCA2rB/HWyIwdgtqkaAbFoC7rwNTL2ngvgtAzFCdGC5Wnv4pyJNjY0wYH
	 P53Gez7wSnw+Bq63en+VkWs2FUMcKEN9dLRG6EH5zrULLLJdMOME8QKWwkGOnbJG89ql+
	 gSxVjmnfeAH4EjEUISx79rHMl6Hor8QhT/DM07sH50HuDe9EAndfn3/bqk49jd2XhqYx5
	 KHc4enEbYPS7HXFx2DKrzbyWljonM0MuJbyY0IY98NBqX+ZH2s6Q7ztMIsAOW3wvg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WFWQtd86yNkuC9tkkWvizcMlouBBSzOlV36p9Bto29A=;
	b=0fNER6nD6xU2aaO37l1h9n5PWXPIzov9Hz0WvuZiD0L3AGV/R2UwGNWpYuuV6P+x3uXu
	 l0m2sLIBH6+YLRe7k3r4XjNl+8n1WiMI4PJkRbGubR/c/zx3767gM4Qne6BuDxqFvL1O4
	 jqrrP3KUeFTNakPXgftBPxag062Upg1t/C2zX0XBZvf1/wmyMhe3RKm8zjon0q2RI4oEm
	 Q4BzKwiQRWgZPZlbbl5WWEm5wPCunpHp4k64RFKSrEXBa7ZIQRY3d76E9mZi8kgvibMP9
	 CBiFbNxbK+Ko3cnEaASToLyBcqW4NiI7h3vwdkf3nkSzIYyA1pPNn3g1MuOlfd7ZsMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ7m8UJ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81490606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81490606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ7m8UJ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so4017446c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795409058; x=1796013858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFWQtd86yNkuC9tkkWvizcMlouBBSzOlV36p9Bto29A=;
        b=LeQ7m8UJUwumbqbaO8qllsDV3Ju+XAZVl1OPvg9NpZKO6lFxpnID3/yqoveeH9Ps/U
         G0ZWL+cV9tTZV/3oZLKevL/ENld3tMEz7xBIG/rWwlwrOEXyimr31LfOkwbGhOQUqysi
         J4FfpJMSxAYPYrnB7hb1S/veqjEcydA+pZ8vOR0t1T6GcgC8w2ysbTBIhUEN8SU+GYsK
         HT6HxVaVxSoNgRoPdb9G47RApr/CADGtdqdshEwSF2C1cmCmQdnh/a0G6Fw/lA6db1L8
         BGrJ0tpxgeFyA+etBw+lZz9epRFt6A6rzqxIPtlMdhGtE5ZGN8+QqgiVvu5iGBEoWWD3
         2Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409058; x=1796013858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFWQtd86yNkuC9tkkWvizcMlouBBSzOlV36p9Bto29A=;
        b=wyc+qZ8oloN9H7PVhw4G6oPauLauSN9GPiLXGGqe0835ycWt9qRFttDm6hjXYF/MTW
         rqYlcVaPIm3cet8OT8NFHWF0zWWAwTVi0I1hxh+DLDZbHjcBC9W8AW7bNZkXtC9zth5F
         ZMEiHkohM0bjxqLvBDDSKNL5/honBTrzfEvZgLT8x7mkqbr2xhipa/TlB+IwfXDnzrvV
         hl4jZXo1na/tOaT37wfnJ0NALoh+sjlnN7EduPnwNmrHKFyHiwawxw+Fom/41pxvWKtI
         70Pl73SbJbbgN9COP9hW9q1X61/SkZF32S3kB1o+Oig8UA+lHDSyBQuRGr8MnNSwiEIP
         UrXw==
X-Forwarded-Encrypted: i=1; AL+hErE7uR4cBdb84CF1yand/MSrMx+Rdq/EsE3WY2R4BmVkwnjnVAreotYtrrI0uSbh7gEvSr1jm6WqbRB/vPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KtAm5dgP90m7gUTYWi/zABQxvSs3G7vADkpA7cDf2Yl1mLTt5
	9FSCKRDBlSQaxd9LKus+gL8rYIXxfmtxfM9nRzUSpnoQcyeZazSUpJo=
X-Gm-Gg: AZFdTZeO8ohGFB6WTRaTk+lBH/KcxHIap+I+nRDBxEer9mum4IYra2k7wuC6zxVmgq1
	AHdJOessG+FlGyYu1pH9pl3Wu1hmj/7EdQ8ivMmNvhjHYt6NwBZbyRyJCQ7APA3jnN4YHNUUz6v
	5l0RJzMyVCfVN5l2bbvVYnOJSjjir5YiMpwpdAOtRw5+if9rNfd2+EKEEYRovWsGza2OiNMoQZo
	NN9395EwccOvW596LrNZbIfG0ff00L/0b06YWTrWav3Se+NP/6h09W/c2CxFqbV5dM47V7ssG+R
	jigciDc9zfofszK8qdt0ZJcyp1nVZjdNRz4LcQT0c6UVWTb4rs7NfwARTfmVhx9davgofvuxJsW
	Y7AhBuSn42Y/Pd2pd16KqEePsTGs9ZxhTJOrE8kymrw/KO0leCh7xe7O+qJj9VzSAN9XWVHsAMu
	Tm9Y0agabYYL0N8ND7ut7dZrgSLboHEYzRf8OgyPC/aU8oyJjGibcEmyOUtu0+LW0WRA6TTHZG1
	ewdTeDGqdGOsHMfm2uWYnMDCOzE3BwUyaNaDtN/M3CuDvTgLldExP/erRI6EOIZGzkSOkKF3UUw
	tPAoEnbCbFPvPCbnhRnRZdQC0Za4qNqx80+MASONdD5KNMk04KRtrd3EDBBNFcaqm6zsblb3wyn
	FeR9H8kOd
X-Received: by 2002:a05:7023:a8b:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b5568fe775mr11992061c88.32.1795409058483;
        Sun, 22 Nov 2026 20:44:18 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm24684252c88.1.2026.11.22.20.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:44:18 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND v2] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Sun, 22 Nov 2026 23:44:09 -0500
Message-ID: <20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com>
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

Changes in v2:
- Fixed grammatical errors.
- Added CONFIG_ACPI check
- Checked for xhci_suspend success before turning off power

Link to v1:
https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/core/usb-acpi.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c | 25 ++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96..69f86b2b6 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/usb/hcd.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "hub.h"
 
@@ -199,6 +200,34 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
  */
 #define USB_ACPI_LOCATION_VALID (1 << 31)
 
+static void
+usb_acpi_apple_get_location(struct usb_port *port_dev, acpi_handle handle)
+{
+	struct usb_device *hdev = to_usb_device(port_dev->dev.parent->parent);
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL } ;
+	acpi_status status;
+
+	/* The function only applies to CPU's internal XHCI controller. */
+	if (strncmp(acpi_device_bid(ACPI_COMPANION(to_usb_device(
+					port_dev->dev.parent->parent)->bus->sysdev)),
+					"XHC1", ACPI_NAMESEG_SIZE))
+		return;
+
+	if (hdev->speed >= USB_SPEED_SUPER) {
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				acpi_fetch_acpi_dev(handle)->pnp.bus_address;
+		return;
+	}
+
+	status = acpi_evaluate_object_typed(handle, "SSP", NULL, &buffer, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return;
+
+	port_dev->location = USB_ACPI_LOCATION_VALID |
+		((union acpi_object *)buffer.pointer)->package.elements[1].integer.value;
+	kfree(buffer.pointer);
+}
+
 static void
 usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
@@ -221,6 +250,11 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 		port_dev->location = USB_ACPI_LOCATION_VALID |
 			pld->group_token << 8 | pld->group_position;
 
+	/* On x86 apple macs, Apple exposes location via SSD method
+	 * instead of _PLD On USB 2.0, and on USB 3.0 it uses _ADR
+	 */
+	if (x86_apple_machine)
+		usb_acpi_apple_get_location(port_dev, handle);
 	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		goto out;
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

