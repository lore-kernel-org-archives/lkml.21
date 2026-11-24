Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513765;
	b=RlOr+BzTWD/lTD1Fgpvaqpso3rUyjIhOksbRX5O7xBao33HFM62BLaufyr9ykwBmqIBm
	 4jTN6k1JzlVSczVmIk8K30NzkYOushYA8mUranjO7zgVoHsN8HrT5Jxw6NW2Yd2pXFJp2
	 JACJLpXOklNF6vNDahrxKhH9sgyjyYLWk4mYQe83AtlA6Ggv9oE2vPEho/qd+u+fTrvaB
	 lhrTXb9PTaPQk+Dii9y7hiXonwjpS6Ex8oIF6XplU+lyCrn4xExMPFzii2ukeuzRzeSsx
	 NnYOmfX8kMyrePDiItgkMaQ9Nd3dVwIoFgZD58enW3HYAOytOQpnC57bh5lIk1CJvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=hnZdVmGIlbYJQT19/qZgx+WTmTT3dtS4VOZ5K0EyWuY2rraX68Y2LM2/13hdg6YT0Kff
	 itTe5bKvor4YsAJBl9z9SS0SU8mwQ8O0+mQkMcCUlV0xkWA31QZDGvf6leudsP2i69NZp
	 1KRJ44HNhc1uAYaU5EYPYts97QRofkQOeOiXJw9CT+YsuJMH6f6CqL4Wlpg4zhaCofwnH
	 i2/HvtfNcx1vbgWnNnFj939Bn/z9YbrqWoXgT7CM6oeM92IZU34WqOqAPCUhLS1Ogt+7w
	 eLfHGDOrmOSY3CJQmPPxCXimVcup1Rnb7aW+5M1887Gupb3ixoNPfCVtYw4l1fNJKXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF277606A865
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF277606A865
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so33377101fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513760; x=1796118560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=Vra8ahew6DCh+xOD3B9GVIIHTWftq7Q5Qh7dUmEvAMzOoV55LkwToKUZBLTG1gL5cz
         zIOdB95FAKOrUv9f8QxF6VCY0l9NqwLtppZdhJTkmZoTMQV7xAY0euFq//1pewgqhecn
         po9Dm2dVl9z31VrI21h1TuBn8VZEz6nZNh7cEnPDz8TNbitavR91C/z8Q6k9eATDavVM
         LA9SgmWNB+wDn8RA6EwLRxadydgqeVAyYHTMnZ23YoXee1W0n8isAaVPgOn20V4i/Egd
         hgFUp+cmqgTN2/nLV0MFuNzrfoSAKtcl4Awjy7NJhzulPebr3aMxeSmGZmhVaB8qteNV
         o+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513760; x=1796118560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=AHSlMi1qURMxKRXRzrjq3WQyw5BcZE1KyxXBXbFumQPxYQJbXcURZTkZEaHS/4L5L2
         SxsHCEfPzSsc/Q0lov7OlcVE5JPXRM5gg+a5n//xfUv8wuwnY04fDcyxpbQAiOwiZhLv
         /D13/plFDvpwWbj6IqbZ8snxnd/RI4XM2A0I6LEP7finwaCmdWIl88s0oGTC2oghRaa4
         T+j+am2xFZGD1fgN1kaf267EJiOgvUGk5SXFWwbXRSTbFDi79bLpI+VN7R+u/9sbit4T
         qQgcXtKZzVaB21eh4egSPkSq9VYXDNAGJVWQyN9o51JLO2cGE7AZU5yMP0UyAfNt4FBV
         bU/Q==
X-Forwarded-Encrypted: i=1; AL+hErEKfAl+wYuRIA9H2mZ3DW8r3Sk1VUEM9h7KTXod9z6q+kUVDIDfLt0WODPnE9FqXo3ZvC+n4rDYHjpCN28=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nnl2/7S4tiAA6q8tp80VxpHNzNFeEyBb1k0XwrlKd3mcJHu6+
	AksjXxLsf26rdWwQYkZv6SRWwyLXuN8N+AQTJGx/xq+iZ28/nTQR2h5ILUsXiw==
X-Gm-Gg: AZFdTZegAzYZDT9bwE5Yyp9I2oGj4ucG8oRNYEb4hlh7y+5WIZStAsEaM49vQcqvt4H
	t7+sjAW7puvscBFoSr0Ld1HKkrrGDyouNmuNpfs1Q4yvVc+GZO7NXGZvTQ2I4Hfj0tXnk+3J5y5
	bHS6Ipphq6mKyLvCCqRph+SlfquWAVvNdS+WDlYEx2Hrcrq6gG6CMQZFJ/XIG5tg2z7Ah7D2grj
	CrkzxMoqvpw1a+0BwDvkqViENmRn6a2MOAxu9DUhaUqaglKDuacUnKQwRLAeDMpgntYphvZKQOZ
	XZ1UlAnp9Gs1u2ozzg1xPcer2ZnQECgjLXE6Qn5onrJaSmIRb2U/63a6DIQ6FIsjfQ8zmZEQQ3E
	9QocP0MfxBGITY5pR78VE3ceTDrJJH9YP+n7qn2WBVyvhgBmfidLRLLLNb4FyRoJhJ2HxRfougn
	c/rlRqpCttssvkBRe0L7mTQ1NjVR36u/E1lueQzH5XjL3IShhIYqfGIJTI/1sPM2+0zFNSTPhUn
	at/eLQ0zgxYIgqMLJoAk6mQQGcKAf4WX2Fjq5RS3nMbpifO3WihGPAebUDOPAQmkmG2NgvdYQFJ
	oy+lF3/Wtuik+BfuSZyUecrTRupWG76DNUT86KyxK51YqRQ=
X-Received: by 2002:a05:6512:3a94:b0:5be:5222:5611 with SMTP id 2adb3069b0e04-5c1bc86cfe7mr3678861e87.39.1795513759856;
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
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
Subject: [PATCH net-next v5 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 24 Nov 2026 12:49:10 +0300
Message-ID: <20261124094914.2993988-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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

