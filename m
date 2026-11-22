Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327296;
	b=ixWIJy2qYZRWvJEZYK6MUoRpPck1SF5ZqxD7k95WFKCx/ZtX52mYCR3c0TVgZWY9aFxm
	 TRH+cx8H35Zulxyz/zO5vBUWVAIT2aNKKTHePJk7Fnfiq6s+JIyeb3K+Y80HqsK9Sy2d0
	 CBn3QFyOCN1bGUm5aoyJ3bkhOB5wjBMztMGKiLCE5f1DRg52tdVZ/RO3d9GVO/qgrLaTv
	 JPi3KrsZb/Vy1lPN0gX0qYUoow6v6eOmEWg4Gx50AQ97hVvxVRPIB4M+a5MYxEYQhf0bb
	 VB4w6ZDgaTqqdQdMCdpmz9litZFmE0oOVu8Jo90KpT0Q+ANgTnaKnkFtJxud6aXJw6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327296;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eN0oCpWpCumvmeNPzEEeEhK6pL9hBNoQmVPaU07OxmQ=;
	b=g1d2vHQ45xtC7W0WulEXc5qxyJ9/Gm8YNeikiZV9T9CF0rW7cIqP54xUfLhNvlSl9+C3
	 XMVAsSmO28AKciJwjIGbJU+GTJcOXyGllQssCSt6RgPupJTNGALw8dR5DpiMHMgi/mL2j
	 ZTswRuTQS7W8ZHTBdMwMQwTWwRILW4jAgGz/ZVksoJpHxl87tma+Uh286BVY725kZWGLh
	 gyrPHsncPInMjIpd3po/3hTtGsaZIjlnXENrRCK+DcYvzaR9yHhgReFwZWe1mxrNP7bXT
	 Myz+lkH/gtv0cFTUyTJR2pCspcSrhWDpF64mq67qJrqKesgjr0uoDgn288X/dodKJQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=jpEtY1j9;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=FJ8I14c9;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE13606A68F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE13606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=jpEtY1j9;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=FJ8I14c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327290;
 bh=eN0oCpWpCumvmeNPzEEeEhK6pL9hBNoQmVPaU07OxmQ=;
 b=jpEtY1j9GQCYhTQLXkw3hqTRm3xwi9I8O2uiH1yst2FimjASV1bb0tKi0zMZgLIrnnFwW2byc
 1gzc/sSqo7Z+xqtmDtalIP9nTSF0pL35pQGqealmTzqkT8z5tiJUjnOV2mDi7CuYiEu51SRT/KD
 seqFqDssxUUPaJBMLzFxM4VZ6pSuecyhQWSOEzELkKaBVwJ3MfBPIaFztz9ApoVJFpmzSaXMfEe
 aoRkh5huGyfOme16EFeoEkpDCEgc4dIsbqddngSAe05DHUGIDwihaxBpYWCbbDJyRkkgtJ9VbYN
 +SCey9p8ujGpsB1AvUIOCSkkKsjcOnfBeuS29reywC7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327290;
 bh=eN0oCpWpCumvmeNPzEEeEhK6pL9hBNoQmVPaU07OxmQ=;
 b=FJ8I14c9dtmmuH+T/fA7VSDScevL+z0T5hP23P0oA4+B27fZrQAXJUiOlhwrxvNupN0oTRKHp
 Pzs9waZchSNTdimNV+0j0oRthwoc4Ot95wK3lEhCLOt9vFKDIFVA4bENCjkzksJmCdrI0mYOb9x
 jRYtxpMdugVi7kFHKbGzc3k=
CFBL-Feedback-ID: 6b02853acff95ecda8c093a6:5a2a3aaf4a95b445a62476d8f16bba92
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02853acff95ecda8c093a6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.37
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
Subject: [PATCH v2 5/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
Date: Sun, 22 Nov 2026 06:01:08 +0000
Message-ID: <20261122060114.773624-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
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

Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
IO expansion interfaces.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change

As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 37321e23b087..651da02cfa51 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -865,6 +865,7 @@ properties:
           - enum:
               - luckfox,lyra
               - luckfox,lyra-plus
+              - luckfox,lyra-ultra
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1

