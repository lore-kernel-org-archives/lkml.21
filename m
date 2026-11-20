Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162273;
	b=zRmDGrEza3ENQZv3az2knm9DTn7BkGFg5j9weP7zDoHZEsRY/UBUAAWSQ1wSSC2Fm9Fj
	 qFO877qzfobcWnyaPXPQCERVeauuBkLFYK32roTTEMy1odXUmxjpERlDdNgMdd6VxD11M
	 9fkWnaW7xIgNObqATGGa1wK22/mma3BO6thkGgSmC3NpMryiz/vntUE9dOxrQ9ZWU+s5B
	 kar1DHbI7bnIHLJDJL8SIJ6j3gwVzAOOIZ5WVJGS/ZM6YbqRPe42BYesCt1KV7pCfwsLY
	 BzVtXuOvtpEcfqIFvC91vgaNRl63tmqLXOUtQ0J6u7dN4NQIejCdBRpJaczV327uB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=iL90YS7nwwu013Ir13zpy+PFhqgYdnsy1L54kOosABMscMvarMz8DJxpfmz8EHP9XP8J
	 xfbKc2U2xCFR8IVt45o29PnENSKr1j9EkzCX6ZtoSsNevDG/n6eythxTz6FJumlETKYzq
	 pLQHjM+BMsqPoqMbxgrqtNyUGceJopaYz9Xauz3RuTUJaWk/t4bDanyZX4Ny04nkCm57E
	 tjAiOkDqCEqNeATNyq+vYZcKUGMQKPtfxq9Bay8o547tVmO3QKGGSjUkzoLM21N4smJLp
	 y6PIp4ooy8S3EKzxrk2Uu6YfpQWQ0rM9RagdOVOChfAuvKNue+UhnFwn+R4sIF0a05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C9606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721C9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso839234e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162271; x=1795767071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=w2ATjdeWwzJcMVAzYw2sUM72zVRswVEaXN6KcBeMnv1a5wK4Bz/OGAV2d1vhDrzdR3
         XSaLtIToCMVx8rbKxIZp3xo9oXR5wQRcYGMIURqLx1iNDth4AfZzH6TweIcacdUY8HMk
         bJg+0v5lD/gv2HVUCWrGxTlEdcKEVe8gsGuxfgJOmRHLC3dVgHXJaHN102UgzjEyua9A
         FBJTTjkxchlJuSxcKoMy55A8+5xg80byQe4k5CIR/KAXWb7S3ATcYExMlw0amzQewHc7
         b/Rek8VGAOvZRuuQsRPk6XWPvbOPf2sRdTn1P2oWSbO2q6I5QcHBTfH7c286B3A70ChB
         EYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162271; x=1795767071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=pE2fQOv1jjXMbsHxiFLC7Cx6jPnbBKpa48f1l57l+pBM4NwQal0fzYI5q7nEbffY6Q
         M9h4ryzQeyx2snF0NkadQ7EB8ZFRAVwgNT2c2Le99apMnM7WLEdmzfa1pEYDRaUfJsX4
         EtGhIjYV7L15oVS37or6lbSPyIxan9HJYk+R+4HpTWtm5A9f03LlFoU4oG7XMYybE/H5
         /w/MzA+sfxtO8892cd+tjRhcAR+m7Fn85PW5+0eSnNKHSVR1fROgRb+OpHgfnWeoSZ0h
         zgFZ/Hu6UCNbxUXbSf4GzGm7075NRDcy1THQiV/52j2DKuGHfxIIvm1XLidk5KfkC5ec
         531A==
X-Forwarded-Encrypted: i=1; AL+hErHp/EIFUJc9C6mINyn2uWCwSCsZ+OU4YGU5VMsJeynGbujeyvDN/buERim4tF681pIxezuCgE1BbybwN8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GbUoFRShcjIYiI23Mg76s1yyIiobunLbIXopfx7y25giJugQ6
	TZslA3v49zHYXLf7B1vmH7D/LKiXwcspP79A6cQjTcN/zajnlnmgVvVC
X-Gm-Gg: AZFdTZdMQn88jw2jhNQwke7oXh2TYQLukQ8sgQSGxczrqvqonsNl34J6xTg+j0xOjE6
	7bnsMmrvI/Vg7EAtxwE9FAhyacC9Gf4qPdS8rCZg7uQF33EvUZcDR6WfFV6IODSkev3ikZCcYVU
	XHRiMoVx2LtWa33bKscv79al79oLNTFRRcBSsbvrMrtkCgvX1AygUSs6tVf7M3bSSZS2yRDBJ6D
	9WmcebTTD+Sjjm3HRRQrdsfmfJhdlBlhzpsAFOyXZBrv8YB+q5R9vfRAzeEm/wG7ypdNaQIwy8R
	bAyej4AR8RDs7Vck7PZRTPQc1InZ7lLx9GQAL8t++rgnavpDNRrtp9+EyEKbe96bcNFq39TUXDY
	JVsfE7J0dwczgyxoK/q6rpWP1feZIc/nRkZp0zevmMqSYnDDHqU3Hb2eA3fJvSjD3QATI9Q+qsV
	l+wbY7sIc2LtDaMRCgOiqNeVQmBftsg3zk+ta7Blept6M2ssAbqKHq3kh77F4soGyqYjIQM1tSH
	7uAoBSp1ojHNB1nGrvIWOpEmcrD89xTl9xf/AxNhzgVs3LN85OBLcYDf3e5UWLetumNVpcd7PCB
	9RBcfEKe9dFtg/NdBQ1hkwcSPIiuPxebOFGK3qA4hOjS4x8=
X-Received: by 2002:a05:6512:10c7:b0:5c0:d102:8374 with SMTP id 2adb3069b0e04-5c1bc7fbfafmr636017e87.17.1795162271379;
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 20 Nov 2026 11:10:59 +0300
Message-ID: <20261120081106.2919010-2-a.shimko.dev@gmail.com>
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

