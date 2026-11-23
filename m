Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466057;
	b=xXPbs84s1zE3iZzXhYJFOxkfddpSNYXEenW3Y2+pUvzwo95uy1/M4F4wD///teHBIfeg
	 jY/tUtW68KQ/J+qtW2RTjLPjhlyTHmMt3wOdLKD7JtMPCuKTHuTLCFbwlwDUwH72crT4t
	 BxyYclDhl+d8P0JtKOWxkxHXyg5ujZINKh9ShhvOiTZ0UcIXT2or2fE/922iup1cAw8Ly
	 Dj1+kW26m5H7nmKoTNlmDUP380eX328m4QMrPHnJuQsCFeiu4SrNS7BrXTD7IRUgAUtO2
	 8IZbwy50IoIPyAWsB/uWNFjSOsWUXB0NgSdlDeCPaxig1WLEIY7xNAdna8sglgSj+HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hPT/ypmWmLMxLtJbyhU72b/6yrEAVjSw6rFwMDxvsHg=;
	b=hZO970FlXxIEMFhndAdGqNeHaEVWTcQszvQKOLRTthhltSNja7/g9vRgeCgDIbJVcsUc
	 yEMeOXRhEdabR2GRECWH/Wsfo2PxA7iEvAzY0vjm0TIpzHfaaOjq2hmn4FgWxaLxh/8QF
	 Zpi37PTTP16uWySgfXWjkZxOZpAMPVDPocWTLzzIpjZII8YT74c3c/eAx2wkSvq4tNQS1
	 ClJY5vizf+cjvgW6Sp+0xjmxwPcJ5pBW/nbqnodUaEItDK/bxYdnt2kJQ/rdZC9+5oAGh
	 EAWXUWI059Tszet3X1pcDXpOCHYGe8a/3x40IkR9u4fErqAZRthHZ49nPvHb+Q2SvYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNYlOwFm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACBC60A262D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACBC60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNYlOwFm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so37040545e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466055; x=1796070855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPT/ypmWmLMxLtJbyhU72b/6yrEAVjSw6rFwMDxvsHg=;
        b=VNYlOwFmrm+wLhEGoOMDJnlhb33JACLnJI2PJY6WoDx/+lw/0L8iwubY+Fe1T5seGq
         uZOpHDJ8XNVSvY0CRcJTzls5ESPF9EJEteQRXiQCQXzG5DSRDqmPkOfoqugitUOKR8ti
         h88EGkLgbTcUZz5hMLVudh2rLEHCHdcx2s0zsG6oPyJk/ijyqvJBXe0CJGxMIoIKJsXv
         ucw/jA1j/R0pu+1/mT5GuEZdh23/cy6/Hp8C50+7ByE2ZlF3+vtEl340GDeE5NaXFKfS
         wCVXj4rqIfT7XGkND+GsqDdX1A8i8BuGw5pjL+cury/90Nswk4eah2cqRYyqMffqhhpi
         mh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466055; x=1796070855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPT/ypmWmLMxLtJbyhU72b/6yrEAVjSw6rFwMDxvsHg=;
        b=F0O2N6eMWH5NjKu4UJkhqgPeBhIWPlpuuCI2HAzijElhztdcJTd+EfBdCb4pUacVjc
         U0pIkkb4cq0eWjrbEATXdBT0eqXHtPEjCGjWwxp4Gsiy/LoEXjUI/QsFUF+gSzowbS3q
         LDqGFPNTR2kzeHyPLUKeYFcEU2ClnFL6zKf9Sd7hj/OIfGQ2wCGs0kCSuGjdI4HlpyXn
         8hTUU7k5hOKtBU3pvTM9KBxUJ5bNUIabx1KDjzfge0oMM6pUqwmOhgdDoec0LTGG2V2A
         KuHSe2jWwWS1ZFv2oH8MV8U4H56VfFNiz1FIVdvOODJilR6S3dDjrQbTXrHUmwVWkp3K
         X6jw==
X-Forwarded-Encrypted: i=1; AL+hErGYTgIZFpA/8IZt8mXdUD0sTgcEdGEiyDzJ4HtDXzG950dzFhv5gvfaboR/9DoXlynkSMAUEls2IPu9P6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V3dg4TRdEaAmubrRUJIDJxum84yUb9JXB2BQOjRs98AM9aVjx
	jsdJhxXEXGHUGi4OUYxXVd2gYY97AmkPH5hKAhhMNY6xX1dQxCWv/P52
X-Gm-Gg: AZFdTZc5geEEQLJAwaS3Y9xiuy5PmjQo+MuBTEK0Yg7KV2zunYHhv3T7QLvqrdnD4dG
	VFrWBEvm/MkdhwDvW7FUoW8HxpW1bEFLIg73eDI0fyPFd/UFUmIunXtC3wG/wIRStwyIlQPMzZj
	3F3bHeuuOwQjLbEG8nOfXB9xQYHdnCMj1FniHUCu2TUhgkTKtQdQvjaGp9HplZHoWeQ5X+JWVhW
	jOwvJ03zcTyqGrL0yNw8TUKgwAFDIjaa48M6icUPaLXZIDXaPqHvyY6KZj3PdoJ691XwiFhMHti
	7Qq+HYOXcZTGJsn5H00Oz9dvcgIRGNGn761PsjhVk+o0cDYF0TICC++72Cu0sB3SSLs5vRpkZNl
	o3fw2Z3ZmFAnWEQDwcLxE8eykh9ijOgV9L/UBypnHPQWRTA6d6ky0qfJYacNiQiS5hd7n7NBVze
	P0iL34oumWYQ7boKqVZ0pCgp5th3nLVshIaEmSQurZJvZ/jobntQa9DPny51/ujQ3U6a5VSy6sd
	5p1xLTmN5K3Detsg/UudyMWbtZ3nf2AiKO954roPvFejijRXOxxd7zbarzVg2iqT8CBNsWjoW7p
	l2wpAGisPjYgw+ZjbJ8fxSsIWGPBlg==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr271461095e9.32.1795466055465;
        Mon, 23 Nov 2026 12:34:15 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:15 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:57 +0100
Subject: [PATCH 5/5] media: ccs: Apply rule-based manufacturer register
 blocks at stream start
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
Message-Id: <20261123-b4-ccs-imx376-v1-5-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3499;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=VfDCx66Bt9Q8ssDuqyaFOOZuxp5MaGCTsBGPv8t+RG8=;
 b=NAftwknVuWdeZhsZgh/6X5zyWUZbkl202qCbHJEL29BwWA0IUWx/7BgmqO5i80iqHzD4qKiJ6
 6mHO0e+HqvVDk176PadruzQefMIA//D4e/+mM70fA0XvtZsNzGlkz6V
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The static data rule based blocks were parsed but never used. Before
streaming, write the base manufacturer register set again (undoing any
earlier rule) and then the manufacturer registers of each sensor and
module rule whose if-rules all match the current register values, e.g.
binning_mode, which is already written at that point. This lets one
static file carry settings that depend on the readout mode.

Tested on a Xiaomi Mi A2 (Sony IMX376) with a static file whose base set
is the 2x2 binned mode and whose rule on binning_mode 0 holds the full
resolution deltas: both 2592x1940 and 5184x3880 stream correctly from the
same file. Without the rule application full resolution output is corrupt.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 72 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index acea07d906f3..db98590c1ed6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1620,6 +1620,72 @@ static int ccs_write_msr_regs(struct ccs_sensor *sensor)
 				   sensor->mdata.num_module_manufacturer_regs);
 }
 
+static int ccs_rule_matches(struct ccs_sensor *sensor,
+			    const struct ccs_rule *rule)
+{
+	for (unsigned int i = 0; i < rule->num_if_rules; i++) {
+		const struct ccs_if_rule *if_rule = &rule->if_rules[i];
+		u32 val;
+		int rval;
+
+		rval = ccs_read_addr_8only(sensor, CCI_REG8(if_rule->addr),
+					   &val);
+		if (rval)
+			return rval;
+
+		if ((val & if_rule->mask) != (if_rule->value & if_rule->mask))
+			return 0;
+	}
+
+	return 1;
+}
+
+static int ccs_apply_rule_list(struct ccs_sensor *sensor,
+			       const struct ccs_rule *rules, size_t num_rules)
+{
+	for (unsigned int i = 0; i < num_rules; i++) {
+		int rval = ccs_rule_matches(sensor, &rules[i]);
+
+		if (rval < 0)
+			return rval;
+		if (!rval)
+			continue;
+
+		rval = ccs_write_data_regs(sensor, rules[i].manufacturer_regs,
+					   rules[i].num_manufacturer_regs);
+		if (rval)
+			return rval;
+	}
+
+	return 0;
+}
+
+/*
+ * Apply the manufacturer-specific registers of the matching rule based
+ * blocks. The conditions refer to registers that are already set for this
+ * stream (e.g. binning_mode). The base set is written first, undoing what a
+ * previous stream's rules may have left in the sensor.
+ */
+static int ccs_apply_rules(struct ccs_sensor *sensor)
+{
+	int rval;
+
+	if (!sensor->sdata.num_sensor_rules && !sensor->mdata.num_module_rules)
+		return 0;
+
+	rval = ccs_write_msr_regs(sensor);
+	if (rval)
+		return rval;
+
+	rval = ccs_apply_rule_list(sensor, sensor->sdata.sensor_rules,
+				   sensor->sdata.num_sensor_rules);
+	if (rval)
+		return rval;
+
+	return ccs_apply_rule_list(sensor, sensor->mdata.module_rules,
+				   sensor->mdata.num_module_rules);
+}
+
 static int ccs_update_phy_ctrl(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -1993,6 +2059,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			goto err_pm_put;
 	}
 
+	rval = ccs_apply_rules(sensor);
+	if (rval) {
+		dev_err(&client->dev, "applying rules failed (%d)\n", rval);
+		goto err_pm_put;
+	}
+
 	rval = ccs_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");

-- 
2.56.1

