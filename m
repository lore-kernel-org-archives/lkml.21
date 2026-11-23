Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443752;
	b=rPsbN2utQVLjcjYhDKA6/HbEtIcJkF7hmYRiHngwE5ng6sz63E/pXHLL6QYtkmCt5/mc
	 h2PBttp3gbmgyhyHXdPjT7+EndEe67drzvm6ylLGivRoWtpiL4LRu6DQHMv2eW7Rqr/Q6
	 95F60mcQAcR+9WInCyKSyDwM7P9to0LYtuLY41EEkZTwB4EWyVjevy1/hrRP8d09gtApX
	 bbevJ+Cbuk6LCc/erDgpDDX0PLFVEIBd67d+KJjS5fTm22ydunGAof9t+KePXBYR2DkiJ
	 RRGP88rQXh5opV1a9yn3gVJH5xgsJiDJgopUGNABgWh7IH0EPltUFg0bbt1YyuKobsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
	b=QNGTW+4vuRn50e9tdWxavWzlhoZgLRrgBabVBmh9hkHKcZZtKo/itKhi0ikbAPAvegJU
	 HzHXAPRYqOWtxADeGLuQzMoa2tZFb/MvjQCqdZyhpQplAPErgfZyozokvQqwixwAtbGJd
	 AirTH25Qgehn9NdwfVf7mb1tqydO35BOv1ZvyEQy5Zt1eHlMWc/OK07cE2LOC3Ym33tOv
	 QJ2VKaZ6q0qSk36iFjMH4ujdqrrj13bhEduXtLxQ7+OH4ZFRrjBb6+0sFmBnn6QrnvVEr
	 gRcJad9BYLJaD1WLMcsVpEjatXPg2NkPCfYjdXN4Uxr59agLECgyIsj18zOGpCp0mew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Enz4mbBL;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BBC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Enz4mbBL
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386ab9ab619so2353909eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443751; x=1796048551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
        b=Enz4mbBLoyOM1qE72OcdkCkHcT/AQJTULlVtwmDt6CcHGM5lWtc/7kVlyzh/u5Af49
         Z/bRO9Wj1HOb0oTOwNwjiDfR+Y1ENhxEyq8ZGJD4qx0VFdBHrMa/laFFP25cNR6LNFld
         xK6IT8sDZUWXw+Rd16EwNprx28Qs8UDAyAvFtTpvvVV1AU3NXz3wksY18w2MEztxq7UY
         WNGUV6fySXnE33qbPhgit9/laJQA21B0YmE94PctgL2a0pgUFHSEbnLtC86V7p6BjkqK
         B+NApBeeF945Z14ek1svgqWy4AJ1U3xinesrzRkxk5xWNj3DnKUrzKAdU1dbc00w4Rkh
         6U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443751; x=1796048551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
        b=vd3tfucOV5DodznhuxVsRBj7JkP5ZdrfCzsHBrWJVzfRSBHh3thfBAREY/MiILJfCt
         QumrwUxN4OjpOjCGjvE5HmuNW7a1TGXB12VHglCUGYtLz+JYwXsm2tjSSnlLV2YdkHqS
         cvSpi0cXo97zeeTX5kDxftcpSuZsAlBSKcheHskKFCjOPAZITNM4jxG7NGXrlWlj+Amt
         e7do6uoek6v/YOfoq/aGJwJuxxC2lua4vDOsVITBEHCC1KiQ6UfVqZgFLDB1Dw/p9qxE
         sgRni3D10qUVO/NZ2ZRtHMfaVZgUT8TiqSy4yRZ5KTxposLmT/kUOnMGyBM+GvlVhp+D
         SNiA==
X-Forwarded-Encrypted: i=1; AL+hErFSLu6XjLvAm30v0swk2bn7ofr9+h/7g1XIn8AScF5/vWPrABx7QRaQIUL+e+BDU4Vn76ml4zvjHsQeCTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zncXRTCOJ7Z0IiBbT0jCrbYVwgtNblY/drrGqmxu7rohZwrTe
	pW9Zkk2P0Dommi/D4T+FJe4JOjcQJSa/PvcsM3PybT+XmkddTvmO4J+z
X-Gm-Gg: AZFdTZfh5na5ujz2ex35kGGEc17Js4RQtgcTbnjEJkjxvRaJjYR9+TlM9wV3M5rPy7f
	0+JY5IKOchg+qqY7yp8nh1qiNHoiIRHzn8H8zd2mNXwLdoesjezd/ireDpTjxQRCpei0gOYWS/A
	WrgrTHkHOnaVDQ/YawNirTmure0pGA5nIjYVRyTPdr4lELKptTPSLMqxP+YXvH3jHiC5AsJ+AxL
	Z8hv07ddee2z3AmDMoYyYCxyFWjSpH9rmK4rOAyYZckmLIhhg/wlR5WmMTniHSPGIb2Oxq5XaRw
	5OVoIjMluR5lJK8l+UfIRTNfToFdwiD+qbu4vZjH6Nm+vb3NGeHfoEEH6KA5WL4TSpdyT0Si1Rl
	cO2xl0eneEeIIHlEUFsTjUlJ0xvdGgOZXJE5z0MncD451GEnhDh1oQXk25jLcyKtn9N9zElnXcz
	caJc96AzN6OP1+IquKuPq0/FSBaEWB1ZBVMRU8TI8Q+2nUFdyfiP9F48y8E4BjTP+CtD8ACa618
	tkF6yh3NGCr3mAq9qRUP/4J/frsqdmxo8ZTBQ8OGhrKDZHxgWXNKEBJCefEi5wUwtdj0iFW8Z5J
	lCHaWEPEwIPiZnp0/SK806t0I79KN+JgcIkhRpexTbzJMLtb9pST71o8TFUTLfiuIZYPuPaSNMP
	jYKdf8mUX6660Y/dOxSoyrw==
X-Received: by 2002:a05:7300:c011:20b0:386:b100:467f with SMTP id 5a478bee46e88-386b1004ac7mr3404737eec.11.1795443751145;
        Mon, 23 Nov 2026 06:22:31 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38385854eec.28.2026.11.23.06.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:22:30 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Require cpu-release-addr on bca-smp secondaries
Date: Mon, 23 Nov 2026 22:21:59 +0800
Message-ID: <20261123142203.3860616-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123142203.3860616-1-hjf3108@gmail.com>
References: <20261123142203.3860616-1-hjf3108@gmail.com>
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

On BCMBCA SoCs with more than two cores, CFE parks all secondary CPUs
on the same mailbox. Extend the brcm,bca-smp schema requirement so
cpu-release-addr is required on all secondary CPUs, not just CPU1.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index b83c7785f6..0b7dbc75ae 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -492,15 +492,15 @@ allOf:
           $ref: /schemas/types.yaml#/definitions/uint32
           description:
             Physical address of the 32-bit MMIO mailbox read by CFE after
-            a wakeup interrupt. Required on CPU1, which CFE leaves in
-            a holding pen. The kernel writes the ARM-state entry address
+            a wakeup interrupt. Required on secondary CPUs, which CFE leaves
+            in a holding pen. The kernel writes the ARM-state entry address
             before sending the interrupt. CPU0 is already running.
       if:
         properties:
           reg:
             items:
               - items:
-                  - const: 1
+                  - minimum: 1
       then:
         required:
           - cpu-release-addr
-- 
2.53.0

