Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554382;
	b=CUkeEz0v1q1ppUzD5YuyFlTIrAX5IgLBWvZ44urghU9955ano8gXJ69qcWVSqwZD+e1w
	 H90q3kYedHB5DCnOcHX0UW4CW4Ju0LdvYY5e7EZ26gDftFeYXkvBp38Ebk9gOpjQMK65Z
	 XaMB77dv9Cwt39ceCuA35rDphOkGHt0xjQpcpbQxT6KLCPsJF7QPknWDRrfWorQv+ENTf
	 QEQvTCjOeloDzwAN0vbpMyJ2qpwUbHwHYuZGPHy4g3nWE+7xWHtvqqHeF3E5WhVMdCE1w
	 Qcyw5mqjyHsV6gySwM2kkU+YlNQSUd1brCmi53g55FkcKTpq2zeJSYtCg7Wur1TGFMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/ZzDhJ2gcHhV54lhNv8s8yqVbnpcWVy/OFQkbMVXpq0=;
	b=SzkHDffzSuVrqceDaSMWl1sX+E/Hntj42e5PtywUDkg/WeCJhlHtqZ6HsdfoYBZd5dhZ
	 RAyKTv7C6QsqcKdU9VBlPpKXCfVhsy5nnC6vIIgHkolmKxDpiipy2xHw5pW9KK+2CZ5Jb
	 SfV5QIy81t9U5PjxVdujLcwtaVKyVuE62bu1BTjDKLl6VzllnpOxbxz+xmRCyk2NdkXpJ
	 b96wivU6D6iTFQ1pJZXu203t1ajqIq/OFbXAPP+rLW6H6ikeHut42gTviJI5c8yaB/cm3
	 v/q3a9KOYi4o6D2kPc6Ij2CC9XAtMzGM2C+7+Ey27+WI9zIEVhTMnY1aYPJEMjeEyoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7tMNrI4;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA8606A684
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EA8606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7tMNrI4
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso44072241fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554380; x=1796159180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZzDhJ2gcHhV54lhNv8s8yqVbnpcWVy/OFQkbMVXpq0=;
        b=x7tMNrI4u1htM/38wiPKagvLRKehGjmUIvkofJAAFp+a2Qqhi/omWSJPbaDuD4JoEp
         6EAi6krocYy8B9yJNQdihwNjBJkmwQBZLSLM206z+c2xUaCsYJgJfEuiaowzFW/YdDqv
         5IEA86KCeTxtqbKRLzCfLKDUkm0kX13Hl09C0RpeE2yL/SbsunS8kkR/+zqNpSrh0jmw
         Hr+ozqYqlgbP6fmdBI/QeT/6U6iT8cIchibEUzl219QCgUbv3DfUrC0pxMVQjJe8jxJC
         IQssK/F/oLddCz5aLorD9xnYJ9e3/IxVpz5ZlxfY/tx6bep5/s8QGlldvy7OnwTFy/Hw
         UimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554380; x=1796159180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZzDhJ2gcHhV54lhNv8s8yqVbnpcWVy/OFQkbMVXpq0=;
        b=y0o6lr1bVQnkwcE+tXSM0aZ/Dt8R3NjwK8yqCmS7U2frbgDWA9wehKbV+KGe+4OgKs
         gj4bKdCqxhCgQaDhP9cwPrVBpbnsWt0W5gmHFgxPdW8UoABAl0vMx+vn5ZZ0uwKpHAo4
         6AqlSbcaRwLHS2kp+sGefuAu1KzCVvFz2xJpVMtSKHlFAQaRvOqSHY758ToQIHAT8dG9
         4GgFRwOzYDq6H7X/uX7HPu5MzABJfBg7wY/5CNaST7j6z1H5+YcNFd69i/Cd7PDPK3LF
         H24nXqDxJ+mNEHjKJPZTggsX1kiOaus5X2HYa/WQ4jd4Z6pObt/RENWgJS7yfV0RjY9h
         oqvg==
X-Gm-Message-State: APuU4Z93Zb27ddoqiRZn63bZ2siTKwsTyoGHTXovSkYwE1JbEnr6Z9g1
	Ed5g1rGo4k9akmdDd0VDb3gnObAlcW/UtS9Gj3JCo7KsHkv21Ac8GJy0
X-Gm-Gg: AZFdTZchs5DmEOhkwwcttBUKr+qGQhHa9cL7XcWwijpdD2lzf/nFEQcxcwbLVxRsUSh
	8Voexj5h5JgPboh3ReKFXBtoCPZJGg0iVyjtmM8/1ptocvsa7HDh9MofO/mjPK8uMd5J9hULt4f
	GKnPZ6aI/mjpGQLVHx4oOgBW4RbDMBpY0s7mw38dQP8jw1j2JrGUlfQRJ5Y8gL8tzBQm7HtuH8I
	aKUvr8ROyLKxtC7f5Fk2e7OLIEq50qr/4wp5uxmhcZfzEgsg0D8S7salIGvnST/QiEuseeFg7+z
	tIlzx8WZW2rKnHQCCkJFlZfjjJkz9xgHAXL4TjVfiBmtliYFg+jjC1xqU55uwiFmmDZZSeQF4fh
	qaU9WAigfrfqByz0NjMXV1bVjNf7pUNJB0WRBDtnF5U2uGlqGSsQ6aD2o0phWOQmKtdYoXQotgq
	nw5ZbCRoqxp5fTOj+YW77J8v8Aqm8Ff5E4NnrR7x0dkUy6AliqFVuGTE1ssfRrECzecVLBHeJfw
	e1j1CXdLlGNXPIsrO/Dnwr5gkrohn68H+tEUoNj6nUuuHkAEyUFVwoCSLHbo0Fk3EN/5qpyyqz0
	EJ58ePxDRCTIMo9wHIZkS3kkfOZiiBvtxwYNQeSW
X-Received: by 2002:a05:6512:3a8c:b0:5c1:4e4c:359c with SMTP id 2adb3069b0e04-5c1bc807476mr4726295e87.36.1795554380234;
        Tue, 24 Nov 2026 13:06:20 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:19 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:01 +0100
Subject: [PATCH v2 3/6] watchdog: Add Tegra20 watchdog driver
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
Message-Id: <20261124-t20-for-upstream-v2-3-440116846f97@gmail.com>
References: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
In-Reply-To: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11835;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=Z8/WCBTxE9lG7Z7ZE2bJmZazeBqpHNHOFkjpaEdhcH8=;
 b=kA0DAAoWODJDi+1lBDcByyZiAGsF/ELIZOf+zwRT3rxK+NwErJPoB7kr090e+RXNX5RyKHTps
 Yh1BAAWCgAdFiEENuES9AyeSu+w6bWJODJDi+1lBDcFAmsF/EIACgkQODJDi+1lBDdL2gD+PgK6
 0uQ7BXHWVi8vyxXpg2ScS1uYyP+mcwBJ3//9U3gA/2gz5AM/gMu5YbZ7I6o8fCmAssy4oRWiR+G
 cD0ndZJsA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Tegra20 has no watchdog block. Instead, the clock and reset controller
can reset the system when the interrupt of TIMER1 or TIMER2 fires while
the previous one is still pending, enabled through the WDT bits of its
RST_SOURCE register. This relies on the timer driver leaving TIMER1-2
to the watchdog on Tegra20.

As this has little in common with the watchdog block of Tegra30 and
later, add it as a separate driver rather than extending tegra_wdt.

Use TIMER1 for it, running periodically with half of the timeout as its
period. Clearing the interrupt alone doesn't restart the period, which
would leave between half and all of the timeout after a ping, so a ping
also rewrites the timer setting, read back from the timer, to restart
it. The timer has no readable interrupt status, so the time left can't
be reported.

RST_SOURCE belongs to the clock and reset controller, so use the helpers
its driver exports to enable and disable the reset, rather than mapping
its registers.

A bootloader may leave the watchdog running. Take it over with the
driver's timeout and let the watchdog core ping it until user space
opens the device. Since it then runs without user space having started
it, stop it for suspend and restart it on resume whenever it runs.

A watchdog reset leaves the PMC alone, and the boot ROM hangs if the VDE
power partition is off at that point. A following patch stops the
watchdog before the partition is powered off.

Tegra30 lists "nvidia,tegra20-timer" as a fallback compatible string,
but is handled by tegra_wdt, so don't probe on it.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst |   9 +
 drivers/watchdog/Kconfig                       |  11 +
 drivers/watchdog/Makefile                      |   1 +
 drivers/watchdog/tegra20_wdt.c                 | 267 +++++++++++++++++++++++++
 4 files changed, 288 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 348229ffcb43f..8f454c82521a8 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -603,6 +603,15 @@ tegra_wdt:
 
 -------------------------------------------------
 
+tegra20_wdt:
+    heartbeat:
+	Watchdog heartbeats in seconds. (default = 120)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
 ts72xx_wdt:
     timeout:
 	Watchdog timeout in seconds. (1 <= timeout <= 8, default=8)
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef1..9255438a40462 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -920,6 +920,17 @@ config TEGRA_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called tegra_wdt.
 
+config TEGRA20_WATCHDOG
+	tristate "Tegra20 watchdog"
+	depends on (ARCH_TEGRA_2x_SOC || COMPILE_TEST) && HAS_IOMEM && OF
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer
+	  embedded in NVIDIA Tegra20 SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called tegra20_wdt.
+
 config QCOM_WDT
 	tristate "Qualcomm watchdog"
 	depends on HAS_IOMEM
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 9ac406677aba5..aec4d478f8736 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_ST_LPC_WATCHDOG) += st_lpc_wdt.o
 obj-$(CONFIG_QCOM_WDT) += qcom-wdt.o
 obj-$(CONFIG_BCM_KONA_WDT) += bcm_kona_wdt.o
 obj-$(CONFIG_TEGRA_WATCHDOG) += tegra_wdt.o
+obj-$(CONFIG_TEGRA20_WATCHDOG) += tegra20_wdt.o
 obj-$(CONFIG_MESON_GXBB_WATCHDOG) += meson_gxbb_wdt.o
 obj-$(CONFIG_MESON_WATCHDOG) += meson_wdt.o
 obj-$(CONFIG_MEDIATEK_WATCHDOG) += mtk_wdt.o
diff --git a/drivers/watchdog/tegra20_wdt.c b/drivers/watchdog/tegra20_wdt.c
new file mode 100644
index 0000000000000..aa90d538f92f3
--- /dev/null
+++ b/drivers/watchdog/tegra20_wdt.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2026, Artur Kowalski. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk/tegra.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/stringify.h>
+#include <linux/watchdog.h>
+
+/* Timer registers */
+#define TIMER_PTV			0x0
+#define TIMER_EN			BIT(31)
+#define TIMER_PERIODIC			BIT(30)
+#define TIMER_PTV_MAX			GENMASK(28, 0)
+#define TIMER_PCR			0x4
+#define TIMER_PCR_INTR_CLR		BIT(30)
+
+/*
+ * Tegra20 has no watchdog block. Instead, the clock and reset controller can
+ * reset the system when the interrupt of timer 1 or 2 fires while the previous
+ * one is still pending. The clock driver controls this reset, and this driver
+ * uses timer 1.
+ */
+
+/* minimum and maximum watchdog trigger timeout, in seconds */
+#define MIN_WDT_TIMEOUT			1
+/*
+ * The reset occurs on the second expiry of the timer, so its period is half
+ * of the timeout. The timer has a fixed 1 MHz clock and counts PTV + 1 ticks.
+ */
+#define MAX_WDT_TIMEOUT		((TIMER_PTV_MAX + 1ull) * 2 / USEC_PER_SEC)
+
+struct tegra20_wdt {
+	struct watchdog_device	wdd;
+	void __iomem		*tmr_regs;
+};
+
+#define WDT_HEARTBEAT 120
+static int heartbeat = WDT_HEARTBEAT;
+module_param(heartbeat, int, 0);
+MODULE_PARM_DESC(heartbeat,
+	"Watchdog heartbeats in seconds. (default = "
+	__stringify(WDT_HEARTBEAT) ")");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+	"Watchdog cannot be stopped once started (default="
+	__stringify(WATCHDOG_NOWAYOUT) ")");
+
+static int tegra20_wdt_start(struct watchdog_device *wdd)
+{
+	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+	u32 period = wdd->timeout * USEC_PER_SEC / 2;
+
+	writel(TIMER_EN | TIMER_PERIODIC | (period - 1),
+	       wdt->tmr_regs + TIMER_PTV);
+
+	/*
+	 * Clear an interrupt left pending by an earlier use of the timer,
+	 * which would otherwise reset the system on the first expiry.
+	 */
+	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+
+	return tegra20_clk_watchdog_enable(true);
+}
+
+static int tegra20_wdt_stop(struct watchdog_device *wdd)
+{
+	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	ret = tegra20_clk_watchdog_enable(false);
+
+	/* stopping the timer stops the watchdog even if the above failed */
+	writel(0, wdt->tmr_regs + TIMER_PTV);
+	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+
+	return ret;
+}
+
+static int tegra20_wdt_ping(struct watchdog_device *wdd)
+{
+	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	/*
+	 * Clearing the interrupt alone doesn't restart the timer's period, so
+	 * the reset could follow as soon as half the timeout after the ping.
+	 * Rewriting the timer setting restarts the period. The interrupt is
+	 * cleared afterwards, so one fired in between doesn't count.
+	 */
+	writel(readl(wdt->tmr_regs + TIMER_PTV), wdt->tmr_regs + TIMER_PTV);
+	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+
+	return 0;
+}
+
+static int tegra20_wdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	wdd->timeout = timeout;
+
+	/* starting again reprograms the running watchdog */
+	if (watchdog_active(wdd))
+		return tegra20_wdt_start(wdd);
+
+	return 0;
+}
+
+static const struct watchdog_info tegra20_wdt_info = {
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_KEEPALIVEPING,
+	.firmware_version = 0,
+	.identity	= "Tegra20 Watchdog",
+};
+
+static const struct watchdog_ops tegra20_wdt_ops = {
+	.owner =	THIS_MODULE,
+	.start =	tegra20_wdt_start,
+	.stop =		tegra20_wdt_stop,
+	.ping =		tegra20_wdt_ping,
+	.set_timeout =	tegra20_wdt_set_timeout,
+};
+
+static int tegra20_wdt_init(struct platform_device *pdev,
+			    struct tegra20_wdt *wdt,
+			    void __iomem *regs)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	wdt->tmr_regs = regs;
+
+	/*
+	 * The bootloader may leave the watchdog running. Take it over with
+	 * our own timeout and timer 1, and let the core ping it until user
+	 * space opens the device.
+	 */
+	if (tegra20_clk_watchdog_is_enabled()) {
+		dev_info(dev, "watchdog left running by the bootloader, taking it over (timeout %u sec)\n",
+			 wdt->wdd.timeout);
+		ret = tegra20_wdt_start(&wdt->wdd);
+		if (ret)
+			return ret;
+		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+	}
+
+	return 0;
+}
+
+static int tegra20_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct watchdog_device *wdd;
+	struct tegra20_wdt *wdt;
+	void __iomem *regs;
+	int ret;
+
+	/*
+	 * Tegra30 lists "nvidia,tegra20-timer" as a fallback, but it has a
+	 * dedicated watchdog block, handled by tegra_wdt, and uses TIMER1 as
+	 * a per-CPU clock event device, so it isn't free for this one.
+	 */
+	if (of_device_is_compatible(dev->of_node, "nvidia,tegra30-timer"))
+		return -ENODEV;
+
+	/* This is the timer base. */
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	/*
+	 * Allocate our watchdog driver data, which has the
+	 * struct watchdog_device nested within it.
+	 */
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	/* Initialize struct watchdog_device. */
+	wdd = &wdt->wdd;
+	wdd->timeout = WDT_HEARTBEAT;
+	wdd->info = &tegra20_wdt_info;
+	wdd->ops = &tegra20_wdt_ops;
+	wdd->min_timeout = MIN_WDT_TIMEOUT;
+	wdd->max_timeout = MAX_WDT_TIMEOUT;
+	wdd->parent = dev;
+
+	watchdog_init_timeout(wdd, heartbeat, dev);
+
+	watchdog_set_drvdata(wdd, wdt);
+
+	watchdog_set_nowayout(wdd, nowayout);
+
+	/* Initialize struct tegra20_wdt. */
+	ret = tegra20_wdt_init(pdev, wdt, regs);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, wdt);
+
+	watchdog_stop_on_unregister(wdd);
+	ret = devm_watchdog_register_device(dev, wdd);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "initialized (heartbeat = %u sec, nowayout = %d)\n",
+		 wdd->timeout, nowayout);
+
+	return 0;
+}
+
+/*
+ * The watchdog may also run without user space having opened it, when it was
+ * taken over from the bootloader, so check whether the hardware runs. Calling
+ * the stop operation directly leaves WDOG_HW_RUNNING set for the resume.
+ */
+static int tegra20_wdt_suspend(struct device *dev)
+{
+	struct tegra20_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_hw_running(&wdt->wdd))
+		tegra20_wdt_stop(&wdt->wdd);
+
+	return 0;
+}
+
+static int tegra20_wdt_resume(struct device *dev)
+{
+	struct tegra20_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_hw_running(&wdt->wdd))
+		tegra20_wdt_start(&wdt->wdd);
+
+	return 0;
+}
+
+static const struct of_device_id tegra20_wdt_of_match[] = {
+	{ .compatible = "nvidia,tegra20-timer" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra20_wdt_of_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra20_wdt_pm_ops,
+				tegra20_wdt_suspend, tegra20_wdt_resume);
+
+static struct platform_driver tegra20_wdt_driver = {
+	.probe		= tegra20_wdt_probe,
+	.driver		= {
+		.name	= "tegra20-wdt",
+		.pm	= pm_sleep_ptr(&tegra20_wdt_pm_ops),
+		.of_match_table = tegra20_wdt_of_match,
+	},
+};
+module_platform_driver(tegra20_wdt_driver);
+
+MODULE_AUTHOR("Artur Kowalski");
+MODULE_DESCRIPTION("Tegra20 Watchdog Driver");
+MODULE_LICENSE("GPL");

-- 
2.56.1

