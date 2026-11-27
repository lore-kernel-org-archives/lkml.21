Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776065;
	b=SoG4jDt+UrmllxBbj+d1JUe/GAbz5dAQDa9q7WAO/iWQSWhhctHsXsxpRzlQTHp0I+NS
	 pAanTNb7r5Hnb8aTGwRnyo9qgHUvGMllYP9SlKjeqNGyUhJV7tnNkEvDRY+JYZLpTIsUQ
	 BEW3UjqpaEBMrC9j9L2gceCCP8M+h5Ar4SKUL4UalUDMFP39D3jYDKvh8u2b9gyzVxMW9
	 Y9Zffb6QxG0gTle93F/guBgHp+Ibml7Yr5q/G9KO8IH15JMAww9YN7jVxGWB2QyciUsGp
	 NCGyfb8zDT5X6HckRbGfDjL5rHLz+fwcl3KBfN151Z2wwUUp3d9GCAAyJbNoc6+WnQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=N20fGOx6HVq4KHr1wxvnFvc1GZbdma2ueBGXHUzirkg=;
	b=VfH+bFKJp6LkA0nkqzRq3qfMOxv3Rgp79wH9QALfMkIUHMTeN+AMIZAwE04J89NHww5f
	 DtWeoATL6hIR0d4YyxCpbcjzztrDRkH3xj/VaF7+exWQIlAFgMmXQ7+4NNSRVZRl6C/dN
	 ZFcccIPgnkS0PjUrPtj0P3cS0oFgbDdGdmBaGN4Ds02nm2kDoGaplvQ3V34VtJK6s+rKh
	 0IJYuK90Y6GB/h/gg8U8F7NepOA0r9zuHrZUnCmbTGfKoHG2qUcb8yNapFv9RYaENVLUI
	 vOXXTYBFt6pFRsj2uN4eeG6su9OZSiBGjEcTVBeYKV6qFSuhARmOxUCuODNISkSRcKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6NGKMMJ+;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A459606A333
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A459606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6NGKMMJ+
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6174025f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776063; x=1796380863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N20fGOx6HVq4KHr1wxvnFvc1GZbdma2ueBGXHUzirkg=;
        b=6NGKMMJ+zGpniK0z8lLNVGpJJkAxHbacv7TQ6r49VLB6XpOEqyfXP6qoAc5MO+vJ8o
         nLNz8+NQmY5EEJfR73XL/bZAqhSzxGTbnmgY0u3gtPEwvdLmfGCfZowHJ5RJGQYiGzPj
         MwmQuwa+W8+VrbWQJtPBofdtzj73kPBd9AG5itNgmov6xmXpGqtBGMjtv+wgdU0TTnmj
         NRDWqBQsTyFMTmdrPMrxTv2BcGwk6R8OMfQ4Pm+zFQfSR2EtykQ4iI4swoQfbIEMWURr
         wiwQJaqlnZT9CtUXfPUsbh9n5ClTul2cXp1DSV/m595HdKG11ZnIYrwRNXzMkX+qwIsL
         54YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776063; x=1796380863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N20fGOx6HVq4KHr1wxvnFvc1GZbdma2ueBGXHUzirkg=;
        b=mJBaQ77d2XwmZ1q1oWbvidIjGIEN3UBKS0R6zy/YiLEX70rUdWDNsu7LUlngonU6xL
         udnNRa01utZv91KE6qXNJFH240FWz03uC1j0RUHjkaS8YffI3KYuInU5Wuoi9SoX88W8
         iW0plIcQvfyfKq2ptH1BK4FERW3N5WmZYNWlFfeh9g8Rj1lncJnnwk7dh/igGHlpLXNO
         y1T9n7eropgb4/FCx3DaR7K21U47A+P4WOtj6nf4h5JzSLRwjzXXOS9KeZqAEZH9DnBs
         xXjBF5ZaGo0sVUp+OZjAqbaQGzh4d++yZwMkzHmb+4dLy6ulCVw3Oxj+Q8ACDNAZTecz
         7+aA==
X-Forwarded-Encrypted: i=1; AL+hErH9jNNPqUgufbzKhkEqSQ2CTUid8X77eqYUeDDpGrx5UwoZB7y7N//csJLwIy8uk7YnUnipnniK2uCKyYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ScHL7tWPqinqPRkfv6BYVEzAQZA3PBkNEqeo0mJ87O6/IwRs
	dnTpt4Al6pnQVN9n2ikBuX88sHsIouGLqgck/23+z9Ou5oOOQ8FwKfU1514di2BUcYg=
X-Gm-Gg: AZFdTZcxikbc+piXPHrIY9EeSe0HswY4qmfhKuBoI/nhqMk0WvocgNi+ucRagjL8JVS
	5fMP65FHKv3w1nHGuTJcrtFgiz/PplvFCsJ66j6jRHbpPB/y3VlEFQ/645wNcr/zwaOTisIpPYa
	lpOQfyypTfbO/ZNlvxBvd1sMO8DKKDCjkXfbnHkYiaK/g6DakpiM2q11xDhO+YsP6YSCWd9wvtN
	+pb9b8qF/K3Sr2O7Xz7m+zIdvWGHY8WJQ6W2i+7+3Fd/AbnmJ90v7pa/jLnTMz7TKNZCoc4AsAR
	ljA7uzMUg/GD+o9RO0+O/3g2oQDnBY/3HBDxVd8LlgrNuuBtFwYuX+pQ5P2rj4EHtmbUcN66fIw
	QIKKfq8ffSyPuqpcSVSEJ2kI8K2sSII3Eq5oL7NQVhXEuCq4WHBT8TexqEwSAByVg5RxcxvkmNA
	nc1mwNE+GsuWwl76UyB0QgnIX5SiSw4NiBUbsW/K54vvQsUC6NBptF8oFL9J1/IRYMhLWWFqxHW
	DWiVVngiq60H6ggLsUy66XRXYl1uoeMKIxeSffM23M9S4q7vOWsmqULCge1/5FEhbInSu0NTTOM
	EQC4fkr5o+DjX28bAe2rObZ2aGuGGG+ooX4vamqcsEfZ8DRQzcJZv4xxA1gZ/czQZ+lpqArv8xw
	gDt5P4aEc
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id ffacd0b85a97d-4b780c1127cmr20888918f8f.35.1795776063087;
        Fri, 27 Nov 2026 02:41:03 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:02 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:48 +0400
Subject: [PATCH v2 3/6] usb: typec: fusb302: Read out the RX FIFO rather
 than flush it as PD RX goes on
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-fusb302-getsourcecap-v2-3-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
In-Reply-To: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7439; i=alchark@flipper.net;
 h=from:subject:message-id; bh=O5zo30DMU4B42IcNMdWqxNCDgBR82hr7Up/HY/MQfVU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpntFF69/02s2QP+8qyseU8XJGo16HCVXxA1Ei+9/
 WWxuNW1joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6TR0jwwoTswNXfpccP/qk/OCMbv38ALMX6c5bZaZqiaz1X3rcnoGRYbf+yXW
 7p3TPshPaHXl0xbunHCqr+vbW3sn62Pil57BsKw8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Messages that come in while PD RX is off go unacknowledged, yet the chip
still queues them in the RX FIFO. Turning PD RX on flushes the FIFO and
only then turns automatic GoodCRCs on, four I2C transactions later. A
message that lands in between stays in the FIFO with no GoodCRC sent,
and the driver hands it to TCPM all the same. The partner, failing to
deliver it, keeps its MessageID for the next message, and TCPM drops
that as a retry. On a Flipper One attaching as a sink, this happened in
1 of 30 attaches: it took in the first Source_Capabilities that it
never acknowledged, dropped the Accept to its Request, and soft reset on
the PS_RDY that followed. The flush can also cut short a packet coming
in, leaving the rest of it to be read as junk.

Read out and drop whatever is in the FIFO while CC is idle, turn
automatic GoodCRCs on, and then pass on a packet that was on CC at that
moment only if the chip acknowledged it, and any that came after it in
any case. The chip decides that at the end of the packet, and ACTIVITY
drops between a packet and the GoodCRC to it, so wait for CC to stay
idle for longer than 195us (tTransmit) before looking at GCRCSENT. Should
CC stay busy instead, flush the FIFO after all, as what the chip
acknowledged is then unknown, and should anything fail, turn automatic
GoodCRCs off again, as TCPM then treats PD RX as off.

With PD RX turned on 0-30ms late in 39 attaches to a partner sending
Source_Capabilities, every copy that came in before is dropped now, the
3 caught on CC as GoodCRCs came on were acknowledged and passed on, and
every attach reached a contract with no reset.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 124 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index d57f9ae6621d..5cf1b78e7669 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -133,6 +133,8 @@ struct fusb302_chip {
 	bool rx_resync;
 	/* Only look in rx_buf, as the FIFO has nothing more of what it holds */
 	bool rx_buf_only;
+	/* Drop the messages read: no GoodCRC went out for them */
+	bool rx_discard;
 	bool vbus_present;
 	enum typec_cc_polarity cc_polarity;
 	enum typec_cc_status cc1;
@@ -900,6 +902,8 @@ static int fusb302_pd_set_interrupts(struct fusb302_chip *chip, bool on)
 	return ret;
 }
 
+static int fusb302_pd_rx_start(struct fusb302_chip *chip);
+
 static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 {
 	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
@@ -912,22 +916,26 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 		goto done;
 	}
 
-	if (!on)
+	if (!on) {
 		fusb302_pd_set_sop_prime(chip, false);
-	ret = fusb302_pd_rx_flush(chip);
-	if (ret < 0) {
-		fusb302_log(chip, "cannot flush pd rx buffer, ret=%d", ret);
-		goto done;
+		/* What this cuts short is read out and dropped on the way on */
+		ret = fusb302_pd_rx_flush(chip);
+		if (ret < 0) {
+			fusb302_log(chip, "cannot flush pd rx buffer, ret=%d",
+				    ret);
+			goto done;
+		}
+		fusb302_pd_rx_reset(chip, true);
 	}
-	fusb302_pd_rx_reset(chip, true);
 	ret = fusb302_pd_tx_flush(chip);
 	if (ret < 0) {
 		fusb302_log(chip, "cannot flush pd tx buffer, ret=%d", ret);
 		goto done;
 	}
-	ret = fusb302_pd_set_auto_goodcrc(chip, on);
+	ret = on ? fusb302_pd_rx_start(chip) :
+		   fusb302_pd_set_auto_goodcrc(chip, false);
 	if (ret < 0) {
-		fusb302_log(chip, "cannot turn %s auto GCRC, ret=%d",
+		fusb302_log(chip, "cannot turn pd rx %s, ret=%d",
 			    str_on_off(on), ret);
 		goto done;
 	}
@@ -1677,6 +1685,10 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip)
 
 	fusb302_log(chip, "PD message header: %x", msg.header);
 	fusb302_log(chip, "PD message len: %d", len);
+	if (chip->rx_discard) {
+		fusb302_log(chip, "PD message not acknowledged, dropped");
+		goto out;
+	}
 
 	/*
 	 * Check if we've read off a GoodCRC message. If so then indicate to
@@ -1835,6 +1847,102 @@ static void fusb302_pd_rx_recheck_work(struct work_struct *work)
 	mutex_unlock(&chip->lock);
 }
 
+/* Tries at reading out the RX FIFO, before turning PD RX on */
+#define FUSB302_RX_DISCARD_TRIES	4
+
+/*
+ * Turn automatic GoodCRCs on, and keep messages that came in before from TCPM:
+ * the partner, failing to deliver one, keeps its MessageID for the next, which
+ * TCPM would then drop as a retry. Read them out rather than flush the FIFO,
+ * which would cut short a packet coming in, so that the chip may acknowledge
+ * it and leave the rest of it behind. A packet on CC as GoodCRCs come on goes
+ * to TCPM only if it gets one.
+ */
+static int fusb302_pd_rx_start(struct fusb302_chip *chip)
+{
+	bool gcrc_on = false;
+	u8 status1, interruptb;
+	int ret, i;
+
+	chip->rx_discard = true;
+	for (i = 0; i < FUSB302_RX_DISCARD_TRIES; i++) {
+		ret = fusb302_pd_read_messages(chip);
+		if (ret < 0)
+			goto out;
+		ret = fusb302_wait_cc_idle(chip, &status1);
+		if (ret < 0)
+			goto out;
+		if (!ret && (status1 & FUSB_REG_STATUS1_RX_EMPTY) &&
+		    !chip->rx_len)
+			break;
+	}
+	if (i == FUSB302_RX_DISCARD_TRIES) {
+		fusb302_log(chip, "RX FIFO keeps filling, flushing it");
+		ret = fusb302_pd_rx_flush(chip);
+		if (ret < 0)
+			goto out;
+		fusb302_pd_rx_reset(chip, true);
+	}
+
+	/* Clear GCRCSENT: nothing sends GoodCRCs yet */
+	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &interruptb);
+	if (ret < 0)
+		goto out;
+
+	ret = fusb302_pd_set_auto_goodcrc(chip, true);
+	if (ret < 0)
+		goto out;
+	gcrc_on = true;
+
+	ret = fusb302_wait_cc_idle(chip, &status1);
+	if (ret)
+		goto out;
+	if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
+		goto out;
+
+	/*
+	 * ACTIVITY drops between the end of a packet and the GoodCRC to it,
+	 * which goes out within 195us (tTransmit): see that none follows
+	 */
+	usleep_range(300, 400);
+	ret = fusb302_wait_cc_idle(chip, &status1);
+	if (ret)
+		goto out;
+	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &interruptb);
+	if (ret < 0)
+		goto out;
+	/*
+	 * Only the packet that was on CC as GoodCRCs came on can have gone
+	 * without one, if it is in the FIFO by now: whatever lands after it
+	 * got a GoodCRC from the chip
+	 */
+	chip->rx_discard = !(status1 & FUSB_REG_STATUS1_RX_EMPTY) &&
+			   !(interruptb & FUSB_REG_INTERRUPTB_GCRCSENT);
+	if (chip->rx_discard) {
+		ret = fusb302_pd_read_message(chip);
+		chip->rx_discard = false;
+		if (ret < 0)
+			goto out;
+	}
+	ret = fusb302_pd_read_messages(chip);
+out:
+	if (ret > 0) {
+		/*
+		 * CC stayed busy with GoodCRCs on, so which packets in the FIFO
+		 * the chip acknowledged is unknown: flush them all
+		 */
+		fusb302_log(chip, "CC busy as PD RX went on, flushing RX FIFO");
+		ret = fusb302_pd_rx_flush(chip);
+		fusb302_pd_rx_reset(chip, true);
+	}
+	/* TCPM then treats PD RX as off */
+	if (ret < 0 && gcrc_on)
+		fusb302_pd_set_auto_goodcrc(chip, false);
+	chip->rx_discard = false;
+
+	return ret;
+}
+
 static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 {
 	struct fusb302_chip *chip = dev_id;

-- 
2.56.0

