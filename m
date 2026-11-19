Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090493;
	b=jCVs2kyzFgJxhJ3d9kMMHk7ZEKH8JX0af5WPC60NP85qq//UX3B2JKIseb0Iwwj1qPbi
	 +miCXLqmAshOJyXkDPCiY+9CQaEd0jpxK7JdEefx6XY9mSeFCtwFwE+WQV/K9zyoM7KfL
	 SJsaVSbrToyBVsE6S3zZ1W3rJI+LGczDO+JYdo/D1jCtW81+1YCYyer61tR4nqFOdFTnn
	 dWLboh0P/YgbG6xdYea/ThPfaY2c4ES0kGFgaMhixhNvz6u4QUqP7WCGJtuee7v9jBqPP
	 CSPcZu5Ikblp0qXIJeaPhc7J1CKRKcxd6jCCRnnOdTNnd5Bd9g+EyVEkWX60YhEcWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090493;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wytq4v1yoNl2lNxNKZUWQLMKNWC9LRDCwAsV3MchUXY=;
	b=rNp0JHjo85ziVH58vAH3j0Xk7Rm09KyDfdqvVeW6i2O61BzyHpnDxMw4RMtfFRYgDapo
	 7S09VIErDtGk8ASo0qY2Vs8qVJtvivDwQ8qbwVPEPNE2J7wiHqN5dQeLxOptB+qrbx91E
	 o+G/+9zWAEwRbIQkP9EUtXRuFBv3YfjCo0Bn2QvkTMlfjyxTlNocKysSAHoL+cmbGKK20
	 axM0gRT5IOsJDmqX5O7DA369XRfjXuxMZ5MWy4kvF5BO30QeKelu2E2YNSkQIYX8axXB+
	 1E1ODbcYql7AmHqHIRxT1Qtm+IaRVqf6fRGCdLMK1KJigMXNSdpsMt7B2RJDsmKSBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=mtZvP3Ly;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=PriZYvaQ;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E3606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77E3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=mtZvP3Ly;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=PriZYvaQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795090486;
 bh=wytq4v1yoNl2lNxNKZUWQLMKNWC9LRDCwAsV3MchUXY=;
 b=mtZvP3LywoTs7iVbx/6+6JfzbLIjVc6jcmFhG2EGODsdVu39wkfYkjj0RbGsDHb2+DpVq4Gpc
 UWaLiLVT1MB0UERZN1MHwOX7tkCnYr2Chxml5yrvzlXk9aicVoFsbWVWwbUnOdk1Vhfyo9s94lg
 uQnUvlWsJqjg41YFinWbwspCUl78f/PkOEp/s0zSktapO/hdB0TfGhmoKEpKaso/SIaS/zoGm1C
 LKo84dCDvjxRsJWPLZAb7gFfowE/S6wDiMcv3rKfk5sN9tJ1QRP0hW2zlSfKoqBgikuiUnp8E3s
 4vs7tbg0elGNTwGCJEv84VM1A6pDabADgy0bqL+n7/mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795090486;
 bh=wytq4v1yoNl2lNxNKZUWQLMKNWC9LRDCwAsV3MchUXY=;
 b=PriZYvaQo/RG7HI/tbMsYlR2F7jZl+F3hSZKGGvXq2YRrjfHvGyxEiaL8yMYTnmAA6Rh7rUip
 yGPCwvlEj9/CkmtRaS7R6OQoWjWPuZKSjx8YHVIc6BE0cmIdY5kltRIYOlMlUMnpzj04BKQQQrT
 mQ0RSKbfqtRkjPMuLZF20q4=
CFBL-Feedback-ID: 6afee835d37bc4966df160f3:48c077aad09a957449f716d8faf09bff
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee835d37bc4966df160f3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi NEO3 Plus
Date: Thu, 19 Nov 2026 12:14:31 +0000
Message-ID: <20261119121433.550704-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119121433.550704-1-jonas@kwiboo.se>
References: <20261119121433.550704-1-jonas@kwiboo.se>
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

The NanoPi NEO3 Plus is a compact headless SBC based on the Rockchip
RK3528A SoC. It shares its base devicetree with the NanoPi R28S and
Zero2.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 01a13aaf3e8f..a5eec2ecf23c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -361,6 +361,7 @@ properties:
       - description: FriendlyElec NanoPi RK3528 series boards
         items:
           - enum:
+              - friendlyarm,nanopi-neo3-plus
               - friendlyarm,nanopi-r28s
               - friendlyarm,nanopi-zero2
           - const: rockchip,rk3528
-- 
2.56.1

