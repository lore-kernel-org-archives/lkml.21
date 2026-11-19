Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101683;
	b=DK10NzRQu2EArLdm25ITSRpPLY2jMf+ndvpPQ0kHpzNvqz8LI9uqK73fxXWNaFu9V7oX
	 jb6NNxV8ced+LwG53pr+RjmnUXQzWo/PyVNGVW+oP8q6kJfkWpGfqK5IqiYTMv3qrqrcv
	 39DzHrzI3aRaCskA5CPgeEj4wEHPFar7jVgX42oiMmXdgY7TliYnxZeex8i2dSbqx2JHT
	 cZgq5weBcHrNBna6Tarlvg/wYJQ6/giMwZuMmfjbm8tO6Ix98NNCXtdUjTaLP82ET8ozA
	 mhaFQlitwAYjni6In7c6LiviGuf9Ff0XnoM5sqnt8+utaCidujD0ufZT5mSsM/6C5cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101683;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rc9IovJCfQ61e5vbjuwikSayGXwiC9aSST6CRLHtd+4=;
	b=smDZla0jbR05rLTSdXPNNDpcGPMcl6l20b9IQUAlMz+HA+HLfVy539VODUocQhdRrOSR
	 cu6fs1ee2gJ3QDRiYO4L6m6ndQXWRveDRjK/Bmw8a8YEdGbP/CRvnO9ked1azPnPYtLFi
	 if9WFChzgCy2PTnK3UBmaHHw7N2Va73axGHLHKqyhYSBGyfkyRkoMzyQDauVajHEEQ8zZ
	 eJ6lnlx6KoxWAvqbGL+iH/RwtbVWgkdmYB01yOWffgcxWL8H+8S+D6vIMdP4i+lAwKeVn
	 scTrfALM32hTZ760MSnrT8iW4BEZUu0eu4pfebVea3gHcB8itXmWlShd2AEbxQGmN1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=jnavfr2K;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b="S/chanQN";
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CEB60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CEB60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=jnavfr2K;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=S/chanQN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101682;
 bh=rc9IovJCfQ61e5vbjuwikSayGXwiC9aSST6CRLHtd+4=;
 b=jnavfr2K2hgtcN7qYDtL9FL2t2Yhdq+NfusegLbp/xASq03iKq5hPCJzE8aM9DqC6cfntj03s
 3NHgjBvD1ze3m5LGqbggXcIZwjjLj/6HuQ59mst1SDfoEc9B1olkBKIBbhOwKBelH/824n0qfDI
 EEj/67b5bQohDFCwy1y0EJKK7HeBWbotq9BtiJnoIINOlGYqhvegpAkA1Zz13YqE3GeBBOpkyla
 25ra65T9PAKK2YmWRmINawN49zLSMexZwq2Hd/8hi/e29dOFEvT59+3+6AhGCBx0HeLByO4tO2l
 xK65qib4KftTp7JaBYZ4Ez9G/EdPH8yF7M2/1IE0N7qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101682;
 bh=rc9IovJCfQ61e5vbjuwikSayGXwiC9aSST6CRLHtd+4=;
 b=S/chanQNoM+mviMQrwZ2jlBHd7nQ5GT2In7SMJsGrefPsHJcz14YwVVfz4ooAIg13BowcJtob
 QaRtyOQxseSdh3a4otCy4ua4AnZ7CjmnbOPWpilZWYbrPCOWdqRB9x9f4PjuU3QYpEwBv7jzf89
 boZIlfz22u5b2teDsHvGgNg=
CFBL-Feedback-ID: 6aff13f183f3cb488062baef:3891808134843f152c0d8149263de5be
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13f183f3cb488062baef
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 7/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
Date: Thu, 19 Nov 2026 15:20:50 +0000
Message-ID: <20261119152055.556266-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
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

Luckfox Lyra Zero W is a compact wireless development board powered by
the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
peripheral expansion.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 651da02cfa51..49c61ee985e7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -866,6 +866,7 @@ properties:
               - luckfox,lyra
               - luckfox,lyra-plus
               - luckfox,lyra-ultra
+              - luckfox,lyra-zero-w
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1

