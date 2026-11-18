Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969301;
	b=aXUVi2fE7GtMnDEkbSRYeegQzZkXtPaXkzFT7IfmMyGAT/AYjkIeugHUuez1FLJcWb0h
	 nGkLfbhZqRKzoFLkccB80xgCytUG4Pm99lZIgKMtGfhLJFSySASfQ0ElMiLtw6KyhHy6v
	 l8/eGtvFQgY2H2jqMrPtOuKnHIqtFMjlBErbg2y4fLpITz2pRugVFgak2828x6Ej9XBvO
	 T4PgNmtTn9ygftOAAkDDY6n1DF0t2y028k+SBv6td+YCtsRFgS+96dB4VOFfgQPE6jPSu
	 TcjhDoBN87uimLfYFCfq3CEd6B5VnZtzk2fQ4g4junsOqOUKY0nCj8I2slqRzvdmrOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mHWggqLpnauq8V0f/6VAUKeVELzCOKPOXIB0IXf4NPc=;
	b=nU2G24kNAjzBwtM1optqEHhAvuL26mwgRSB7sni1QUR+MxX19n3Ke72gA/3XWTDrvKah
	 G5WF7gJDmrR2NeAdg/sYYeIxLiW+eyWWXz0AzlGXkowHrgRZ+bBrG01tywsiwUhx5CQwx
	 l+OSPRT6PuLUyW/W8a0RA5dP1NxZPVjz8GXT2Nxzhb62Kj2DD0xi0ImKeX7i226wMrF09
	 xAIAnjhea91Xo4h30aspO0imr9O7km/i8cOiU9bWKgElBjCBsxQf+EGCiyTpBBUyFGRrp
	 NSZeOCWI3WEx7SCrfvAzwTUPsMtmHOGo5Ti9nZ+KHMIHs+mNEhElj3lqyQdJQamqNlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgBopbYG;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23740606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23740606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgBopbYG
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3b3c072eeso223154a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794969300; x=1795574100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHWggqLpnauq8V0f/6VAUKeVELzCOKPOXIB0IXf4NPc=;
        b=hgBopbYGPttjpizSBDDYLhvsVhl19nNbpKHW5AW/Yfr/sBuasj5k4pRrIKLeV+BfL4
         rDt3WruEU/azl5Z0oit/bX/h6eCf7jow4fA/So0yFOxi6mwHa6GDG2jK/Bk8brCufwEF
         VOK21i4s+CY48i2mCzF7EsWM8jwN0+2bgKuOyDQvJlUCmUYetA0+kuy1BVWfkcFv0NHW
         TZG9aMGVMVhr3SQvYxQv9xQOFuCVoCOTKbQMD+jY4eOipypgAHPSEGO9mrPfvBLNElie
         l8iWjMftgdX23LqnzsfIHTikxC6MlgCUeItHVZxMPBFQTWrQhhAIM3dxlMTpXLgWE8MR
         uShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969300; x=1795574100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHWggqLpnauq8V0f/6VAUKeVELzCOKPOXIB0IXf4NPc=;
        b=pSiNZQppO09xRwRUx+5YrORb8XH6JhZNfiLttHEKIcAlq85G+c5HXq1yTjhd22/WLD
         BO9h+SGHx6KcQXJALHjIB+03vlaViPMBkbz/EVoDpKS9JdMOIb9YQJVRaZkonEEmhU5U
         oJOu6hL8FdCk3FUYe6AY353/dA2FH2f4gjEBWF8erQa0CaJwsvLf3zVGg8RzpRbynmBj
         1Xa2oD7xCm3Iw+YA/s8yMv/gWbliwiPW7070VolIvqHphCbJnDm33RtwccuzFdWegorV
         xFCDWuar+a3Tj7IcZcfLH3OFzyyQNg4EJziZnTJn6hTTYLxYD4jK63O9bAC8GvJRCu2e
         NI6Q==
X-Forwarded-Encrypted: i=1; AL+hErEMDGdy3W1+hVmkEl+tbABm5lYvYl2N/BTG46q2/C8eYLdK1ZZgBfF2BbG1Ao9Gwt341fRNkVgPnDAX9tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+99Nf0m9utQP6wS+7Zt9eccYaXlYIAe+v/EjQTTOAd8axbTXb
	zMHau1PvcixtOKfz1Rk6Y1PBCbYCqHBhj/uIozaDkVl6AQQKbqduMb9N
X-Gm-Gg: AZFdTZcS0BEyUnyXlk5pwo2TqbmMG33MboJ4/MlrIhZWZYrfRa3oD6YK08TjlYURaTG
	JAPPF/f0Mr9209Ff9XsgPDMmi5PDUIOA48ZCVkMbY1xsVQM9c0QdZqt+gsGnemAcX5FMdqd1mJP
	FAGfGXO9ei/5YPTdjsjhFS5rlLjTQB/gE4oPYtKweAKyvrkBLYtbfk+SdmjijpM+yiCSCH4dOjC
	mTCGbAYpF0aDG2AFmQOCzg6Hgd1LJILp/gInKdOZSG+VwLs/+iGY2hteionpipIhIflTd9X8vCa
	fuOf3sVlAJ2aCauTEFxoOB8IXmFmuvm+efV93948YU9rlo/eGxqvxP5RopmHCdD/rjbVeKm/DZ0
	kwIepWnarnAJRfCkfq9lPMl+FaAmH4nQyi47PQYMCcmn/+5zS1xgjGoEvGEjLPNARp0WIm9wVFK
	t1LuizSbPCmPkASN2yRGAgHch40Ax84KjbB3en8sixJ+04KrcthlIK0yzLaTk2OMFI7D1iOChwV
	9Gnib0t+q1S0FkGALMOnKDLvIaRPR+POd+HQ68ArHcILa+JCamDmqX1lLr8O9cC+zDePNtJClpQ
	qvJtS+jtepX/sHA+J+3dolcU8G1NK9ALiR//KFvy/yR97l+W9alSRg==
X-Received: by 2002:a17:90b:4a48:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b3d07d8066mr1199082a91.42.1794969299849;
        Tue, 17 Nov 2026 18:34:59 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56c9c2csm426127a91.3.2026.11.17.18.34.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:34:59 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>,
	Jordan Rhee <jordanrhee@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Tim Hostetler <thostet@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Matt Olson <maolson@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] gve: clear flow rule cache state when freeing its buffers
Date: Wed, 18 Nov 2026 10:34:29 +0800
Message-ID: <20261118023429.29330-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Freeing the flow-rule cache clears its pointers but retains the cached
counts and synchronization flag. A successful rule-reset command
invalidates the cache, but a failed reset does not. Recovery can then
allocate zeroed buffers while retaining a nonzero count and synced flag,
causing a later flow-rule query to return zeroed rules as if they were a
synchronized cache.

Clear the complete cache state after freeing its buffers so reallocation
always starts unsynchronized with zero cached entries.

Found by code review. Compile-tested with W=1.

AI assistance was used.

Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

 drivers/net/ethernet/google/gve/gve_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 35cf0f06a0f2..747f5229d7ef 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -189,9 +189,8 @@ static void gve_free_flow_rule_caches(struct gve_priv *priv)
 	struct gve_flow_rules_cache *flow_rules_cache = &priv->flow_rules_cache;
 
 	kvfree(flow_rules_cache->rule_ids_cache);
-	flow_rules_cache->rule_ids_cache = NULL;
 	kvfree(flow_rules_cache->rules_cache);
-	flow_rules_cache->rules_cache = NULL;
+	memset(flow_rules_cache, 0, sizeof(*flow_rules_cache));
 }
 
 static int gve_alloc_rss_config_cache(struct gve_priv *priv)

base-commit: a2239d5dbbda3a61b6323df8836f605921a29f7f
-- 
2.56.1

