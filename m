Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327298;
	b=xI/wp2W2oqw20o9YHW1xuhL2HtJVhO0LJalN/8HOYtXhTyGcy3Y0etuUWMqkcQ+bKkLB
	 kPz33a879W4p6yA2Ccy0O/vmFXiaGa95t7EZ/UZ7vAgJiuUkWjt3JIydN+KO41aL3rsH+
	 Rq+hUtMFGAPZqqCs0qbNin/+uazRO6YdiN+iNPiezJrM2mxq4b7zmihSgMs5P4TIcU+yI
	 CNTsjAnOzSQv+nuY2j0hfWChhXTcuGpj953v4Yd5DTde0p6uA6EHG/grQhndWmYlwgXWT
	 VH8gVq+Id9JPQh/eCrCWY2A5PidVqhNLRhkhsFgNdcLmPJXcs8VKnaNSLr7xNJSIYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327298;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l3joljTh86SrgqgzDwpfUEKaM0c8d0FKMsL+NNKPMFQ=;
	b=N+0e1S6kUV3NF+eZxR5Ke2aEZBKO9vvC87GNz7cMe/t+atC41SolYZjgT7ZBXeiT1s+2
	 Dx0sxxX6eztPHuhdQ6WbCms1DS28gu11FrX90+zpmC1nUns7VKTQgzKPql8QC0Z4zJyen
	 8bMVu9Gsi0jXAVXdyB+txHJYGXrEGQtICtG/n6rSnZbRSvI4WvNqMJb8Dxqs/ww/HU/+4
	 hrtEplRMT3tTjRoR/q6w3foFLWJ1eZ3I25II3fzCShEwpqbucCg8IfJZxhEfsBtbibEYx
	 EkWTb0oUV6UUS/RN2aU60ZDHi77ySvUp+UPaFmS9TCdbWV9p9A1LoI56Nlqhqn0gP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=opYShIM5;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=IF0V6MRx;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C9606A6A3
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350C9606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=opYShIM5;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=IF0V6MRx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327291;
 bh=l3joljTh86SrgqgzDwpfUEKaM0c8d0FKMsL+NNKPMFQ=;
 b=opYShIM5rsFqOjunC9aprqEO1aqCo5nTaIfN5gAOd00y/qehjKI+JnRUYjKOi1lNJNU6VKj8+
 +1gajyNXr+79vOWhRmytrrGYhQsIsLxezwQKS2iq2+EqhWD4tL82/FH6/wQeGFhwbkzPrhtrUo/
 SfL4Vhifad35v4S2eAzGTG+ZSJprQIPtMy4HxDopxcRZ9po0f5eWyTAb/iygJyGKQomObVYskmk
 nyThyVnPsO9E/7GEMn32++ovxJfNpxJVM4KKuKB5j6/843DXDftt4VdBcVuY2hHIUG/PwlGrQzr
 WrEXxtWZhNMnF69/ib5278uXmurZSe1uMDzObYDDOauQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327291;
 bh=l3joljTh86SrgqgzDwpfUEKaM0c8d0FKMsL+NNKPMFQ=;
 b=IF0V6MRxRulB5q8Gy/7vb7uek0Zk0mFw7XKNc8C9aOJKEY021uE1p/1/K0j9qoynzP6bLrunQ
 q5tB/wsYfv9muICCN9lajUfvfOJQlAlBc9uBIaWZoLYd8vuLF8Suzv++4Vj7ZLejrSIxy88CDAR
 yPEdeKaFypN2IC/Xpa6oL+U=
CFBL-Feedback-ID: 6b028531cff95ecda8c09342:2df51f67f4fae979f4232f86c9c7a8f0
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028531cff95ecda8c09342
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v2 1/8] dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
Date: Sun, 22 Nov 2026 06:01:04 +0000
Message-ID: <20261122060114.773624-2-jonas@kwiboo.se>
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
Changes in v2:
- No change
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

