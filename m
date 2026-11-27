Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761442;
	b=iJDFIu6KuKVPASX5Y/wfTrRwQxqrrQZbkuJqLoAXWXEDVtPKjoPT4vqP7uhBlG6btNVE
	 5C25JHsjVY9hf60kFGEvWnN4/YfkmQL4lGkvMOy3slgIuZClJ6Hui4qIFyTd2yJiS+z2X
	 Vee6Nmn/kbS0QQFY0C1W281z+/ANRQnokEa4MrT+D7m0KFv/PeDUEzydrkOhTClyMvcBm
	 pxVNcwKv6jhfs4C8K3/AQ2UNwmPDXo8ELQthYJH9Ad2XhL/HOPpxBuc1bHb9rrktVyst2
	 SgptBhNVO6ig6OOXVmRVwX/7RHaQ8Vk3ZhurQg9tno8gtyv3KC9AxxXjqsZIB00UsKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=E5fHzQ1wJXI6cMtlRNm1DxhBfd1Nm0LylAmteZPQDjEU9Sobbx0YGo+gJv5R8Oq2BxJn
	 KKk6ekvpuV3zj3esf7a2RNF+gBR6n9Q3WLQNdLaoacnYUFtfdeS3uRJ7C4GN88F4y9lTy
	 qNpZEI/PM+jozhVuTFkYL7XB46xP3mD70Lm3sCS5KFtHNo9M+QtgoGQ89zvZAAtGRiDvc
	 pzclm1FJbCe0pjL9JK60LPvKPwdB/9JOftmq6Emj5YI9zzPNNqtMJ27QPM4nmILLfQ68P
	 ok6LlEON77z0Gf82pbMfy+HZ9VR9aM+ObuasMVyO8vJyXmWiwBb2N0mj81nEdKfKe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucztA/QJ";
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD6B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucztA/QJ
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso75215551fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761440; x=1796366240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=ucztA/QJ143mwCYe3kf7A2RaycBZd2xoYXbvWqsW5cbri3/pQzV93kPcHYN9CCaW2l
         bnnQmXcGSWufUwLRWXIDFAM+WQkX6R5SuJomY1IMK3SQbYT/XVX/VcTCtiqRpPM4oVSR
         3r0Ax1FV8YKaxt+rwSQo8jYYBpMRb28Zt6Pz6uutC8KtVETt3fvPjcGdJVuf/uyWZRQV
         ML19RqqoRhgfjNVj+xSLTceTW5eOy3/VT5jUSlptVfHdtOdaZKYBdBV68si5wd8ViWCd
         iyM0U9S3MHMfjBoSum/p2e3pKQpX8IAChJUayLm/CwfyRn4+qsNlxaOdvUVImhb07gmI
         c32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761440; x=1796366240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=ZPLVUHhkrtgetZSrDZPdJUYx4/TpJJZ4/pJYh+U28uNHLY9Yurum3RCp83AWaQgnPZ
         O1DxmcAC0w5VNu1PGKNOr+IGdNXUYlfTUIaw5p7ywEePndjjb+QirBRXKmylHv5qUuNX
         rBQWOwOP9DcBIJvDasOh0SM28ml3j5IykseEJkAVbzlUChr5SvrPp+Td7H/4Rw7nIbFy
         dif6RRl1b7BS93v7BQScgU+dDKKAsur9TwRil09EogZJi/vLSovz1GgWJ8YJVvRKREEw
         khvEU7NxaropaLO9oca7fgvhM2ZLtAxgoIYmr28Sdl9TMxMTZLbgm4H11TRiIFFU5NiJ
         INsA==
X-Forwarded-Encrypted: i=1; AL+hErGCW3ah4hiDTQiomkR8Q8OkjYiu8G0rI1RCNlvI2JNGvPizjOVxb59CSifPnJESFyVR8IXFBflEXm+AUxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JYaQsb7L1uew+LW6Ek/NE6mUK8avC1P56KxQdajLdHSgWfu0o
	HZlT5GBgr6y6lKu5FANGQtCebMbAVT92xvc/MLeQ2si32U/8LeTjkITN
X-Gm-Gg: AZFdTZc4yKtVS3UEmAW48FIfLV7VoZ7ajdlqxzVn/L8mBax9Ubc6eOugihaRPqKbGKE
	zjv6XW9zal8GoQmBxrrSDJf94AceDKP9gCmxiDZ9WEcsuRpA1kdgvil5mhFzDS4xzXsgtauHoRX
	dLWTc+V9BUSh/IiMHZzE9zuEFYE7QHNbFu1ifcdz32gY33luzpYPkfnq8aCdXhBzwOJEChHlAdi
	XxfQR496g8ebgFCfQ09dm6XJTiMVGfI3BkTyQmNiYn/DVKvKEDI87K/lTlfMh8HRlSrv55K0Vs1
	Y55lJUDXUQwrdnrlai8egUCpQ/8rj8l+Xcu08aIWQokN6++kpwfLv98bFbxkgqtYw5VHTKy8cJk
	+XCfma6MAH1fEr72dhRj2Ik+TduPQQDrj6AQkQRmFD13zXVoNpW0NK/7+4tooWsvvGJPL6inj1Q
	uTRbWXC96mHOla6wtZ2n9j2fNsF4N8pvMtPM/VZCHxWV5SqIez+SXivlz1RLCRVTE6nVVhx9rtR
	65e4URmEA/dAswX1Gmk+2vY1IH7Nq61arIe3gYtZf31xv9Y1mrbhdsnwPH3PUClz+dZmuZEi9N1
	a1MZ7Bo2AbxF6SKijUTqqBoAoAs9Kg==
X-Received: by 2002:a05:6512:2249:b0:5bf:cea4:b26a with SMTP id 2adb3069b0e04-5c1bc86048dmr6197622e87.48.1795761439922;
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
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
Subject: [PATCH net-next v7 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 27 Nov 2026 09:37:03 +0300
Message-ID: <20261127063708.3074433-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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

