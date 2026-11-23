Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467966;
	b=s+9k7tla/plMLW0mUc5AmO/sFEbTSpstvdnBbOFi5BNBX9Sg+m2tYqE1bZo0ug8MizoM
	 ystumPP6H2mesWJscqrhqjT+5mGJFzcDLl4RIl5qU4hh7l0tWE8RBm3TPZITodZ3kmtul
	 nyY4z8T1WCPTFKIrTLVkC3Cz6hKwedTZ590Gp598oOwHZEM1MYwijcD6kBM9WYn13Rv2d
	 Cfz9EO3sgP6vSfZ0gpuHJmvR43+YJdhpW5hhgInhW2gyt1fHO2WEkCPlWgrzTJ0SsJAMK
	 V7ddG2xdBRYi8l2PJ6mMq/wICeDj1bFUN3OMSITuJfEVFz2gqL9h0mmjC8AwtWF+3vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GJli0MCSg+XV1AHffhsgwUtsM3L757cHBhotDUXV8Ao=;
	b=s66S3fR2E05xtvyX0Efk5W1PIRJTaE9TMBzE3mVpzpBAe7T4z8ISh8S7L36pnQOFKDWt
	 g0MTX2F2GYClgcfHpKXlwAe/QTKraoQUl3zpvpbKbBevU6W1wBjQHV66s39fQ+T7nCMHr
	 mCt7W1ScJn2pl+/uq23uZB/u7iq+rLgd16+DGdVvf/xF5gBcv2FN9sB83U+jwtBf0S+hx
	 /3548YF9u99a4ktFdJbEXRgw5Kum2fofpfnFFr0Hw6Jg/xRlvJoaKATmm83ZC+WTysFCJ
	 Vpv/3lfb/Zl/fsU0m6oeu4Vc7qmNEpg8KqUwGH2Gy9Ilb9vHbc6/NHnVugOr0nnzJrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMsGFCDJ;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A235606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A235606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMsGFCDJ
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so1149319137.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467964; x=1796072764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJli0MCSg+XV1AHffhsgwUtsM3L757cHBhotDUXV8Ao=;
        b=eMsGFCDJ/7F+kdA6ME5z6R8aJ4TlqYqHgBVLp841q+odNyu8iE0FkxiL4ZoSBY9s9k
         Y2BSTX9shjwaAbzWF0N8erjGUNmSMhPVDm1sd0dZl5kB3ZaI1epWe9vTPBFT3D3zozg+
         ZG4UGqwSqmb1Orw+1uvwg3x8rJsa+A8WwK80P2iltTRJkYDYmyJUWBI2yDeZts3BoRhP
         UGkzM2gjTR//4z35s8u+fgBYfmtjPn8AL39oqDXObgjawf8ZEbauIH92CWAOzwfWBOcJ
         ReAdhsbEC8EuqAFX4I48k62Lhn20tLHzkWDqDnM92wF3h7x2E37vCP1CVQtExEvtCb18
         ULlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467964; x=1796072764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJli0MCSg+XV1AHffhsgwUtsM3L757cHBhotDUXV8Ao=;
        b=oH52g6zDQ0W0edvjcEEWXmeTjK1WLZXpZFpJd7SczSMDbbIZR8gkCNz2QXXTbzw/wc
         YMGfiAmWzXilOfr3aqyOQd/O9YWPrBXev5fgvj5BjEf6v2eJKpoq0yuZDyOrlDUfLmMZ
         F6Jr2OorU66lMH7YsMzCXA31yNMsFfFcFWG7Y+KbbS2RSgiQNh7aEeKgDHp0l3ScuOxG
         Dzwzw7RUMq6Ee3LaQ9iFWI0eKUZDqLCzu4GLH2BOe64ciwFzFUTVTxBNI8//iNFl6eRD
         yuxzdJDi/7CJpLvJAPQFarqqhAjvOOObWHqc8me1polfdWkc3JrCELj8De8MLp3WTFeL
         gOfA==
X-Forwarded-Encrypted: i=1; AL+hErE8Se3JeOpX2UUInYNngVOnRqrgpys3tvO9TPPn/FKaBTIJoLI9T0x8rW/cwduPbDVfqW9QGT4ZSC+LorE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4p1mo+DhISKvbBwt+pXDQmMuhuTBgRIPMuaqZ5y2spGmkrhVR
	avny13j1y+wt4noqOpe5LlVa8o9DVHm2f6Da09JKOH40jOb0D3W34rin
X-Gm-Gg: AZFdTZfJdxsSg/eYj4fRg3qXer62GvKA0oJhElrE4bHUUagpqi0KXkV3GY2zgyy1Fz+
	QFIMWnDqFYLTqZVxVAMIh9slYZFn6odoQhy9xoxMfo6pAMrzf5i3De4RZeD//aZ1wF4LImh+t+7
	XOu8PuFOpM6sKlllc3/nck9qJhBRQqc9VTE935BP5+ptVygoDr6tXar4SjJFh85MjBGLEcSAa7f
	6f1iaNL3hLCz50EjKCGRUoCsw0EiFyIAlfYuSZvA3saYpbrYm/ju0u5DHpkjCWMOy5Eyv0y/sBk
	R01ZaJeFngx2TexhBiCfEnt8ZLu06ZRQIJcyIpbDJcP0MWRB6xu7HTAE0YlXLvVe9J08mnQvPab
	6OUQxRXQ3ulXKt57JbwIF/eRf8Yma2wK9cKCDvlr3u3sRe9KCLOAlFGdhHPR5GkX1W8q+hnmie/
	krcdl0YSsIIuoWzYfn1wrhv+u6eVsNd7QIataqZr8kj/utKAjBB2yZC49Qu+XMcv/u9FqvQMLLO
	pmjtwAuBw6Klibec8njH9u81IIbZ5qqtDfzPpXzEOOddZHGD5V8o+ztlOwHC/C4aAi6n3iM8D1t
	edjfmOG0zmCyTqcnxGjX7D6R
X-Received: by 2002:a05:6102:a52:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d71e344b33mr5590361137.0.1795467964108;
        Mon, 23 Nov 2026 13:06:04 -0800 (PST)
Received: from garuda ([187.114.10.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm13041769137.9.2026.11.23.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:06:03 -0800 (PST)
From: Renan Biegelmeyer <renan.biegel@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Renan Biegelmeyer <renan.biegel@gmail.com>
Subject: [PATCH 1/2] platform/x86: uniwill: add read-only WMI EC backend
Date: Mon, 23 Nov 2026 18:05:53 -0300
Message-ID: <20261123210554.3357528-2-renan.biegel@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123210554.3357528-1-renan.biegel@gmail.com>
References: <20261123210554.3357528-1-renan.biegel@gmail.com>
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

Some Uniwill-based devices do not expose the INOU0000 ACPI device, so
the driver cannot bind even though the EC is still reachable through the
AcpiTest_MULong WMI interface.

Add a read-only regmap backend for that interface and let the WMI driver
instantiate the platform device when INOU0000 is absent and the EC answers
a test read. Only the hwmon sensors (CPU/GPU temperature, fan speed and
PWM) are initialized in this mode; all write-oriented features are
skipped, as the WMI backend intentionally has no write callback.

Add a DMI entry for the Avell A62 LIV, which uses this interface.

Signed-off-by: Renan Biegelmeyer <renan.biegel@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 138 ++++++++++++++++++--
 drivers/platform/x86/uniwill/uniwill-wmi.c  |  76 +++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h  |  12 ++
 3 files changed, 217 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7fb52b574..9b7627271 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -42,10 +42,12 @@
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/units.h>
+#include <linux/wmi.h>
 
 #include <acpi/battery.h>
 
@@ -338,7 +340,7 @@
 
 #define EC_ADDR_PWM_2_WRITEABLE		0x1809
 
-#define DRIVER_NAME	"uniwill"
+#define DRIVER_NAME	UNIWILL_PLATFORM_NAME
 
 /*
  * The OEM software always sleeps up to 6 ms after reading/writing EC
@@ -380,7 +382,9 @@ struct uniwill_data {
 	struct device *dev;
 	acpi_handle handle;
 	struct regmap *regmap;
+	struct mutex wmi_lock;	/* Protects WMI EC transactions */
 	unsigned int features;
+	bool wmi_ec;
 	u8 project_id;
 	struct acpi_battery_hook hook;
 	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
@@ -596,6 +600,55 @@ static const struct regmap_bus uniwill_ec_bus = {
 	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
 };
 
+#define UNIWILL_WMI_EC_METHOD		4
+#define UNIWILL_WMI_EC_READ_OP		0x01
+#define UNIWILL_WMI_EC_FAIL_MARKER	0xfe
+
+static int uniwill_wmi_ec_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct uniwill_data *data = context;
+	u32 args[10] = { };
+	u8 *bytes = (u8 *)args;
+	struct acpi_buffer in = { .length = sizeof(args), .pointer = args };
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = 0;
+
+	bytes[0] = reg & 0xff;
+	bytes[1] = reg >> 8;
+	bytes[5] = UNIWILL_WMI_EC_READ_OP;
+
+	guard(mutex)(&data->wmi_lock);
+	status = wmi_evaluate_method(UNIWILL_WMI_EC_GUID, 0, UNIWILL_WMI_EC_METHOD,
+				     &in, &out);
+	obj = out.pointer;
+	if (ACPI_FAILURE(status) || !obj || obj->type != ACPI_TYPE_BUFFER ||
+	    obj->buffer.length < 1)
+		ret = -EIO;
+	else if (obj->buffer.length >= 4 &&
+		 obj->buffer.pointer[0] == UNIWILL_WMI_EC_FAIL_MARKER &&
+		 obj->buffer.pointer[1] == UNIWILL_WMI_EC_FAIL_MARKER &&
+		 obj->buffer.pointer[2] == UNIWILL_WMI_EC_FAIL_MARKER &&
+		 obj->buffer.pointer[3] == UNIWILL_WMI_EC_FAIL_MARKER)
+		ret = -EIO;
+	else
+		*val = obj->buffer.pointer[0];
+
+	kfree(obj);
+
+	if (!ret)
+		usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_US * 2);
+
+	return ret;
+}
+
+static const struct regmap_bus uniwill_wmi_ec_bus = {
+	.reg_read = uniwill_wmi_ec_reg_read,
+	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
+};
+
 static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -716,6 +769,18 @@ static const struct regmap_config uniwill_ec_config = {
 	.use_single_write = true,
 };
 
+/* The WMI EC interface is only used for read-only sensor access. */
+static const struct regmap_config uniwill_wmi_ec_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.readable_reg = uniwill_readable_reg,
+	.volatile_reg = uniwill_volatile_reg,
+	.can_sleep = true,
+	.max_register = 0xFFF,
+	.cache_type = REGCACHE_NONE,
+	.use_single_read = true,
+};
+
 static int uniwill_write_fn_lock(struct uniwill_data *data, bool status)
 {
 	unsigned int value;
@@ -2363,14 +2428,18 @@ static int uniwill_ec_init(struct uniwill_data *data)
 
 static int uniwill_probe(struct platform_device *pdev)
 {
+	struct uniwill_wmi_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct uniwill_data *data;
 	struct regmap *regmap;
-	acpi_handle handle;
+	acpi_handle handle = NULL;
+	bool wmi_ec = pdata && pdata->read_only;
 	int ret;
 
-	handle = ACPI_HANDLE(&pdev->dev);
-	if (!handle)
-		return -ENODEV;
+	if (!wmi_ec) {
+		handle = ACPI_HANDLE(&pdev->dev);
+		if (!handle)
+			return -ENODEV;
+	}
 
 	data = devm_kzalloc_obj(&pdev->dev, *data);
 	if (!data)
@@ -2378,9 +2447,20 @@ static int uniwill_probe(struct platform_device *pdev)
 
 	data->dev = &pdev->dev;
 	data->handle = handle;
+	data->wmi_ec = wmi_ec;
 	platform_set_drvdata(pdev, data);
 
-	regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwill_ec_config);
+	if (wmi_ec) {
+		ret = devm_mutex_init(&pdev->dev, &data->wmi_lock);
+		if (ret < 0)
+			return ret;
+
+		regmap = devm_regmap_init(&pdev->dev, &uniwill_wmi_ec_bus, data,
+					  &uniwill_wmi_ec_config);
+	} else {
+		regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data,
+					  &uniwill_ec_config);
+	}
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
@@ -2390,15 +2470,31 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ret = uniwill_ec_init(data);
-	if (ret < 0)
-		return ret;
+	if (!wmi_ec) {
+		ret = uniwill_ec_init(data);
+		if (ret < 0)
+			return ret;
+	}
 
 	data->features = device_descriptor.features;
 	data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
 	data->lightbar_max_intensity = device_descriptor.lightbar_max_intensity;
 
+	if (wmi_ec) {
+		/*
+		 * The WMI EC interface only supports read-only access. Do not
+		 * touch any write-oriented feature, including the manual
+		 * control bit set by uniwill_ec_init().
+		 */
+		data->features = UNIWILL_FEATURE_CPU_TEMP |
+				 UNIWILL_FEATURE_GPU_TEMP |
+				 UNIWILL_FEATURE_PRIMARY_FAN |
+				 UNIWILL_FEATURE_SECONDARY_FAN;
+
+		return uniwill_hwmon_init(data);
+	}
+
 	/*
 	 * Some devices might need to perform some device-specific initialization steps
 	 * before the supported features are initialized. Because of this we have to call
@@ -2441,6 +2537,9 @@ static void uniwill_shutdown(struct platform_device *pdev)
 {
 	struct uniwill_data *data = platform_get_drvdata(pdev);
 
+	if (data->wmi_ec)
+		return;
+
 	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
 }
 
@@ -2544,6 +2643,9 @@ static int uniwill_suspend(struct device *dev)
 	struct uniwill_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	if (data->wmi_ec)
+		return 0;
+
 	ret = uniwill_suspend_fn_lock(data);
 	if (ret < 0)
 		return ret;
@@ -2661,6 +2763,9 @@ static int uniwill_resume(struct device *dev)
 	struct uniwill_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	if (data->wmi_ec)
+		return 0;
+
 	regcache_cache_only(data->regmap, false);
 
 	ret = regcache_sync(data->regmap);
@@ -3072,6 +3177,14 @@ static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata = {
 	.kbd_led_max_brightness = 2,
 };
 
+static struct uniwill_device_descriptor avell_a62_liv_descriptor __initdata = {
+	/* Sensors are accessible through the read-only WMI EC interface. */
+	.features = UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
+};
+
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 	{
 		.ident = "AiStone X4SP4NAL",
@@ -3128,6 +3241,13 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
+	{
+		.ident = "Avell A62 LIV",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "A62 LIV"),
+		},
+		.driver_data = &avell_a62_liv_descriptor,
+	},
 	{
 		.ident = "Intel NUC x15",
 		.matches = {
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform/x86/uniwill/uniwill-wmi.c
index 2ffa29a82..35eb36d1c 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.c
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -13,9 +13,12 @@
 
 #include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/notifier.h>
+#include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
@@ -50,6 +53,78 @@ static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
 		dev_err(&wdev->dev, "Failed to handle event %u\n", value);
 }
 
+#define UNIWILL_WMI_EC_METHOD		4
+#define UNIWILL_WMI_EC_READ_OP		0x01
+#define UNIWILL_WMI_EC_TEST_ADDR	0x043e
+#define UNIWILL_WMI_EC_FAIL_MARKER	0xfe
+
+/*
+ * The EC WMI GUID is not unique either, so make sure that the EC actually
+ * answers a read request before exposing it to the platform driver.
+ */
+static int uniwill_wmi_ec_read_test(void)
+{
+	u32 args[10] = { };
+	u8 *bytes = (u8 *)args;
+	struct acpi_buffer in = { .length = sizeof(args), .pointer = args };
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = 0;
+
+	bytes[0] = UNIWILL_WMI_EC_TEST_ADDR & 0xff;
+	bytes[1] = UNIWILL_WMI_EC_TEST_ADDR >> 8;
+	bytes[5] = UNIWILL_WMI_EC_READ_OP;
+
+	status = wmi_evaluate_method(UNIWILL_WMI_EC_GUID, 0, UNIWILL_WMI_EC_METHOD,
+				     &in, &out);
+	obj = out.pointer;
+	if (ACPI_FAILURE(status) || !obj || obj->type != ACPI_TYPE_BUFFER ||
+	    obj->buffer.length < 1)
+		ret = -EIO;
+	else if (obj->buffer.length >= 4 &&
+		 obj->buffer.pointer[0] == UNIWILL_WMI_EC_FAIL_MARKER &&
+		 obj->buffer.pointer[1] == UNIWILL_WMI_EC_FAIL_MARKER &&
+		 obj->buffer.pointer[2] == UNIWILL_WMI_EC_FAIL_MARKER &&
+		 obj->buffer.pointer[3] == UNIWILL_WMI_EC_FAIL_MARKER)
+		ret = -EIO;
+
+	kfree(obj);
+
+	return ret;
+}
+
+static void uniwill_wmi_unregister_platform_device(void *data)
+{
+	platform_device_unregister(data);
+}
+
+static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct uniwill_wmi_platform_data pdata = { .read_only = true };
+	struct platform_device *pdev;
+
+	if (!wmi_has_guid(UNIWILL_WMI_EC_GUID))
+		return 0;
+
+	/* Prefer the ACPI EC interface whenever the BIOS provides it. */
+	if (acpi_dev_present("INOU0000", NULL, -1))
+		return 0;
+
+	if (uniwill_wmi_ec_read_test() < 0)
+		return 0;
+
+	pdev = platform_device_register_data(&wdev->dev, UNIWILL_PLATFORM_NAME,
+					     PLATFORM_DEVID_AUTO, &pdata,
+					     sizeof(pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return devm_add_action_or_reset(&wdev->dev,
+					uniwill_wmi_unregister_platform_device,
+					pdev);
+}
+
 /*
  * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
  * from the Windows driver example, and others probably did the same.
@@ -69,6 +144,7 @@ static struct wmi_driver uniwill_wmi_driver = {
 	},
 	.id_table = uniwill_wmi_id_table,
 	.min_event_size = sizeof(u32),
+	.probe = uniwill_wmi_probe,
 	.notify = uniwill_wmi_notify,
 	.no_singleton = true,
 };
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
index 1b6f650c4..1cdf2fcbf 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -9,6 +9,18 @@
 #define UNIWILL_WMI_H
 
 #include <linux/init.h>
+#include <linux/types.h>
+
+#define UNIWILL_PLATFORM_NAME		"uniwill"
+#define UNIWILL_WMI_EC_GUID		"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
+
+/*
+ * Used when the BIOS does not expose the INOU0000 ACPI device and the EC
+ * is only reachable through the AcpiTest_MULong WMI interface.
+ */
+struct uniwill_wmi_platform_data {
+	bool read_only;
+};
 
 #define UNIWILL_OSD_CAPSLOCK			0x01
 #define UNIWILL_OSD_NUMLOCK			0x02
-- 
2.56.1

