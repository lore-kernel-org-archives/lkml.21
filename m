Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101673;
	b=l/nh87zQm5eY3T/fXh8Bz0EbKkIXuvp/wjw8glW/cr/rCjiDcR5TM2Cw288qcFzgqGA9
	 e+x2rYagVjI4v3GlTQNTTOX/6a65IsLkeVkN4ER4LpYFQzZ3JTBW2Ng+J0zNm+6yNvjR8
	 yOoMTwL+avmKgQlvXzF7KlqmGchoKEGcPJoHUWycla2adw1fqq0p6PkWWps1RAwffjAlp
	 9GIX3TSaHgCMwjGZxpmdz/pKGPr7rCZo2QgzlQT1m7Tpx5JJfprSM4oCVFT8ua7NtQ85E
	 uz1sXNfLkWwX2CAtfgJOBYoTvZFw0sLcFH+GwB907ldzrxaoX8xviu4s3HOmb+pfoLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101673;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LqXHUUaEAYAv/Q+Al8HLAFSVcPECY/QLRNGskJYYfIo=;
	b=T8QU8ykrLv4pMKFSr0sRZiuZ8NEJKOTxy8dMdkKmD/tuCaMQNhZ1emdEmKEnKovSizi4
	 7bJW1+0wjZj7iuFGm4FR4xZ6ZFHxYMJVzlm65LN9fGLNsvzdtORr89gbvhg7uhjwGYaOf
	 GxjxpT5G5e3j5lJecOwtDCi8RjalNtm1tCO/ozBTnf8+p5xcMZ77JYtrqOSWtr3Qc0hDb
	 yRqSEeHZb4Fu/raWrJp7Ab9vi0rusdOlY1rx4aaR5dTfL/kq0+Tdp0ezfElrdmBnnsCcD
	 kTTcOPpWVFfgjlGkt1NrjC0oxUK7bWZDmxXt+5eGT4zXu251WAtmHA91wcH/71eaTJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b="FIBEg/H2";
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eSqziSpN;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE20606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE20606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=FIBEg/H2;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eSqziSpN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101673;
 bh=LqXHUUaEAYAv/Q+Al8HLAFSVcPECY/QLRNGskJYYfIo=;
 b=FIBEg/H2lvRs4wNiUeBLC3jNWguJo/1wInY5Lz2SKpm+iQU8672Z1x4TORMo1bKWwVfwDQ3AA
 CjeQrEHP2pvbeBL3P51KMes+F/UjUkB1EnE253tSZQlak4dnTJj7t4KJUfLmSm7noBMGp0wMead
 999LABIEDAD2ju6RhaPTybtgPwMlazZHcUxJdCSnqoQ0sRBpeh1arA4q7j5T67Q2OqqasNAGOBg
 4+B9WO18eTH3l98Wu79CBXdTbKKEIG76LtmnlPhssjChXb/Uz5JJu1yPQggFbRmfVJMxDA7+lRP
 6pd/Ymgxws3V23uJV6eZVaki9uWIVZqHy94l8XzRVbvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101673;
 bh=LqXHUUaEAYAv/Q+Al8HLAFSVcPECY/QLRNGskJYYfIo=;
 b=eSqziSpN6jE2Bpba2b3YIRhJ6Y9Y3SatuN0VYIf48pkymkvKbMvpLTf53PSOd9LqbkmFs+7LV
 pjLtengwezxX7dzBJ5ZvCD6ggi+Jhrdq18Qic4Y5IT4ZnemoGTmnJXbYjJ+zlrRcMMu5QxIeOoD
 8W3QwQA2eWbNa5CrATGfuQc=
CFBL-Feedback-ID: 6aff13e483f3cb488062ba55:35c3a38be5423f5ccd1bd3436bbc3bae
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e483f3cb488062ba55
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
Subject: [PATCH 1/8] dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
Date: Thu, 19 Nov 2026 15:20:44 +0000
Message-ID: <20261119152055.556266-2-jonas@kwiboo.se>
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

Add the GRF and IOC compatible strings for the Rockchip RK3506 SoC.

Table 1-1 RK3506 Address Mapping in TRM for RK3506 contains following
related entries:

  Module		Address		Size
  GRF			0xFF288000	16KB
  GPIO2/3/4_IOC		0xFF4D8000	32KB
  GPIO1_IOC		0xFF660000	64KB
  GRF_CORE		0xFF840000	16KB
  GRF_PMU/RMIO		0xFF910000	16KB
  GPIO0_IOC		0xFF950000	64KB

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7c138..3c1c3dc1b84d 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,9 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3506-ioc0
+              - rockchip,rk3506-ioc1
+              - rockchip,rk3506-ioc234
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
@@ -93,6 +96,9 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3506-core-grf
+              - rockchip,rk3506-grf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
-- 
2.56.1

