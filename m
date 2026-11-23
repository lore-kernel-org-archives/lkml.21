Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418623;
	b=WouYXzdXI4jhigiY2CuGe+K5vTTXUaZdCYdH6K4GxQQJ7sY3jSd2/wt6NTo7BQdXIYCN
	 qSyw76feBV4jPBBB8rbcLpv4ePPKSfYxQj40iOu9dtNs+OUAobbevVS4UXX7DxBs5F2Vu
	 50RnHn1AXvHgKKVrshqROsz1n1AmsZsxw1/qluWihccP1Sq+2TgJ/Z6DN9DNKxEMWrs/p
	 QlUpjLZmwSf56NoD9HjQYz06k0I+y1TN+V66xSVgAua58wuV9CtDkMXAvviTPKUrZt72f
	 tsfX6l/ikPU7hE+CXwO3ct5NxS82KKqqMMiFd8ZJYnFwh9xuP6BpGvBcbMgxJTdRihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H8gLzdazFZwlIm2KfjMoHrjel+Sb1VQszOzQk+URMQE=;
	b=FDzkwU3isgdXL6Iqa1IKc0u7PVSTqNxPOk5WoIC/mzts8zeL+F3hiL9ROcvgvQeEBjUP
	 v7rPKoe8bctq3WzXXyw1cInWrMwjPZgcoo65C77VaqVN2ijc2WnW3l0JPqzIJFHUypQdP
	 v3prcAWHeVwceHbQuIaYg7FBj1wJjUbTr4BAXpf7I9xPxUbWXkCZ0yU6DFBh7bUlKPcOS
	 JQMizPtN4qCZwnIQlnR/GYix1vHo9z9o0RB40lEq15/TFI1WAXz/qz44NEID2Czkd0NCX
	 iMMXSeew/t0l0mpDxYw9UuocE96JvDSFdvJiYHJQftJTWFd+1YyTj0ML0Uw+IKqzBOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ES8KqK+P;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E70606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ES8KqK+P
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso3202151a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795418623; x=1796023423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8gLzdazFZwlIm2KfjMoHrjel+Sb1VQszOzQk+URMQE=;
        b=ES8KqK+POnE7N2UfZ1uvbgSacHLGpSqGufHpfXF0Na82i/vZGN2Z3MAHif5Jd1Rqq3
         FyCDEwlfp1jdY1KvCjAb4Tb8yHFQELf71uSzBIJxnYiXu8an7glJujhHdDlfHVojNGdt
         X6wol31g2T2M7FZjRYVENew3OTpOxBcEPLmpyK0DHZR2Jcy0LWqOBrLtlZOYkGoi4zI4
         PbrOgCFT6JEXzjH2gBXIC9OeSm8jwjjRUEDxfmf62BDXJWpNpYz2yEQ9igJeI3nBQnfJ
         PIKzYKSZuoJ9aNFiWdhTqZcoxrspTYxjgNysrl251bXzvkfzquN0NV3H9hRfTseFphOS
         JPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418623; x=1796023423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8gLzdazFZwlIm2KfjMoHrjel+Sb1VQszOzQk+URMQE=;
        b=1ranKmCvOH/hyN0BlPGgx3ho9jBcmFpG3zodzEMCXyp6gidDNcWiiGYxglS9eAWVnt
         7r7zfXzOEfsmEH4r2cuPhF9oapW+sLNsKbCLm+k6Hazml9m5lIxkYXXR6b0xNXyotiCH
         Hn8pUd0tuz3HviH/w+7mf/pn1MyE+XE0I3IOOf02ePRmAwEmW+/uAejrCN0rdJWzMG0G
         8LmG1VZ4RtlN6T5fKmzNlwNciOplUkkJOYg9s7Usvh0pN3b1L9gD/GWigfkEgx1t06kp
         SlbT0dUYCV2pnYgLCYKs70V3uivyGK0CzRdi94m6kbQWtVS3s2K0L4mQVlwwLF53BUgu
         HRng==
X-Forwarded-Encrypted: i=1; AL+hErHnjwt+F2F0iK1s+RtK9ANW7oe5hJm6g73NjqVYJi9xT0jMP7nHM8vSBN6va7jfiHvxoYjoIoHMyFZ3gsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V7fJ2WbmAaRa/9uDyRukjVtsj5IPuJpQ2k21IG3K8ipTpZd8F
	Ke4g8ZUk6Fx0UhDRpqIOVbqAu6YswiBOdqaexV/z5Vw8xce+o7VbeGJW
X-Gm-Gg: AZFdTZcJbWAY7jbPydfizKH8OHmlfKCdgyx2EKgVJCPB1iVcabRird2V0/p4zmYQfCM
	ZGi+dNzt1CGeGZeb0wLS8q+dH5ioPIRAoEPoyDM9krmxu3vU28mMKYGCjCIgHjqpFGh4NfC0zVx
	FN26Vhj8xKjg3WlMaEnByT6g2SwW5K3BMpWKJ/duwjH7fcb1HuB5DgOlldiMMTL5KqYQWLsm7mF
	y2tQeqQqxjuoBA9APGQeyUGQCBMmZ8bLoeZv0/CA5jqVJDMC3Y1Lm+51Kl3jWQb1qQucbR7zkbU
	SkQmTHYsYDu0IB9Ek1FAwHY9Z3QxbPn9CeUY70QaL7rf05LF7MnJ7+U07Mu3ogOVC4UmJmmPfa5
	8TdMpR2hPLVLf2NRST1bCNvQyakw9hyPscSFQdcFPxPxYmOzAviRVSrOA4eR5gcp1f3ZFgKf3+h
	tyWel2zIjh5wh3d4LAv5OZZOLeKLDhRn/fnhcjWAoeADcQ6LAtoRAj+W3p7LVIirVsG47kxp5KP
	8TWYmEQgRux3IdNLGLB/UrcOxgXnd6iRAezAvwP3oW+kTJUST+sj5Cu1JusapLjECvGFvwZwdqU
	aTg/6hAQ9WgMlt5vtFGJ7yGZxWAFOunXvbVF9uC5TVKBJVm9TwXhXbBfHjbVgmR/nK8Za+78EbP
	CcJU/XUt5UH4O0RMF5Qj4l2M=
X-Received: by 2002:a17:90b:3d92:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b41c8e0602mr6108571a91.14.1795418622775;
        Sun, 22 Nov 2026 23:23:42 -0800 (PST)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm17751153a91.16.2026.11.22.23.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:23:42 -0800 (PST)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron hosts
Date: Mon, 23 Nov 2026 15:23:20 +0800
Message-Id: <20261123072320.5967-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
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

On Etron xHCs, a USB2 remote wakeup may also move other suspended
USB2 ports into the resume state without generating individual Port
Status Change Events.

The issue can be reproduced as follows:

1. Connect a USB2 hub to each downstream port of the Etron xHC.
2. Wait for all hubs, including the root hub, to autosuspend.
3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
4. The last connected mouse does not work.

The affected USB2 ports may remain in the resume state, preventing
newly connected devices from enumerating. Reconnecting an affected
hub or mouse does not help. Reloading the xHCI driver restores
normal operation.

When handling a USB2 resume event on an Etron xHC, check the other
USB2 ports for the resume state and track them so the normal resume
handling can complete.

Before the patch, the root hub status bitmap reported only port 2
(evt 0004), leaving port 3 in the resume state.

[ 4621.396100] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
[ 4621.396158] xhci_hcd 0000:01:00.0: port resume event for port 2
[ 4621.396164] xhci_hcd 0000:01:00.0: resume HS port 2
[ 4621.437164] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 0004
[ 4621.569169] usb usb3-port2: resume, status 0

After the patch, the bitmap includes both ports (evt 000c), allowing
port 3 to complete resume through the normal resume handling.

[ 4824.829350] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
[ 4824.829425] xhci_hcd 0000:01:00.0: port resume event for port 2
[ 4824.829431] xhci_hcd 0000:01:00.0: resume HS port 2
[ 4824.829439] xhci_hcd 0000:01:00.0: HS port 3 in resume without event, portsc: 0xfe3
[ 4824.870180] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 000c
[ 4825.001183] usb usb3-port2: resume, status 0
[ 4825.027484] usb usb3-port3: resume, status 0

Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fffd901..c640952 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1997,6 +1997,39 @@ static void xhci_cavium_reset_phy_quirk(struct xhci_hcd *xhci)
 	} while (!(pll_lock_check & 0x1) && --retry_count);
 }
 
+/*
+ * Etron xHCs may resume other suspended USB2 ports without generating
+ * individual Port Status Change Events. Track those ports so the normal
+ * USB2 resume handling can finish.
+ */
+static void xhci_handle_etron_usb2_resume(struct xhci_hcd *xhci)
+{
+	struct xhci_hub *rhub = &xhci->usb2_rhub;
+	struct xhci_bus_state *bus_state = &rhub->bus_state;
+	struct xhci_port *port;
+	unsigned int i;
+	u32 portsc;
+
+	for (i = 0; i < rhub->num_ports; i++) {
+		if (test_bit(i, &bus_state->resuming_ports))
+			continue;
+
+		port = rhub->ports[i];
+		portsc = xhci_portsc_readl(port);
+		if ((portsc & PORT_RESET) || !(portsc & PORT_PE))
+			continue;
+
+		if ((portsc & PORT_PLS_MASK) == XDEV_RESUME) {
+			xhci_dbg(xhci, "HS port %d in resume without event, portsc: 0x%x\n",
+				 port->hw_portnum + 1, portsc);
+			port->resume_timestamp = jiffies +
+				msecs_to_jiffies(USB_RESUME_TIMEOUT);
+			set_bit(i, &bus_state->resuming_ports);
+			usb_hcd_start_port_resume(&rhub->hcd->self, i);
+		}
+	}
+}
+
 static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 {
 	struct xhci_virt_device *vdev = NULL;
@@ -2103,6 +2136,8 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			mod_timer(&hcd->rh_timer,
 				  port->resume_timestamp);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
+			if (xhci->quirks & XHCI_ETRON_HOST)
+				xhci_handle_etron_usb2_resume(xhci);
 			bogus_port_status = true;
 		}
 	}
-- 
2.25.1

