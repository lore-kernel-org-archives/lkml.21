Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009593;
	b=hPBnVecDenFI80n7rMamO2w/6EvnZ23wPUkQRTJWm+ngZszzrMVa5Nkghjode3c+FmE6
	 PWbtVUW8YFRoM579STQxCYZe4vhFt4x7yXw/jydzOqpTwnkeyoHF7Svd9TkxnklK9WsWa
	 UYxB2DpZHa7cLYDTg3Fd/VLTC6k2QDpbl1Dok5x8jja+YNunZe2SRMaOydsHdtLiGpy0Y
	 yIQJgUbfsgo428c9shmN4jtuOT6qtUmxfEIdJJs4+wGdftkuJfq8OWAX3/OLoh8XDIkpJ
	 +pB/QA0RmK1LAzLitSa0+RrfTq00f9ArmUPZqrEX8atpKAfh1b76JtCsv1JLNNTsl6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JxCBlWe9xidf5BljIoViI2yy2fuy4UwH/MuESKWLU9M=;
	b=iK+hGXSd71Y8X8fFG5RyLupjiCI10PUornlnFl26uZ7CySg4z+OBXuDxgjJTLVD8y3xI
	 LOY2TC6G8OE9kw5/Jg/nvUdu7uYwrnHGyNHqc/vvMVDAPWhvOjbGKYHCTx5NKbmINOjxL
	 dPAym70IH59Cwn5bZJn+sUuF+Dyi854zqpSyozTRXkKsMOzRfIr3AUTAb9Xn4tbOll2zF
	 h6bsyKXtLXSMQ0lQSD9yVa5SC7GoeLJ0fdpw3PFc23O6zrQwb9BnRvnoSGYRlC+XOwXSq
	 YHlTDZW53jMlwXc2c6jU7UqJwDM7VEQ/Zu2HlwP3FlJev5Bkyd/5DeKy5LVpciK7xVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CI3T//Am";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AC606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82AC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CI3T//Am
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c511cdd5a82so47407666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009591; x=1795614391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxCBlWe9xidf5BljIoViI2yy2fuy4UwH/MuESKWLU9M=;
        b=CI3T//AmB4WgxqmDLK9GofxG/Bymhupg2aUet9eCacSlxYrNgnwA37/u0VMT3FY8qZ
         u+AWDjn3gxLMDWCmuFKzKVxFOhm2K53C1Uzz4XoQ3HsPzNdvX9do+DWmoQ/F4W49APX4
         CYrg01bmy/hHY448naEYetdYQ3lTB9PZxcwDofbxZnj6HXGI4uEL9H2PguSqPZjR5+Gp
         IJ4cpdvM85isaIERTBArshTyzXpGxN46ZPlFNUigJceRK6Wdm6N+QE6P10GQVZMeF83/
         ZKYjMKH39oQwKAJ99GhWgrQ+D2wuyQMQ9WafweZR0tM2yd3RPXVXW/yz5qLsAMiEgKm/
         89xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009591; x=1795614391;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxCBlWe9xidf5BljIoViI2yy2fuy4UwH/MuESKWLU9M=;
        b=SAowSNsOgwahLZeqOXTTPFfNdnUbEt8ZNNZ7hDMeHKxMCV3PpQYJQsSg/Nc2JinRdc
         +aSOwcfgp/9FQW3nGMenSjCpqb+/JTBOaxTsE7qZ9Uf8rZm/G/8+V+B84Ml0Zi2izTw+
         opRbt+1ppSx3N0xFJNZycNgMiwfBVfBf74N7lfJ15hpS91fQ2R0Z5fx8s6X1cpt5ysg4
         xQtdSreAv58TyvAWCcsRxLJCZJyty2vYs4x7NsWZjeg+nQAo6IfcK9A73HCkW+Z/Ey4g
         KGJ3v2sYOYWCd7JsxNgEt9Ik/AKaYhKM8uawHtdAkOmdrkH684QxGx8bfe4UIIjDgZo+
         V76A==
X-Forwarded-Encrypted: i=1; AL+hErEIEMYFmvG6A7jWh3zo8Z84OkDsVZ/rzbmN9kScTRieORD7HCdiaWrHxjlSNGWPUJRLNYejNuRF/LfgwqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ljs5DrdFnbXIdJd8G2arcmXjy3ChWlVb7yRZy31zR8KlqvxP9
	TTwuuL84fZpBd9VCzOiYkSiXLSj5/xS9TZrMMrvsNj26C6/BOb5hvCZH45wYtQ==
X-Gm-Gg: AYBFou0GmMQ3chSrnhAK8Q/fnkk7MCWL9thMX2MPu6eR5A8Nlznanilefavhva5bmhs
	pM+o4e44JwCQXd8JQ+wpMOiOm3Gx8oObHimR6IOKdjcmh51Vw6p8NPcYDcSnTVZUnBofEacwu5N
	BCYmyK5bLzvgVpZLByCxfBn2CVcAsK//ad3hAiv3CZSS7KN2naXdXs/ai/pVJ8eck72w7qU+afg
	adoph41sWU1DyS88O/QZVsM74NU6HtQyLSeC0IOh6HMbfQ/M8KRI6zZincBw0DO0QtRweSAnvdy
	pqLAU91TBggjS0fDBVO/YUAxr8LeNtdc/nZI+QsfYMBJ1uehiNLVp4+qB99TICoYfMsfKPGcSps
	xD9nqGd11K7pzsWPV+6AgYC+Y0ynbRt3K93b4oTwiB010LRmduRhgbyjAvBpGu41NtkLDsPANfB
	7nRSQSUI55S/ZXcREo+RQuJ1rTB95zVSatYImyrUw8QL6Ohc0fRj8TvNEAKFCNSaU4rBd+RkI8s
	ETfFWtMZNn0FpclvOJARtNoCkt74u+luSf7XsvrJRLk5V/e3evaC7OPJR7MZe0mxGd4ytRIwAnX
	DsNKewxaVsu54nupOZZ2OGwG0q7YMfjF25hwuOuIVd+DMxUdOW6kHCsG2Vy6K5NRwJEY1FqrTiR
	DX29glWffLg==
X-Received: by 2002:a17:907:3e0c:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c510df534a3mr224094366b.6.1795009590871;
        Wed, 18 Nov 2026 05:46:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab33aasm95461766b.52.2026.11.18.05.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:46:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: i2c: Document ASUS Transformer's Dock
Date: Wed, 18 Nov 2026 15:45:46 +0200
Message-ID: <20261118134555.195479-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118134555.195479-1-clamor95@gmail.com>
References: <20261118134555.195479-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document a hardware configuration that uses a GPIO signal to determine the
presence and state of devices on the bus, allowing the system to
dynamically configure a predetermined set of I2C devices as they are
plugged in or removed used in Tegra based ASUS Transformers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/i2c/asus,transformer-dock.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml

diff --git a/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
new file mode 100644
index 0000000000000..5f4a40539c2b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/asus,transformer-dock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Dock for Tegra based devices
+
+maintainers:
+  - Michał Mirosław <mirq-linux@rere.qmqm.pl>
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: An I2C bus extension found in the ASUS Transformers, where
+  certain devices are hot-pluggable, with their presence indicated by a
+  GPIO line. The set of potential hot-pluggable devices must be predefined
+  and fixed.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+
+properties:
+  compatible:
+    const: asus,transformer-dock
+
+  detect-gpios:
+    description:
+      A pin whose active state indicates that detachable devices are plugged in.
+    maxItems: 1
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the I2C bus that this multiplexer's master-side port is
+      connected to.
+
+required:
+  - compatible
+  - detect-gpios
+  - i2c-parent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c-dock {
+        compatible = "asus,transformer-dock";
+
+        detect-gpios = <&gpio 164 GPIO_ACTIVE_LOW>;
+        i2c-parent = <&gen2_i2c>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+...
-- 
2.53.0

