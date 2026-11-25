Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630863;
	b=uM42G286IJyvTFjEWgmeC69WKpVDmlQby2n9xUWdtJxoJfzL2pvManSfy3w9Va0riF65
	 IuuZOAHqc0qXiFsk5HCgYkm6aXQH3Qv+rW4uyMBhb/7A3tUjz2VB3V9iqIgotFMjKbuCg
	 bIoG+8sNbU6KpbnA+5u/7grOc4AChmyJNZe52t6cyJQK8INjh5ZDR0j15zH6veB89vZL1
	 huNMU7vmezIdRvzwLJwMxyGxIyN3d504vfY+aSmt2ith0YFw7iVO0vsCB6E7t6IYhrYVW
	 73mXa+69tlKS70hZ7GvBONLA8zJYI+9/EDp6zmaHfPGV5TUA7WObtXxYRXcye4HMPnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630863;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
	b=ibSmg2GKOItssASEYts9A5lT6hwrM6i8XMr51bDdgwMrMuDXiOo+McEE+LnTllGyrkry
	 caV+FxrEkhkt2pOplcU+KcQI8xUo2JGul7liynwTfWjM/4kiW786zTiwi6aiKXM1gUhbb
	 XOdwSufD/7Fryyw95UeyqmFeplAhvisL0sHS7SBZx9b+6jkpJaZ55SqbvEwfOQYC1Q4k5
	 AS7c9WpHC2RZUVUKJfsVZWzdvFOGLD4PE5tx76nCPkY79boL2nFRKLtFD5zl/LqAdAbVq
	 +jJLlfGL+yVTvnR3l4rA9G0SXWjX9elN5U+B2o8Fml+56X3lO3+aMlIQPNbD2kQca0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Rf9p/iyJ";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E303606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E303606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Rf9p/iyJ
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb2893531bso3240416a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630863; x=1796235663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=ernRydBYLVXEQlyvZAwC7ahwCkoi17hsrTcQDXn8aqEnQTXJLQtRdpj/PfDY+hicR9
         nyoElPJjpTvLHgWeuKhTneOBgALLezX0HYrLuRLSVy7WMvt2lLMrVpuVGKkjmpVD+r5K
         GV5VFAI25UODJxNnO7w2m3Ca8hK9/0E4iT8D2vbSTfItNLStVPIZL48Kio90WJSswKC0
         qn+pWbcu6yA8tNwLyXbqJgyiMDim7DBwCSCaz5qTJe9iEqTJoLaWZpbj8Os3iVDwI0RP
         oUqXIlyyNDs3JfkmJmSXDw/1SF4GsFm6OczcJCtHFJ2pBx1CmzdIb1F3SjpCCarlNABT
         a9PQ==
X-Forwarded-Encrypted: i=1; AL+hErHMWaDUdHCnWO7txu+7Emf4WftjdSZD1yo+jDeDU7VvlQy1//5/zAj761akC4hypyw25z7W6nvB3r2qktg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D2eZpuFV7kRktBWVb+mgV2EB5mc6DcsuWV6dnSFltwe0nD2kY
	tw3ImhGR9BDFwXUAKI7f15n16M4yV9GpaHBEguUdDn28M6H5qkebL46oEkSbaKq1nVXOMQ4WCl+
	A+lrdBAAdUETRQCMYd43u9EGgcoOr/89n2HD0COhvFPENAlr4/BcBY18Cbc7L2lOwxawcrsiei9
	oIN//mgaKrlwL3fjhN1Ipr6sQ2vSSGMYmzC5vm6GssokGiD+wbQSqOnizC1GENy/qpytT4eGmoq
	L0nj22Q6X+E8iLL
X-Gm-Gg: AZFdTZcZUGa24Fuz2z72rtxlcwPRFAipYfHfUi574G0PUkkB3aadFFsLwk2TvmJ/GT2
	hiWgoVycjG7cMqB8BzXD8skFNeCdTUBK8yVc6Lqju195v6x94FWXPo7ELwCLOyf+94Bg+q1X1yx
	B/fx1uE+zewIon1Gbaa+YdExWweETgjG1rVvILWuVtJsy7rR1geX3NahvxMtYToaguQM3OdVkGF
	quN6pUIDg7aA5bY9ErUGpoVZiCsdSne+vUvtxXZFpOh89AxbZ4UCe4mqctUnP+3jYK0f9LBVIS7
	L9AJaMUJvICFnT/KvuQWFq9Eg6yOw8HbebsUrtbzagK9lwpEYk3bIIkytfv9nzid9JIOYhn0DMn
	OUG0JMwB6sh1wheFxrW/05cUY9PPd5OrGCDMILrPpgMLq04cA2Ar7e47bVhyyZAKQ4kQVbRfFSU
	9PL8rCBOQqalGEDCmJW+g1HlR0B/SPPKyH
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr17574467a91.23.1795630862572;
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42001764esm4741941a91.4.2026.11.25.10.21.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363b06bcb2so115988701cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630861; x=1796235661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=Rf9p/iyJ1C28/hw3Kfubns0Cj2vLebrtpiNw3JHIKxX+JV4+3uGdJp8dUgbBoLTh2D
         Sq6hQxM7PO2t1FittueI2QHLktlSqxSSuJYZKS9v0Urg1YeDvTiytyiY9GJuvX+0RgOj
         6Vyaf4j1J+iph2jS8XPiUhZxVBlP0vkzk/Hjs=
X-Forwarded-Encrypted: i=1; AL+hErHGLMg7M33UMyd3uxzBWGqSMsi/rs7ZixnYlHO/N7vFME8rlihMRNUA68McgTdInhvWfGtQlUQdy0uF45o=@vger.kernel.org
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id af79cd13be357-949ba823b70mr3245214785a.1.1795630861247;
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id af79cd13be357-949ba823b70mr3245205985a.1.1795630860597;
        Wed, 25 Nov 2026 10:21:00 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:00 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Wed, 25 Nov 2026 13:20:48 -0500
Message-Id: <20261125182053.3915833-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
