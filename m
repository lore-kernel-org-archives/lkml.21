Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115092;
	b=DtAE+6JWhoITRQAiF9ulQaBQ2CAQsT63ppahL12T1FZxpiASEbtM0MS+RGNLBpGRnFXc
	 Y4aOXWtSftQ/U8mMf6WB8bgL6eb00D5fwCFBCc5ukDy4aaCuuU66aLXZWWbZ4dGi9Sy4p
	 np5XRYqaQQEkVpn4yaQPS36TaEUtvM5cqmpSfyEEl7YuC7XOCTNIzNQD2HnBzuWOWR1ve
	 hxhINAH31+CwVDK9zKGbKx9twN68Mrt7/NS6h72VoinPugoKml+fuM4Cn60tlqyPigKp4
	 tudp4C9lMbYmbn4QG8zrqopSs8KRm34pumEAc59RyhefX3IKUU6muILTQtjI/GPjxVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=ymAzHsCU4qyOGDbMBTCEFU/WtHJkdvWAtrPNZhgTmLm/D0ptP3/RHVHr+GeiyW/3pfCX
	 9WuVDDgtgwB2QrGHcADVZ+uEhRCJPPVqmqtb50k7qDsoVWEk2szsiuHsxjEYzVwtq6vhG
	 N2LbhCVoz4YCteIaBKKa84fQ3dW6hhcc2BBHghD8kcFcaJacTiQynh4vp8+JYb06jDlrJ
	 CU3C1Cit5/zpzxUxGTkyK4iPCrOwPt5AD/5cU2wuEZHlCP7XQDc5SX2QBPkj/evQZ4xaU
	 d2ao/4OgrZBaTOjoIIjbwNKY5XpW4ffzujX9kSRfJ3FFW1pxC1p/InTx/8OLPm+iElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDcgawAM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6A60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA6A60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDcgawAM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso506095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115088; x=1795719888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=tDcgawAM81feFVf4ZkuBppMquyf88Zs67t1lVp9wL2A+gFtc1LnNYr1QR5JTORZb72
         jgSyxoBZUqutM2zUH8ieWTMWXMAQj+0I09eYJ8I3nAKoUHPibF1rS9gAG8KOcQCrp1hz
         sqBGyTKxiUacbyZvGaeFnGYBkFTvrGd8hblMsEkjwIRJ331ZgF7/1zjc1iBjMaoQWVS/
         9wIzaA7GNZcmNw+mQd99xbchLxJlJBPkitduNqKoRqKuOzSJfyDgNT5KxZtajVcOLkqv
         B9Tevl/fOJ4C4QnPAM/FvRYRth/uRFhRSCDjheABTGdiFfWYxau7BAh3YYJ4V9L88MuN
         wQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115088; x=1795719888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=xW4A6w6m12eML98vCaKBM1QhD0lCAbPypxtKzsE+Ju3HuyLjpx83epePoVtflgSZzT
         52Rs5NHGpHxL9xmAwZ+Q52sguCP71o2GpDi/6754pskYQrLka5hNe/1uhHMPdJfJL9RH
         9e56uQ+7ePKRFog7irDvmPdmi3isKq1ezRCiDj/TA1ltJ8TU79bbSVemnzVwExUKCN4x
         G5jWXtD1uWqKKXXOjos34h3RjTHBKitZn51GvB0x+JP47yzdhs18HAbTign5Xx9Kt0Rk
         c/oZ4Y50mdydfu39Yj29u0QspLduyDgfm+Oupi/UJfs3t3NJGNsZiT0S4xNDAsMhL8+a
         8GMw==
X-Gm-Message-State: APuU4Z8Knq0RRTiLpJmSxTzRZxdq3gaaD0BAw0wf+yoWFlisPxdEVzFb
	ELBs4XgzezjPIvCPR5eFdOpQXcUJHvLJ92H8VGAqkl9JyyEeAzZZynZ9
X-Gm-Gg: AYBFou32W2mWvY+bpKM8tBUKNiiLFI57SDbU62Te1P7UNwk0rWRXf/XQXzFkAgxnime
	Y+1Kqz09dymaDyL9kQ2c+XdvHawMf8J2f8E2EKtu215AAduODYlOvyWs6lIeXuK+63pdB1AE/Xh
	pFsGG/ttElB6isywCQl2ycajEOAg/vY5e1Gjy6dI48DnE6s8PrvkeSEpshqMp4oAOKUG4ia9he4
	vpRWwKOAAVyHsqS5Zy22OpjI3e6VWDGl2IcPhkoAgTwjcnc5aLKM+pth1ujddA1o1mD0dNwcRGP
	TBUTx959L9gIBL9uefQkTb/OFA3xPnHS4uTrcBJJnnDRs+ZYmHIvMNM1KvI9iZWgftaFbAL9sa/
	tHoHJztZJLxlh4/lvOWSahC/SoalPdQY9yoqxCV4r00wXq/1MS04uYlVVCYFI7ipO59vDh5hOKv
	sgziMSly3MOrVKpMvBzGyS+L+KYdJ0HquyzcBn5INkxx+xHNhwn/Jzafnfg+kRiB8RbUCbydqtY
	qgo9KLRQWeiBbhtLm/tWlBxD69ef59+pcPdiiYXHZkjC6FT/nNp9TWen4rq89aQ6+RxiDu6lJiD
	zNRjrXawJEZFfflVKmdeQ6EBBr8XrlgMDKC6ENZnFCV1OozcY5PWLMA8Jsnkm76qmxaDb9QgbH4
	r+77VGNOk8A0Qv8tc
X-Received: by 2002:a05:600c:4753:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4bb8880c73emr10830495e9.21.1795115088520;
        Thu, 19 Nov 2026 11:04:48 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm19124775e9.7.2026.11.19.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:48 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:02:24 +0100
Subject: [PATCH v2 2/2] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261119-hwmon-da9091-v2-2-d6c624272a9e@gmail.com>
References: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
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
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/0hNFIRxvZnpewtzaaGCmAxJlbTZ6ygiQm+SX
 WvHc3zLIs+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9ITQAKCRB4zXhFDAXI
 Z8CxD/9zPkW9kooLjhMMGYwX7WilKkmvysEL+aq8pfEOAhKuRFVnSBxa+QC7SjCaQCs961fQb3Z
 Znuf37UxAT5ksO6Rsoh64QiWTiwL0f1eapWtUhRDVwLQo73vyvLeuV7FiIQahf/krRPcGSPOVE3
 wehAFpieJouLoKHHJHMIwORsCsMOH7624mc1BTx13GzNjw7CUzyKkIOMr4e/mfMJva8B+x9FdU0
 x4K5KWVIhNsH+DjKsdF9YDTDWJxA3AuCJ8gnNfjCCb16CD1XkCArt1EUkuBZsOjNgB4zI3jEKqw
 wgovByXjbUnePgIHHmb/K4GH6e+E6xrRmZhOu6XqnJOvY6lR/1K8JIN0x7KSLhXOfhSRcxknyk2
 JdaaSTl6ByUw5Gc9YeuoHA7c2Rve5RhBXaciU7lrLKr6tuBtF6FTgpZyFmidH3lJ6Mhyi0/88tP
 Ewf7vYpdK9s9z9jGfXtpvvoHDk0tZNqKl3Y7d6FTyFCvnDLRqZiNV4R382NIinhx5/DUkvxdAoi
 adRIjvRCoRm9xwkGeQhA8iaXrVsv2fFiyuSsNtXSj+huwhzCzVpl7AL8hrXG3anUuenoXqU1NAF
 RVPKMZz2spn8g1UzWS/PZ/DuQBV6v6UNQqu7CT9k7V6j92yE2VNua1SXcgmuv2gmjZRLCeCfMQu
 IQoaWdvM6rc3PnA==
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

