Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698229;
	b=b8MctQDRN7Q4t8LxQeR5COSbSYvompkk1PIC0Bj141pUu3MBZ5p2ozqe4mJNDF2kaGsj
	 ecEgYnggv33lBhWAtH6t8TZszGlNQC3jpLWxzg8sroM65c8pPkyjWk5ueO4WaSqI/LgOW
	 PvF98tb/8T8kN4J8kLfOp1Dy4h8wvfmYGID7ABaN9KaATHM0KatPnIr27uI9JCbVjZzwu
	 /mgGdTM1pLH+XRyuwCR/GYk8lVcxbZv9bjG55/HPUpmWPVjiYQWzgqABwIVIzpcMYQqHJ
	 tDdwl7lAJZ9HRZs2tY5mh+VZtk22Q/wZM7hRrF9ai8ziQd205W2HtRAbW0l1cFBs/zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=h+KSC9hXnerufZLnJziB/VLIUIm4B58avNQwD2KLqvyxOlkPjYkbNp/8MsqZz7w2lTUG
	 4mMrjiBFQuW8JW0HH31Wc+AU5tVCqDB3V+18kkELQ+TXq4/bdXc/lF5ShsMZ4KR7CzR/+
	 d2MqwrHPUH9BxxzT+sG1JCkPjYEhSoPupxHpW+Xe8+8JIo4vb7QLmyf8Q97ltRg4RBiqo
	 o6rmAjCzzf94NTb9lQKUvYxW4nW7q+gxRHkPCBWvHHvjtDoZhhmoqaF6jBdA3U+9C1jSK
	 wR3XLdpNyX05GAivSQ/uVVPiBkIIVUOn4TIVdCVv7JegpmqMh3YX3dK4mij31+nSDZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc+4uOFH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257E606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5257E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc+4uOFH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4949183f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698228; x=1796303028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=Oc+4uOFH7gxgWYT7IEWvRP9q9C/nc8WHA3KgPi9lcFkiqDMog+1534PSwq0wiYe7pK
         vqlRdDRnjFdqYFpwvNritESF/2HA9WYmFdjNWmTPXQn4TyE6VsNedJ8wyt04fkcpC7eR
         8H9tslSzbX4tZqyXYLBEQ7tDEAnxQcOxjPoyq1LlhtB8JX1GRb3vGmeMJZkgLokfrjve
         vZwH88zSww3JYFdkmO23Pw/tKUfVHAhTNTB/Sbl3Gt3PLfnofwB0gKpaJKamTULPxXUa
         NjzP4FFFKa72mdQE/hT14yHnoxXMLXo1VS1kgv3HR0NnYgraYviWv4dfrjFuP+J8KZxV
         fgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698228; x=1796303028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=AoC8a53u8R71jRLdDvAmEBmbM8RGm1y8OT+yngKkdM/a3tHApHht4wh8UQvChnvCSk
         eoBsO2zVI4id5exIhqTgr9MkIeSNokumNDISaKQgImlZ/2P+sDifgTsihKMrNLgGLYAa
         bNpr/Ngzz0/x7M0Q7yG+q6SAJXI7EagAUBogowKaDs+MPpQZf9GitB4a78NpXR2XG3/O
         710ymlqSW4SOmxoa1wsmUfWB2j1/zlO8yS02A8aRbgoN+HzbynlDf7jsqYHr6LTwGG41
         t0/VVUnJbHdG4LqI2SaNpiBRCdmJw9xJiOGTLCsSuxDldGFjpRm9hdYUwuL3sK5oIBv/
         m+aw==
X-Gm-Message-State: APuU4Z9F5hsmMmbAEvtMZXxRxA4AXP4vj6Xr4c5ehuqTAOjqgx2gvUAD
	/J9bszzbyNWCNi+hD7cOzYmYIvBIy5EyE7RmkW9+7sCgDzu+ePvz8HT6
X-Gm-Gg: AZFdTZfghiDy7B61gtH+aRJLvg9TjJalZnSUYcLGZkCh3DCfUN+mjrtwl4q+4KBfLzh
	L9RENRdD/vKNbMP9DfopvSZhhOmI33zSKkh1ur/y7FKQ1o0hfidLyDqxRCvwZW13JVXeqxiEhO2
	zopZG/CwkT9ElmIB3dnd5kcS5D1e98WAE2JDtWOVo/5j9Q7CfS0q3UxJXWFbVqhDUTkP+ABgae9
	Fsrpf5q8fDiiNc88hSm1m0wISm06EuAWVNbvuelUNJAz+/rSOkARZbbrTkTSISQJv3WbUihwTzC
	tCylhFpAw+OJzOOUjxCFCkL6JKGConqZhAjk6bmeG8h9PaOZq7U0erhaFQoKoynqu9tlzWrOBVo
	TFoZ4V/1VyDXQkthNaqbeLuXBdG3hFyzkDi2i21zKAxAFSKTStbBZ3Bq2NCAO3ORPi7ZAi+eI2A
	yiNUtSu7okDbpkBUhWFeBW0yJ5JlDfmi69SPHRzyC2QWWd8eKZzQj8aCC2R27KYxS8Lg0oTBOEv
	9bR9sipJ/6QHxrV0TP1hJfXKoFU/VBblGyyKRAioWYsEzVhhfvAxHHVKjrC3w8fXxH3awTw6BpZ
	JKvxqppz0cgG+D9atpj3pJJBEoQc9/QymxMRLFIUwkQZzzFsY5F48Q8MP+kzQtRKe8VY/VhcJcL
	+dtpp+jGToY3MiSsv1fjP72/MyWs2y8wtLMwY
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr45744040f8f.33.1795698227412;
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:30 +0100
Subject: [PATCH v5 2/3] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
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
Message-Id: <20261126-hwmon-da9091-v5-2-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xetf6hc9yk9GlDHpxKF8KJKG4DJ0Yfo95h
 tWd0n4aFUGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z5jED/9aBU4WlCVfXB+PsNCOFLUJZl9506vsDabSXLzTn3Xk88xdDjnN99nkstV7sEG4+ju8PJz
 MPini3NNQSOyVjivSP3C8GkSHyvHGEnoCkNobYB6hAgiahT1SRmiC/lPjhkAfV0qOXZmUQGXA2S
 rEmZZ4rISFs2lGH3AsN9WxhclXZh179ylEls45Nzjai3fI3anY9e8qsahNWoGeMOqVhjaJdazRH
 as2xOwV74dZ8Lcy8KgwrkRYB6cHLJJie+hlGVbMeNO/Nq7Dvg4RUa0L+2hf+7M2w3ouKgKXmPo9
 D1c/dRYxI6AD3bWEGoACZEOehX2PoCIhg9ZWeYx1SPSBMSmogjFpc4D7DzKuzFf9dbGDR5GmEqk
 DGhs83Tj2a1HdvoC5bveLy20PnQ4S4T9IN1tOMhRs9qT0QyT9PPi90O5JQme6wksDvg+wGVjSLU
 w31LzGeMMBKRH9IYP/guUpzgekiozJNjWqfaMpfxeDljpihvnlrXTB3f5fzaXW1AhEQzxww0tE6
 SJXLVjGPMztHBkC4m8S5L9aJrceEi9k1RwBvcl8l91ZQ2F7Q/w/IA588nxFnbqnY0Jd29jWEZDt
 y8qO3oNV54o6VzlkJFqvr8hvR6VDO7EjQHe2HT66XoLRiH936a1i05StW4U48XehgRbjFJZLLGc
 JAJAA4zcbyAsM+g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Register the raspberrypi-pmic-hwmon platform device
on BCM2712-based Raspberry Pi 5 systems,
including the BCM2712 D0 revision.

Store the registered device in the firmware state
and unregister it during driver removal
to ensure proper resource cleanup.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..a694ecc18f9c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 

-- 
2.56.1

