Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353547;
	b=l/cWjI2b4oIeDduBSsdAIbMOr/RDwlirGfBf7BNrvO/IFRGThHhrxCwvZYU7W1BQg2Db
	 THebQ/jLDaLClnFPf1muRaXIiDKGH2F9KMupM4W8URfQAgsgKOrgfkxqEfyU7aMrFohNA
	 I20hcg5W7tNnWY7v+xIT/lNZpPdkr7njPwrDLHP3cnXY8kHXtGPCXBTfrK1YwLhquphmR
	 v44nd75C5/7zY5YSidZdUWQcf2ie9nOZaocGKDrQ/i14y+cPErijAqSe08qYMGCGo2duz
	 /l77iryS7WDYPlK+ttmtgfQG1xRBz03TUXm7vhZTWksnam9hPFoluwRReQpmzHviJMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=iYqZBhst6gEbLUhT8+HQux7yB0lwmr/v84QYPro07SE5zOXaAhiYS+MC4IyAlZpzpoXU
	 68yg7aazd9BJn5m/7DEYDQizrSkOHw2w34QK7IZErWoUBuszG+jlkmn4hVx+AusMMfrEm
	 4ndVZjdShcQNmbZVlM+Av3iX9OZXBEHwyHYguvb3lapEkeyc2bgWiak+HpnByrMiDCjWZ
	 t2tSYVuBO3Wc5OrZf0sJ0lE5j7Oz1vbPOc5x+VLcw6y7J4rPIQYvO/Oy1KzmLgTBaVaxf
	 Et2ms1h65tTzegPq2Kde4VHa1AxdmG1yzcDhPmCmtAa2R8g/OzsNvM7J8a0Xu6S/MRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E5606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480E5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so18860641fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353545; x=1795958345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=zNnfJDZXicFiVo9E1HRD6Wgn97zHNLVg7Nrj2zO2yQK/+VeOM6+DTQoDas/laCrJAW
         khmwgB5guiv3XpWuY+JI2VHXZ2p46zCjMzWGu39MngWb2BqmLBcb/Nw0Tu9hTp0iG2CV
         MTH9BLuAMRV4+NwHNYp1j8bxaFtKoTbme/8i6vg8KOi46LFO++5AEdG3+ckRipbiHRDS
         Th8COKQwDZaerOq96OwJwdUR5kyN2+9sR3G3K2onV2dNJrmSCG4htbBssMuwhP5Lzk6u
         iJHzpYcf6xxzRD1ubSpYD4iS7R0+Zu7ACkYALBN9zDMR4lLFWlMqLcgx29nUwHCIHCAJ
         jW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353545; x=1795958345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=1nJw5jf0fqkfIigRZ46jq13rsiFHO2Oy0cKXc9tookHjhyBO3sx70EH6NQcTiYwzMo
         dgfZWBl7x9Ba2pZQVl72S9wOUCOL9yLz2B6lkuUgjTVAx5H5hfzdr+12R5FwhgxkeRDi
         B/H1DfOEa/7BYLjqD4n8Br3ZkOnvt9gAWZ2l568+opuBVjHy19b7WjLKAtEAThohfhbT
         V6+EsZ2IuLkW8hrAr2EOFFuJ3MWGQMFo1FuVF11WM9+X5pIVfmvq+yGJawLcxmaIJEXd
         9LWWFAcP814RBae6QDwQG5JB5bN7rLB/qwEi8TMhKn13GlkXh44z/pMBJ48va/hCtX8/
         e3Lw==
X-Forwarded-Encrypted: i=1; AL+hErEW2w+hUFcN4FC7t2ALbX2FFv9rnkDiNEjCnhIrvGg4pOFUz3kWfU1hxnvPSEDMdmOt+vJ29SEL0LkWigs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aF3paJkKjk7ohRZyth2ROog2HkDGTXHYxKo44RuiMpzsvfNt+
	5q7Uf0YAhNLhMMuypaT7oh1i7pF5k/335Ilg2deKvAsBlpoqb1Zt3GvQ
X-Gm-Gg: AZFdTZeoa3GCGPqpfI2utDUIIPanDHVKDFGWOye7q+i2Wu1EU6gMgvuvzRRDznlqSI8
	Ik7VBUgEPAG0Y+UEKgFtLf85ZyNS4eG4bXtPA4rchl0CyNomv4GaWx3/QmQotrO/2plfKuJQiVI
	EcmufHFNdLkj0F7A5E8CdctZD8fi7LjyFnK3d3R23DvrVpJovf9G1lhuSM6KWeAKjDj2CnYMxAQ
	Fg40mVeqg9MiQ8auFf7lP3EjKex6kNxGpq+bh7qKOMDpspvzLLChwVL0ACPZ7ATDvJj+Jvf4OaW
	cGkT+kJUkMo6bIIL5onDGjc0yyC0Hc1zlxydd2muGlIjoNHznDPefOdagGT/8W9aZfH79ZWzAVx
	B2t7KcovPpccnZy9CNbdyjdHPU1zUY+ayEUP0pmywgqFAvcntOjKUfTeV77jV6m89lydyGYWmw0
	ODLlaTAAqxFCuIF7IjA8GOTzaj0A1iasw7uBEjQG/HgFwJxzzQM/NV67OGMmW9s+MyIyBH4deRT
	mphzhTieEJ1ZQ/XvMq055sY38MZwq6QwAFbURjIGt9CTCEiFbiTLzPpAIk30ns6VtZHSKFdKWlu
	/RgBfOeK8UdWpbghx1oINf/XUjRgtA==
X-Received: by 2002:a2e:a10d:0:b0:3ab:f43:a3ca with SMTP id 38308e7fff4ca-3ae7fa19f85mr20640791fa.16.1795353545402;
        Sun, 22 Nov 2026 05:19:05 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:04 -0800 (PST)
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
Subject: [PATCH net-next v4 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Sun, 22 Nov 2026 16:18:54 +0300
Message-ID: <20261122131900.2951586-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

