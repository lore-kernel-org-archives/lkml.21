Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101679;
	b=jknBSILHOWKwOvIqGofHGJh67j+wUc9p3yogeiDnDqMN3kHL34j49OuAHS76j6MK+MUy
	 dnwUDCGsJEsTWf5mMXeXizJcignDntfdB+75sUVSC19ke+ww/2BNcRLiw5gcB9c3yEjls
	 2ZMpoLgAg+bD9suckcRX21iPMW3kLqG/WyprXwVODqAvmg2Y2JGpcG+kHyMkDgKXYLBcI
	 VYvHi/mhG8MZJq7kBxJA7wraQaa1BwY16TCx8JHEbkWOYd0oB236b2TeHS++mfsmvVc0h
	 s6z36A+JUrYj4rRdpiId0oXKaY+ipTsOz4+i2cL4ckJ4vil5lRPh2F99FzzOEiq7tkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101679;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
	b=3/9oV1r0R+hb1SCUrZDhHL1bGZ0f2XzXPPzGMuuOpwwMK40l3Lwc0eHjAy+1kkUGUK98
	 sGwEmgW+rn3l1+SCm/UVkarxiJkARAJ1Oz3/pBbLWKGcvN3IT+ktnus78q531oeWDcb8d
	 aG5rVzHFqODvf3bJF9123XKbbNxzcvrZRFaiYHzgHcQCKY3sBLmZTL43bQw6jSW12A54D
	 CEHNslfs9Csdll0nbW1XIiyQq9Ln63GbxyS/FfgingwN0dPEyCyr4unqpoKGFNWwydDc8
	 pico6hgZMYYYLoI4EqLEAMtHdY012INnP1ronAwXl/b5aNaXNLgGqT8yK2rLWfo8rLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=D2IcrCy6;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=VMeu4wc3;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D260A2605
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64D260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=D2IcrCy6;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=VMeu4wc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101678;
 bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
 b=D2IcrCy65eFlcKJWuM0ppbrnBWM7KXTUh4F46FHIe80b0NSMGvNwvyaRX35CJZquky+0MUB8F
 qmr/pT184ImhNuIkOHFlUAluoV5RevU84JP7zMjc8CS7At5eUNw+1voRdwkgwlCM+Yw9UjCyl9t
 nIvl7085cZemhVqqqAS0lv7vzZv8QZhPBvjdoadE4nIcYs3GlLOZYw50l7dYM71NeqsW8olYq4r
 vHhuSQAF/YW3nzYoHOH4/rrHF4w1dTiuydPZHbwo9JNLCIuLBpJqysZ0ab0uoU2b9e4HcQVJHGn
 Pv33jlvgT9cdKfWWVRP717CiUzfQ8SgY6EgCUEf7Nfrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101678;
 bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
 b=VMeu4wc3Jme5MI15aWIIMGHN0H6ISwuSwitiJ+mfQQVuvxwKN56N44imkc2jGo8BpK1Gfch7x
 m9xhdLtpKmO1IpuB1l0dKXaOFORa0ugKofzvVS9n18LZtSR5rQCZ4X2q+eVET5icrx1+sJQ+OZq
 gVhSCDIuY6+gFuD9eJ7sSls=
CFBL-Feedback-ID: 6aff13e883f3cb488062ba87:e2901e9a9683cb47dcb4d9093b60c712
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e883f3cb488062ba87
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
Date: Thu, 19 Nov 2026 15:20:46 +0000
Message-ID: <20261119152055.556266-4-jonas@kwiboo.se>
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..37321e23b087 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,13 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1

