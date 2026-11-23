Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430058;
	b=TWRtryfl3SQXBpnajrrv5Fa6UfiTld9Byf0InwfKLE/qeNa8ep0WC1OKHZcg4nAVSjmB
	 K1ilInYFzNhCk2mioqzU57ir/jKkTf0ZXUhBuUf1sAUMjEj+oJGD0INQGquod4IusCGnB
	 UOIdZPq7dWpTNCC5fwTziREuz98jhmIC27DjieOMxtJXSgG5V0alcmQcb9JYaQ+NetCab
	 0EO/jD5u3dgWPe8QwYiYM0WFWm0ZGg29mevupT79oMzPefBO7IzuJNcPcIvv3j9a/Mmy9
	 ZagXXeorj8hx688dIFspLztTDJ3ONAJ7wcyLjlQ7Qb1bkRkhPdFGvfVwtlzXU+q+FTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rO0PLvuw6ce5QXFOrLKO42ZXm/30hY+KUJ+GebPFvXY=;
	b=TX+jSRT3IoPA78k/jHIhmnzGXgGGAyBwVilG9oR3KBPOf9fzi8T5STk7R2amVqRJmwmG
	 gA1CiYXVCTH751WgCXOsK/7HYhWeJqlJ37zWPpmi1vIa3Y6I4h008M0buCdR4382b6tVc
	 6Vy48nFAjvRnddBklJmD0eD7R1lICe1F/BOZPe1JS2H5/6rwC1TjItsNfHaZdai8qQCvo
	 GxkwEKW8muJPmf2iGxUdy0WOSz0JNCzWCC3jwS+n7IwmV1dYOUuYBiVdBI6BiugrD/AEW
	 wGXucHVxRVjDdI2cwVHBLgvXYiAxKU3ZCRI2u51I3rMeZA5Pk1wsA9KhAeMQbhoc0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SJX+LAaz;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D08606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SJX+LAaz
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso166519f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795430057; x=1796034857; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rO0PLvuw6ce5QXFOrLKO42ZXm/30hY+KUJ+GebPFvXY=;
        b=SJX+LAazpKFZy4znH6MNzecKcIgg+Rjmvh7Zp3XhlehrLDz2DmdfiXpsPG1qYiiUWx
         z8nE+LqP59RXRUSZ/4C/S/gwY9LaARwlwx5R+Y2JH9Mh8v2CIULk1hQzEg8Shr00VyB8
         HFUEVxUetx1SqELAwQODf0tj48wlRJYKlr2w3Dzm5eiVgDfyZwtR3PM4q9zxQhDlXvR8
         Gzi2p1uCsoGc5zYMVD9fEIggaDorkwCV8Efi0o9kRAA65VZ96YEaMV5cARd4KFuLgfng
         ix6Fxf9HH7NmYF4uXi1p05wYV8swOtnDReRM2cPyqZqZcd5YyKbfbXRSEFVJXwtkuvN6
         X3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430057; x=1796034857;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rO0PLvuw6ce5QXFOrLKO42ZXm/30hY+KUJ+GebPFvXY=;
        b=uYKNemTmZjvWzoYb1hrRL34BPqZX3fRIkUBXr2T2wjvPsKx+/t8Y3kRPGsb4FlbUta
         s9yAAM9xzkAH6Bq+wAcx67FyQn30SqhRPjWsbAGUOVztAYcG0qyr8Hr7e3A1pPNB/1M8
         fH00zjU9UdV00EYdgeAFRHCqeJPCd1ogbvCxQm9jUeKKC0pJiTUlsi78ij+EBAhTtrcU
         t/fbHJCwtWqjDQ68wEbCOFThWk1kj/nQAo0zi5O/lcRnUqjetPVv4f16YZOubzAvS5Xl
         ZEoQHGPy2ns34sl8P80/s/JAUEkH3tKWT7Cly7Mx0l2Rcbo8ocFWvnIlqaNMop7Wxnsd
         6SBA==
X-Forwarded-Encrypted: i=1; AL+hErFNDY8zFugyOY+V2nepXcfuJGHH3hFAmgq6xqAYTUjGx0uGpT/8kxNU8qQqj9NLpMRXcY/FBtxVhCMKEsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zv8gdzFq3mufKszvqizGzXYRcB3VSRe9aXEHWN8T3eYdvD7HF
	KJ4d4J9UsZIitMBpD9rgpmYvXs/fZ9vhWYPSr3oAF3zss5h01AQDpRezMIeq+EMQl+4=
X-Gm-Gg: AZFdTZeJPBKoyE7ezEr6GVz8j48UL+vRFzeTcdW83wlXAaXWpHyqHE3/AXwgGoJPCYW
	5YACBsXYo1WXdCLmkcsbW7Jm03VPSlXaakPUjiN3KIheIQjqdTeqzT0P+yfdTFpGE4znJSBnZkr
	TF8VpAXU6ZbrfyU5+dObqw5CH5QLnluwoMtzm76jIMLUqoZMCxbTZ+yob1cqG1EVEsureT500cF
	8IdJuZ5PkoEy8Z2GMoqTuD/MimWl1llVawoXpdUT6HVwxlpRLhVd0O7Wwtwa1K4+4EHIupYe2iO
	f+yH1xBC2fqMM4rGtxcCoSRI8HMIliww6xCQQDYcbVM5a+7+6fHHe5nLN7cB6kQdUzHYrIHGQmb
	aG88iqjzJ4Ych5joAdtldJQZCbOeVzs1RAOMq+JYfCFgUL3ynP6Q7+qg+XsutnH8NUrOQW2hhrV
	CeSqH7SkBdyfF2k/SRA4o1KudyAOx5XxozP4LNGnAohql8JpAC/eI+lmTXXjrzp5XImsmj7mN4j
	HnzCtHm8o6IxhZzQxeL9j3Pzj8xU3bwVZYyMZ0hLVH1Kqf3jfjyJl0CCfVQ6hHe/ynrY5JjKPRc
	A5qVrF+YqyNmjNllO1JpkBO+81IgmuMWVPRFLl3xdrzIANtib5LLhAG4My/vq5lKOIO/DByEZsF
	z6tCwUlZG6g==
X-Received: by 2002:a05:6000:2085:b0:49b:f7e8:6f3d with SMTP id ffacd0b85a97d-4aa579a93b8mr26457325f8f.18.1795430056726;
        Mon, 23 Nov 2026 02:34:16 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm22256392f8f.31.2026.11.23.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:34:16 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 14:34:10 +0400
Subject: [PATCH v2] usb: typec: fusb302: Keep interrupt flags across a
 failed register read
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
Message-Id: <20261123-fusb302-irq-read-error-v2-1-5539a09127d8@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dgxTBIGV9zAs2jKVMQZwCkRDu
 LuAcenyJf+/N6tAwhRUGc1KaOLAXbuCPkTKNaa9EXC9stKxzhAxAz8Gm8QaWJ4gZGogkU4gN4k
 zKfmCrFPruRfy/NrF1+rLYbR3csNm2xYNh6GT916ecNv9Iud/kQkBweRpfUptgQXqi39w35McW
 xpUtSzLB5kZn0vQAAAA
X-Change-ID: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3912; i=alchark@flipper.net;
 h=from:subject:message-id; bh=roam5Grdtbk0Ss1UgX0o2hvhZvIfWOfQ3AePotlY4MU=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGsEFqahmkf9hJIxmk3IIEJkrEtl4kjl+kmQLMrMCU+GCErAp
 oiRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmsEFqYbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlpLMA/3t2jSkrpALLo+BYCnplVjMN/lQzKQJbIYGsIAVRlXp
 GAQDl/9PRZPBbR3RzWc7ixzsAMjMQL1u+WWo5vm0KO+TxAw==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
so bailing out on an I2C error in a later read loses the flags already
read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
as a sink and left every Source_Capabilities unanswered.

Keep the flags pending until they are handled, and retry the reads a few
times, as such errors pass. Otherwise a flag left pending waits for the
next interrupt.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Added stable
- Rebased onto current linux-next
- Link to v1: https://patch.msgid.link/20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net
---
 drivers/usb/typec/tcpm/fusb302.c | 62 +++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 83bd287dadc7..9fb76fdd3b7b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -100,6 +100,10 @@ struct fusb302_chip {
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
+	/* interrupt flags read from the chip, but not handled yet */
+	u8 pending_interrupt;
+	u8 pending_interrupta;
+	u8 pending_interruptb;
 
 	/* port status */
 	bool vconn_on;
@@ -1499,6 +1503,43 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Reading an interrupt register clears its flags in the chip, so keep them
+ * pending until handled: a bus error on a later read would otherwise lose
+ * them. Such errors pass, so retry a few times.
+ */
+static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
+{
+	int ret, tries;
+	u8 flags;
+
+	for (tries = 0; tries < 3; tries++) {
+		if (tries)
+			usleep_range(1000, 2000);
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interrupt |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interrupta |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interruptb |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, status0);
+		if (ret >= 0)
+			return 0;
+	}
+
+	return ret;
+}
+
 static void fusb302_irq_work(struct work_struct *work)
 {
 	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
@@ -1521,18 +1562,17 @@ static void fusb302_irq_work(struct work_struct *work)
 	intr_bc_lvl = chip->intr_bc_lvl;
 	intr_comp_chng = chip->intr_comp_chng;
 
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &interrupt);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &interrupta);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &interruptb);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, &status0);
-	if (ret < 0)
+	ret = fusb302_read_interrupts(chip, &status0);
+	if (ret < 0) {
+		fusb302_log(chip, "interrupts left pending, ret=%d", ret);
 		goto done;
+	}
+	interrupt = chip->pending_interrupt;
+	interrupta = chip->pending_interrupta;
+	interruptb = chip->pending_interruptb;
+	chip->pending_interrupt = 0;
+	chip->pending_interrupta = 0;
+	chip->pending_interruptb = 0;
 	fusb302_log(chip,
 		    "IRQ: 0x%02x, a: 0x%02x, b: 0x%02x, status0: 0x%02x",
 		    interrupt, interrupta, interruptb, status0);

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

