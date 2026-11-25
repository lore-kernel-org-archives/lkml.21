Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635417;
	b=fhnV8ariznrPq1Io2bCSR/YfI8YDtjRhltSSezDZA0Kf5zd60+W8zj+MjBpF53lp8ZzA
	 vhcAVC+emWLMSE96u7UEDBFUa6+jUGiR0OL0YkjU0Azdi/J6ttOunuPbivgu5CxkBHbxq
	 J4LYx1NYh/b17Er8J7ao97sf01XgQ78GcMkqSOxkSTdttUUlzGbxhSagrQQPz06sPx2Ya
	 1I8XGUyuZlI1ICm20F0dofdqRyM6jJbS+wol57H7IMUy69n3LcG9c/YcZZgHWBNENHyn+
	 4hxqbUbNzI8F853EQEA2+T9/LlQ6+wNNpNMaRlTMo5rJyabEHR6XXIt6cMZJyQfeKag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0pJOtI67d+kHFSLgQGK+M1K+XRengRZYaaBfHiu/Z+E=;
	b=Ezy3n2H1/08uhlQIB/SVZ5N58tj6lXAbwr9qT5QhPdWC8inEwgthfeoVK5AG9A5HTA+e
	 rwFTomqxkn9SSGVRBFQX+JiVgfJblwIvqEcySVsUslOHX3QswqcSYWoAzzpojfZl1snyQ
	 rU83VzCmSAGg0CjAPG+ibkaGfichc5GzasVwwCK/lzl4w25dw8MvWjwoiY/GQ++k+m4E6
	 05IMuo6AXcApuHcwr3Vzdl30VEOwlV2Il0RHrKsoA5GWkaaHPS9uW6xYCAIiNzHoRB5TG
	 FtKIIq/Rv0FY9kXORz8p3ak/cCIo7ioKYxFqT+Y9OwU1u4HyV7hbs6H0zQinyfoszMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1DpJNQIY;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17010606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17010606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1DpJNQIY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3608302f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635414; x=1796240214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pJOtI67d+kHFSLgQGK+M1K+XRengRZYaaBfHiu/Z+E=;
        b=1DpJNQIYHXfna2+7JwHdJMtJd2HLH0zguPWtQtFzVenuI3kVl9jOc9KSxwKQIdNfkI
         90ZLToJU4Q8HT0RsgvLuaOg/SEYKMOV5hFjO2c0p6sJvhtVnyjtWTAljDg1csRCJF5rq
         6E6HkpTPwixF32ZuIsKNjFSgOEgGzwljvz1XfbtZMZ49Mwq3oLJJuX7m7QrkbCLXGM1N
         X55N+a3MOGqOsnMfc39tg58hGM8wC43IFzggfn5omhoyCm+12c5z6AvrTO/wy53ASvu+
         fm0F4btMXSnmECTYWSYWq/X5AiiyH8T6NSy6odz/8/CgA7JF3QL1hkX2u+k2rIwIfhbC
         mIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635414; x=1796240214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pJOtI67d+kHFSLgQGK+M1K+XRengRZYaaBfHiu/Z+E=;
        b=pwnDzkmXtmt+wQZvYzfeA/3JCR1FXhSsOoRSDSP9fFWs4pjytXH6xXProVlWVnukl9
         UAO3jexDf+P1xS/wShnxkjNmiLHtke8/iy/ey8hLEvWTH/XOGrkjyCDOF0hEV1esujFI
         oOKsrHKe6c4j3e0z9UN/chzKRaN/CTeakK460i4heg50yR9FNtCaA60Ok663Oql8dZW+
         mec3/2ARkDwiUSNGHk8Ys4K9BREWx99T5zN8GLGlN5WUHqT+VsZC3axCqglpu3CxToBM
         XjpUjdZI7dBFs9Fx7aYQ1vgQfVx+g+cLZbuHWu4d4zpt3EhhSyLC8x4ZGfltOpf5mdzY
         JBNw==
X-Forwarded-Encrypted: i=1; AL+hErE+cyk6UCvyaLmlX3MnbA535Jz4OWWSLqGRaMDf43EOH2TosqS13KB4TS1skC52I0x5hPHWKCMdwUvz/VE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1EWTwB7qRo8XYx4UAhX16w2tkwBBxi2zpyQh9gQy7yKVyoiv6
	6St7k11WQtQaEwOrKk6bHkoaEdB8D1+EPj9nMMluyMIE5Ibjul07epUnTSZ+OZTQSTk=
X-Gm-Gg: AZFdTZcbijLu+28jno5dvEYbxlYrzGheOm0E25bghcElLFC8NC1pcfw+0nd1kOGtOdG
	kN2cO9Wdgfs8EddUy4kB94D4JjGERkasZTs5cx0Ci1o+QYCPu/1CyfvFQoJJZN7v8rfxjVfXLdX
	UDQRg/DzFuNKAmh9mKKnjudx6yv9XeHhpIxlidwNWeGnsYCUo6beXVFXhZEUuh73EoK/hAeD2zj
	xBNYvk+ITgIhm7GEdkTqA5xQcErUPgbNBmW0s1WJcsceyCu0jjbTjJRuNRk+bHYM4zRf27Iyqpz
	AsBZQqWcVsxDkFqSkkh0zuAYaET7YJQQ6ONZcGGx/YFmarZDSidWQWym6lbJb7e7blDKWOmeB35
	f9WNA6z/yS9QceWIcnAmmnCs4RI6UB4L/NtqYkaPh+TQwyvzFOk8QAH8z+yB6mFCHGlk1eZkhsn
	9ZkzseQfdMbLQJ/lCymYTCjAOoBYtssWCefaURNbQQntl/sxFTEkr8M3Qe7o6bkemmNiThEIyqN
	oaa+SY2cKmHXbG8XDQtb5vq0slK/uvL5fzC0aUlUDjTj/oVJQ4Ea8szIXlLlYxsNJyjvsJ7jdKK
	Z6p8eiMVvELq7tLfpxYsF4NpSDklMkFGwSicn0HwEAhU2pef8J0Sc4nyUu9Dqpj8YrED8iZUHB6
	MUmyEBh8juw==
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr37014528f8f.56.1795635414475;
        Wed, 25 Nov 2026 11:36:54 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:38 +0400
Subject: [PATCH v5 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
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
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-1-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613; i=alchark@flipper.net;
 h=from:subject:message-id; bh=KY2yBjwot5EgrybI0zeyPf83MlVvC55FsNHz6cLctls=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5yd2619ad0b62MzqmbMV9u7TFp0xh1BIcFD6zZlX
 W63XyNo3DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUd3Mw/A9Kmq5avWfzuT+nk/crNx8/fW6XcGP4wzo1Xb7PSk58QSsYfjLyOmg
 IqZmuvmDGeFqvUPph9q27cxvdnuy0rN6vVLo9hRcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs ship with a unique CPU ID programmed into their OTP memory,
and compatible bootloaders derive Ethernet MAC addresses from it, so that
boards with no dedicated storage for one still get a stable address.
Whether a board ends up with those addresses then depends on the
bootloader patching them into the device tree.

Describe the CPU ID cell with a compatible which also defines that
derivation for Ethernet controllers referencing the cell as their unique
ID, so that the addresses are available to anything which reads the
device tree, whatever the boot flow. Index the addresses by the
controller's "ethernetN" alias, which is how the bootloaders assign
them. Keep the compatible vendor-wide, as only the location of the CPU
ID differs between SoCs, and that is given by the reg property already.

Plain "mac-base" does not fit: the CPU ID is not a MAC address in either
of the formats it allows, and may require different processing vs. adding
an offset to the base.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 24 ++++++++++++++++++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |  5 +++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..3acf306612ad 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -19,6 +19,17 @@ properties:
           addresses.
           It can be stored in a plain binary format (cell length 6) or as an
           ASCII text like "00:11:22:33:44:55" (cell length 17).
+      - const: rockchip,cpuid
+        description: >
+          Cell with the unique CPU ID of a Rockchip SoC (cell length 16).
+          An Ethernet controller referencing it as its "unique-id" NVMEM cell
+          derives its MAC address from it. The base of such addresses consists
+          of the first six octets of the SHA-256 digest of the 32-character
+          string of lowercase hexadecimal digits representing the 16 CPU ID
+          bytes in stored order, without separators or a terminator. In the
+          first octet, the multicast bit (bit 0) is then cleared and the
+          locally administered bit (bit 1) set. The number N of the
+          controller's "ethernetN" alias is XORed into the last octet.
 
   reg:
     maxItems: 1
@@ -48,6 +59,19 @@ allOf:
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
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index b01567f99284..a1935bb49282 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -56,6 +56,11 @@ examples:
             #nvmem-cell-cells = <1>;
         };
 
+        id@200 {
+            compatible = "rockchip,cpuid";
+            reg = <0x200 0x10>;
+        };
+
         calibration@4000 {
             reg = <0x4000 0x100>;
         };

-- 
2.56.0

