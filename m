Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999010;
	b=kR/+GQMaFUBHwBB0yTJSg9OqiPcdzV8lMQf4V54zmC6L9tR4kN9f8J6drS6zYuKABI2Q
	 mJ6k0fNgoTTtY/qmJo+JRqM4C0r6AyNDg/DZmiObratFNcTTf0NpyzcEjBFiOzZzVs387
	 9E67T880lbLj3s4C58f3thMHWh1NjQJaDllQIBBp5cvsNXiKFUOkVJXQw1HmZgX49jju5
	 p1v4Aiw1q++s8c/B2yV86dQDvhM193bb0d8M2CeZaHIfqBgc/BDDQHPJ5RcaKHcUJJYDx
	 +NKI/o2qVIP2jOZvBvioS50qSWUrGO7WHrgauhixuFhtZLVCUxX8VL7lu58cJ7qrunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
	b=m+Cq6dodK21FfjFuh9bLQqiCSEa6UaN+CsLklk70OHMXwyK908QZvUad3DTbwxkzSp7g
	 ZSKa5xuKoii+G5N4EzWoa24BzsKSv6KIt4I5YoQ2KUyfs4MkgzyytoHjAvVvo6nIyYPUb
	 mD4TU2uhcseAHtm3EBr/f4GwNgG9iwxiyt1RJMHRB5G6EhsessjB4BUmJo8XDCu//z2m5
	 SkNk+t0Zkk/R9RoEovBwJk6Lb5hVR3P4kh5D8raYPhU5stNFCJwWnO0Pci8L6acmlrbHS
	 v2k+9oV/gQEE68Q64M8Dq1DtH8H/CaD+z1y445j602CYImw6+CjittnPtIZWp6AxsLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjYIpOgJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB42B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjYIpOgJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38318d69173so199640eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999009; x=1795603809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
        b=VjYIpOgJ5WkRQHK1x1tOlm+PipZQNIeO7ws2Qxf+gGLE8nsTRg+6cwQvBAcEdJ6FuP
         W9o86ptdUA9vgM5aIGJtsZzKoV2TD4kciDHci39IlVR6UgSf8aVWFRSk1UlZr87w7fxk
         Nwf7Oq0Mulw5hKiuT+StH12IqeiTwEesX6AyzGtpvlCMoEa7VJxtoz3as+DabHUDkZFR
         ESkND7xTxQQk+YPUD6fs6k4Deq46VD+ncjZ84psj8ZWjQlU7MIZTxRH/1QBOhcKrk7dX
         3e8DWMMcyLM07Z3F8orjVGQX2++0QDlVKZjJ5X71xOqXKfIOMlIIMq2ecweTLjERQ8TI
         E9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999009; x=1795603809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcrm3vnLSGimQb5rCI5RJTtZbp3UKYK7ig1rjNTiXnM=;
        b=1KOa283j0VjVKaECg9AocnLFg7wR/aaPqsV3DtVbJ+evqK6AuesjKgj9fzwlLZVpr9
         q0VxDzji0IX1Lwsu8egQWM/SpBXmilHFP7VwXS5s0rQaLVl8y8xZu5/h3iPuPczFlMNv
         04mr+GyYxaWkgPiKC0z2X4gGgj/BwZ7LiglLkpVRw6zNaxVV0Eo+EG/TDfcCJfRuKJAo
         be9Je2YWon8hcPsDEuJB+YMErbwn9T7sPtvVdpnduinwqRGX0PcC8MhNR6huOX8IJxRX
         jLdJhIjP5cL6NKQePNzCGALwIEtW/tMjwJcVCXDkqitHXFe1JFWi6hdGWCDZKR4z4IyL
         ehAw==
X-Forwarded-Encrypted: i=1; AL+hErEd73N9IqxzHSaBFcA0WN3XRY4z0ueZefwKHfQYmyE+/72ZKEIMUydQePyjn2Tm9PblOZ3SLtwDjX8yWms=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pcZUYLNgUtS/shwpNkpPB9A/qEnpRwUHPf8XBGaXC8vlKCX7g
	XfJV+m8idKa1dXWlBCNh21J+yZxty1I6LjaHGL+SY7sSK+1XnRzWU3gg
X-Gm-Gg: AZFdTZdCQnMkzR+x7iL9u9XK0j2cELGKtmLbSaUfGY5izNeWGgr2xFjxusC/EzYLgYl
	3np2QUeUGxGH5USOERkr0xKmrO1VyJavke2J1SJngmd5zlj0JTAeDqkpliBIfIyT/g/fnaJCAbf
	281Ea8LMqvA0v1NqYO1R4sqxhbkV6O+PG25ARqAYYRkCz4Dl+pWlJPTlYMcevXlBqp9icKC4kOH
	+OwjLiT9vAJKMqEEP49W0NRWhLrydLviCMkGiB4ZDvUayU9ixcwxfeHHjfbiNTFJMDdFqz11NLE
	ig9OsU+FZYRKI2PsskPAmYJTRkm+Pl8UzKff4AABd2MmDCNJ86V/f3C/gk0a9onHbrIHtMhHpIA
	H74KW54txi5ofcryvtUgc1gm6BxA9gferA5E/RrseZxxhBgfyk1ov8xMjMjS67TqJdPA+cD0xTF
	/LUgCNgSEcz74MMbHtBE9YuXDZ/Gu8Q2Qi8IWHTMnK7uhDv3SbSbObH3vVIwRkQjmoekORYKw6K
	PK1kVDkicPJjwWa2l5D+fK3rCDndhax4Zk5+Erz1ZUoQiijpYPhqwWhwBYUFlC20y2wXxExLsdx
	O5M4Ui1sUqzukJGT+IxRZJXobJKIyR3m
X-Received: by 2002:a05:693c:2113:b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3828026960bmr2342283eec.11.1794999008833;
        Wed, 18 Nov 2026 02:50:08 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:50:08 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
Date: Wed, 18 Nov 2026 16:19:15 +0530
Message-ID: <20261118104935.1716-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118104935.1716-1-linux.amoon@gmail.com>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
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

The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
request system shutdown and restart through the PMIC.

The system-off handlers run in atomic context, where regmap operations
may sleep. This can trigger invalid wait context and
scheduling-while-atomic warnings during shutdown or restart.

On SpacemiT K1 platforms, system poweroff and restart are handled by
OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
reboot driver duplicates this firmware functionality and is no longer
needed.

Remove the driver along with its Kconfig and Makefile entries.
The P1 MFD driver and its other functionality remain unaffected.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch
---
 drivers/power/reset/Kconfig              |  9 ---
 drivers/power/reset/Makefile             |  1 -
 drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
 3 files changed, 97 deletions(-)
 delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..9e997d58fcc6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -295,15 +295,6 @@ config POWER_RESET_KEYSTONE
 	help
 	  Reboot support for the KEYSTONE SoCs.
 
-config POWER_RESET_SPACEMIT_P1
-	tristate "SpacemiT P1 poweroff and reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on MFD_SPACEMIT_P1
-	default MFD_SPACEMIT_P1
-	help
-	  This driver supports power-off and reset operations for the SpacemiT
-	  P1 PMIC.
-
 config POWER_RESET_SYSCON
 	bool "Generic SYSCON regmap reset driver"
 	depends on OF
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..2d5bdd1584cc 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
 obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
 obj-$(CONFIG_POWER_RESET_REGULATOR) += regulator-poweroff.o
 obj-$(CONFIG_POWER_RESET_RESTART) += restart-poweroff.o
-obj-$(CONFIG_POWER_RESET_SPACEMIT_P1) += spacemit-p1-reboot.o
 obj-$(CONFIG_POWER_RESET_ST) += st-poweroff.o
 obj-$(CONFIG_POWER_RESET_TH1520_AON) += th1520-aon-reboot.o
 obj-$(CONFIG_POWER_RESET_TORADEX_EC) += tdx-ec-poweroff.o
diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
deleted file mode 100644
index c0454b547718..000000000000
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ /dev/null
@@ -1,87 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2025 by Aurelien Jarno
- */
-
-#include <linux/bits.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/reboot.h>
-
-/* Power Control Register 2 */
-#define PWR_CTRL2		0x7e
-#define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
-#define PWR_CTRL2_RST		BIT(1)	/* Reset request */
-
-static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
-{
-	struct regmap *regmap = data->cb_data;
-	int ret;
-
-	/* Put the PMIC into shutdown state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
-	if (ret) {
-		dev_err(data->dev, "shutdown failed: %d\n", ret);
-		return notifier_from_errno(ret);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static int spacemit_p1_restart_handler(struct sys_off_data *data)
-{
-	struct regmap *regmap = data->cb_data;
-	int ret;
-
-	/* Put the PMIC into reset state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
-	if (ret) {
-		dev_err(data->dev, "restart failed: %d\n", ret);
-		return notifier_from_errno(ret);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static int spacemit_p1_reboot_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	int ret;
-
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
-		return -ENODEV;
-
-	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
-					      regmap);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register power off handler\n");
-
-	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
-					    regmap);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register restart handler\n");
-
-	return 0;
-}
-
-static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
-	{ .name = "spacemit-p1-reboot" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
-
-static struct platform_driver spacemit_p1_reboot_driver = {
-	.driver = {
-		.name = "spacemit-p1-reboot",
-	},
-	.probe = spacemit_p1_reboot_probe,
-	.id_table = spacemit_p1_reboot_id_table,
-};
-module_platform_driver(spacemit_p1_reboot_driver);
-
-MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
-MODULE_LICENSE("GPL");
-- 
2.56.0

