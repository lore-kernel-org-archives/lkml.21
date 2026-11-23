Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412358;
	b=jQdUZJpKjAAJsyFs/qqKfpnmhsXUapWgXCTAJG4fCCgQWRwIE2hfFy5xsuRGkhmUVADU
	 ZwFau8r81c1exmyXJJlCFi8Xc1R4KAlYppjaJwnlVyPsbx5Annn0T9f+RwTBKZqzvLraH
	 szzNWf81ekmXgYkoC6ezl56+kDEn0ql0GUwVv45atWN/RUiFhUjml2SWA3NSSyc1oVX60
	 yFtb8bSsSFbZJ0DNuRRY41KYtHlNPYPgcVeh4/ccY+CkorSkK2KuUVYsnzG8uZeVP9Cq9
	 YXnWml9sYVHppO4JoM6akUX1hox6+7aWCv+k73PeCSRKGHaUJv+4hr5fc9+r5sA3c/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BxLsp/7fm7vmE3YeyIg1YDl2+7NAVmPu9zSe0GsblOY=;
	b=jz8RDytOne52LWFFtDGs5OQvDRwfrt9kHuXSO+/VuvbJ23dp9sZGL2/IVfLR71L4CSbx
	 Du5zDVXAY8DaUAYcrdsIRIP94/GxyOLTqrXRwg7NrGQA+CQFxaGi14DB1F6UsamaHWDJj
	 g+E5/xxTTmWtvUlVBPu4CmtSVqYrRa+tSfknflsEh2ZYEWrcfQrkAnyenUejgELm8fjG5
	 sv5Z3LxQY9Ej+lXf0gXk2vPtqZPM8BYZW84aHa04nT3PghdJpJW2kHEEGuRmdvM1kzTt9
	 VcMATzRuFqjOqXRY6waKN0deRBI/YuDfUnEFdblcTem8xnokVmLj5HiB2/G8X/gY7Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbQI1Zl0;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E4F606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E4F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbQI1Zl0
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so7024747eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412357; x=1796017157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxLsp/7fm7vmE3YeyIg1YDl2+7NAVmPu9zSe0GsblOY=;
        b=gbQI1Zl0FifLwxaooOLPhwIjqB8LPOC0Jddug8zX8RiPxZ5ePa0rj6oM+cqp6Sx0dj
         p9ditWCx484cXa3BSOKvlYyHLnntVHcjM74B1rjl39drnqm/Qr4T51GvVasw32BM3bN7
         3Qy06ctUfezuD0XBu1BrTNRYlC7g6jGKtGqlysn4Wf8cp/m65zyJ+Ia5d5dCKhNgBVsu
         Px9/dQzhBO7PRM4+hz/R4Nwqm8ff7HcY8GlRg3x1x5Z9Ghh8aefuWM4l3sYtLs+1R+Os
         aKAOP9/b9ApVZrts+jR1SigdqTLbhmNxOn5Rl/+Q3YDi4agxIjKxkwycjAtTOOGMlowl
         qClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412357; x=1796017157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxLsp/7fm7vmE3YeyIg1YDl2+7NAVmPu9zSe0GsblOY=;
        b=GHK5DjuPQqDqdzJkXQuUqVyrOh73J+OrQhbRinjl0D6t0R5EA9d6Ehu7xEz4MQ3Zgp
         i2rP1gJAyxREJbH1KidysTQoAuA09USJ/FaS+yuQSvkv/X4CfqZMu3+JUAOaejoER0TY
         T0KiStiHUqx7Ssv7SnQ+03cOwDwR+Q6Z7X/mBNOfPlYTMtauKg0X+fKyxtOpeI66LKBY
         8/H1mdpU5/D0hpVPikkNm5E3NJMkjueIpzlvnf+Xdboyw7JB0AAoVTbaJXZsLxxuiMj6
         KQun7AdR4BMzFC73vg5p6BpEeGArxtTGGPGzQh2NZNJKuKHzO7seLDb0RKH/TnwVK0K4
         X7aA==
X-Forwarded-Encrypted: i=1; AL+hErGbRgi2pIAZLrP34xMSSrYanbQi2g/nRo6sSsQERuWtSjPXPNQz4RXJweAqbb/cJ/6g5Aa3KwNOR4s5X4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z86RAWAKxXf9KxZV7W/Qv9svkmfyxe5Gi5IR+cwU/cjtj9Ucc9O
	d01Bai2EOt+PEaxSzn08vagdj+dqYQTZVMlxxNNNQMZku+3EJnbfFeWyzL3m4f0=
X-Gm-Gg: AZFdTZcYS4O1MN9FHYY+kANEOi7efjUrvG899qr+EocXbQCEKecui9rFQEXVNJlsdDi
	Pvhufrg0dB0XsK6/MPBZhOxTuOtA5OOMSPdyAdhvMFpcPlohZpP1mhGNAVzUCodqqBef2WaJCno
	iFk84CeMslEieZ9r9NSu2mfpu6XILgYLdbq+MnOmRi0Z6zzUtYu/Sitcw87izhMwP/NmqAF6Uch
	DJmLqj73KsjQYWsklIdyKRSRvU4ZQVz0yKzM9w204bP+xcXX/J1Gt+iFJXoDtv4M2z3VeylE3S0
	6u/u492hq20GO3R4IumeB193rSG5yYxDqRvD16XxbOTsOZXhvTqf6006ODLgh6ivljxZcruc0jX
	MKeozUBQ8O77wPcRMs7ZuF5kjYh42JCDi7aUtbOqhP/3itbO+o8hpTPmb3buhoCS7/nKCFFFcjF
	GMnnqK1djaHJQDN4gJD3QCUEpyqKPb2hdtdge+vS5crOp6Qebj6I8gOOGj1isSM9A2T2/DvzeoM
	/QBiBAjJSAdmj1dcozPx3JDr4gPaFpL0MqKhNeMAcHRynFflkplpDgJ1V+usbLvBCBg/T/HzS+5
	Cj3zlrrKFlbKuzIeehgfzqSsnGk9unNh68gaZP8d7ffnvzm4R4IlBkQSNCU0ThHh9VnbrBVP79Z
	vN0hwoMjcnr9lUCM9/zX4tZYo4FX72g==
X-Received: by 2002:a05:7300:de05:b0:385:a2b5:94d2 with SMTP id 5a478bee46e88-385a2b596e3mr9867119eec.25.1795412356996;
        Sun, 22 Nov 2026 21:39:16 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm28519017eec.8.2026.11.22.21.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:39:16 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 00:39:09 -0500
Message-ID: <20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com>
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

To fix this we use Apple's own location methods called SSD
for USB2.0, and they use _ADR for USB3.0.

With this patch we get proper location and peering:

[    0.280281] usb usb2-port2: peered to usb1-port10
[    0.280298] usb usb2-port3: peered to usb1-port3
[    0.280311] usb usb2-port4: peered to usb1-port14
[    0.280325] usb usb2-port5: peered to usb1-port8
[    0.280354] usb usb2-port9: peered to usb1-port9

NOTE: All USB controller has bad _PLD values but SSD is only available
      on internal USB controller, and even only new intel macs has SSD
      method, so we check for SSD and XHC1 before using apple's methods.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/core/usb-acpi.c | 71 +++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96..b5c61a2ea 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/usb/hcd.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "hub.h"
 
@@ -199,6 +200,66 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
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
@@ -289,6 +350,10 @@ usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 
 	usb_acpi_get_connect_type(port_dev, adev->handle);
 
+	/* Apple's location overrides the _PLD derived one */
+	if (is_apple_location)
+		usb_acpi_apple_get_location(port_dev, adev);
+
 	return adev;
 }
 
@@ -377,6 +442,12 @@ static struct acpi_bus_type usb_acpi_bus = {
 
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

