Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330681;
	b=ZEW5D+G8E4CIk3iGMozW1i8jW2YTSScqAQ6MFR9V7GkVxEO2WjGcY+1j7X+QXejpF5hV
	 kEHo//g7fqh9rq96gH4x1jsfBTj2J0aS6VJrzCuLJptIHVGB7wV5lIVB2OtfB9vNs396R
	 wUl3lLlBmOziKDhVGyKOhMddHx+2/hjnq++ypB6OxMDJSIldkl3TKSE0EtRrhq4qWFNGe
	 YsM9QD8gnREAp2yBhtw+GHjxLPlOhBtxbRSVdpz0v10TmwTlZV14Nbuh9vEg/UUZ5cdqG
	 AMD7UVKAQHusUXTENJRmP1t/ST2l758F4nrKqEAIHZ0UpxpJhlv9l5nS9fj1x4d00zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eO3IKw6CHR4Chw3bpKC8j4H7vOdunoO+BnbGIugUhTo=;
	b=Q9u7JrJxMRKH1hGqaQy7E/oKow6ZyAdMGYF0WSjz0FTU4m6etp2KGRGURt/PRIR7cnbH
	 cPcXjOPytE1/ivWQuwS/Ps/RTlTWYySw4zr+RJYOshw9QHGi15Yt+A4u/bILeWrNWi1B8
	 NAUsODnj+t4U6UJqnEC0GXP64znxUyHn9OBfcJej1OE+6zMZIPAkrOhrej7Gy6ZJexKUM
	 MCV5zF5n+peqnH6YXbo1VXrTtE4E3uNCJI+EwCQihSujE3Mw3dvw0hOxVTSDnO7cRLemn
	 DpeUGETSnSViLui2M+d9oVXWVy1HfZFT9RMPwXu1NlkmCTrkYp/H1vjiDuL3f/xXhkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sb2M38vj;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D051606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D051606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sb2M38vj
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04e3bf46dso14701835ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330680; x=1795935480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eO3IKw6CHR4Chw3bpKC8j4H7vOdunoO+BnbGIugUhTo=;
        b=Sb2M38vju2L24cvKVBMdAPQCxNmzbC2/MbsqVGY9PZw0HhYN4cBc1Cie0j4HxWKEdw
         u7QmRDHjUtKQrUF1pJ19U2bSEtVRQiyRTFgKb3HsKex6x+XF36Up5fXHkFlx7ISrERt8
         256MOFAwakeJrCbSka+Mz6wIuEEtyEzkTDYAnBNPP4ba6cmnO6AfI61oeit2047Gp5dc
         yOXNdy0Pae5A5dmBIjkd1YnHo9gNedDfXETtfpTJbidz3s6k5IQ3Rbj5csUcQ/7IuSxF
         /wR8ACh1OngEQLr1NUFM48/BtUpiU9qAqDnLe+Hzo3uMF4qEJBk5UIljsLHf7c2NT/Hf
         FRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330680; x=1795935480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eO3IKw6CHR4Chw3bpKC8j4H7vOdunoO+BnbGIugUhTo=;
        b=bX0Ncmbq9mSYU7ZO2Gk2L2QLHOhfbZgQgO9YLF04qjKbherjN5WUS/EjlAC51yC2d6
         8U9MrentlI6aWopVi/ppANV8KBwyY4ZHjewyMAQxExndZZuaE4GlFUjzb0g5oQ+XNOLA
         Op5EkZoTIh7NNrD/HyA8j0aoZNL6P/allTTwxf/iBWS61+sXsCHAhXvFHCjwLRnqSdQo
         Eb62ZW2ZFKN7Pn96TQS6STf1uZ64opIpl224ok49OeB3QyQCRdHSkr7po1RopnLSUvd0
         8DMgAbKGwi8VYelinRckNMfVYp0/abdUadjdCGIniw3hAO8XjRWNst4ZYL6XwraS3hXT
         I7oA==
X-Forwarded-Encrypted: i=1; AL+hErFA2NtHnCsHBsbQdzixL82JFmRzfplC7iR5/ec6iTpgGvIR/Tb2ilID098NMr35Peic5/1qVmoJ4fz72pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/38ihvG+ulK9taUZA5KMKn56lzcbyXqkHjCpunvMHcFn76Ws5Y
	HbwN1+HzAQo8T4W0ACoQGh7khluH7OtePk7dQH9kUBR0cCu5/c6/Xnsf
X-Gm-Gg: AZFdTZfbTFRUDhnE7qDYfGaJx5BbDalZIHBDcMhUR5073oKVQxbaI9W8a23cOGCkeIr
	QQdiCS61ZE3OVhw4+g2gnz385OmU+PyORuW551r3Wh/VOtxnd5bV6BZ1aRF2mRZernYrcDCGwI2
	cjDCppFIH5dYjROuzJ2tQLQ2fSLdDFkCeqkdqLIo0c4x5KKhXpK4Wzuu1dNE4GeOgWYXnqks69c
	o4ta491rPQl5Dem2VT74HR/sCnezfFW/kj1FO4umLDkbzpw/uGozkO1zvuXsHG7ZymiCqBMbrB9
	kbDvXp2YjCCFKk2M2MOwpcVE0UUfhawca92wvoO5pzvntgTCa9Zf+n3TDJaq7CsNXK9p0A74zkV
	IHlLNgNmIsYgMrJ5rlBeTyeOThg80AI1CGG5kVjlHGWNLu7zLi/X4uEQR4vypeU/YxTX9smB45i
	2loWyFdXO9svr5auUq70flApyCKVxbIs3AIqiaA2jgh31wk4ssNBfGR9EbYGtQPsZnX7FSaZate
	3/qByxw5PBL8ClAhXHm8jaYAMutnjc3+8+AL89Y6tkErSOwJpWe8xVyGYQkFVJSJ+nCK0Myy/kz
	h5DoQG/cZyvseuORLjSf78kGriHXm4DSxT/3Tv6vQMia28WjnHq9
X-Received: by 2002:a17:903:4b0c:b0:2e2:d77b:e586 with SMTP id d9443c01a7336-2f03f26bea1mr74481015ad.60.1795330680341;
        Sat, 21 Nov 2026 22:58:00 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:00 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Sun, 22 Nov 2026 14:55:21 +0800
Message-ID: <20261122065549.3265519-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
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

The watchdog controller integrated on HiSilicon STB SoCs shares register
offsets with the ARM PrimeCell SP805, but differs in several critical
behaviors. Add a dedicated platform driver to handle these SoC-specific
semantics natively without regressing generic SP805 users.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/watchdog/Kconfig     |   8 +
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/histb_wdt.c | 287 +++++++++++++++++++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 drivers/watchdog/histb_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..d3421bb76326 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1183,6 +1183,14 @@ config SUNPLUS_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunplus_wdt.
 
+config HISTB_WATCHDOG
+	tristate "HiSilicon STB Watchdog"
+	depends on (ARCH_HISI || COMPILE_TEST) && OF
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer in HiSilicon STB
+	  SoCs.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 9ac406677aba..d2455e54ab23 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
 obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
 obj-$(CONFIG_MA35D1_WDT) += ma35d1_wdt.o
+obj-$(CONFIG_HISTB_WATCHDOG) += histb_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/histb_wdt.c b/drivers/watchdog/histb_wdt.c
new file mode 100644
index 000000000000..1961981f1e5d
--- /dev/null
+++ b/drivers/watchdog/histb_wdt.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * HiSilicon STB Watchdog Driver
+ *
+ * The watchdog controller integrated on HiSilicon STB SoCs shares register
+ * offsets with the ARM PrimeCell SP805, but differs in several critical
+ * hardware behaviors:
+ *   - The ID registers at 0xfe0..0xffc are unimplemented and read zero,
+ *     requiring a platform device driver rather than AMBA probe;
+ *   - Writing WDTLOCK freezes the counter instead of only blocking register
+ *     writes, so the block must remain unlocked while running;
+ *   - Writing WDTLOAD never reloads the running counter; only WDTINTCLR does;
+ *   - Writing WDTLOAD with 0 results in a counter starting at 0xffffffff,
+ *     resetting after 2*178.6s (~6min) at 24 MHz;
+ *   - The counter only advances while unlocked and INT_ENABLE is set.
+ *
+ * Copyright (c) 2026 David Yang <mmyangfl@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/spinlock.h>
+#include <linux/watchdog.h>
+
+#define HISTB_WDT_LOAD			0x000
+#define HISTB_WDT_VALUE			0x004
+#define HISTB_WDT_CONTROL		0x008
+#define  HISTB_WDT_RESET_ENABLE			BIT(1)
+#define  HISTB_WDT_INT_ENABLE			BIT(0)
+#define HISTB_WDT_INTCLR		0x00c
+#define HISTB_WDT_RIS			0x010
+#define HISTB_WDT_MIS			0x014
+#define  HISTB_WDT_INT_MASK			BIT(0)
+#define HISTB_WDT_LOCK			0xc00
+#define  HISTB_WDT_UNLOCK_KEY			0x1acce551
+#define  HISTB_WDT_LOCK_KEY			0x00000001
+
+#define MHz 1000000
+
+#define HISTB_WDT_DEFAULT_TIMEOUT	60
+
+struct histb_wdt {
+	struct watchdog_device wdd;
+
+	void __iomem *base;
+	struct clk *clk;
+	spinlock_t lock;
+
+	u32 rate;
+	u32 load_val;
+};
+
+static void histb_wdt_arm(struct histb_wdt *wdt, u32 load)
+{
+	void __iomem *base = wdt->base;
+
+	spin_lock(&wdt->lock);
+	writel_relaxed(HISTB_WDT_UNLOCK_KEY, base + HISTB_WDT_LOCK);
+	writel_relaxed(0, base + HISTB_WDT_CONTROL);
+	writel_relaxed(HISTB_WDT_INT_MASK, base + HISTB_WDT_INTCLR);
+	writel_relaxed(load, base + HISTB_WDT_LOAD);
+	writel_relaxed(HISTB_WDT_INT_ENABLE | HISTB_WDT_RESET_ENABLE,
+		       base + HISTB_WDT_CONTROL);
+	readl_relaxed(base + HISTB_WDT_LOCK);
+	spin_unlock(&wdt->lock);
+}
+
+static int histb_wdt_start(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	int res;
+
+	res = clk_enable(wdt->clk);
+	if (res)
+		return res;
+
+	histb_wdt_arm(wdt, wdt->load_val);
+
+	return 0;
+}
+
+static int histb_wdt_stop(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	void __iomem *base = wdt->base;
+
+	spin_lock(&wdt->lock);
+	writel_relaxed(HISTB_WDT_UNLOCK_KEY, base + HISTB_WDT_LOCK);
+	writel_relaxed(0, base + HISTB_WDT_CONTROL);
+	writel_relaxed(HISTB_WDT_LOCK_KEY, base + HISTB_WDT_LOCK);
+	readl_relaxed(base + HISTB_WDT_LOCK);
+	spin_unlock(&wdt->lock);
+
+	clk_disable(wdt->clk);
+
+	return 0;
+}
+
+static int histb_wdt_ping(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	void __iomem *base = wdt->base;
+
+	spin_lock(&wdt->lock);
+	writel_relaxed(HISTB_WDT_INT_MASK, base + HISTB_WDT_INTCLR);
+	writel_relaxed(wdt->load_val, base + HISTB_WDT_LOAD);
+	readl_relaxed(base + HISTB_WDT_LOCK);
+	spin_unlock(&wdt->lock);
+
+	return 0;
+}
+
+static int
+histb_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	u64 load;
+
+	/*
+	 * Counter decrements twice: interrupt at underflow 1, reset at
+	 * underflow 2 if unclaimed. Timeout is two windows.
+	 */
+	load = div_u64((u64)wdt->rate * timeout, 2) - 1;
+	load = clamp_val(load, 1, 0xffffffff);
+
+	wdt->load_val = load;
+	wdd->timeout = div_u64(((u64)load + 1) * 2 + (wdt->rate / 2),
+			       wdt->rate);
+
+	if (watchdog_active(wdd))
+		histb_wdt_arm(wdt, wdt->load_val);
+
+	return 0;
+}
+
+static unsigned int histb_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	u64 value;
+
+	spin_lock(&wdt->lock);
+	value = readl_relaxed(wdt->base + HISTB_WDT_VALUE);
+	if (!(readl_relaxed(wdt->base + HISTB_WDT_RIS) & HISTB_WDT_INT_MASK))
+		value += (u64)wdt->load_val + 1;
+	spin_unlock(&wdt->lock);
+
+	return div_u64(value, wdt->rate);
+}
+
+static int
+histb_wdt_restart(struct watchdog_device *wdd, unsigned long mode, void *cmd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	/*
+	 * For reset, we start the WDT clock and leave it running.
+	 * The clock was prepared at probe time; only clk_enable() is
+	 * safe in this atomic (restart notifier) context.
+	 */
+	clk_enable(wdt->clk);
+	histb_wdt_arm(wdt, 1);
+
+	mdelay(1);
+
+	return 0;
+}
+
+static const struct watchdog_info histb_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "HiSilicon STB Watchdog",
+};
+
+static const struct watchdog_ops histb_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = histb_wdt_start,
+	.stop = histb_wdt_stop,
+	.ping = histb_wdt_ping,
+	.set_timeout = histb_wdt_set_timeout,
+	.get_timeleft = histb_wdt_get_timeleft,
+	.restart = histb_wdt_restart,
+};
+
+static int histb_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct histb_wdt *wdt;
+	int res;
+
+	wdt = devm_kzalloc_obj(dev, *wdt);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt->base))
+		return PTR_ERR(wdt->base);
+
+	/*
+	 * Keep the clock prepared for the lifetime of the driver:
+	 * .restart() runs in atomic context and may only call clk_enable().
+	 */
+	wdt->clk = devm_clk_get_optional_prepared(dev, NULL);
+	if (IS_ERR(wdt->clk))
+		return dev_err_probe(dev, PTR_ERR(wdt->clk),
+				     "Failed to get clock\n");
+
+	if (wdt->clk)
+		wdt->rate = clk_get_rate(wdt->clk);
+	if (!wdt->rate)
+		device_property_read_u32(dev, "clock-frequency", &wdt->rate);
+	if (!wdt->rate)
+		/* 24 MHz crystal clock default on HiSTB */
+		wdt->rate = 24 * MHz;
+
+	spin_lock_init(&wdt->lock);
+
+	wdt->wdd.info = &histb_wdt_info;
+	wdt->wdd.ops = &histb_wdt_ops;
+	wdt->wdd.parent = dev;
+	wdt->wdd.min_timeout = 1;
+	wdt->wdd.max_timeout = div_u64(((u64)U32_MAX + 1) * 2, wdt->rate);
+	wdt->wdd.timeout = HISTB_WDT_DEFAULT_TIMEOUT;
+
+	watchdog_set_drvdata(&wdt->wdd, wdt);
+	watchdog_init_timeout(&wdt->wdd, 0, dev);
+	histb_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+
+	watchdog_stop_on_reboot(&wdt->wdd);
+	platform_set_drvdata(pdev, wdt);
+
+	res = devm_watchdog_register_device(dev, &wdt->wdd);
+	if (res)
+		return dev_err_probe(dev, res,
+				     "Failed to register watchdog device\n");
+
+	return 0;
+}
+
+static int __maybe_unused histb_wdt_suspend(struct device *dev)
+{
+	struct histb_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		histb_wdt_stop(&wdt->wdd);
+
+	return 0;
+}
+
+static int __maybe_unused histb_wdt_resume(struct device *dev)
+{
+	struct histb_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		histb_wdt_start(&wdt->wdd);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(histb_wdt_pm_ops, histb_wdt_suspend, histb_wdt_resume);
+
+static const struct of_device_id histb_wdt_match[] = {
+	{ .compatible = "hisilicon,histb-wdt" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, histb_wdt_match);
+
+static struct platform_driver histb_wdt_driver = {
+	.probe = histb_wdt_probe,
+	.driver = {
+		.name = "histb-wdt",
+		.pm = &histb_wdt_pm_ops,
+		.of_match_table = histb_wdt_match,
+	},
+};
+module_platform_driver(histb_wdt_driver);
+
+MODULE_AUTHOR("David Yang <mmyangfl@gmail.com>");
+MODULE_DESCRIPTION("HiSilicon STB Watchdog Driver");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.53.0

