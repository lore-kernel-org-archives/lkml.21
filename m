Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415126;
	b=2HDo9jkb61GZQsdpFi+RDU3VfwRpA/2pG1Dkj64Ba6jiqPvBtcSlwndBODpkbSJI8oVN
	 7KVzk+qImBbUiK8xsAOUOmEeHDEVj7y8q7jUCp6bnQKkvQjzpY0BFy/S71CQOBiG2s4xo
	 TxPJr3ZpVwa/LHdYHsv8n7JyvXZNPTl1m7CBWI3SOVKp74K5saCCwxB4Akdgt1xScEw3h
	 UA97pgDXBEW3cwFjGI1OQTKc+nVan+183sslBcbRzcPd1Qtsp67sSrN09BmgHEF2BixQC
	 knCtdyQp5y8Wtpa+0D/BkOlRPhXsBiKVEJgkH2YCNh6bQTSmMGxFlQuuKDKCVD1w7Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXo8tWHfjpJRVP3X4QZLKcOAikBfHSnWZfGPwWhnZ/0=;
	b=q+yXyMEhfmYFI0h0wY8kXO1J69s95tSSuNGMCQo4L2y7ObNs50CegCMM3ESCgBawEruG
	 rTbgX3nMW8RXTGjj8rcCE/ayQEBT8dybs0qXsh5OKacAZzC8JE9dwJLdUNSF/CRc377Kl
	 yIjN4vrHJnlMYL+v2FFjlmKKFsBJx623rE9SZZrZ0g6BfEAieI7Gc36X5fa/nrZxZ+yoz
	 tyeFJzmTRfZ/JPw8eGh2p8Qi0MyRVL+rigTcqkWqe5tma0NqY4sgW65a8odZLmfXGcoQh
	 0xOPCtx1+UMSDe+U1dyAoujePcAA7nU+2y4eGeG5nU+683Q3wqvFdaP6VNKc3cH7PFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D170la6g;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1E606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB1E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D170la6g
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so3980038eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415125; x=1796019925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXo8tWHfjpJRVP3X4QZLKcOAikBfHSnWZfGPwWhnZ/0=;
        b=D170la6ga4/y4vsQ4QIWIcg2h04c5gM+Y2q2GVo5kHUg+IMdH+WRaK+f+iQlPFYhv6
         QuVz0ZtCQ+noLFopmwakgZFXm9+41GASqws3fD6s+HBjqmQ50O+7SRfITbdAs92wgpTE
         OzWHUTv3v/lkpBCwVHntEtk0SGQmXE6yhKbt8SiHN+Nmlz48C++/LCepREycGgggFa3x
         6XtmAxNRnXMne8NMRyRdegT/XxLRGdoKd4NNw6vg51wccLn2+Y9D6IF2Zii7T1Thkh/M
         eP1QyZJeuctMGs0s3hhD8YqFS5VTX/YXPOyboZOu4sb3lSNmUtpY/MaSbPrqQyRS6+IR
         JSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415125; x=1796019925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXo8tWHfjpJRVP3X4QZLKcOAikBfHSnWZfGPwWhnZ/0=;
        b=jOoswNBPzdBL3ywIm28p56uqDtTLDO5vVfNREPntm6p6UuVmr+qcE+Yz/hEE8HchAk
         ebC5WWqAPxhEVMN7wUdqAePAYkThQZjUHcvRv+Yn2R8rAU569YF3m18uq9RifPzvnpvF
         Z3KVXaTOyb9QfEHq/9xD3fTmX/8NHDLsZza9vMqUyLUZdsOj88AlxlWlbnwYx7ZHkVpW
         ZKriwUOHmjjHGisOlc4gaCNRXiRezgViC0einxCflP2Vqep6H9OT0am3yUVgENuD69LI
         M5+XfUIL8hNcYYG3d1Sq4tgnuUb0b68m1IjS33jvaZohcG9mIzPm6qXS+V0PH67ep+SW
         ZRhQ==
X-Forwarded-Encrypted: i=1; AL+hErE3VqD6M/ERpjC9V2F5H+mogfgh1RzITVDM8yns6hNxR4ty/LOeCZFIW8v2BPxI2edEUjkWmE1JQ4L7avw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nCKP+iamztloYhevPY+34S9I7ppTwzqFtYEk1AcQtzlHEVLSH
	pGz68HH2xwingr5SohiCy6g7KchlWdc24KcsZyuynQuLjh4rJUbbYks=
X-Gm-Gg: AZFdTZfZCEHR2zrkUOHyMowUOsaff0KOcxxw9sW47FZZBGjJiW3YANSS9r3cDC531dN
	Dm2w8Yz/fYvgBBls6o+oULxrQDKrJ2Yr5Kl+iwH5a2ciKhblCjWSHv1zgBaY9fslLOISHvrj+Ex
	GynNFtmzZnjreqt9jYSAwsqwgyDKARW6WNL7hyA/E2qeZ2sbU381q6gjuVPq1d3JArstVD4OucR
	nRMqKf1TajrxeACFra38M8UF7HmO438pEyl5bzmtHZ2a8HyBF+0qKKZWOXCWLwVFFjNGruD4uH3
	2G5cOwNSUdGTiTX/HSZxf8XNbigCR6HUTZaDSNwr9S+fepT0mlMhQd8OWcb6M9YeTvSiaN8+QoY
	F/eP4ljCQ7SsOq+pEgwXx/h9+AmIj5rVuHCuavkldsLq/4KT9PchH9GXRYWEOWliJ/R28G629j6
	ycQsYsL3zA2+czBbSdQSH6qMNyDkkxnc0K2CgIM4M0tA9P3kYb3vbC/dwh4GY685qrvMo/K9XZT
	O8Cd8UPzO3kn7kG1wGmGG3Gj5FsktgD+/l4LkCIgGZOBQSddfqCghbGU0x5hvnrnyjlwLzQ3YmR
	SiRusOFIdnDvhV+mIFhqhBWV4fp+Dn8DU6Gxqk+wVPup+FoKUsR7eBnJwuXgkW72I+TSy6dCsWA
	cTlltT2Oz
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr2683229eec.13.1795415124883;
        Sun, 22 Nov 2026 22:25:24 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm31398955eec.17.2026.11.22.22.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:25:24 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 01:25:17 -0500
Message-ID: <20261123062519.11531-1-atharvatiwarilinuxdev@gmail.com>
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

In All macs, the _PLD values in ACPI is just garbage values
and provide no real data, and that may cause errors like:

usb: port power management may be unreliable

On Internal controllers, with multiple USB2.0 and USB3.0.

To fix this we use Apple's own location methods called SSP
for USB2.0, and they use _ADR for USB3.0.

With this patch we get proper location and peering:

[    0.280281] usb usb2-port2: peered to usb1-port10
[    0.280298] usb usb2-port3: peered to usb1-port3
[    0.280311] usb usb2-port4: peered to usb1-port14
[    0.280325] usb usb2-port5: peered to usb1-port8
[    0.280354] usb usb2-port9: peered to usb1-port9

NOTE: All USB controller has bad _PLD values but SSP is only available
      on internal USB controller, and even only new intel macs has SSP
      method, so we check for SSP and XHC1 before using apple's methods.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v2:
- Nulled location provided by _PLD in apple_get_location
- Fixed typos.

Link to v1:
https://lore.kernel.org/all/20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com/

 drivers/usb/core/usb-acpi.c | 74 +++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96..403c2ff44 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/usb/hcd.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "hub.h"
 
@@ -199,6 +200,69 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
  */
 #define USB_ACPI_LOCATION_VALID (1 << 31)
 
+/*
+ * Set at registration time on x86 Apple Macs whose internal XHC1 controller
+ * has ports exposing an SSP object. Apple reports the port location through
+ * SSP (USB 2.0) and _ADR (USB 3.x) instead of _PLD.
+ */
+static bool is_apple_location;
+
+static acpi_status
+usb_acpi_apple_ssp_cb(acpi_handle handle, u32 level, void *ctx, void **ret)
+{
+	if (!acpi_has_method(handle, "SSP"))
+		return AE_OK;
+
+	*(bool *)ctx = true;
+	return AE_CTRL_TERMINATE;
+}
+
+static void usb_acpi_apple_detect_ssp(acpi_handle xhc1)
+{
+	bool found = false;
+
+	acpi_walk_namespace(ACPI_TYPE_DEVICE, xhc1, ACPI_UINT32_MAX,
+			    usb_acpi_apple_ssp_cb, NULL, &found, NULL);
+	is_apple_location = found;
+}
+
+static void
+usb_acpi_apple_get_location(struct usb_port *port_dev, struct acpi_device *adev)
+{
+	struct usb_device *hdev = to_usb_device(port_dev->dev.parent->parent);
+	struct acpi_device *hc = ACPI_COMPANION(hdev->bus->sysdev);
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *ssp;
+	acpi_status status;
+
+	/* Only applies to the CPU's internal XHCI controller. */
+	if (!hc || strncmp(acpi_device_bid(hc), "XHC1", ACPI_NAMESEG_SIZE))
+		return;
+
+	/* Location provided by _PLD is garbage. */
+	port_dev->location = 0;
+
+	/* USB 3.x ports use _ADR as the location. */
+	if (hdev->speed >= USB_SPEED_SUPER) {
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				     adev->pnp.bus_address;
+		return;
+	}
+
+	/* USB 2.0 ports: SSP = { "XHCn", <companion SuperSpeed port> } */
+	status = acpi_evaluate_object_typed(adev->handle, "SSP", NULL, &buffer,
+					    ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return;
+
+	ssp = buffer.pointer;
+	if (ssp->package.count >= 2 &&
+	    ssp->package.elements[1].type == ACPI_TYPE_INTEGER)
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				     ssp->package.elements[1].integer.value;
+	kfree(buffer.pointer);
+}
+
 static void
 usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
@@ -289,6 +353,10 @@ usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 
 	usb_acpi_get_connect_type(port_dev, adev->handle);
 
+	/* Apple's location overrides the _PLD derived one */
+	if (is_apple_location)
+		usb_acpi_apple_get_location(port_dev, adev);
+
 	return adev;
 }
 
@@ -377,6 +445,12 @@ static struct acpi_bus_type usb_acpi_bus = {
 
 int usb_acpi_register(void)
 {
+	acpi_handle xhc1;
+
+	if (x86_apple_machine &&
+	    ACPI_SUCCESS(acpi_get_handle(NULL, "\\_SB.PCI0.XHC1", &xhc1)))
+		usb_acpi_apple_detect_ssp(xhc1);
+
 	return register_acpi_bus_type(&usb_acpi_bus);
 }
 
-- 
2.55.0

