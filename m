Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643102;
	b=Ypq9QoQsgICKt9PSoobLun93fokEpjPOg1tqokndC9yKdyuzvsW3Z48Qlk13fa1UKPFt
	 JTEM5IeXIt0tJZc1vapUgIwSyp4ocTH7N2upJoAMjSolU4piRfRpNIdKmnmJdcVm14pxj
	 l7YdQmhF5TJweDHHHutFIeu/UXrZ/jEr8/IL6OjSKSjxHlZANcQPp2GAGws5YnTKNWphN
	 XXc7afvvW5pfSIwrweuGxE6/NKBq2/tYzVN8l4Qmz+ZAXvqpaH+EjTRi8JrZtzLlXnaCu
	 r7eeUloMaYhe02oY1M70Fnn4296xyO8U8dkAFNj9kLCAGmusJoEJT0Ng/Kwz5abKcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643102;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
	b=qGoFPYy6sMW/LdM+Idd66zhCbpTlHu/EQv+aI1DpI36/zPIcEwbXoH36PTckzxzysObe
	 Ssmmwz/6vukB7km02UxhJB23+7Jk8gwafXGOqOyOv+QsrU9KOgxh1LY9fuuBkoguU9uL5
	 qdluCihVNQ4T+l08XPZ1YLma9roT358D/77TUwBgV1ZXLQ0itfcyvJHl++t81emXEiP6J
	 uRBchBN/4X9Yki78WdTJFL6A+qD9SI1NW0RpoYsEzKLBmBwRO1u0lbE7+ovDWDccr8SnT
	 8xmbX4h9LxVNxUf3jDUqWMHa8TActC0OPI/7HCjSiO30U5t7bIFFffuvi6f8Cr3W8Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=zud2B5f7;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Ld9Kd7zK;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D5D606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D5D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=zud2B5f7;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Ld9Kd7zK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643101;
 bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
 b=zud2B5f728JVSW7aYTqQOx6CsYQMAS38MIhbfbfgP6z8wBI46KuiTXR5xIkwbyyLCs/MB3D1L
 2c4SkqGqiugH2xBsUMr2zgWxHYWOydPaLTqRUUgnRMYz88j3Dnddy6DXlAW3tcsC25y9oUAAf1o
 NjDmJyFWjQBpImLT3mNjp9tc/HIBXyd9mEfIcw1mBJaEPXNi3Lx6FKDpc0VPIli3R8hJ/N3qTeA
 TsoIksU8bVZr9bbPBDcFTtUCkmM/aqfNY32Tzg6UolFHdnkFv4OOirG/YhfF2O1glUufYqlNdJ3
 00YEzGnaMd78aUDCh1K1GGBaP10c2s/S6PYSlbxzWafQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643101;
 bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
 b=Ld9Kd7zK7HvgjKqxD6PGhKSDUCcnzlowm2tRYlUM9uL6OZiVNTQukXivpucW7KFCkKQXjZRos
 LpBU4ELEgaKl/fEKfQQV21I+JgWCJr73w+W6nr/sbwF7AzQiRAjvz1VKtKWt67iYkRdjd3mKlEp
 WQPg2MuRXjV7St/6me6NEzk=
CFBL-Feedback-ID: 6b0756c5f930f38bf754f99a:55ace0071697eb29754ce598a7fc0c7a
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756c5f930f38bf754f99a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
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
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/6] dt-bindings: arm: rockchip: Add Luckfox Lyra boards
Date: Wed, 25 Nov 2026 21:44:15 +0000
Message-ID: <20261125214421.1580359-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
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

Add board compatibles for the Luckfox Lyra, Lyra Plus, Lyra Ultra and
Lyra Zero W boards.

The Lyra and Lyra Plus use the Rockchip RK3506G2 SoC variant with
128 MiB integrated DDR3 memory. The Lyra Ultra and Lyra Zero W use the
RK3506B SoC variant with 512 MiB external DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Update commit message
- Squash patches
- Collect a-b tag
Changes in v2:
- No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..49c61ee985e7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,15 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+              - luckfox,lyra-ultra
+              - luckfox,lyra-zero-w
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1

