Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631871;
	b=tJO/KELD4OkPuAQbSGoIsYRpLFsq3bo6HBJBcCKkULSjQzOBLAKZKZXaY8OSrOU75vpB
	 TbKus9ASAahdcRE0U9eXi5rGPA8mkEnvDWvKlY7sLM/hhNQYx9fytL94uGh48gPqTkqkh
	 lJ87axf4Wao2GyBBZ6C/wSJhLO2Z6J+0FYqhbz9mPBB7mMwuGEyYgoWm6Jcmo3+4H9JcB
	 tu1oMR8dFLdfsWG+D7RdD2y20wGFj3VOVwpGfD+I5GJpRGEU2YkkLAa/xmBvTJn6a7yVa
	 oMwoV/jf59Bi1Te7pVaAh05cTp/DHhZDrtCHu55yRfVvIM1xof4pIyc0jzNxBGdWrmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=PsfahjIH+H/TCOD1lewXceWSi3pzr+5mMfQ/Zy/mC1qxSi+6ZY/0267wKUJHNnPKFkmu
	 df1md9ZfR+TYWA5dTJ6R0YJNFG4+yn0WE8/4OqRioQDO6dG9XMtJkuOf/ahRuU6fazgOV
	 /MC5x+8Viwgsk2ebAzb0GcAqn+kkqyaoltc3pXVvZzmrluRyj3FEp1KK656PHrzVkUq0V
	 lUH0bpsX1UueDX3QPMEw4wJ31gGQ7AwfvJ7SwuSqlHFL/LAQC28XVKWUj6Iq/Vmj7uLdt
	 hfgnx982MsP9Fk+JVTlpIG2H4Z9CqdBxasFWRlv0cRUmFZFhsDBDW1ntd+QyWk5mT+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso5104255e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631869; x=1796236669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=IB9x4XiBn42WWx+a0IBFuOzPdoDFdOA9Q77g7vg5kei7js7nO/TgRpsHZWTHGqJDGh
         lqDcuMbNXTNwIpYOPoQT4UpO4L7/bfYHXWwh6CJadd1zKFSOPi2A1B7Jgf63XAun17UU
         d8yPhsGID7+V4GH7ujTExMUsBR/5DbEMAJUSG3ojSiPT4Lwv6tWBubT4BqG/nPqJrbiM
         uhLLg15uderoCOhiArWZKExx/On0zEzZiW/G+hEvORcpjMDWfI1GeKzcutweF9kwZjHy
         uyO1j8XKq/GE2cRDEEJe7kbr6YBH+3hotZH/RzHZ9BG212rd4H+/lZgfAJL9s/tMxC4G
         enzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631869; x=1796236669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=Gc7YA4e61+xvxqZcC1eD+lxP35TY6450ZVS/EYoDddegt0BPLAfy6CtDaH/AhJR1Ku
         b7i7YltDDMZtTLD+EfxkTIbrM360sETSJSbkaSoR2ySc11Jty15qbHrC2FkTL/oLQBlG
         NVFiYPbX8y5C+ItNmJAOGBqrvStFGehbOlCnJ0K872slxc7dMzwv6kLRxRBub5gnM0o6
         RlbwXvpueOQ22HeZ1qJs1GMazCwsd5Ybj9A80ECVx1TQU+inHqVXZd9q3eWc+G8iqkCJ
         TSQf+bM8k7uJud2hafApxgSi61TlBELnqMOt7FFUhN74JG9HfKDyf3nuiJQuaXjzz8jD
         tYug==
X-Forwarded-Encrypted: i=1; AL+hErEONmY8GVE2ZmQg+YnU2JGYbf9jEjEWdne/CjFGaOaezRWBc9Ddy1Z+CEO8sjxE5tufIPPdquoHWi5vfwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o5UWA1dOIlu8wbmpaTVxnxa2LuBxICGNVQoR+siBb3Qi4Bnke
	L8t66rRIyEZk5F931H0iAZZLPCGlkq32YEaZwrTkfU5f0iCPWlySOJG2
X-Gm-Gg: AZFdTZde/vIftqkpCf0fRlqlihd/HsOoDPyhkyXPfUFR/B9sOiYIM7FvP6YB+jd/4Lw
	6Ixbp6PM8HJezCcBeAb2iiW/zDyeW/xsu205VxPSbsGizndbAT3VQmIwDamk1A21z6sKbwKmOHQ
	zSNHi9nTcgFakjFyPpYOLBcoK0fHIzaD/r5aHjz5LoZAMTPJDEsAWpxvff0GDrrlJo0TxTOY9sL
	X2Xr+XEumDmywkmRcKtAOq8eOzom0cYhB85TSXsO574xZsCfGaMdjSeBUXoYgfZX/ncd8zrbWVb
	0E8fIJn9jK7b80qW2zKUzPA+Fpb8ibMZHHXbAMvGzeNNqK3hz7C6gqs6KxeoCnobric+wYmzXzN
	bDAv5B5OuKDdb2aDt/brENiQquL2oNnWWR9XzFtfoE4e5e5tqciINrkPs+JaYQWXMerREzIAPil
	Fr6P5s0NihQto4LFXY30ZFTTKAPoKttXyxyux7GekW5+N70xOr4F7wl5igGKvxumJ67jt6RBiee
	puPS1T8fIcDc+DCHpxMyLrXI8YbLZH0pSMUh5Sco8MaLGPQE2MsFpz7A2XPmPYd7utDG2X+xZHP
	vLKOux0Ild7TGuF0JTe6bHVyD8UebqUn2hv0P18EjxUPN4FT7Sl7G/ohRSIAC9J1/6Greg==
X-Received: by 2002:a05:6512:104d:b0:5c1:5a83:2fd7 with SMTP id 2adb3069b0e04-5c1bc907072mr5651830e87.66.1795631868971;
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
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
Subject: [PATCH net-next v6 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Wed, 25 Nov 2026 21:37:36 +0300
Message-ID: <20261125183742.3039752-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

