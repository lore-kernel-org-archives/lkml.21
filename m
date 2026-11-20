Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146436;
	b=GEEYVWAbmvi8EqhHrHQxUTq42Ldt4RP58dTpRZwEqFhJi579Okf00eRwnUNNFQNg6xXM
	 Wq1N1So/6HTorPnb2Z14KdntPNnVlHQuIKA3W8gbUcMopTF7zIBS4kF2m/DDUMsT1akqZ
	 SKKCxm9cFMbmSBnbxY/e5kbAQi0rpW7IElW+ETDLLeJ/VeyZR7OuCc/mPIsMlmO7BT9SV
	 aMwSgopgJIhv0iHBUcGj3OSU7jr990qrQnh72jXHX4lyOdO/BoaeTq6cFOuRc3W5CBqDp
	 DgldFa9p3aL5UYIkNFQAfMPH+YexKzAGyfRTPfo21mfeT1mFxZBo9/1WtFgC44ueTag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
	b=QFG/urBu1p4P3yQvIsump5gsNrxguVHzrljUBIxDkEPOrbuV3HSKVWEIDCPz8dkb5CO3
	 Ly+txBgqrKihzhqiiNIaA+IOgXA8H71FoN1gwA2EorWAH3M4BDIs8hOyxeb8E4T8NdWSA
	 2/wKIz9+rhnuCINZna0ZD9qMcdp0hsZiNzt6uNz/XOBXvt++7wQGmTBz7KjF30AnluRSQ
	 sLFD741OogLErhD9zKTTwSa9b0+A4T1p3KwXakJaeAX/JIbYUZ9XOqmwuSbxtPw0R6bie
	 ekMlItBztz8M8yJ+gWpmDxNwQxbIPC5QNGf41ARqHTvAl0dacSfvLe3QDNaBEklQiAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkkUn9It;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E261606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E261606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkkUn9It
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so314436a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146436; x=1795751236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=VkkUn9ItkidKYbXcfHSlfPBZudP9K2xImqcc9RRLJHf7WAOg6qYPjqgDmSdxSksIm5
         +OwMgPNqm/QwLeG8YjbbxUdXwf0xJRFWI/oeecvV1io7KyYaQgHIPFkZ1bU44YvykqtP
         oG+p7kWShpr0Tv3iHYxetTFDk1pkcBedBccFf94dCWx7GujcNp902VE/NmNK8rUHIVUr
         VoKwrnxzAYjddxn3hpqTSogjJV3jSCmAKS118ZasXUSQJlxJCyC5yqWnJj6tQ+7Mcpad
         pMyY+iom0k4upp3/oMlFrhp5AVzjtkELU2ceDglZ0kevpjn3UCpIqQiqFSXis09w3Dqh
         nnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146436; x=1795751236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=RK/+5qAneeQAKoBG1haf6vc9chv6+hzAaW84hEWHd/52ejheLwe68bAwVKUCccms+J
         LheXdA4HzDp7Um4w6AbmlAAFMvgAd8HKx1CsWnzK1kBruv/WOITlx74tqD1/J6S0fT+F
         WEg7d48XG17Z8fNpalsGSRH1eqV4aZ0ThkK5MQJPufg1PXNj51MrMq/Egftotcg6y5EJ
         BvyU1pDY3KGQ7bpN94+V/DSvmuXAhknMrGxkmE/or2/9hWSTb45RbgoTdDt1rki7mWMa
         8R/Bor6K39aPXfsG6aFfEnjs2dS9yV8lDJzVO/Qm1xAWxAmQNPUcpqu5gex6dARcGkwt
         7icQ==
X-Forwarded-Encrypted: i=1; AL+hErEOWmFL5HGfhRd/dSx/7NRBoyHM0ODeNKz2V5zyQDgPXZJHpSbl5x3zwAoiZ62/6nMi35BuzuLWzxRcvz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CklJNl0WEaowcnv9ExFaGBt39YWrfGYW4lfBNXbCCy7ac3Y3T
	gAQu7qpJh2QIV4ieogjdzEQUq933YTisphKmEuWCgaNWkZsAaRJtHf+ReLHOxisVaA==
X-Gm-Gg: AZFdTZfT3ZkZCC/CEbzkijHPXecCmNw93SqslFodj0wPPkSfibgGwsf2rmkBdZr3IhV
	fvf1aIS6LE/XmBkOrnkV7Lw9XsdJ1c2EHi95FgXfbmJY79R9xtHp/IQyBtn54QcINN11XkA4Ir7
	CBDB9HyFNfJLIm7N5K+k2dOq/4stI4o7W2VTpU1BXZZgsWKUF1Yo0Ngnye+/XGpaibODzbmiLiV
	6yH0JViypbqUYYudoVTd8BjIiNjFKKNU2TM332NPfehgLXH9tSdisLbJ9vDMksnmmaDnQ19OknB
	qfPiXNhG/qgG2bteANYFus6zCbdA8JN3nODL3jyeh+vX4I62Oze/JDt/01b6OAGkCsCYdL9IHhM
	dv0/GMrh+y9eWczYaTgszKPQcUCJT4RhR5WqZsHujUCDZtEI38KFnu3KeOF91g6KrO2ty1mal8b
	sBr8txu5euXguZHSONcvb3lDJ65L93MC2IZTI9ROR2HSnknGXl6asfw7iktHy8mK6qg+5Rc+w8H
	chsw3CG/XSSL8KmJ9KJS4DZp2PKbJW4S+BouoWQ9+h561++7mvvuZ3IsierKjG9Jimeoy4OQCAF
	CpT5TlHUTZWAbFsUOWWhEaVydZjB8EyYb8dqJXHh0hxnIiHi5gNcaRTkzhLzd+QIWV9V4midMdw
	xoG6Ro3789y/+5Kef
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr1557473a91.52.1795146435786;
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Fri, 20 Nov 2026 10:47:00 +0700
Message-ID: <753a575720fa88245d12b19081741687271f6c2c.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795143925.git.jjc@jclark.com>
References: <cover.1795143925.git.jjc@jclark.com>
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

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0

