Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937329;
	b=d+AybuKft9VVVRMQ9nVUnKYyxn6kJhg2KkRyaLBPXDFE6sgNGWx89FaLSAuLma1wqq8O
	 PH/mAiKiLW3YxO0eH2B2nm6zjgIb8b51U6wWZuRUyNJdQEBUK/6tT3TiV4dzUoINvOUXL
	 Prq9dlAK+8dCGU9Bkulgo+JUctCDFLwkHUf7XOAd1TdXffW6/Rq5lk++kxttXfEGahEA8
	 J5yu38iJBMat5GLpJn1aDxNUyGbBoDw4o6PZaBGhY8AxrdMbEfqbcHIPcDG9f8ZAdw4Qk
	 2pqtmiUESmovOupK5PN7XFmU5IENZBt5uYHmiTms8+HziS8Cnvh8xqcHiibheF+2Dng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
	b=FU8fcZDxwClSaIqUg6yGQs/DaBn3sDtMYToKWtUIK6nKAMxDNA67z0yFBRgbzq7OLaTu
	 e6WbWLowMjYOiXEV9zVAfbcwD69AckB8QrY0l/hcp5uczw01o5LTAXEelVs65ApOpr7Bu
	 IMuj8NpZe/q9U7XJrxjYQo1+HpKLxlZR1UufKwNPWE/eU8jzhhxVk4hVh9Shl5QrsDiXn
	 M0cNHGja+Ggcsirdr/dBNjMtpuCsb9WIvwjzalY6fEnOoHuhNnAev30ub7mzSAs0EaXXl
	 lFOKz2mPnUwhe9SCdm5cal1/Q4k0xBtPYqLsziTCHlU1Lk4ezE+ycPlXZpnUmvCjr6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFGjpIaO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9339606A887
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9339606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFGjpIaO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a32576da88so14478f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937327; x=1795542127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=FFGjpIaO7cL15zX3nPk1NbIb0TtthT2MxbC6mTMT+9988qugXo4KEd/YFISIExRb2E
         vpqav2wDB9C+GbNYUWjPdXvjQ6TpIyso8ViGM199yvmnHNdu1Oc4EcskTxrrSCWf7RP7
         k1pVissPAZZg8IWCXZMGmuQA2OGVMNHixFndfiVAUbNuVmevLRN1e1ocOaL0qqJLfxKC
         N3ZLNnX/B2eniMkl/0NfPpm7ppln03kxUXKcYdHEORsSdKRexnd7oYZe4MgLysYp5Bvn
         Gc4osTTWZiGGCkQIgD3v17KPr35iNs//xj5GOcbbA2q/A6Wgx6oyMOHWZRsB3CKGkm2e
         F2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937327; x=1795542127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=zKU4+2ZdiYEm3Zjiwwx6uPSpnotsPeU+EoT4NM54B6cffenlOqiqcYHEZ4fuNwhzVc
         jt37CEM39dE4t3JxhE0hwMdyZ0B9pCHzz3rKIUyjtQuqbg8v0lldWyu2RIY8bb0mN371
         bMNUhR1BMb0wOX2tRZWWDMSITe2OKcawdAnAffmJLln8ZxT4ccqhG6z4RO+AU4bPNS26
         zE04yyFAyMJUCmCrwj8joLhiW8hoVaS8Ti17CBF/pOukI7JpgSP18usiWspR8tR1CjeN
         1QoEZwCpyh5emwPvSB+s2BLvEVsquykfVOG+yrRqb73l/a7eR0XcsFNCNdO2KlDs+JU7
         qvVw==
X-Forwarded-Encrypted: i=1; AL+hErGL1wETwAYZ86y0hBphGP5V8Z3xi6LFSUORAm0Wodla33D6C+yckt5UxarlNj5lM1s0W6KXlpCrB1UW3fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dsI0PA15ENKFxfOmjEQ//KMBQv2X2YKCV2yCd7tL/bjjQjrb/
	psvOeRWcspnQZsjAbc1CjciNXYKVArmjpCLLPpRlXXow/N1Hb6HxvQg7
X-Gm-Gg: AZFdTZcF6p7NbzBcRLmOTQA5H2pUNvnobmVS+ElMCdCANweUz1f7q26I+el0k2UEnwE
	65AUZk+x3v8zX/vXCnUncesfYVcFN91nrNpWr3ZqWxdBpIBy3wB6U9Q5NIY44kaF6zTZf7DXr1Y
	gwPv0Xdrx/k5zU5EcOmlSAw1qosX+xQD6Ia79kr+q/fFXn/K2T4ZrylSfnhof5LKwna7ckBjFwo
	lLFOgCWEQoUtQ6ru2q1M9D7tRyDsZYith3fIY9+++PBnj4TWTtn/gpFiB8CMWDC3qWxzg6Gd9c/
	bY7LGhh/yi1mLGx6jkZHQ+NUUjDJn22DB3PJyo8Duvp5QrvEcEPvIyr5J9/eSWBIZMMlkvqElB9
	gkgDGWVTIzZofFZjBN9ZyBxfZr15K+1lfxGlmhnWSCACNtNCS9CoR1yqweI9+MQOK28arxkn+m0
	yzmTnR6VIEafOw2ccrx1O4yE2fAV1OjSuO4EY/GVGaJmmZQmVqEHI2wGNOkSzb+q1mPCtbgYS/b
	b1ZnwZrXIEEAjbFcdKWTxt1TjlZqZ2oGznUJjnUdSV1zpHNfviLAwv0RQ3nHi670lYmIbmvBhZh
	VmU9ReBXJUjkC3WJnnA+MIrSYpWacySJTrAn4ki1AGs3Cx3FC8datpDR7A==
X-Received: by 2002:a5d:64ed:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4a638ae26abmr362462f8f.12.1794937327122;
        Tue, 17 Nov 2026 09:42:07 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:06 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
Date: Tue, 17 Nov 2026 17:41:55 +0000
Message-ID: <20261117174154.549590-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

The binding requires all nine WCN7850 power inputs. This matches designs
where the chip is placed on the board and its rails come from the
WCN7850 PMU described in DT.

WCN7850 is also used in modules, such as the Silex SX-PCEBE, where the
PMU and its rails are on the module and powered from the slot. None of
these supplies are connected to the host, so there is nothing to
describe. The DT node is still needed to set qcom,calibration-variant.

When the binding was introduced, it was agreed that the supplies can
be made optional for cases such as M.2 boards once the need arises [1].

Make the supplies optional. Keep requiring all of them once any is
present, so designs using the PMU are validated as before.

Link: https://lore.kernel.org/all/87ikyenx5c.fsf@kernel.org/ [1]
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index cf3e1fd99c12..27f443bbc401 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -63,15 +63,30 @@ properties:
 required:
   - compatible
   - reg
-  - vddaon-supply
-  - vddwlcx-supply
-  - vddwlmx-supply
-  - vddrfacmn-supply
-  - vddrfa0p8-supply
-  - vddrfa1p2-supply
-  - vddrfa1p8-supply
-  - vddpcie0p9-supply
-  - vddpcie1p8-supply
+
+allOf:
+  - if:
+      anyOf:
+        - required: [vddaon-supply]
+        - required: [vddwlcx-supply]
+        - required: [vddwlmx-supply]
+        - required: [vddrfacmn-supply]
+        - required: [vddrfa0p8-supply]
+        - required: [vddrfa1p2-supply]
+        - required: [vddrfa1p8-supply]
+        - required: [vddpcie0p9-supply]
+        - required: [vddpcie1p8-supply]
+    then:
+      required:
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
 
 additionalProperties: false
 
-- 
2.53.0

