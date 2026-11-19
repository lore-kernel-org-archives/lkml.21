Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117312;
	b=mAbh1zqlz54w1WiSbJwMYhVSEN5ww3BofzqmHk5sD9QvfQNMT2fvZAjGoyNtQcuq2TPb
	 YCc5CDFHyqfsYd8CKHK3QbmKIBxfOoyOKAaYHRYdCmP5ckd+aLr7+MN5fgs+c09W/an8S
	 FmZRHvd4oPvZdKbMRbP7fEJKePgdkbzvo+B/is3aqpd74TOE6liGx+SgrUmYphTDoY7OQ
	 hTLeprY8gqv9D7zbaOaskDA1RQFKWcUB25jRNF7LGvplB+UNf9zaYroL1LACbEryL5M8j
	 X4DYCJ/kX0H+/GOSCoO+nPU1ZXLPY24VkJrnY+kaBFd0weU0wroXKvjye91uGfzzYhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=fJcYwideTIbm4onEJvh302UqflLU8onuYQ3tNnukX36TVI4RGC404U9cJnfkfO8Xk4j4
	 v+C1t+FIyt+56tq4EeuDq5wyoGxXVeaA6NBiNooisNuOQer1S6GoPqKlV4rp2mglDI87Q
	 MYTBwMhN7U8vzqKKeueBLjnZSQ1T/VTQIkpf6e+tHIZFv+d8+MOkUFYncZkraOX2WkUR+
	 WwHFDpHh6lS2ecBXqlUKZCL+dF6BZv/TP4DD2Nh6mns32zt6fZjfbQFViFwD5rt0H10ZG
	 0INo1HtGdLzN9smKUlDjTpJPCOSZvThVa96vYe8kNn9dmfb0yvQwsbTJ/GdcmCFWA5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pggkvc43;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CA606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965CA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pggkvc43
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so65779f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117310; x=1795722110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=Pggkvc43bdzFxBdBLrMha7tax1IJw4WFhDv8r0c2/fSngg5OX8dXy6DEu1LNip3Mm9
         O+izM5BTYiR0AzgXkE+3awXmyVbTCw1sjE+YBsrqs2SPPwsdQi6RJVHtcnQdddl5UH8h
         E4YLX1BLrt/QNfK4yGvBWucm8SaueRx6/dGUnnEJhQZHudqKA0j05EWDgcwR+dIJPXhH
         1eCmhXHCPSxIiYibany++bRdE4Vn846DoxCzaf5JjUrp93hBAVA9h/IeHOcgz4Yg58t7
         oJiJ5b7PvGg41avCu+yP2KmXjlFqmmCJiX7py/PNAArqDI26mgMFEAoyO4bssiADKP8c
         UQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117310; x=1795722110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=fic0Xz5MRfyy6dpGCgRSG4ypS4P26N5hs8H+4tlB6I4nYMgrhVMKIDJYNS3atZNcAJ
         NzKsWt320R3Aug+0XJbx9Cv6qPpkEtsCh+zQVsNZ8Hve2P7CRFd20qPzUc4RhfFgZFXr
         0lBwYykI23Men549FjyYymNUHPKyaqEf38GMKZJ4MNXVqv6IBP5966sINYeWTrvhtXcb
         itholnpiUtV3yUvrCOKKPVkH1g4aovjd8h9HFbStL0Zf3l2aNghrp4OHDW5Z1eJxRQkV
         LRhY5cNHhN0d+znEScqXlRXpPX6PXF++rUgWzRA9YhN5vf4YqnMRDGzwVOZS75h2lyV8
         dCjg==
X-Gm-Message-State: APuU4Z+bSAEVcoD+/UsWSMGQlKijWfAuAGxj3sCASMscwttU+pQ5sPB2
	Yc2zmgaIgVPDH7K7UuIG6M8DI9Jo6+O/bLtWGEdpJMXQW6OhASUsr2dM
X-Gm-Gg: AZFdTZe97sDD/Jn5ZWiT/X3RYCLQyv8jGTRYyqP5frSoTxS+o0qF60sEm0Ee39D6D+Z
	GWw/mzPI9P+6rT72+5ba49UFeF6qWrC6jUWGGJSsNxGUNWLF7SoKMxLfRD0uRpCJvhe/N5UT5o0
	Y5qSCHtQVR9z7pCh0+hv3FT9smUqjqpyEV34KhFRIY1stADQHqp+Qy/Bgsoy58W2vnA6h6lQ30v
	ojSzPFvplCI7GmgEGAn+PwlAblJ3QKmovYXG9LzthtOlCLMV90A32nmV7K8LcnFlNHMndhN56RR
	Tt7Ccp9ScpK1xaZf8NvTISDpcjAvYgUVKpycGTQvCsXasDq22cpFRptzm4ibfaMzVChAJ0l+vX8
	+MdHybQP17AF1oYtKVZYAQtiTzCRu75MuJpgxAF6oyHP/LcreFHl0smdiLBn8gSUMlE2SbQMFPV
	indRdjtJiMSX1ouZaBiLqkozTTOjkuM/uhlLAunDbt9lhX46ueyLMDpTDpQSjAHisll16Rwk7+Y
	30INlVqRDqXfToC2Vve1n7mxFJ7WNwlRqKb4Ksfb1eWMoDtuh8vH84P0hTC2bbArWkt/hpqqD9m
	V9wtcs4fVI4ElKxq23k1REPKVp8GJv1qaGB1d11xxgUNPfg/kTZp5Z0E7MM3whRrTDabOPP1WGQ
	v6dyGZzzLyZ/GiL4=
X-Received: by 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr623352f8f.47.1795117310023;
        Thu, 19 Nov 2026 11:41:50 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:49 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:41:47 +0100
Subject: [PATCH v3 2/2] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261119-hwmon-da9091-v3-2-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D8hT49gcrO0owQ6GAVVxBPc9dALdWiwmeBh
 7wzQUpOUs2JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q/AAKCRB4zXhFDAXI
 Z3F1D/41fT/30zUKBoREaKGpQ6CcwTaTKbaai06qAahviHvMfc1xgx7/Vvi8BZnNW46KjEDjbKJ
 XpK7WKd3to5oCMOOpSotgCU7nSghiSXrsb7res+QxchabwX9sLdnrMU/HqQO/EXcBgaHw6Vf47u
 Ehz/jcyxmiyws6JcpkJ7eiyZvmKtYCzlK22MJ2lBFnEXcC6xEtbyNUOUs2ZcoM/RTjdVNSI62Tn
 UhQ7H9dJZ8O7lBIahrri0MMvoG4RgO0weyHV6CZzsV3+ZvJ+2xSlCq8p+K9R5WMJN05iN/5Pb/w
 EDOEDc/L0zVKbo9/aOMykkBkEngHrnWOxk/V9rcETZ/ijDSdEo7GlOqXzsvV1bBaz1uqkf9shmY
 R+clSeni1rzCcaYATDChIVTeQ0Z8OvsGkSR25Wz4+xW+asFR8gy5pNY+f50vuh6ITQZHSiJ0sQ8
 5bGCFBkfuwBupgwc+ImE2VynI1rvcNcjjrPP5xk5IjRjjSlrcrtl5Y6mX1vm5h8KJO3TysUCRUK
 H5FN971m85rU6Jras20aTRL+OR2gv9mPNee17i8wYIJM2Y3I/BFstsNV/BckMA0yyn/qBKUobjc
 5FUEpfG5R9a6/+wFLeY3vbG9D/ZDWmgWi7gNj2z+87Fv1qObomrOVZq7scAcC8X+6DB5iMtBLfE
 9rMSTdBO3nht9MA==
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

