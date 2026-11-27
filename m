Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797672;
	b=Z4RBkpVz1ePjCKFhPQOwMwKFQpiLjx6lLfSoT8nTiAJf58eXkD7VRl7HsQf0XESuxhGH
	 Xa651OBIlVUTPm541WSHvDSTEoDuK5e4/BP4Ynk7zysJOt7gyy2hz6ilyM45U0UBe4048
	 muCltOAPckK73A8UK1x5yXCvWnNzZHte5T8bem5pESv1E9PoxVaVu1neWY+ur/NvgsFGP
	 xXJ4c2d642s2zq5am6GJ69i/YItzVMIwYM3JEJHinytiucQMWAkWwsZAYsAXI4Wk45BSL
	 pY+CD2XNDKQXsk21oAuprdCcWV7r8XJvHjBskoCvHYCQqy9dy7PD01IvZN+khcnVuDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YYIF8RkppipMffW3zldT0xJTZtUWxbFsBpGgswJx78w=;
	b=isvwPHWCHK0vZfdqRjUYUGI7zU0lZHTMIEljQB8T8ljJQimNbVAq1oOuLMkqak2B7e7s
	 W+YAT+VebZKFF9BC9i1BDLj4RIxb5GT6+phJxbOCnUsh6e6r3YVEYJFPy4j0L9emDO6jg
	 +/ERFY7kDXIzRNmCOy8mhU3SwJQvvuneqiHYua3jNSKpeGS+XUhbO7KsSNqy1kYfLekLB
	 5fJn2vskt1863sq420EWHGbXPcdovGMJJA+Du+jbr0viNINzRgA41KJ3AI/ESjha5rhGN
	 7DAii7jSmq8ZoMWTam/ukIULYH7gx2YqaZVZ28M7hfCz+v7oR/D3I7wNTPgq79p5VsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pc4ovEOp;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6BB606A685
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6BB606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pc4ovEOp
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1670994766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797668; x=1796402468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYIF8RkppipMffW3zldT0xJTZtUWxbFsBpGgswJx78w=;
        b=Pc4ovEOp/BxdNDI6dFhP7NheFnyci70UY8nO0IX3hxATyxO686GkP13/76Tdz0Pbnb
         ElLZ3q+owyYzeTSZF/Wd05n77ROtwGo327SddnLQDP5OBvAHciPZsOLjLTYNOHBwFaVW
         h4MaAL8p9Ipo4W4aYt5/U0Mupc61VcXnJqN41enDLL5FjB3C/Itq4Vms9+1I8An+98j7
         nQzk7l2bUQudUwvX54EnDdpktgcmU9zcILGVTEbNxVvULYZYAVJMEFnyy2yqxb1S7Z/0
         03A4V/BPqNzLUqOtMFwEb0hEZ2vO1SeZobtNHbsURUkRHegOTBlX+UN0MbvbfJB6bJ29
         So9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797668; x=1796402468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYIF8RkppipMffW3zldT0xJTZtUWxbFsBpGgswJx78w=;
        b=rtjrAnM4Q4UdDKJ/Z1Iu2JMiiLShg0zRLuQ+Utn8ISUF+SE9sy0Q4sxW485slc2+O7
         IFaGJ2TgD+k83FyF72AtNm+oAEqzELYB+J3ImAi4+ovOXFBetamSpU1tX0PEoeJrdo7Z
         l9IoYBHt9nFoDQJe8vHqJMgYSeVXnipU7J2eArLsIZlkAjjOId/kXfZlwTQKOT68B5fc
         DTE4MEfl8KDDGDxJW3jUyy6V5DLQUimq/eT+ZVUyCuZGN96tC8pUJUNzw5pVKOY1cI/C
         hjUEL2rtZRXBGtn5dnquvZk4SOfnvFSx6FjQnad+1POYXC4ouXlKV8BVMnqBF1Unn4gU
         vQpQ==
X-Gm-Message-State: APuU4Z+aOfw6lk+/ooxX2t0Y08PDS1kKadlY0566ezw/nPmL5/TQ9hql
	gfu0bl6jLRVZJcH5mT4AgLivjAOsK44h6fUnGTVkYWwKaxlLqDxTlECG
X-Gm-Gg: AZFdTZdnWvLiG/pcarXSnH1qQfOvGZWl5+1pmWyvaxPJqm4YTShgXxmwqoZv0egMJQT
	qOwuBnkNNOeyaV43VlRXoOyumhrOhicrYwwerNiASZzzDSJObZjunxA9IM6RYbxodhrly/uG4gz
	Pgo7yPdb5p6bz2ar0afmoOZ6KHryaq29oKGgYJnJuMuaZY1MgPwkkOzPpKlWcZ85BPnJOHYzsYo
	4zflhhf428ucp5YFEF/mSERWjrM+dsC1eT5WjmBQpJqFQ3rekO++L8qAzexTozWjCqob9cWFRAP
	uHXICNECqkD6h7MYjxQlQk3KVxkshwMIpmEJh8zYxFG35JtqjwKKlXm4epUYDeRcAFlabZ7mlwS
	7em25VUSO5mTuhWIGTu3jzPzS3X4kI1NrV9FNzGDPI2xkyie+uA0h2PS8gh0yAQZqDQP9oUpERO
	Lw+CkaFdh6vRkW1cr+OFSdfQ4ozYgUmtwg0yed2APfJfJ7e8jGCqNr2+e6Ry2R1Uf8RmiPJhcNl
	14zjMAuuekKMrdnU8c3hCjaKGgFkbe+NOpB9dbH4hHWAgyDfgBnL10S3D+0MXGqRP71fV4nU0d8
	HqgylhC2ELmUMQKhxA9JFxn+Qw+/z26pIKuFDaVrclNIz4TcvOU9ZJ69BdGLJwwkQwDsQeyw4hM
	9lrG9xqTtjy6edc3wrGbqz1tuB9p71hOl
X-Received: by 2002:a17:907:6d22:b0:c45:219c:7fec with SMTP id a640c23a62f3a-c51319bc924mr2316260366b.27.1795797668126;
        Fri, 27 Nov 2026 08:41:08 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 5/6] mfd: max8907: Add ADC client support
Date: Fri, 27 Nov 2026 18:40:43 +0200
Message-ID: <20261127164044.285910-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
support for it along with its regmap and interrupts.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 74 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h | 53 ++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index b511c57026188..103294c76b97d 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -113,6 +113,48 @@ static const struct regmap_config max8907_regmap_rtc_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static bool max8907_adc_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max8907_adc_is_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max8907_adc_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config max8907_regmap_adc_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_reg = max8907_adc_is_volatile_reg,
+	.precious_reg = max8907_adc_is_precious_reg,
+	.writeable_reg = max8907_adc_is_writeable_reg,
+	.max_register = MAX8907_REG_TDIE_MEASURE,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_irq max8907_chg_irqs[] = {
 	{ .reg_offset = 0, .mask = 1 << 0, },
 	{ .reg_offset = 0, .mask = 1 << 1, },
@@ -175,6 +217,20 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
+static const struct regmap_irq max8907_adc_irqs[] = {
+	{ .reg_offset = 0, .mask = BIT(0), },
+	{ .reg_offset = 0, .mask = BIT(1), },
+};
+
+static const struct regmap_irq_chip max8907_adc_irq_chip = {
+	.name = "max8907 adc",
+	.status_base = MAX8907_REG_TSC_STA_INT,
+	.mask_base = MAX8907_REG_TSC_INT_MASK,
+	.num_regs = 1,
+	.irqs = max8907_adc_irqs,
+	.num_irqs = ARRAY_SIZE(max8907_adc_irqs),
+};
+
 static int max8907_power_off(struct sys_off_data *data)
 {
 	struct max8907 *max8907 = data->cb_data;
@@ -227,6 +283,18 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
 				     "RTC regmap init failed\n");
 
+	max8907->i2c_adc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_ADC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_adc))
+		return PTR_ERR(max8907->i2c_adc);
+
+	i2c_set_clientdata(max8907->i2c_adc, max8907);
+
+	max8907->regmap_adc = devm_regmap_init_i2c(max8907->i2c_adc,
+						   &max8907_regmap_adc_config);
+	if (IS_ERR(max8907->regmap_adc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_adc),
+				     "ADC regmap init failed\n");
+
 	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
 				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
 				       &max8907->irqc_chg);
@@ -245,6 +313,12 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
 
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_adc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_adc_irq_chip,
+				       &max8907->irqc_adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add adc irq chip\n");
+
 	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
 				   NULL, 0, NULL);
 	if (ret)
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 9865ae52877fd..ac4532d172331 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -153,6 +153,51 @@
 #define MAX8907_REG_MPL_CNTL		0x1E
 
 /* ADC and Touch Screen Controller register map */
+#define MAX8907_REG_TSC_STA_INT		0x00
+#define MAX8907_REG_TSC_INT_MASK	0x01
+#define MAX8907_REG_TSC_CNFG1		0x02
+#define MAX8907_REG_TSC_CNFG2		0x03
+#define MAX8907_REG_TSC_CNFG3		0x04
+#define MAX8907_REG_ADC_RES_CNFG1	0x06
+#define MAX8907_REG_ADC_AVG_CNFG1	0x07
+#define MAX8907_REG_ADC_ACQ_CNFG1	0x08
+#define MAX8907_REG_ADC_ACQ_CNFG2	0x09
+#define MAX8907_REG_ADC_SCHED		0x10
+#define MAX8907_REG_X_MSB		0x50
+#define MAX8907_REG_X_LSB		0x51
+#define MAX8907_REG_Y_MSB		0x52
+#define MAX8907_REG_Y_LSB		0x53
+#define MAX8907_REG_Z1_MSB		0x54
+#define MAX8907_REG_Z1_LSB		0x55
+#define MAX8907_REG_Z2_MSB		0x56
+#define MAX8907_REG_Z2_LSB		0x57
+#define MAX8907_REG_AUX1_MSB		0x60
+#define MAX8907_REG_AUX1_LSB		0x61
+#define MAX8907_REG_AUX2_MSB		0x62
+#define MAX8907_REG_AUX2_LSB		0x63
+#define MAX8907_REG_VCHG_MSB		0x64
+#define MAX8907_REG_VCHG_LSB		0x65
+#define MAX8907_REG_VBBATT_MSB		0x66
+#define MAX8907_REG_VBBATT_LSB		0x67
+#define MAX8907_REG_VMBATT_MSB		0x68
+#define MAX8907_REG_VMBATT_LSB		0x69
+#define MAX8907_REG_ISNS_MSB		0x6A
+#define MAX8907_REG_ISNS_LSB		0x6B
+#define MAX8907_REG_THM_MSB		0x6C
+#define MAX8907_REG_THM_LSB		0x6D
+#define MAX8907_REG_TDIE_MSB		0x6E
+#define MAX8907_REG_TDIE_LSB		0x6F
+
+#define MAX8907_REG_AUX1_MEASURE	0xC0
+#define MAX8907_REG_AUX2_MEASURE	0xC8
+#define MAX8907_REG_VCHG_MEASURE	0xD0
+#define MAX8907_REG_VBBATT_MEASURE	0xD8
+#define MAX8907_REG_VMBATT_MEASURE	0xE0
+#define MAX8907_REG_ISNS_MEASURE	0xE8
+#define MAX8907_REG_THM_MEASURE		0xF0
+#define MAX8907_REG_TDIE_MEASURE	0xF8
+
+/* Regulator stride */
 #define MAX8907_CTL			0
 #define MAX8907_SEQCNT			1
 #define MAX8907_VOUT			2
@@ -166,6 +211,8 @@
 #define MAX8907_MASK_OUT5V_EN		0x01
 #define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
+#define MAX8907_MASK_INT_REF_EN		0x01
+#define MAX8907_MASK_NREF_OK		0x10
 
 /* Regulator IDs */
 #define MAX8907_MBATT	0
@@ -226,6 +273,9 @@ enum {
 
 	MAX8907_IRQ_RTC_ALARM1 = 0,
 	MAX8907_IRQ_RTC_ALARM0,
+
+	MAX8907_IRQ_TSC_STICK = 0,
+	MAX8907_IRQ_TSC_NSTICK,
 };
 
 struct regmap_irq_chips_data;
@@ -235,11 +285,14 @@ struct max8907 {
 	struct mutex			irq_lock;
 	struct i2c_client		*i2c_gen;
 	struct i2c_client		*i2c_rtc;
+	struct i2c_client		*i2c_adc;
 	struct regmap			*regmap_gen;
 	struct regmap			*regmap_rtc;
+	struct regmap			*regmap_adc;
 	struct regmap_irq_chip_data	*irqc_chg;
 	struct regmap_irq_chip_data	*irqc_on_off;
 	struct regmap_irq_chip_data	*irqc_rtc;
+	struct regmap_irq_chip_data	*irqc_adc;
 };
 
 #endif
-- 
2.53.0

