Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296476;
	b=JAyYaouDcfx8yenIDz6QUA1RMl/aDECQZlHKxk8rZ0pdCmC7hdqikJvwI35fWocXi9fJ
	 P5wn2X6L5y5hFUoUG2Wb7thqV10VOGfp/4hmodb/qMTrwVtTEtzOURIqLSSdqEi6F+/F4
	 L78FOzjzJXAwZabY02Igv9MMfq/u4jCqU4xzTRRvog61RN7DsHjjQG7pCwXOhoINokJQK
	 G3RK45s8aTkUtKJjvPixfiymFjSuCQL5cWP+9oixHE2WVq6T9swHHQYfJZ+dNn4OI0RTm
	 fYdr8ZCUxDZHbrTZ5nJB25ONvoCXWEjvIblJL/QgUfX5YcEDcpt1vwupOdwppe+wcJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=CTpBrFd+pgnH4Z9AY2F3BvJvAsm+D2fJCvMWJtP/JpYtKjIHMlWk4SUglpmLAhMHFQGV
	 +o4liLbJXZO1deipUL+EE/YutAhvgzn6s6ciAXUOKd0GBC1sFWnUAT0cPQK4LqtReg2l+
	 l5kGFndL5Kqoxj4HuHZq467akxjiNHItTUHlWGtQDVVlGZ72+IoyjfSDepa/80YDU7ReS
	 Nb93DHON9R4Z52Okj/ZMfLqEuUCvZKT1TRPgFn5/lxNA1kAkT/Reetue+lyj4O4RyvZ/I
	 hse37p76nPTEUqT/u2L4/k2RUobyQT3WcTstYk8oUG/HSS85hNyqDooUparnTUqg0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brq69Qmt;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9810606A337
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9810606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brq69Qmt
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so24072875e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296474; x=1795901274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=brq69QmtSdY6LvsBGsyCIgmwtJxd4gvXCgAw8iEFSFZES0kqnoRxnN80CAAT4Hb8NU
         OhxM3IqTo2Bvs9qmauYl8MPUocEXyUZApW2LIiNtk0Lg1Zc35ctvcKvK+c65wALwwjj2
         RKFJ7aR8wpjuNXqUwmWtC03DTql1Vx5kLaQadqNb1JlBtAG0Yf+qFMZKEWaH5yp5cz5S
         AVkEMK5EIG3iyZv08sDRjYy/Q81xzgsxDhH5P9Sicu9WA1SCNJgln+wrAj4ZZfpamtLQ
         OCiF0jb+EuM+9GFkf4w4jaxZ35nISU518Y+3w81EZSwiz8/PwHWzKWJfOrXIMh43PHzU
         4Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296474; x=1795901274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=PnQAMdTGXw9AFU5OSTFtWwKSVmth6A7DhCv+6H9BJB/iZ69zy4NyoKMS1nWWZpwdB7
         eswOtYmXKYH8WDaUqxwmi+psbbjI3AGVkbX4AxUIQdVeYwRqhs+26agPIboOlTOvDDq1
         jSX+dii5kSIDpo4GrbIHN3C1ddlPFBg/Zfw2p2aEMOJ8wZ4JTAkMWO6AdqASmbEdplGS
         lgOl6X0Y+LUk272XlUfQh31L99iotdyJSd+14/as0NLOMuRAWCDHPsSRU1s6JSe9Cmlu
         9QM3Jhr2WvYYGJajGU0bJhc8GUcvza9CfSAsENhcuwFROeddcUw7QXHT9cMv6u7AkBoB
         7qNQ==
X-Forwarded-Encrypted: i=1; AL+hErFJcg8VAHtYmYZzxJlM2NOC13mX7Gn9i2VyliksfvDKf1uLsuUmOeup9RwJkiU+U68eUUO7yi/jUTIb0dA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qkZqqqQdP1D0S8vQ89s0JlqwfPJbcIQpJW2VnQfpMfVNbg2zn
	K0V8DJtry5UuquyEFrVTBW/5jor8rPJtemyBtwtk0d3vJaQIBU5VDyZd
X-Gm-Gg: AZFdTZdo1gpqVFQJBM3QyoEJ47b0z9+6nEHts3o9xjxYfxnUVXG0mw7v5baiLuSaPWl
	MdJWhWigLU2+gHw6zjYgv2MtPoUzvSL6GANPgqi25a2N9D8hBsjrrQe2VaqENXP8Jgtzoa5X5fk
	0Q5llQxJuM7ekIubklUj0k8bu8BS21eG3d8pwGUPgFLhqfErvbcU5R/9GOb6rP8gT9t6UrmsUj4
	8M3iDKPjL2A6/csqw3g9zyAUvCjK31W9INOpHh6mgE615RNb+imGg4qcmXhpZnBUl9+NvBoY8FK
	DGKhedQtaxhYqNstzQpb1xkv3Edqz17DJ/goXqRCLqLpBYAgSXTFFuBCiKMG04l2EVZPXC+z/YL
	M6VdZhPnHVmeZtiTHBPye5payuRkd/a683jGtCH4hJbuAtVvBLEBbK/z2aARdDn5qZPY/qtN52Q
	OWXQI7O8bHXk2o07BHQ2S6Dx2fw5TQ/Lef9lmMG6XIXnZ9kt5jdNyRY4VhSMuEe+JwCBShsVG1u
	K2OB0V2nj0DrT0zgs6tQMR8cOBHK8I77TdzuiInXJ+L74BRq4U5CkrwH8NnJYa72sodSrO3kSkS
	zm8vSKnu5oER7LGRcNvNTzPfDEpoiJzjhbmUDvSPde9yMDkkpOfZXT2IIsimZUDZuSyJaWJSh9A
	Eyx4i/WrTNRUOwJVwHiT7G0i6RkW9bTlmmF13gPHQqmQypqPoZX8=
X-Received: by 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr157077865e9.6.1795296474193;
        Sat, 21 Nov 2026 13:27:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v15 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Sat, 21 Nov 2026 22:27:32 +0100
Message-ID: <20261121212738.170775-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

