Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505378;
	b=Eq5fcKBOhxsPlC8AQ5HUEVX7QI23APVJnR3186x8ex7kSEe4byhBYdbKXHYiu/H0JnQb
	 bOjEv8A9a3Vk7VVEiO8/jaG8Rbd2wQDjBLv8Bjrv13Cg5Ya1rK7/w2AgcYyIAkXW2T1JB
	 +Pe0RuwMKTmLI2FqRXmUCToj5OIzJK9NCyD9fGQvR1sBZ5JWwJsyQ4Q8ia6Eks/8iZcgK
	 3iIGtQnJa9peeKuPzIDxmrOAIaunHNyYHfAoxjJmolTgFkqzT7TLICtzuN5mal+H6JOQ9
	 wJ+eGNJKgVhnjJbltHUBmLcm3yAzn5lAeNn8aT64yDdigiiWPyECl/Wp12UsyhkK11Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
	b=OYEFEl2DpbvLeiow8XxBRDDc9bsRdIfmZrP+87dPsSdwRSw8gy0MVS10upClzVkjXXdZ
	 tZlkL4zL9LCoQCUd73X9qTvrQPZCmFWjmlkYNQICnOe0OgBIjHTUXxTxSnBIH2hCLlwLw
	 zdcqfI4hsJNz9+KWJa1X97hYPu0DPGm/fnVTicelCTVrHVkWt2QB3+/jYI7ZGjzjZbhBk
	 wdNdANbR32jaKEPOEh01Nu8UKdQurrjFQH2sEhu+P9hgd5Nxg/bKYdSEblRMMwLNxCsBM
	 xS0oMbzYhPoz64Z00hAE9WbtE+cvYcxXfWIfFV/deSud3XXEEwGvMi8D1E3Krpo9J6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRPDeGiC;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B81606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B81606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRPDeGiC
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so1148243a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505377; x=1796110177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
        b=CRPDeGiCKnKoKY4aIHRZyu35iEF1GmR1ERFuarJuTDRWEKGdSKZ1xYWN8Bj1faf1Zu
         lpcKJUTJQHJMAlvdsSh5RvFzNE8Lw69oB39RLGTMQmEMke+HFVC8ImtF3A1JHQqJUeRm
         RtrRqGSt5j32mMpMPLlVo1JcifevCOcxW3e6hlXH49xyDC57zGqLKS9F1CPKO2mhxpwi
         phnAflR3xuk1E4kCjjchhZ++nlQnR4fDtQIAXzsFus9RzWv2xh6aWMFOfagN74DQ7coI
         y+hVlWjjjgdqumIPVUWa+c0oTCHSp3ncGVz7XZQJe4nBmLmL3eUhtPjwk1fB87PPGspo
         5wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505377; x=1796110177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
        b=twXV/9sACmNWGSg3xFtwMbK1NVV3YRhQC6/oEFxbXtoX4xjOVhLm5uuBvL4EFvGB+K
         saNli4ensUBfip16aTnqcvkEeaRaQLoS99dDcgWQM43yOsdpGzAMhFt+Mt7qczfMQJbs
         HkIAUVw0OBmKWcf944qSfMf6Q5QaySL8SevPAL4dXZZngW60jk/JkThFthO94K5uaxB9
         tK7fl7/jtsQ0BYsLHeoKqMdKOn+03EgKmZlt0GDSVme6g7XRbOxwuGgV5S39kOjKrUyt
         UaeaDXQZLVrHQDZtwLCMDYNCdzO7ScwYlPqdecl2Bpbv4sATwNfea8+OLo30PLBxMzkR
         l3fw==
X-Forwarded-Encrypted: i=1; AL+hErHe7n+XRr2FhEZn2KMwc+47uvo7Ch4EPB70han+H3LZyoXNKZFuXeqEvFrEU36Cacw+/T9oSIPMLk0q5oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5be+Er8NHMxtRks+uswp+fY56XZAgxlosFT9066Tg52kbVVBL
	LKK8ZMJd7uLn0LfJUk2G11rmZYisUxpdy9BCIWka4LxkEUnn0lLkeJy4QES/27OL
X-Gm-Gg: AZFdTZdo2S06tjz5YtLorzqP5856UuuA/ytQxKz+H+VUXiT65Gmo7PZV/ROxfTKPssr
	Li3IanNWwJ0t48tZSX1Rh0/56LsdNUwN/B1jEMjtnnBow+mtEWKJl4P50dPhWM0h4stCzyxm3FF
	ZXtdFTIRyBeuTSYkwtk0Doypj4eEwlEn/+oEwhAm0fznMRbIL7wIT6uObG0ygWeZnHT1PmRwCtH
	KnV3idJ5xFsNhGV5lWftweW50/2z8OC0baFqho0lLQTihHs3GmKr97yq9UQl9TN25mv2j+2rMg9
	WgqOhiZsA2m1RUxAYz0qraEZovqAuyM/yB3p/wH8BPCM7eTVJboRTiP2lSo83xbT1qnxSDbmQZM
	DRy71FbkgoYzCHijmijAfTiBz8Wv9toyYy9GE6U+gSO0x3wtg2uExWS5/PTAdoFkXgB7n+BLSGG
	wAG/hzpg4ox3aKzJQ/qdQBm84swUCJMzZA7b+Qzcf+yNabZlW2uGIy73t8u7dDUYrD3jUMbhpPF
	2fAOHNE81NnvXz6QH2cv6pugblECWJIiJ36yQsrEl1Qmb/ImI4pbSngXK0+90lYCm0PpPPWJOx7
	vJzUsnaWDR0jB2NbqLCgqW80oLc=
X-Received: by 2002:a17:90a:e7d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b41c9e52f6mr12937561a91.35.1795505377490;
        Mon, 23 Nov 2026 23:29:37 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm22247243a91.12.2026.11.23.23.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:37 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Date: Tue, 24 Nov 2026 15:29:22 +0800
Message-ID: <20261124072924.556678-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
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

Sophgo SoCs such as SG2044 contain eFuses used to store
factory-programmed data.

As for SG2044, HW automatically loads the eFuse content
into shadow registers which are organized as 32bit values
exposed as MMIO.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/nvmem/Kconfig        |  12 +++
 drivers/nvmem/Makefile       |   2 +
 drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/nvmem/sophgo-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..3bcbad51616c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,18 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SOPHGO_EFUSE
+	tristate "Sophgo eFuse support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	default ARCH_SOPHGO
+	help
+	  Say y here to enable support for reading eFuses on Sophgo SoCs
+	  such as the SG2044. These are e.g. used to store factory programmed
+	  required data for internal device like ROM patch.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-sophgo-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..aac736057201 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SOPHGO_EFUSE)	+= nvmem-sophgo-efuse.o
+nvmem-sophgo-efuse-y			:= sophgo-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
new file mode 100644
index 000000000000..d42f18f36828
--- /dev/null
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sophgo SoC eFuse driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/cleanup.h>
+#include <linux/iopoll.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define SG2044_EFUSE_CONTENT_SIZE		0x400
+
+#define SG2044_EFUSE_MD				0x000
+#define SG2044_EFUSE_ADR			0x004
+#define SG2044_EFUSE_RD_DATA			0x00c
+
+#define SG2044_EFUSE_MODE			GENMASK(1, 0)
+#define SG2044_EFUSE_MODE_READ			2
+
+#define SG2044_EFUSE_BOOT_DONE			BIT(7)
+#define SG2044_BOOT_TIMEOUT			10000
+
+#define SG2044_EFUSE_ADR_ADDR			GENMASK(7, 0)
+
+#define SG2044_EFUSE_ALIGN			4
+
+struct sophgo_efuses {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct mutex mutex;
+};
+
+static int sg2044_efuse_wait_mode(struct sophgo_efuses *efuse)
+{
+	u32 value;
+
+	return readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				  FIELD_GET(SG2044_EFUSE_MODE, value) == 0,
+				  1, SG2044_BOOT_TIMEOUT);
+}
+
+static int sg2044_efuse_set_mode(struct sophgo_efuses *efuse, int mode)
+{
+	u32 val = readl(efuse->base + SG2044_EFUSE_MD);
+
+	val &= ~SG2044_EFUSE_MODE;
+	val |= FIELD_PREP(SG2044_EFUSE_MODE, mode);
+
+	writel(val, efuse->base + SG2044_EFUSE_MD);
+
+	return sg2044_efuse_wait_mode(efuse);
+}
+
+static int sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
+				    unsigned int offset, u32 *strip)
+{
+	u32 val = FIELD_PREP(SG2044_EFUSE_ADR_ADDR, offset);
+	int ret;
+
+	guard(mutex)(&efuse->mutex);
+
+	writel(val, efuse->base + SG2044_EFUSE_ADR);
+
+	ret = sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
+	if (ret < 0)
+		return ret;
+
+	*strip = readl(efuse->base + SG2044_EFUSE_RD_DATA);
+
+	return 0;
+}
+
+static int sg2044_efuses_read(void *context, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct sophgo_efuses *efuse = context;
+	unsigned int start, start_offset, end, i;
+	u32 value;
+	u8 *buf;
+	int ret;
+
+	start = rounddown(offset, SG2044_EFUSE_ALIGN);
+	end = roundup(offset + bytes, SG2044_EFUSE_ALIGN);
+	start_offset = offset - start;
+
+	start /= SG2044_EFUSE_ALIGN;
+	end /= SG2044_EFUSE_ALIGN;
+
+	ret = readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				 (value & SG2044_EFUSE_BOOT_DONE),
+				 1, SG2044_BOOT_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	buf = kzalloc((end - start) * SG2044_EFUSE_ALIGN, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = start; i < end; i++) {
+		ret = sg2044_efuses_read_strip(efuse, i, &value);
+		if (ret)
+			goto failed;
+
+		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);
+	}
+
+	memcpy(val, buf + start_offset, bytes);
+
+failed:
+	kfree(buf);
+
+	return ret;
+}
+
+static int sophgo_efuses_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sophgo_efuses *efuse;
+	struct nvmem_config config = {
+		.dev = &pdev->dev,
+		.add_legacy_fixed_of_cells = true,
+		.read_only = true,
+		.reg_read = sg2044_efuses_read,
+		.stride = 1,
+		.word_size = 1,
+		.name = "sophgo-efuse",
+		.id = NVMEM_DEVID_AUTO,
+		.root_only = true,
+	};
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	efuse->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(efuse->base))
+		return PTR_ERR(efuse->base);
+
+	efuse->num_clks = devm_clk_bulk_get_all_enabled(&pdev->dev, &efuse->clks);
+	if (efuse->num_clks < 0)
+		return dev_err_probe(dev, efuse->num_clks, "failed to get clocks\n");
+
+	mutex_init(&efuse->mutex);
+
+	config.priv = efuse;
+	config.size = SG2044_EFUSE_CONTENT_SIZE;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id sophgo_efuses_of_match[] = {
+	{ .compatible = "sophgo,sg2044-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
+
+static struct platform_driver sophgo_efuses_driver = {
+	.driver = {
+		.name = "sophgo_efuse",
+		.of_match_table = sophgo_efuses_of_match,
+	},
+	.probe = sophgo_efuses_probe,
+};
+module_platform_driver(sophgo_efuses_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo efuse driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1

