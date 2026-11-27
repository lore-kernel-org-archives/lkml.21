Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795740472;
	b=e+OO0Ll23WYhrPOXFoAkg4xOA3CLNYa4p9CafoKxI7TphCG6c8Iv1GT4/bFqmi0ERN2O
	 bI+H3fvNXzODbegXBNDwsziQkx3BD/i9nmklUlKFSrB5ccsuZzEBRlNWt6TQ2fsVZqa9y
	 5nO0Ck21bSkpMFFAgkN9DS8dC1Gu7TGQGEahcuDDDyYEMv9CdZkzDhpla/ZXbcMViKdcQ
	 jU+uY1ECXtJeiiiqmgqg1NFWXgrlJ2Ajulgn3WRD1gLkuBq7ndFPfiVAIYJAQ68RlOcK/
	 mM9L+WpqR2ZMV1C8YjXWEfPwNjpXv0V8Ab5XK8IdnrrG+/OG+UjeWOhk+9MxYjRQcQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dCfn2DRCtfqqxPpOlmoy4RkBjr9+3cGVgFmExiqCNdQ=;
	b=UXvsxf48jFVg8iMzrIwo48bZqL+zM4QfTguHQ9e/dRJK6F3+k+VnhwJfDpjyOqBxWYkJ
	 s4Bp9yxJAfnS//1QF3JyB8KjLhsqz5SGcrC+VUCtLMXJEZoErRc4Dq/LqWV6rHw3m69kn
	 OTx3m3e5bk5fa5Qs5SVz+CszvkBAMKp1RuF42QgwVrmsgkjY9nTrbko8Tl94CjVMh/A8W
	 J1CgvanAZAAAGeFlUFGIEixd5H9qJcaly0JtHAIVfoZagCtHb6BnHzik5hCDhVQ2j1zYe
	 d+KtCg9Nj8p/gpvzPBlpxrhFZ+Hh1+XsGyJH81qdXPcNa88Vo5bdNn+I5fTEyGXdakA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="l8GHix/s";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8GHix/s
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so11223101c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795740471; x=1796345271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCfn2DRCtfqqxPpOlmoy4RkBjr9+3cGVgFmExiqCNdQ=;
        b=l8GHix/s9ySTdlfMsFNH8y36VMA/K99QrH4N2GWUz3A7tKr0DMigq3xJnQJ4SeS6Z8
         mSkjqLqw5Pzqz9weT7laNOAeCl2nopFg+bf+S3a3H/aJ7YSToVB7wbDsYsY+R13vXT2e
         GQ3aEHriCtZFUWtNcJJt+EuRc7a9co40RPtbcMyqlmXsFYaWfjNMTPeJvO/GSdkKPcSI
         rhDWKkLJ5YPVfXTabZbwdtnxuSqFfVvBXmvI5GGBQEFrbIId9oCNvFzj1JOHgjn7JaLp
         yCOqIkEvE0WMwvuCWBhK3ppBdz6Ha0MUJbZoB9wMEm4de1ORiD/nyPOU5Khw20G++lhp
         bL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795740471; x=1796345271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCfn2DRCtfqqxPpOlmoy4RkBjr9+3cGVgFmExiqCNdQ=;
        b=SXWIj2teeRLwK+G5AVbN59zAzI9TW8v5G7tjaQslyza2i47KAdbu76idXatHgoXmyu
         JWth+BfKU3dV6RILP82rOiOIxtbr4PsOc/1S03TtKKyYIeq5lp7sqF/ES2yjxe8iH0oT
         dK4to2Vq3loxWXqOpdJxs8KERKEprGa9gI0x4wqhcVsCFOYBA9eaN6EiM71xD21jqcYg
         ux+NRU/G+hwb40yTQcpTgyNDs8cd//E4pt+2rg2Mk7YPgZBtNntR9CiAI14HwY42Iq2Q
         LNEgXrZD5/RVpuBIqGUk4kKzCxO6QxW7wJnccu8jwZs66ifR/9oXkaWkxdhWSJBdOBBc
         QdGQ==
X-Forwarded-Encrypted: i=1; AL+hErHvwCn0Ih055N1gofIrRLE5e7Nf383rFMCnkcb7r7F77GojiHx5GNVQP3l0d5Qo/zrcuJDpPj3Yk5RGLQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LgLl5t5ULgJGwdb7sbii/xKMmWRCQxn/pDvT8hapzhforbmnj
	72U9lpJTSmAfvxgKWBTbBUxq++eLT5nPmuPiCQ+5EWPYkT8o22+COEUZ
X-Gm-Gg: AZFdTZdR1WzRl5R0vHxm7fcEsZSR7XEd+8pI3Os7vJi5TE8NUnycs9zydQI1GahxzBL
	x/vX9oLQu8d9B0GEuWVDLNIQipz1lRYSAtY6KFMnVzb6saAxiovCNVr/KH4OWJvfIoXL4R6j0lV
	CZFu1GSxOfnwShbRmaOQQqw51BjYjl4TSpvbmtTC9RWMlEdQPvY/lthNJnSd/+yRpMJ+eHYysBd
	bENA2vpnXKGNzMh7k5zUtW42CgJlNXNm4zE7yL1/rkk6yKdTxF/Yg4docROU/LgMcFDpoUs2JL0
	r+lQdQyHVZzJS3WjMpYyB+RuFi9v+RE5ONl3tXYsM/v3gDuBou8CG2q4BkdVlJ5ngbe+5RH5nFH
	ZVl7MFDAxFXAxJIzyi8Z3GDMf0vQDujT2PHw4vcIZ8AgV03lAdTSBrCG72c3HJhG4+J0TsxyGCw
	jcXfyeknRXawlr5OFC9CodAx4pw4VUNGbRs2na6oX+imk/d68eGBVijsFztmNRIyyMFd1c1j57e
	FMtqbhN8pKALWQmlABWAAO+8V/rU4+FEw8VLeGfOTnICUKEKUeI64lMDuPJFPUgwYTdc7xehZXK
	1jdJCHqkusqloRY6iIHcHQe/IpZ3VleL44HjhUdZQizu/fMxc/G+
X-Received: by 2002:a05:7022:1708:b0:1b2:3742:828e with SMTP id a92af1059eb24-1b5567b21c1mr19909237c88.3.1795740470832;
        Thu, 26 Nov 2026 16:47:50 -0800 (PST)
Received: from penguine ([157.15.89.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm53593082c88.10.2026.11.26.16.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:47:50 -0800 (PST)
From: Swapnil Shinde <shindeswapnil028@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Swapnil Shinde <shindeswapnil028@gmail.com>
Subject: [PATCH] Bluetooth: btusb: Disable autosuspend and add shutdown reset for RTL8723DE
Date: Fri, 27 Nov 2026 06:16:44 +0530
Message-ID: <20261127004644.8363-1-shindeswapnil028@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On Realtek RTL8723DE combo adapters (0bda:b009 / 10ec:d723), enabling
USB runtime autosuspend puts the USB Bluetooth interface into L2/D2
suspend while the PCIe Wi-Fi MAC remains active, wedging the shared
power rail across a warm reboot when Bluetooth is toggled off mid-session.
Additionally, btusb_driver omits a .shutdown callback, leaving Realtek
firmware active across kernel_restart() when Bluetooth remains active.

Disable USB autosuspend for 0x0bda:0xb009 during probe and add a
.shutdown callback to clear remote wakeup, reset active controllers,
and stop USB URBs cleanly on reboot.

Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
---
 drivers/bluetooth/btusb_main.c | 38 ++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_main.c
index 95398e2ca..5b1bff4ae 100644
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@ -1016,6 +1016,7 @@ struct btqca_data {
 #define BTUSB_HW_SSR_ACTIVE	17
 #define BTUSB_WAKEUP_BROKEN	18
 #define BTUSB_RESET		19
+#define BTUSB_NEEDS_SHUTDOWN_RESET	20
 
 #define BTUSB_PROTO_LEGACY	0x00
 #define BTUSB_PROTO_H4		0x01
@@ -2143,6 +2144,7 @@ static int btusb_open(struct hci_dev *hdev)
 	}
 
 	data->intf->needs_remote_wakeup = 1;
+	set_bit(BTUSB_NEEDS_SHUTDOWN_RESET, &data->flags);
 
 	if (data->proto == BTUSB_PROTO_LEGACY) {
 		if (test_and_set_bit(BTUSB_INTR_RUNNING, &data->flags))
@@ -4721,8 +4723,13 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->reset = btusb_rtl_reset;
 		hdev->hw_error = btusb_rtl_hw_error;
 
-		/* Realtek devices need to set remote wakeup on auto-suspend */
-		set_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags);
+		if (le16_to_cpu(data->udev->descriptor.idVendor) == 0x0bda &&
+		    le16_to_cpu(data->udev->descriptor.idProduct) == 0xb009) {
+			enable_autosuspend = false;
+		} else {
+			/* Realtek devices need to set remote wakeup on auto-suspend */
+			set_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags);
+		}
 		set_bit(BTUSB_USE_ALT3_FOR_WBS, &data->flags);
 	}
 
@@ -5093,10 +5100,37 @@ static void btusb_coredump(struct device *dev)
 }
 #endif
 
+static void btusb_shutdown(struct usb_interface *intf)
+{
+	struct btusb_data *data = usb_get_intfdata(intf);
+	struct hci_dev *hdev;
+	int err = -1;
+
+	if (!data || intf != data->intf)
+		return;
+
+	hdev = data->hdev;
+	data->intf->needs_remote_wakeup = 0;
+	data->udev->do_remote_wakeup = 0;
+
+	if (test_and_clear_bit(BTUSB_NEEDS_SHUTDOWN_RESET, &data->flags) &&
+	    hdev->shutdown) {
+		err = usb_autopm_get_interface(data->intf);
+		hdev->shutdown(hdev);
+	}
+
+	btusb_stop_traffic(data);
+	usb_kill_anchored_urbs(&data->tx_anchor);
+
+	if (!err)
+		usb_autopm_put_interface(data->intf);
+}
+
 static struct usb_driver btusb_driver = {
 	.name		= "btusb",
 	.probe		= btusb_probe,
 	.disconnect	= btusb_disconnect,
+	.shutdown	= btusb_shutdown,
 	.suspend	= pm_ptr(btusb_suspend),
 	.resume		= pm_ptr(btusb_resume),
 	.id_table	= btusb_table,
-- 
2.56.0

