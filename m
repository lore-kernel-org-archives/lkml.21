Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155670;
	b=NBil7fGzo0aEgqQTWOnmaC+qFqSp4s6oGRnQXRTvV6ArFFP198nrxZZ4lbTdhD2a0G5C
	 u6MmngZSP0gHVDJO8Hx4A2MZ6pLC8GXvxxfjld+Tw20YBZEo2WGrKDkAHYD2Pk9NQ7Ms/
	 uC18Y0CyRkT2h0FmxrcYC9FHs20w/YliPN4PB2YLZEjVzT+dZLW51rYUTzy1VQUNj3xWw
	 yKeoLIjneJGTMQMuCIoWqaiI3b1hp4WULRtrHeaMpEoOMQIupZWsXR9ly7ggEewfuKS5/
	 aWp2T/52pPu0iDClDpoJNaajv/ItfO9ctlFEwNtZU4h2Ust27QTi7X8f2NLOTyY8rCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ylQ5NpR+7iB87MylzEu3DJ9CieEThMAM4Vq8MsEW9S4=;
	b=GMy/gMkqzjf+GS19eeAjBjOtkJA4Frg5SFyseaolRbBC751gWQqOLsPLx0x8eLvxKnbb
	 ExRcpACfVyh6eldviYLHrd6Ha0eGVHRncvjNshyCdNG4UYTrO7wYxBcFg70nLaAkVgZoE
	 IKA6xkLmvHVtdVfTU3QSnwUCS6FhQ1VMsRAmtbFZSLi3ggkrMtMZZVhVz9tgw3lRJoV8h
	 CKVO5S47MSIqCwhXJPKKIx+vpIScuQX+/OWdk8c4ADLRt6Z0G3DOxl+kgElqpGOoXY74J
	 nNm/ujoPr9fEOX95NJ3JZpS2fxl9H6hAh44NAb5L9NVRZBVYpRY/h5qailcl4EQlPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jf9CV78f;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1560A2602
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B1560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jf9CV78f
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so1361670eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795155669; x=1795760469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylQ5NpR+7iB87MylzEu3DJ9CieEThMAM4Vq8MsEW9S4=;
        b=jf9CV78fTEHK77xABUNuLqeS77oUBYpR+16bljYgb0KLdAWnIC/IJI+3N04IHXm2Yc
         xciabRbXXTjGCK+TPK2aBYJ9r+9vAennl2WJGwAvxCC6ACdA3fbxP+Zoul6dm0x1GjSd
         lWLSGdMfwzub5nLl87rkdWrulgyYQ9zJlv0ufpxSqpXN+QchkFHOCJILENf9gwiEFBAI
         7V7uqpre3uWfn7D9a1XitMGgfCp2C9XLDzS/TC5Vy7GKAXhFgMN3eNRDH0oDqsrIhaky
         vXMoB/AkH9LNqSmfgh6vvRRVrJ78mqMoDymPL/bkhgNgjJLbEazlcR2RdfLxD4MFWjvf
         t0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795155669; x=1795760469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylQ5NpR+7iB87MylzEu3DJ9CieEThMAM4Vq8MsEW9S4=;
        b=X4H38/iQryToGMshupLSV8Zl/PR9eTX6pyPsB9SudewReYqRNfW+1fEnJoud83jEIb
         VgqAsMhWomVqB/X+wXmf0YyBSVJ/mwrJSTJD8dFkOEEm6dqqET02Cmqlz1ZFQ2fdTe2b
         HaFfBoMoAUBhqJ6gM8mqZNUd8sQHTuayAn6PY9qFMIY14cVxjUk0a3l7ee8GbILFRqJA
         22EoCiP8bKpjSw1BaJpwRRRmzipaLDykcXNYSfJWqfUb6vvj/x/goY+dFQKTHqpw0T4m
         caU6PImvKUIg+OdZip2MihhMImaTV7rHcL9XP58y1bRQmhUK7qREDsPzKzWgmtBco2nq
         URTw==
X-Forwarded-Encrypted: i=1; AL+hErFLd/RptwK6sMKVkXt1vkOEXuShDkRpBowzxI1k14BXvBS+FwivS5llKGBJ/ETLjxiMmB9HVh8BlZUW+14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dbcGQhIM6ja30Y40PXIplkxiH2XndMDK7KKBW9ZW5/DT68fqS
	3f7j98hoIc3bnlRvml5Cp+wdXzGm1msz3eB8A+7kpiVvH84Bsnq0BCim
X-Gm-Gg: AZFdTZfVblRTq3/AosVoLkvhuRpEUi7Mf4E9EE7K03xAveamlLCwXQAfLwdGadjmQub
	wSsvtycg01N3oyGedv4mLQnfkvT6ToKnPaV87n2nfWSotpF6G2J8jESNmAP9Pi8U30GQaLFawJ3
	+GZZHADUsTVc5//pV3StyBjXBbwruV6WYgJX2dJ1uHu1jD+rHPv9Er0S6SAqKe7VFVu/yE1U4Vy
	nojk7IleL20oTutNWeS0/8V9GvB/jOMYAR8RKnOI3YoCqeXzJcmDLneuRJ9OmkSySDDmiaQ7Ns3
	ZblrnNhOOAHGCql7YNdXoJ5SjnMG+xKLBTGDJiCfK7fj78rFuq3oAGD2OQ5pbepg+/tvgTez2sb
	oA+AbHgG64wFpz0M9Yq08u9FoyKrNrWFaY/Chxk33Z7S2f7iL+hf1DD4ygijL/1WRv6+o49/OQX
	Cy/G+Xa7wOXXJ5gEzUArwA1wCGM/JYrCtqbXs4xD0x3hX6LXqu+VHIpogstHSWVDzjFemMmYyRg
	Qs4pBMB/yUeSwPrmLaebciBsRp8cnuWehLtw31CsGSb44N7V2tOQ/G/Slp1COcE/p8aaEk2vVnG
	0OQO1AVmyqqx7GwXTMkcrXhv8eW2++VNm+ZdKxlUGtsnDWpimw==
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr999820eec.12.1795155668669;
        Thu, 19 Nov 2026 22:21:08 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm5476880eec.5.2026.11.19.22.21.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 22:21:08 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael McAllister <me@michaelmcallister.org>,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH v2] Bluetooth: hci_serdev: stop write_work before closing the port
Date: Fri, 20 Nov 2026 14:20:48 +0800
Message-ID: <20261120062048.40310-1-enderaoelyther@gmail.com>
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
A wakeup sets HCI_UART_SENDING and HCI_UART_TX_WAKEUP before it queues
write_work, so clear both after the cancel: a work cancelled while
still pending would leave SENDING set, and the next open, which reuses
hu, would never queue write_work again.

Found by code review. Compile-tested with W=1.

Fixes: de8892df72be ("Bluetooth: hci_serdev: Close UART port if NON_PERSISTENT_SETUP is set")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
v2:
- Clear HCI_UART_SENDING and HCI_UART_TX_WAKEUP after cancelling
  write_work. A pending write_work cancelled there left SENDING set, so
  the next power-on never queued write_work (Sashiko's review of v1).
v1: https://lore.kernel.org/linux-bluetooth/20261118124821.3990-1-enderaoelyther@gmail.com/

Before 6.16 the quirk test in hci_uart_close() reads
test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks); with that
context line the patch applies to 6.12.y, 6.6.y, 6.1.y, 5.15.y and
5.10.y. It applies as is to 6.18.y and 7.3.y.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/bluetooth/hci_serdev.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 194f11251cc5..a5e4b3d32144 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -164,7 +164,20 @@ static int hci_uart_close(struct hci_dev *hdev)
 	 * open may drain the battery.
 	 */
 	if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
+		percpu_down_write(&hu->proto_lock);
 		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
+		percpu_up_write(&hu->proto_lock);
+
+		cancel_work_sync(&hu->write_work);
+		clear_bit(HCI_UART_SENDING, &hu->tx_state);
+		clear_bit(HCI_UART_TX_WAKEUP, &hu->tx_state);
+
+		/* Do not send a stale partial frame after the next open. */
+		if (hu->tx_skb) {
+			kfree_skb(hu->tx_skb);
+			hu->tx_skb = NULL;
+		}
+
 		serdev_device_close(hu->serdev);
 	}
 

base-commit: 1d79f61152c315e30e758116e525871732181a98
-- 
2.56.1

