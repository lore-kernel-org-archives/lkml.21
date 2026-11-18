Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006124;
	b=Vhdc0YBxI2lme+ZlcHeyhoYxtQ+QeP/9vMZjjkXRAX92yMJpDODFfFNingcmpGeR0Qfv
	 cWGiaBUAApFjPg6FoYFUBhcVxNAmnhD88gB9gleL6Q/fPseogu+3Ivb92zcFbiSBle1xA
	 KNGBXdxzLBRrt3VcaW1xNOGJcxXdHZw91E5rr/Evfdz9qYUcRc7fHPndl/4o7hXnn1v/S
	 Qbez+6LrNeIkgAuApcvBKH16i9DjgBg3+Z/8SwIU3k/hmzkcaeVVALjJoAEUIMGFLuNvv
	 7t2B/F4qasOtT66kV7Vul3BzA8kYtbjKsEd+Q22FMJHRRX/cl9JhTjY17AmdTdCbT4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ytH9EhFMxuz7YntPPbpTAV3Bn1q3+Hti8UBQ3IydMDc=;
	b=UHrMD8+u0iw01kgF//KA4K8STi/SHmcKdEfcDeQ/3mWtzSPHtB66m+FdLyxlElWDaZuK
	 eBKglx1BqzB476NdfHASWFYI2BSqUSZP0/D8qvoAQnrw7O0YaieKjYhhehOuZpPAXuqbn
	 vZBJfjCsp2YJF6UT9C7Ft70U+9lqhA1bWRcquhPissJykGsSf1r3TtUG/eDZPga9wNk02
	 7CKgMWrMYiBSUI24Owp4RFDKYzsBW+aj13IfEqJ51JRWMxzoUXmwXaxvvtdjV0v0MZvU+
	 T9bzIrNHVo1Yek1T1/A+su2RSTuWJkZjLk1DuVsDxhzuwFKLQ/778XkfllsUI79BoEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyDNa6qH;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C3606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6C3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyDNa6qH
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so549277b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795006123; x=1795610923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytH9EhFMxuz7YntPPbpTAV3Bn1q3+Hti8UBQ3IydMDc=;
        b=ZyDNa6qHMqN8bT/9UckflEmKPPuhmBWElmSUA594C94jxxTf54Z5EYatCyvYVFjoYX
         hwApiSeGORrZ1+GW+mydas/M4G/Xcymm84AoP7egbmUiPf4ukExDdmUsLWbiom+x12hk
         gd6TMTpDHzVbTRqqfYHJ6pW4kNCvPBri0YZip51lYeFqyMOm9j4TOrR46nZfMp2Tn8Kd
         TtBvLOrwAUhemLdjYFrr2KC2Pw9LqiZm2tox/2fTYSofHoIeARlmHQbM/FftxS2rr28z
         tbwLJSJ5taOaNc4B803dtcycGfxzxZe/wP8S60zRqcBrMG9WjDVE5jzm4zXzXnFjTC+0
         eqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006123; x=1795610923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytH9EhFMxuz7YntPPbpTAV3Bn1q3+Hti8UBQ3IydMDc=;
        b=bCj7dpzzgKaq2LRweH8+wiWPi9EqrmLDG6UwCWMZYqUuN6nt0VkRqxJnOX25EJfm+q
         HECxXwckLNE+BaVCfqgZk2MKz39qnDoyj/0jXF3V3zWy4i/b42JsZqPV1V0mM3mk3OHR
         3ghjbT2H4CDRowgJfnytUmC2NMMz2j9VOG0BXnsc1GYigaA9En5LGgxRaP3Yj5IA2wX7
         M55yNzZSobGA/istKSIKa4CL6LhIXngwf9NDwHotG3/pmvKxEpjVcHzCLKtbSZWyELJW
         TvWop0xLCuq5Aiu+YnEpxcTYOPeQxdo/nQonscNjCZkqfswNVt0gYQRCyG2NqA+k3iQF
         3eOA==
X-Forwarded-Encrypted: i=1; AL+hErEa7i+31hQlhwMyLSwHQrpdoG2BQ0KgLSOuUxhnz2VOzwJYTAadprg4jNKpXloxZZUWpvQffnpQVdIXmeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YVMNJvuHrF/6TllSjNgR4n520UrEgOOD9dGgnRTYf4ReTYg+6
	ZBJzqCaX4Zs+MetiQVzVA5JbFyvTMBCUXHDm+xqfi1mBYzWV597SQPc9
X-Gm-Gg: AYBFou2YLHDIL9gypSF/YBvvE3im4Xv3uxUfafuew7NWNWzmg/Djxc9HmhqW19vrkmH
	TaX/Rht+lDMolDPqvCaWWw5DWtdlj9vrGzDZxi6XrfKkyRAK8WwQg55eTmGT6+bFz5uJr765X3x
	zL8KpmN2g2e/+92bbVzYsl5nGt+kmS+U9rWsPo/UeMHhIkQykJVgIfiXBjpJl+8Kev++Iz+JUwI
	mdhBKOLXDNY/P4kzX3fN0RJEFHDHJ/c5sXoXDsSU2u1cItihnoTfOIPDQa7p+sjw+I/pjZMbynI
	9KZDwwTILuRhf0gbBdKglq0IKzhWw55xGOuVOKexfrehbmo41TtyXkeMrvwOHmktc/w0f+Epd1R
	0LC5YXDNvbkwgOoPKLgyvOsf8dsqBqr1MfhNOpjcxPSVYoPvzhSTw+Q5ujUIJeqkmwwlJ53/arV
	ADwsd4EUUIE7EO9xndfMAy8qaKTn9o1+T3gwMEflpJJljda2mG7Yw6QijV0rWPMrjKtikoSpT64
	FMA14ZiqNZxwCjNb8paOtZe1XdVPHHuzKJQLGFJ0w698yep8BYT/LzOztBY+zMBj/eLn638YgUq
	YG6oCwd829BwGs9UzvsaIT+ywt5WJIFoP787trCVW59OjaULTioVQ5D12GHg2N7ED14=
X-Received: by 2002:a05:6a00:1acd:b0:8a0:67e7:1004 with SMTP id d2e1a72fcca58-8c455fe5db3mr3817702b3a.11.1795006123031;
        Wed, 18 Nov 2026 04:48:43 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm1176077b3a.43.2026.11.18.04.48.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 04:48:42 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH] Bluetooth: hci_serdev: stop write_work before closing the port
Date: Wed, 18 Nov 2026 20:48:21 +0800
Message-ID: <20261118124821.3990-1-enderaoelyther@gmail.com>
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

With HCI_QUIRK_NON_PERSISTENT_SETUP, hci_uart_close() clears
HCI_UART_PROTO_READY without hu->proto_lock and closes the serdev port
without waiting for write_work. The hci_uart_flush() just before it
re-enables write_work and may replay a recorded wakeup, and
hci_uart_tx_wakeup() queues it from any caller that passed the
HCI_UART_PROTO_READY test, such as the serdev write_wakeup callback.
write_work can then call ttyport_write_buf() while ttyport_close()
releases the tty, so it writes through a released tty.

A partial frame that write_work leaves in hu->tx_skb also survives into
the next open, which flushes nothing, and would be sent first to the
controller after it is powered on again.

Quiesce the transmit path as hci_uart_unregister_device() does: clear
HCI_UART_PROTO_READY under percpu_down_write() so that no wakeup is in
flight, cancel write_work, free the leftover frame, then close the port.

Found by code review. Compile-tested with W=1.

AI assistance was used.

Fixes: de8892df72be ("Bluetooth: hci_serdev: Close UART port if NON_PERSISTENT_SETUP is set")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.12
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

 drivers/bluetooth/hci_serdev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 194f11251cc5..028f691bd7da 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -164,7 +164,18 @@ static int hci_uart_close(struct hci_dev *hdev)
 	 * open may drain the battery.
 	 */
 	if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
+		percpu_down_write(&hu->proto_lock);
 		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
+		percpu_up_write(&hu->proto_lock);
+
+		cancel_work_sync(&hu->write_work);
+
+		/* Do not send a stale partial frame after the next open. */
+		if (hu->tx_skb) {
+			kfree_skb(hu->tx_skb);
+			hu->tx_skb = NULL;
+		}
+
 		serdev_device_close(hu->serdev);
 	}
 

base-commit: f42f5cae154b90a0cb6d8232dc84c7614ca2e6a0
-- 
2.56.1

