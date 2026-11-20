Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162277;
	b=eABU/umldDlQUvZFyxuGUZ6VzEDxsq+3NuwV8KXpFC6Pt1+Cleg0THTowNRVjuRJD8Uq
	 yTSXoQzlGM3WWci+Yfet3kjIunH5o3WjgHAGLq/iHgsmuBV6XW1Vz7Bpst72/NLMtZZLO
	 9u9CDVk9e9Rf6znOoB1BFpz3xZUvT6QRpdD2vS3i5f7kXCBGP04wYb0ri7UDEe+lyciW7
	 fVwEYZEOVdXIgSnlTuKEtbRDzNqxDfdeMtbhuuY3265mqc7yK7uQdkOij9BMl7/DBVAlU
	 5u4tTdd5QXRwnRLUaF0ZK0INg0H/5CZeAiQ5FawAbs+McMt89R8XlUrTx5onJE4vMxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
	b=UW1VUb7hkJtU6ZF/xlxG43/5WLiGDdctXBPBnTN976XI8MQs2Rhk+nX8kQKk43LhmysV
	 EQoShum+MqUWjNIxDoPUzmeYEEXaGDLLwO9ruWVvcUYalJ0raBgFlBbUz3XmWcAcJJi4t
	 OH7c2SrwFfxb7eotuAtHWMT54nVqrwNVVfukc4yBlhLDOPRFKG8Z+i7gq4XyMmYcydfE0
	 tYv+BW9TqAEw/zaeblK+/GAiQbY0E2GWCJgZLtCX2ZgW2DiE1XVIS17+a3zw2uM/cvMiu
	 2+fsGpTyhu93guQiSu8L36LqB0Ijl4b1qxRILORx4PhiO6thSa5GAzQ0k+tEUC7uugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4B60A2623
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC4B60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1479a959aso439346e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162275; x=1795767075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=QlGQhOdbE9NngEZTKzmX/WF1nHcSSb4OcwlQqHAtJIG9zxODsZO2QxDPtdr7iNgg/5
         +8ia7e6qh2p/ytD6nJf8fLUo+VM8LrevnzLN9NtX5Q+wn0tJhdzlozNcicBA6rNM5L9t
         16L1WWAN1Ot62Yc/7Yq1OzRx1Z47FOBaJEtf4we/quHuXyE4zOO1hX2qio8xM9WiuQUG
         oWwgJ/dUxqtloojIbri7GhnUkn1DkImLQ31ed4oep8DhBMY3kznEYn7T3l4bbunkOPET
         b0Yd7bXN2lVP1/9eE4iYNReoLbiy82IZJzIswPPJHQ+4M5tq0RSQlrBCjAgAWAziCJpI
         x6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162275; x=1795767075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=IuVNPYglQ+UEAEfIiA7j+4miGxrxxmUku4Tpvc2tjyblNCRXpeWg/ZqwP7GIci75Wc
         0XtUjTIBxRz61wPwY05PKMmDqmKOKvtNWiPU+otYr/bGLH6jlIwOSIW/RcLh71qz3DyI
         eQ3VOeZk7D1dI9O3nm1os35iGWkLMtjbfRxlD29qhZsTo/l6palNCAE2ZtqW22NREn6Q
         qqj1vWH0o2/dS+RpIYqIrvumVG87LhgGx54sSTX3Zaj0jGjinVGyyDXlOpBho97D+adB
         KGHPv9MmQGVJgdcndfDdrWv8gxcdgnQhDHuAzzca5hH8r6l9fpcI0t4Ec6JiSjS/CqjC
         Pu+w==
X-Forwarded-Encrypted: i=1; AL+hErEDsPnrPr1rx1pCHkLWIomsjeKKXA9kT0Kk7BftGURFnk95ajWMv8EmVyphUZD+5wcB6C1UQaInZL2bDK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V+ta+hr45jrHgjD35PCtFNU63G8hDNKfTqJ5ekcxzwTT8KizZ
	dWZjdOkhEdcHMgyOCJN/ifhTZuijBqPVCQ9qThTNkDyCWSTu4d1+Th6B
X-Gm-Gg: AZFdTZdPlvM6GT4YHyataIRCxB1UyZwWJTkfa713aVafrVVucPhYd0PRcC3rpZa31Gu
	sxQmb7gAdzuywFxWrI1U2wI3JyKCRR+QVaXupRr8PMvCC1NFwaE2YroE0aDoadt3IjIyjYKsPOH
	jrJ01evtU4IGzzP0NXsObSZee0ypL5mDR61BOotr6iFl2SonwoP890olnpz8Wnwv46jn5Zd1cy+
	l7rnMGKi46afMg6RuBVQ06QYPfmGqNChaV9yaNEIogoEkmZH2bwebFouD6q0tsNaYx8hS8dh0cV
	DPeJA+5rlFk/gi0kkFRDG4+vLC0DB0GJIZ7t0LQQakExl0+LTBP7V19dABWeVsEd8hrtuAbT8vP
	mVO2Px6MJTNvwA+Q1dwVOWmnUAP/tYeYlYypXbnO7yrxyNFSoXbIunHmKq2WfSVoUb7Ayy3bxk6
	W0Sp6wBDXdgjSkn7tE2K7VJBN5I5JTP8M9p2dqQdw2FpMyoIVZyxvOmTxC90fbVGV7lyy3D9p0u
	xeXJ7dlBvMs/3NRlqSAlqpbGntIXBzTfmDA+1w7tSins1XPyeqBpMUw43/u9K3ZJkU77A3gmdyC
	AR4QcyAde3j1UiCs6h9A9KDtORg1/J/moH5qoF5eDzrkiL8=
X-Received: by 2002:a05:6512:3503:b0:5c1:4a42:fb07 with SMTP id 2adb3069b0e04-5c1bc84b95fmr690376e87.64.1795162275265;
        Fri, 20 Nov 2026 00:11:15 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:14 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 3/4] net: phy: dap8211r: add extended register write helper
Date: Fri, 20 Nov 2026 11:11:01 +0300
Message-ID: <20261120081106.2919010-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..f626b43fdee1 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -87,6 +87,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
-- 
2.43.0

