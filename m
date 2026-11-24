Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521890;
	b=u8NSZBOVa1YHpOcDoNGlWXIYHzslIqO6HtbO+HUdXbeFMlVK2ktIlNFmbTFH53O7HPGF
	 9Rgep/ytHQCyEAWju4XV88VjB53Bei3ARTHG8hnkqKQBzKoj6lOvDRsfKFdG+m90Cqeh7
	 kvif1rQoXpO8gklSJPWP8P95723Qjubz1nw/MIzfZTM8wj4/iVezqwWtcvCARAoKd0JpL
	 tSQVLzKkhd+wgYTAmqi2GPGRyJGCoicvg8E81AnsFz9WRLKUyIKhF4WBYQCauUarYu3TO
	 5IzP4K8uF9zRZc9gLpbMyzKIB2ksuv3l3ZV6lDHtADAeUjq2k0DPzCM/pYIliZMcZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
	b=bsEQwPYb9LMUWbxdUhUIpYsrs0XT93QKw48F8olO2Gfn7J7kRkqnfEjK8pP3T7gwsKAX
	 UsSb3qAF/v6LA51hOzDZP0bZ9uiMHu+8CI+jx0ITqzUu8u07AKvdFPDcrL0rSxLDBrRRJ
	 xgnDmoXHASAoMN9d5qvIAmJ+qV7Dsp/qiY326h1OI6Zo2wV3APBidjSvxo9gYRq9A5gHj
	 5NeAD8FteOsx7OlwgN070izC7O5571jmfe6aDMrBGFo5ARPK6z0Uk6/7JI8CPBIk/WlpT
	 Jl+X8+9RFB1fca0XP25yrVbFN16hSDf8mCZ5NdOyiMtfZkkM3c0NGYnbqxnVhA96+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=mtdcb6Y4;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB664606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB664606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=mtdcb6Y4
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so38621115e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521888; x=1796126688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=mtdcb6Y4DTd6/bcxrnqy1cCsLId4/s+OwY1EJeDc5eF6fgF2z770B4GhTMuP6tTPa0
         uPUrumxuX48iNUfYgxqWsP0giSWZI0hVIgJhdN5eQwKtpJLi8AgAvhbzpUyHBH+09IyZ
         tycB14h1Xub69zj26kiPWYiJ/PJVmmmW7JMeNX3Y/6tdhTjsCL++j6G5GYScK+DTjwCP
         rzYCwCY2+uVj6SFZuAvuxIYPqOMfGRwchGa9oUvo38tYXgcrRH8wMYSMeo57eScaVs54
         N2isRl7ocmckRI9IMSjo9B+3UxjNLg2vm6Kdc0KzXHW1VA8pklxMeGMf+eihP7p2d6JN
         RnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521888; x=1796126688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=brjxCN3I16L6PtoK048Gxw9k0w0Ju25213oIug8WgpCBlH3BX4L657QOpDiYJ5N+r1
         nwz+7VFSoivnwzaIOZM99hG3ryV9Qnp7Gd4WgCLEhu0uih2dcp8CX9j7+VdAym6k0Lxt
         gcxp+hTisxd0B3OLN7B4Qb1aldMjGZq+Q0sFsjARFZSavn5VF+/bDXtknU70VitrBDc9
         RhEZcwoGaqERIuWskjU1h1COgZXbstGBdftB3syGkP8Kb38oAreif9NZoTi9vqCoK1oX
         7zKQdGg+3EhWxHMutR+lCRF6QRqdQTDCGurnOjKySth+uIkS8/GVzSBUCZbhyH3OGLJH
         mbDw==
X-Forwarded-Encrypted: i=1; AL+hErHUpMsVfNKM7sUNjOR7zy7BqzwNgSIiLd9znHfjXSW0s4QaUyLUlTcNiqZ8amFXU188+ZuCqdiVMDg7h9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LYpNVykmEXA+FTg04jBNXJkyTyLKbfadd9aLAf3TlvoFi4vPD
	TlA0t/N5A/7kWNuZt6PuoYNMLiYJJpnTr2HlEQ2MLiBT2+6ajGhmTLRLxHzRfRLBCas=
X-Gm-Gg: AZFdTZdE1UA/ABPqCjdOnFd6Ri/I+2SNSWxh9H4EVvTHNBL6+6+jgMQCa7w7xWQ6lL3
	EWqvjzWvxCFYlI75Xc0HPyXLDpYarA3c4jq9mxQOPJXIOirQXNxy8qsDNM9YXKGjGd8nHpkL4VK
	g6SXSDDllCW0BL03Lol+CbF0AgYpvGFBkPhs+CYXuxSLMR0HslbhNt73AsqPjFlaCnZ7rB8VCdr
	nBfB5c2DBYhV1EkdCai6ZbSU/lPNa1UF6AjqJaICG6LR0RbRSFupwbAYkPKITv+Gb/K3FNvtkP9
	R+u+kWfgAZkdNLb7HnzMZSiKi9am66XX3fAAAi4ZjZv8pWBMr84MCvScO+DoQuB9WY0o3lP7wgX
	J87+gvqs0FvwVaUbnuwLkYFmMjdV3STuixiWn5WO6U3Q1XP87QE5t3eVkZcNV+ZzFFVfwZNQESe
	K/87yeu8Vx7Q4pWJKk5BJ2YUoEpznv70JIqhIApWnF7OLjh+d5pQt8g9cXf9M3vazp/SgVPeZMY
	KJYgXODMlr4Ov9qaRhRr47Z46OZa/lvw1eRolAvr+Ovnfz4dY7mXgpE/ctFgC+XK6GfxRPsNbI7
	7cb4mrX6clWN3ra7j6uEKltRRzmzkISsTp/PtQgfc1uPMHKrjYesxJKdpjgKUAo4jWiYcApTp63
	1e7bEhsY4MtmHLkZ24u16z//YFl+ITw==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr320380315e9.5.1795521888248;
        Tue, 24 Nov 2026 04:04:48 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:47 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:31 +0400
Subject: [PATCH v4 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-1-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CS20fXFVzcjdeDfFRS8feA1q6Da6FDy2IYeGw5SpswI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gb/cTkkOnU6z7Mg8WvBWxZIC6dIne6/+bxhV4vEh
 O9ytk88OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqE0sZ/gev0w9uPyqSnpO85MoFybvMdlLvja7sNeW/kFZ8OW6jvxQjw0v7PSl
 rmeY7e3f86W24O/N148I+y9L0na53zs3TaN7Aww4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs ship with a unique CPU ID programmed into their OTP memory,
and compatible bootloaders derive Ethernet MAC addresses from it, so that
boards with no dedicated storage for one still get a stable address.
Whether a board ends up with those addresses then depends on the
bootloader patching them into the device tree.

Describe the CPU ID cell with a compatible which also defines that
derivation, so that the addresses are available to anything which reads
the device tree, whatever the boot flow. Referencing the cell as a
"mac-address" selects the derived address, keeping the raw CPU ID
available to any other consumer from the same cell. Keep the compatible
vendor-wide, as only the location of the CPU ID differs between SoCs,
and that is given by the reg property already.

Plain "mac-base" does not fit: the CPU ID is not a MAC address in either
of the formats it allows, and its offset argument is added to the base,
whereas the bootloaders XOR the index into the last octet.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 33 ++++++++++++++++++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |  6 ++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..ad38954cfb59 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -19,6 +19,18 @@ properties:
           addresses.
           It can be stored in a plain binary format (cell length 6) or as an
           ASCII text like "00:11:22:33:44:55" (cell length 17).
+      - const: rockchip,cpuid
+        description: >
+          Cell with the unique CPU ID of a Rockchip SoC (cell length 16).
+          A consumer referencing it as its "mac-address" NVMEM cell, as
+          Ethernet controllers do, refers to a stable MAC address derived from
+          the CPU ID rather than to the CPU ID itself. The base of such
+          addresses consists of the first six octets of the SHA-256 digest of
+          the 32-character string of lowercase hexadecimal digits representing
+          the 16 CPU ID bytes in stored order, without separators or a
+          terminator. In the first octet, the multicast bit (bit 0) is then
+          cleared and the locally administered bit (bit 1) set. Any other
+          reference to the cell refers to the CPU ID as stored.
 
   reg:
     maxItems: 1
@@ -48,6 +60,27 @@ allOf:
           const: 1
       required:
         - "#nvmem-cell-cells"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,cpuid
+      required: [ compatible ]
+    then:
+      properties:
+        reg:
+          items:
+            - items:
+                - description: Offset of the CPU ID
+                - const: 16
+        "#nvmem-cell-cells":
+          description:
+            For a "mac-address" reference, the first argument is the index of
+            the MAC address, which is XORed into the last octet of the base
+            address. It is ignored for any other reference.
+          const: 1
+      required:
+        - "#nvmem-cell-cells"
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index b01567f99284..f30166109a7f 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -56,6 +56,12 @@ examples:
             #nvmem-cell-cells = <1>;
         };
 
+        id@200 {
+            compatible = "rockchip,cpuid";
+            reg = <0x200 0x10>;
+            #nvmem-cell-cells = <1>;
+        };
+
         calibration@4000 {
             reg = <0x4000 0x100>;
         };

-- 
2.56.0

