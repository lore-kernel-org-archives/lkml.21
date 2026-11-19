Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092713;
	b=RPhi47LTPABwcOXNx03HFMtFGq7oyePbN8zT9AWDZ5ARoBT+jXmFY38XkJFxItmawsyH
	 BWQXBSnlO/UYzqvRw+xpVhFFqIx7zOTQe1ys8gin7BCI1s6DhjfF6OMQ9Jcn/RKUwTtiO
	 lk81gst7T+kLNl2BlJixQereTC2Io/gnwmz8sb3WpO0pifUFgFabq1AtS0WivWIAV7O5C
	 SvbIGVRxykC0Nt4w6gRFb7SUqgKghcU+Yes2aEuqUTWj0QQ0tsl2F2gGa7hKmVgAug/Fz
	 kT+LVptFt+rholYSW/h6yIjjfFgQ8spCDdRd/XhZ4581XN1lI65Z3fPEtfVtaf3h5wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ir+OchFzfMqNIfCQ3ME+6TTBvwXiIliHswVgA6zvQjE=;
	b=XgP2Yr1Nq8Jv/8DQu/UHUQP5dfkzdax1zWJhva6gpSuLYXPIuET7yDPoxED6pCjtIS7Y
	 qq13E2l7dpizHuHRB6XogBsgroxHTtMcZHC4N1LA8xcJDp5fHpVGSyirBhpdBzUx+PVNS
	 pcEg5sOaYxhfB7G7XlRd6DpYWXJ+vIz7oy3rSlGqJbUhdrnyLVQp62rIErWInyVE85BGF
	 Ag7WUcu3nRI+thUhcWRLNPhm83UazzY/XPP2f2yavrO2/6tOwDHutdrImAHMx8XjLMfdS
	 I5nFm2tb3/PyGxmbhjtjuKwUbGtQlYnTMpjvhz4Fwz3ln+L3yHTxk0b5uR0EZtzzZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4J8mgHo;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535BE606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535BE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4J8mgHo
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-383a4073e59so389911eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092712; x=1795697512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ir+OchFzfMqNIfCQ3ME+6TTBvwXiIliHswVgA6zvQjE=;
        b=W4J8mgHoN+j6jmioVoKW8qWUvqzzp9q3cpZAVKb2w3gTYd/zsdukxlUxsBjWvgmUo4
         ADJdOSKGTNCDEbb/nF+d2FA4TBZ41XNsQZvvEjHnNJj+jKByCpv8My8NIKqMvAN1g71G
         cjbUrTRxhxCCgZzrLsdKTU+7at6nNZH2z+XkIUm9vAVrFnMhILmzlpK02utycRdu/QW1
         uGqCXdWrmgMM5feOUClg1+Dstab8FHY53Izm5DaReea/siAvuXD2BdA8bNsfNg6XvIv6
         voUglqhhjtg5/x/sv1779GhNjmzVzbZ+wsKFtI4R3QhBLNlfRx7ymPaKmFHGJijy3OBX
         O6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092712; x=1795697512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir+OchFzfMqNIfCQ3ME+6TTBvwXiIliHswVgA6zvQjE=;
        b=F8peuTunzpPBNFK1zz/wwrqgKcuvLLzJlnN9SxV/ctfKFfn7CxMvsOzgaz76e+xA97
         HxtY5s4pxaABQIBa9t9+WJXKjCTC+uedPW6/A36hQWhElJbBSlILQo7AkRfOb0OPltLb
         gpYG686LCgRsr+0OvsfqXCGD94rtbiOa/NEgKlzIVAH5777G6drFNv3NvnrRjBaV2Gjl
         hI6AGmBi9wkdd2qo7chOw4xRIg0t3wFFHXDRH+34PBs42txnZaCmiq8XBbfbXhHfIFNC
         AzuaCcbfWKaCCIu51CTuLvZI3qJY5fhLM8hmrD3ceEvNKiW4STOr7hl+f5sPnc+ypuY0
         Ck5Q==
X-Forwarded-Encrypted: i=1; AL+hErGMNgR0MpmEcrvmVkt+sq2I0xwM8cLlVtTWTZ7KF/IcalHCGLGRHdXOVXtqqSBOH53Bv07nj6RqC0o/rLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8URgtO9OU9qYoWC0nefHhHIprIf6D3RwPP6DYUlQDMDsFydSI2
	o6sm+S12+c1yIPMwWi/8dEQuvXgwiY3y6/V+l/SFvVqPyVWWIHg5cV/H
X-Gm-Gg: AZFdTZfgcUYwx3cGBA6Os793DjeInQm4HUxmFjtCAGe2PuTicdG6OqZX9lN/xZ/L3d5
	tto2/ob2mob9DDVVYWjncn1ZO+H1QUGWfqrCCsvf6UDYHpaNcvVbrm4abJK3uI5ke9OPplaDyPI
	2hgQ5ck+NUkfATQZ9ik5T+OF8Cp2AxqhQ+xfZ6ymwNp8qoZbg200Lrf0I5G79Ofyrtqpk4qQ3Pa
	Daem3gu+sb927+SvURTy3d42J+xpfbYUeBhLPtC/X8uqnhSJHDfqrpU06BXJkf/HlbUx7d9mFqk
	M4JW5sT1fDsJ3766GOCyYDRHvuXDeADtnO/twKtebxdWhURZRpZlJ6tu3Vqh6QYMAhVLVXntEop
	NobkryjByZZZIQaZBCvXar0+k8i4vs0qkdmTINwYrQhUxVZL+cP3sSM58GSMFuwfEEs6WPzwsje
	a1o5quAqkIEzqfLfA5wdVWu+/jCwfPcL3EEiVZ+8FAnbaa+U3X7Uw5zhKOqXMqDeIu2e6Jzt75X
	77NXzTxx1hdc2dGODbxhpI2nSDUJhYQz8H2PNTWP3CKtGaxq85UkEzoKa+kuyhsFkq+byl3ORTS
	QlcKwyhuSt2g0G01am4NUXAfkXtNAycN1mk=
X-Received: by 2002:a05:7301:dd8e:b0:379:730d:db52 with SMTP id 5a478bee46e88-382825babbfmr5042232eec.32.1795092712297;
        Thu, 19 Nov 2026 04:51:52 -0800 (PST)
Received: from pjhArchLinux ([199.102.217.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm17979371eec.11.2026.11.19.04.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:51:51 -0800 (PST)
From: pjh456 <pengjunhao409@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: rtc: haoyu,hym8563: document vdd-supply
Date: Thu, 19 Nov 2026 20:51:24 +0800
Message-ID: <20261119125125.75912-1-pengjunhao409@gmail.com>
X-Mailer: git-send-email 2.56.1
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

VDD is the HYM8563's main supply pin.  Describe it so boards can
express the regulator feeding the RTC; the property is optional
because many boards hardwire VDD to an always-on rail.  A side effect
of describing it is that fw_devlink orders the RTC probe after its
supply.  The Purple Pi OH board DTS (posted separately) relies on
that ordering.

AI assistance: the supply description was cross-checked against the
vendor schematic with Gemini 4 Hydrogen (Google AI Studio); the binding
change and this changelog were drafted with assistance from the
Qwen3.8 Flash Next and DeepSeek V4.1 Flash language models, driven
through the OpenCode coding agent, using the HYM8563 datasheet as
input; the submitter reviewed every line, validated the result with
dt_binding_check and on the affected board, and takes full
responsibility for it.

Link: https://lore.kernel.org/all/tencent_B11DE1495C3C54CE186ED508E2CE5CE41106@qq.com/
Link: https://lore.kernel.org/all/tencent_9B1CC4BF39DFA325C2B5384EA8B0319BAA07@qq.com/
Signed-off-by: pjh456 <pengjunhao409@gmail.com>
---
v3: use the generic "vdd-supply: true" form and show the supply in the
    example; reword the rationale around the hardware instead of the
    fw_devlink ordering; replace the non-standard "Assisted-by:"
    trailers with a disclosure paragraph in the commit message.
v2: rename vcc-supply to vdd-supply, matching the datasheet pin name
    (Sashiko review).

 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
index 0b9f39ef0edc..ce9712e2c406 100644
--- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
@@ -29,6 +29,8 @@ properties:
   wakeup-source:
     description: Enables wake up of host system on alarm.
 
+  vdd-supply: true
+
 allOf:
   - $ref: rtc.yaml
 
@@ -52,5 +54,6 @@ examples:
             reg = <0x51>;
             interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
             #clock-cells = <0>;
+            vdd-supply = <&rtc_vdd>;
         };
     };

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

