Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013800;
	b=ZxzG0RnKOcEq5jYgoj3/nhWgW+xKrn0tvhrfM2K4O1TI5u23H6BAcaa/YhVyNjwSOiZ7
	 SUFEsrvt1ccrEAdQWGBdl4skduB9WDwHOfydfgp7I76NHpDnHD/+YGJfTBt+XxpwvlbWr
	 uJtU+wKc3c5MQIbhYpj9Bka/Q4L7WR85LY5acxJ2njDuoxXHo4/KC3sRJWhXeMj6z0Mri
	 3CA3iRfglyCxAxm0LujKVh8bABI8MwbU3Odso6vufHWF0ydRQ8Vj//nrTN9Wyh6tZCnS6
	 jBsrLUlB4m9ZOamTIn/2KVwvJoCd3BfkrUL9Nuojr4TzaRkPmcboM+/o+u9C5hznMZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5+NHJybFkYZ5rmq65hdGu5soNWFQnp+bSzJUXt6Wgcs=;
	b=M9Jthf53kMNw/LDOpPQywYsJ8+1X13GCtjO5TWSBYT5ZWVSCPWQOyROvw+BhObPme8NL
	 QsyUa4Zp9nlE89E9YhzZy1SWpQjEYd51xMVUKAWstup2R62lxGciEOE//4zvAI1rkuV8G
	 ZQ2wFSHqo0+7L0wqBVcnv9AjZ8ANzFMfGOuehVBmgIvkp8iv1s5SyO4ZrEwRcHyONWJNs
	 AGHNGWOpXp+c4H3HDzu5c7cY/+y+UK9cEby7f299Ct0FPBTN1IqRO8N9uktejufspQw9+
	 RUstKeSuZsvVPv29UWlYJMGgMHSi45LH7+a3ulC7pfP6uh2iydl2rnk9UekhUa+khrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fCqarqvC;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEE5606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fCqarqvC
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso878652a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795013799; x=1795618599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+NHJybFkYZ5rmq65hdGu5soNWFQnp+bSzJUXt6Wgcs=;
        b=fCqarqvCcDR5rXgEHLq7dQ0rF1bO7a8DYl3E4BrkJwvABK7+Hm6X6fYkXE+VkLvZxp
         YY7akXggWY6dvDjNjoStIv1a9g5eSotSDt3qTpgmjf6f53shSD8S0mgOwhMqQ/VS6XrK
         EKhYteHZqPiOf3iUAx+qKxMqZmYoscmCNnrGrPI94BjIcuncr6JNScjJ19VVZ6uvGIuw
         abJpj1nVx4qu/YPwAfmXxfcb9vkey9LchlGJqwtnM2n5j+iLPYbKUIeheOTlmd8IT6N4
         +wwY5OEf6WE5V/3RX2GpbuUYDbgz55eI1EMD2y09vFiHdBIBFX4ieECtv1cZq4YMhRq4
         yUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013799; x=1795618599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+NHJybFkYZ5rmq65hdGu5soNWFQnp+bSzJUXt6Wgcs=;
        b=E8cdmMvjU2fwDELqTz5t3c49fMFmRR1mE7E4iryLOqq5Dc3iKXibKR6MYO1t4/CgqZ
         PnOxqTDD6Fy/uoueUsDQvQdPC5aDe6+Kkj8oljImJmKURT1C8D0U0RFXi7zbEEmwkWJq
         Y2dWBATcx9/yRjVzkKouwFHHbiN9ez7FWtsAY0tNbpfDF17TGLSXGoSPTELhqAvElnRB
         YYZzYRSbal/VCG+mUigsYRR21YqZnuhewdspI5cgAA6qq671gLY3Elh6paNK7Fzd5CW1
         5tS/f+cSDirw5HxTex+ZxUjxfP7pVI2UyE/3+tQ3qxWIqk8p6AMvkkYcWBQ2EZ3THCLZ
         kORQ==
X-Forwarded-Encrypted: i=1; AL+hErEhX8H/bomezCU/cVsufi7KCGABm+5LafYE7vKrbj6zSXYb+g1wH2zID7w2KZdPXfF3SIEUcmQ7w+Fa3e8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mSP2Ar6Ly5yTL1jiLQ0EARls8215S7Mkxajew7mFoQJZiuX/D
	P2anNHYxnCRSuDUwXIzXRd3X5vYvsgFfimJfZK1L8M9IQSNc478OY1OSxRoQ9f6tKIA=
X-Gm-Gg: AZFdTZcA6emjaOB6URkSCWZsZLf3+E4tOiXo1XRxhiDKM0DBlvD1p9HT5f+fFXJFjhJ
	b1bhS75QwekCBrd0YXQ+yzq3Yf/OVTHdomYF7Da3BZ3TwEP6tYHoiiwu3igmu3Th32hRoDrbLAV
	kB+IUh84wzRLx8yiWE7CoyFDwVDAyA+40iu4Sj4FwGODray1QsAXrH6wRecgWHzUOL7ntlL4Gck
	eh66ykXZMss1qe2nk1rceZQwcTjB1AxQEUWAYvN1oytKIfC3jGjbSkNv1ll0FvpFKCPC5omG56G
	mPX28msYt6f7Yk8JXD1H+rsxU25vWGdvhL71jX9uznxX5Uohe9RETkshGb+8OviHzhNJv74ktcD
	Zc08Ry4Y8Y0DvS02TpMYEk5HgaNw6K5PEa/8OeHEM22mij8+YwhJJ7GWzkZ7KdFmYzRVHI5t5bC
	5FRGj1jnKm0IvbOzpAqkQSzZtcSifKv7xb7V+GnqgtIZATuFFDnoDIRZwi2SCf7h1Yj8Q31sPSZ
	+geP+ELQHAcsxPVCgIEEYY6i6a34FOijHsfEPMP2OOmRbEoM6xth+VJaVVzONRqgPG2mQtrNX0/
	h6Gk5DdJW2+QxL2HZUcnLHlevE+fJGMZa8c3nsLV1l/v4Emp3rT5u+w4CPnYOXRV1UCxEeE71Jr
	GR2WP/nJ+FrGoQg==
X-Received: by 2002:a17:90a:e70d:b0:3b3:b151:f425 with SMTP id 98e67ed59e1d1-3b3d07aa7d7mr2814324a91.40.1795013798624;
        Wed, 18 Nov 2026 06:56:38 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm15344135ad.19.2026.11.18.06.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:56:38 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] USB: cdc-acm: refuse writes after disconnect
Date: Wed, 18 Nov 2026 14:56:36 +0000
Message-ID: <20261118145636.3534234-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
warning)") stopped clearing acm->dev in acm_disconnect() and replaced
ACM_READY() with acm->disconnected, but left the write path checking
!acm->dev and dropped the disconnect check from acm_tty_write_room().
Because acm_disconnect() frees the write buffers with
usb_free_coherent() and acm_probe() only pins acm->control, a late
acm_tty_write() call dereferences freed memory.

This can happen when a CDC-ACM device disconnects while a file
descriptor remains open with a line discipline such as mctp-serial
attached. Hangup closes the line discipline, but a subsequent reopen of
the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
c_line before acm_tty_open() fails with -ENODEV. Because the original
descriptor keeps tty->count non-zero, the reinitialized mctp-serial
instance stays attached and faults in memcpy() inside acm_tty_write() on
the freed wb->buf when transmitting.

Pin acm->data alongside acm->control until acm_port_destruct() so the
unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
check acm->disconnected at the start of the write_lock critical section,
report zero room in acm_tty_write_room() once disconnected, and set
acm->disconnected under write_lock in acm_disconnect() so any concurrent
writer finishes before the URBs are poisoned and the buffers are freed.

Fixes: 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep warning)")
Cc: stable@vger.kernel.org
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/usb/class/cdc-acm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 666969ffd194..77951cd34846 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -762,6 +762,7 @@ static void acm_port_destruct(struct tty_port *port)
 	if (acm->minor != ACM_MINOR_INVALID)
 		acm_release_minor(acm);
 	usb_put_intf(acm->control);
+	usb_put_intf(acm->data);
 	kfree(acm->country_codes);
 	kfree(acm);
 }
@@ -848,6 +849,11 @@ static ssize_t acm_tty_write(struct tty_struct *tty, const u8 *buf,
 	dev_vdbg(&acm->data->dev, "%zu bytes from tty layer\n", count);
 
 	spin_lock_irqsave(&acm->write_lock, flags);
+	if (acm->disconnected) {
+		spin_unlock_irqrestore(&acm->write_lock, flags);
+		return -ENODEV;
+	}
+
 	wbn = acm_wb_alloc(acm);
 	if (wbn < 0) {
 		spin_unlock_irqrestore(&acm->write_lock, flags);
@@ -855,12 +861,6 @@ static ssize_t acm_tty_write(struct tty_struct *tty, const u8 *buf,
 	}
 	wb = &acm->wb[wbn];
 
-	if (!acm->dev) {
-		wb->use = false;
-		spin_unlock_irqrestore(&acm->write_lock, flags);
-		return -ENODEV;
-	}
-
 	count = (count > acm->writesize) ? acm->writesize : count;
 	dev_vdbg(&acm->data->dev, "writing %zu bytes\n", count);
 	memcpy(wb->buf, buf, count);
@@ -890,6 +890,9 @@ static ssize_t acm_tty_write(struct tty_struct *tty, const u8 *buf,
 static unsigned int acm_tty_write_room(struct tty_struct *tty)
 {
 	struct acm *acm = tty->driver_data;
+
+	if (READ_ONCE(acm->disconnected))
+		return 0;
 	/*
 	 * Do not let the line discipline to know that we have a reserve,
 	 * or it might get too enthusiastic.
@@ -1400,6 +1403,7 @@ static int acm_probe(struct usb_interface *intf,
 	acm->data = data_interface;
 
 	usb_get_intf(acm->control); /* undone in destruct() */
+	usb_get_intf(acm->data);
 
 	minor = acm_alloc_minor(acm);
 	if (minor < 0) {
@@ -1627,7 +1631,9 @@ static void acm_disconnect(struct usb_interface *intf)
 	if (!acm)
 		return;
 
-	acm->disconnected = true;
+	spin_lock_irq(&acm->write_lock);
+	WRITE_ONCE(acm->disconnected, true);
+	spin_unlock_irq(&acm->write_lock);
 	/*
 	 * there is a circular dependency. acm_softint() can resubmit
 	 * the URBs in error handling so we need to block any

base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
-- 
2.56.1.703.gf848ed807c-goog

