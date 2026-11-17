Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945936;
	b=KfU8VbC5U8abmHj9hxqgBABOSMfQvArRRKlodLGH4wPfcJV9OwT1qDMeVdNm4SbyifjX
	 MttcM0L7Ge70hxjfQwofFig7Vxpb+Z1OurXjd2FnoIYqRsiLVzZnM4NHHSwJPyI1gMzdq
	 gtb0Dte3K6xuuJMitVX3jzICdDLVId4LlyWvJmacJUUU9BBgwKmFCURRo4rKg6BoVxRxd
	 /v1ud4XLbCesCHqBoRQeGdwRo2D5XcVz8vxzHWPJmY97y8Oi4bDNe+F7wmfW0mo5rtjg9
	 g2DC4sD3BUQd4+t0K8A6KF6ilDAVSmh6+hyb+hkjENBjR30b/UD2Gq94n3w7jxjkf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RPFM0kM1cCqmHm1/QYYu9V/6YMFz96kfdMoyD2/miDk=;
	b=qgR9YkHxYgRDEvRpfa/GuUtYNB3W1v660XZuqsXAcfSm0nggmNBznwnc/ReRp8E8NPmY
	 7BIakDPLcPhKTV3YPmeQuNzAY7FlXmT4s95vzuRTKWyxglJ1gcXwMIZkldoo38fQNSp7I
	 GxnHRfwlbFN9LUFHUKeuGRv7goZoq57AQqdzjdMmEEH428wnrvu3Nls4F93F8zEx6B6r5
	 6cuQSbXpXrkETrMd1ibxB4IzBgcctQ0WYUkPde8iOJmuzDIRzbkPYT6m8VgoRs8t/xvpq
	 0N006tJeYaj1SDkUl9ji2GZtPs/7WSdxhwy747alRdJ98UfmXqGp1xr4/zr9Cko3NHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g82d6f8q;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30B606B474
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E30B606B474
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g82d6f8q
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa5103so77628f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945935; x=1795550735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPFM0kM1cCqmHm1/QYYu9V/6YMFz96kfdMoyD2/miDk=;
        b=g82d6f8qYdcw1P3PeliLS1T5H9U0IcgDSvbHbmDNXHG0YNHiKA0wzAaPTw9Yh9l0xf
         7Uxfu4V7F5KzrLi/15wIWpNl08nASI9JBMPfRbI6o0edRbvvmS8HvC5AZ/hd05NwBVXH
         oKzj7FSQcG4BTI8GcUvUiqBSRNipAC2I0536YmAMRfZn41nIb6zEP6IHABUl8GqAUma1
         Oo6RA2mFZ025y2RZdQnNSpK6v8ZZVlwGjLDHCFuvCRcRpDT2A8L/6gh+E0/PtHoSSHww
         ND/W24jbWzgH48f0xZsH0RZ2MuiAhjFykGzY0s328KEEiKbIf3AlRRU8vYLDvLGKIzLa
         ELDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945935; x=1795550735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPFM0kM1cCqmHm1/QYYu9V/6YMFz96kfdMoyD2/miDk=;
        b=TJR6AIntUtx4IbyRH9JqBGyNirDM8Rt5pnzZwrK9mZS9YxqdQwdfVOA8lJwmPdV9wK
         /uTlMon7Lf9beZOFYJnqCqbCD8GrpHhJPkQtuVPa+RTk1sevMsnMYnenlwcDPjB6sBL+
         KG/Ll7p/gAZamE60EmI2lW6A/17/jU5nrJMQwz8/ULqRHgbeF724ngj5wEJDSNXJ/Uez
         aIVNibvCEVM63vxtp6KL4HdWH/V/eZnYvloL/A8j4peXIwDG+mgsJHCu3UD0QDqS+cYy
         qCJLywBGWafLhjEhugnBr8Jzh7qrp3fck/71E27pomKnDzQIBW47BUZ27nyAUex2eNvz
         b7rQ==
X-Forwarded-Encrypted: i=1; AL+hErFCwIF8jgdsQsVMqcYzWEVs6nSFJgV9rTYCV+wL3OxU8lLrx0+SrX6qh75Rh/bOdCFRntkRGingnsu5+oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J7iTLew7f5y1HEVC0gtCo8OhR3mefXEnpyBvDhEwfCZXR4rO/
	IqeCkA/U7LiVTPQHFniXh9l7/F2U5pF4bSSPvAilWqIgvfd4Uk9xRegQ
X-Gm-Gg: AZFdTZeaFE0VnkeCGEd4ZiYmx1T21ivabO/wdkpJq/TjQJeciGMVsOIuUrNpXeyg0yp
	HXJQ+NhK6H9cpfC4/V8PIL+3j0QBUNttG5F1JmN/FBNAdd/LelYcsse6aWjSN7EEdtW1TD4x/V5
	1bqnFhCUCVtQvHx9DaOgQ74hKDK/o2PGT6hsb39H4KEHMq8/SixxZS2mODtwI80Tg+pv2ZkuWhw
	sqwTBwo7z67pNR0WT0qmxGVOhrNZraXyYWGPSwqsWzMZWMFDgYlWQsVk0OwLcFm3i2zuu+jR2+a
	mwAVwW8EY64dI1baQnPkVcLbQwLPVDeo4K0V7eTIqMDrDXYObSiG2LP2532veY99lCHtzPmvhim
	4xcH+Qx32IPqzFzzBMuTvk2edeKjVuAs98mHdQ8JxL/XHjuEmj6bdyAzxBH1dfyJ0KUg/hvY1AT
	+Jskk0F8hckDxWzFIkj7SaxU27UsUKWxopiim6Ze3g0l0CK/+MU9PvE/HMABT/Z4fQIHYQXISMq
	GjC7fLTClOfnrV8a0S/NjouGuJEGI3FV4bFMprP/16PPITbsixMyiT1sqs7wN398PGZKXdCB6i0
	HL5o6d5ArdZ6Bwuw3fpT/U0Dpwxs/4fQnEc=
X-Received: by 2002:a05:6000:24c9:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-4a633a652e2mr1441900f8f.1.1794945934473;
        Tue, 17 Nov 2026 12:05:34 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:34 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 14/16] HID: ft260: i2c: fix i2c_reset sysfs store return value
Date: Tue, 17 Nov 2026 22:04:20 +0200
Message-ID: <20261117200423.19561-15-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117200423.19561-1-michael.zaidman@gmail.com>
References: <20261117200423.19561-1-michael.zaidman@gmail.com>
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

A sysfs store must return the number of bytes it consumed. kernfs
hands that value straight to write(2). i2c_reset_store() returns
whatever ft260_i2c_reset() returns, which is the length of the
feature report it sent, 2, not 0. The "return count" below it never
runs, so every write to i2c_reset returns 2 whatever its size.

A write of two bytes is right by coincidence, because the report is
two bytes long. A caller that leaves out the newline, as C and Python
code usually does, writes one byte and gets 2 back, which is more
than it asked for:

  echo -n 1 > i2c_reset   1 byte, write() returns 2, bash ignores it
  printf 1  > i2c_reset   1 byte, dash reports an I/O error
  echo 1    > i2c_reset   2 bytes, correct by coincidence

Return 0 from ft260_i2c_reset() on success. The value is discarded by
its other callers, ft260_hid_output_report_check_status(),
ft260_i2c_probe() and ft260_i2c_abort(), whose own four callers
discard it as well.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index d5250bf5da61..e89f8a2fc06e 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -615,7 +615,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	}
 
 	ft260_dbg("done\n");
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
-- 
2.43.0

