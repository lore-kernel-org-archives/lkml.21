Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541585;
	b=FwLTG1w2OICu6Ep/DLlJNMmaBfVcGYhExkBhL2hX/ax4X6NyxApa2Czl+NlG18rUgzQV
	 1gLuP/SBBCG1E4OKj2WVHlDsCk+dZvX+JkZZnZmSN8jdZYzrOaR5jXIViH1MKLMoDGJaW
	 4ZMgeWfj/YcoLhkc1KX3nkDakGD+Wylr8tWDyucwBS4c1GJBweiGjE2QX4Rp5HCcQHnog
	 RsSeO5tJ0aBLoAcDs9rBxvJRx2UJYHj9MuQdRCsUJ7eI+z6uaoTjnb4EjEk3PlHwAsNJO
	 Qco/ujIioij/VwDYNXRh51teevI97BpkaHG7cbkYVNoF7Ry9ELT4X0ZP8dRdhPHAjVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
	b=TSKAfFZ2pzdmrEOc4/z+NOnwAMbJADKiwC6nZ6URn6GxQ2ENMG7opXgMEHF3MFA7D2m3
	 +gZaH+Wfd7vXWcAvHk+JjU3M2qzMP7VXu9xkmGwXkOHGKtoz/Qxbvx42cSBARVZ1J1HUi
	 zAMbOCZq95Xw9Zn3QeuwR1z2T+APyfRBlf32DRTbD3Gmq3DxNR6qLROVYrvr3HAACeTiD
	 K1n+caVj3ap8VNG85owLOlg5kdkI2GtFYkljCxH4zx7VIf53e/D5RZUVWqksHmX6BmgFg
	 TNo7Yl2wg9C1eO3JCME8RMgEOfaPf9aN0pDuUNzxcdrTzQkgWSmGVKjM0gs9ZaNno9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TqSelDAY;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7570460A380A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7570460A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TqSelDAY
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so62556595e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541584; x=1796146384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
        b=TqSelDAY01AjgWVHCQiO0qyJq3dm05j1NqSpfGrgkq9xoK1o8SCXAgeAGNwi4cf9O1
         D80AavKbdD1cEMbyLmrpOvAADwwORG3wKlSmR/iI028gfH1CngOgZo8EH7fqSHoi0IjN
         gbz/tX9AROw9PK38xaf7fVXgFK1g55P/YssfZJn/1ZBYbFlStVICBbLO0e/rCVwRjNQH
         Of6V55nX5km2biF4bfDYfTlBsMVasElqhJ8zi6qiEtGFGhQRCKLgEf0C0DxgzwqgFgvf
         e2gCdcxBwhbNsrqmeI4iNRGbDG0u1FFNDFsNZB8JGx4FyjBI+xYlkjuuqiXr4JVXpXy3
         rsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541584; x=1796146384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
        b=H2Wb4G35GzMBunH6PneVvctcvX84gdkRKIPjMSLil5YnkH1mZ/F7V/9mEyoVCoWoXT
         1lO5G+MrpTlsY4tXL6XOzOByxzB6YdYsi08XYtAIDG4sgbP4mYLzD2dfUcR7Rf6XMJYx
         opnVpOTx93c8ydM1XFdxOjEt/EGCGXX4R/21QdCL1fHaP1KjKoyA/9KDo44dgX3sFE7a
         NYrPTZkLh2dZdKvXQSBM3WTiNsxrpOThbZOSYvA3eIJ15mmpx9OQu6tY5tmHZxW5/SCu
         i2grDFVtyCwZEV4Zh3heii4gIOGvzChShn1g6lT+Ox8OnI/30K8s6z3DZawLg0VBni64
         cA+g==
X-Forwarded-Encrypted: i=1; AL+hErHEg8NafjDe/iRoqBo/sxYl/5mQkUmDADDLJJndNFuBZTjhDGTo86ZdHk2CPM3wTBoUnViEqnamCWzzDJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oT2Fn1AJbJWbpLxQ+1ANxytlfgINkNWDfnHRPI8j0HBBQonqq
	AbLjHCrgEsfbfOIhPj1ki7oGFpWYOXg6VKxpo7q8w9nKrlFrj+xo7p4F+nR037dsKXM=
X-Gm-Gg: AZFdTZd5TD+aDRo/QRidkIyZsPg52hDYHIoV/p5cj4m7vVuM3F/nXTm4SNvC4HA9zvY
	lsX5OpvqcrKxqhcDJ1RGwjdfK/vV5XdNmXzzzbTx7RpksuFfWP3T9zc4VDdNKpYdzlvI866C9Nj
	FZsWNrd5UgZuNlklMj9LLj+CmE++vDgkCm9XhRvZawpubcXy6iyGfBbdOvZ7wA2e1dEnTgtXyVk
	TVYJFjYYbVIJOQwTXHu3XEot/e9kl5HNmjV4U0Wl1cIl4TvSTAZF4twyimDneuT/VX4TLxWYqtZ
	53ngbFHHRAwTzUtdLVKkku0GXeokLAhVO1BxyjULdT8Jd0ZyO5QJRju0uXxlN3c5QiopracWvF7
	Q05L3vfyZM/V+UWC2dCaTdsJJ5tdbGpQP3PZi4XnHrfOlAwMJFVt4bEXkyC6SyzysZW18NVaUYZ
	03l95pXbnQnYlZ1oou7Pw8ZOF0j+NVP6N3VI2uMsoIbRHomXJNLkEU9VVY/qp1FvGZnnIP4Wka6
	97sZay4DJV7zJQwBymgYAoaZM4uaeBScxwN9T2ID+i8q5UsLudcm1YSEzKP4PfHAGq7OBvCvLth
	c+H7xnvcqxodRb8kV4nMHU0XMO4=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr297420805e9.9.1795541583997;
        Tue, 24 Nov 2026 09:33:03 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm832341115e9.4.2026.11.24.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:03 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 3/3] pwm: rp1: Register auxiliary device for the fan tachometer
Date: Tue, 24 Nov 2026 18:36:57 +0100
Message-ID: <20261124173658.31030-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
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

On the Raspberry Pi 5, the firmware running on the RP1 Cortex-M core
measures the fan tachometer pulses and periodically writes the computed
RPM value into the phase register of PWM channel 2, inside the RP1 PWM
controller register block.

The Linux PWM framework has no abstraction to report such a value, and
the reading belongs to the hwmon subsystem. Following the auxiliary bus
model, let the PWM driver instantiate a "fan" auxiliary device
(pwm_rp1.fan.<id>) to which the hwmon driver can bind, without needing
any additional DT node.

The way the tachometer value is obtained (the register is shared with
the channel phase control) is an implementation detail of the PWM
driver, so provide rp1_pwm_read_tachometer(), exported in the 'RP1_PWM'
symbol namespace, for the auxiliary driver to use, as documented in
Documentation/driver-api/auxiliary_bus.rst.

The auxiliary device is destroyed first in .remove(), so that the hwmon
driver is unbound before the PWM controller resources are released.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS                               |  1 +
 drivers/pwm/Kconfig                       |  5 +++
 drivers/pwm/pwm-rp1.c                     | 49 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 12 ++++++
 4 files changed, 67 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c7b280a2bdb..26f8520c02ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23382,6 +23382,7 @@ L:	linux-pwm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 F:	drivers/pwm/pwm-rp1.c
+F:	include/soc/bcm2835/raspberrypi-pwm-rp1.h
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 523789e82355..7b271a16a483 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -641,9 +641,14 @@ config PWM_RASPBERRYPI_RP1
 	tristate "RP1 PWM support"
 	depends on MISC_RP1 || COMPILE_TEST
 	depends on HAS_IOMEM
+	select AUXILIARY_BUS
 	help
 	  PWM framework driver for Raspberry Pi RP1 controller.
 
+	  The driver also registers an auxiliary device that allows the
+	  companion hwmon driver (SENSORS_RP1_FAN) to report the fan speed
+	  measured by the RP1 firmware.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index 69ce0db4e9aa..f7443b9f9fa1 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -38,6 +38,7 @@
  *   channel. As a result, phase control will be ignored for now.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
@@ -49,6 +50,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -79,12 +81,16 @@ enum rp1_pwm_ctrl_mode {
 
 #define RP1_PWM_NUM_PWMS			4
 
+/* Channel whose phase register is used by the firmware to report the fan RPM */
+#define RP1_PWM_FAN_TACH_CHAN			2
+
 struct rp1_pwm {
 	void __iomem *base;
 	struct clk *clk;
 	unsigned long clk_rate;
 	bool clk_enabled;
 	spinlock_t lock; /* sync for RP1_PWM_GLB_CTRL RMW access */
+	struct auxiliary_device *fan_adev;
 };
 
 struct rp1_pwm_waveform {
@@ -286,6 +292,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+/**
+ * rp1_pwm_read_tachometer() - read the fan speed reported by the RP1 firmware
+ * @adev: the "fan" auxiliary device registered by this driver
+ * @rpm: where to store the fan speed, in RPM
+ *
+ * Meant to be called only by the driver bound to the auxiliary device
+ * created by rp1_pwm_probe(), which carries the controller private data as
+ * platform data. The auxiliary device is unregistered before the PWM
+ * controller resources are released, so that data is guaranteed to be
+ * valid for as long as the auxiliary driver is bound.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+int rp1_pwm_read_tachometer(struct auxiliary_device *adev, u32 *rpm)
+{
+	struct rp1_pwm *rp1 = dev_get_platdata(&adev->dev);
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	*rpm = readl(rp1->base + RP1_PWM_PHASE(RP1_PWM_FAN_TACH_CHAN));
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -347,8 +379,23 @@ static int rp1_pwm_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	/*
+	 * The fan tachometer is exposed to the hwmon subsystem through an
+	 * auxiliary device. The chip id is unique, so it is used to avoid
+	 * name clashes if more than one RP1 PWM controller is enabled.
+	 */
+	rp1->fan_adev = auxiliary_device_create(dev, KBUILD_MODNAME, "fan",
+						rp1, chip->id);
+	if (!rp1->fan_adev) {
+		ret = dev_err_probe(dev, -ENODEV,
+				    "Failed to register fan auxiliary device\n");
+		goto err_remove_chip;
+	}
+
 	return 0;
 
+err_remove_chip:
+	pwmchip_remove(chip);
 err_disable_clk:
 	clk_disable_unprepare(rp1->clk);
 
@@ -360,6 +407,8 @@ static void rp1_pwm_remove(struct platform_device *pdev)
 	struct pwm_chip *chip = platform_get_drvdata(pdev);
 	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
 
+	/* Unbind the fan driver before tearing down the PWM controller */
+	auxiliary_device_destroy(rp1->fan_adev);
 	pwmchip_remove(chip);
 
 	if (rp1->clk_enabled) {
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 000000000000..290a052480bc
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/types.h>
+
+struct auxiliary_device;
+
+int rp1_pwm_read_tachometer(struct auxiliary_device *adev, u32 *rpm);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.51.0

