Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455749;
	b=CCcSt4U16A4kGyPQRvfCVCXC5G7g9thxgXd5sKDecR22+9PnaNF+9rO7qFBYkKIcRs7c
	 6WEf2tigB6aOqN4RZOj/TQlzsATJe2bSJU9d26U8DwBg1RplmjL9DqvVyYTJEwLvPCKKT
	 YPFKYMA8Q+tFiZTjkYEuK3uOHCZA9mmRfMcEW00T78iZazD7s9YAHiDCMKc35MxtoJbk/
	 0e3kAV+nUyKdI35MHLxqgK6CrgJtXe79Bdui+yNNdZhCcweNDAT+DPFQ8Da08e8ItKrRv
	 SoA6rA1OIwI6Y4e+ZLoJKMiIgZWwP0emlTeu6EMnY+I4jRbFkh6yjZC7HVoE1jNHRdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
	b=hTLSjg9NeO8EZYyDxaJMshqxZjvmzMs0RxBaX4amZtFQPlymy/y4qP2La+icbNFAOkDO
	 9bXW0aa74v5XKqYP52kCxd0XGgzeYgxp9XxEB1qOz0EcrvxXwAsQqNTCn4tqZdFhWcVAn
	 8g2l52NPRc+lU1wByvsq2Yd1H46xEJoqRkmNXagQc4CHMV0APecow8UeTKstfdMd34xRs
	 RnzFCBR4IWTJiU1iHS0VL7mUpOr2SPV/EuKEYfy8DqYyUBROOEA0veSR0SnBw8iREQi8Z
	 5NmiRBvemrezmXlz/+LS2ZsAlcBrMa0XOLvAOzDxP9wnx556FDeF3Fule8bY8E/Ma1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLen9dyG;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CA606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLen9dyG
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716d052dc23so1604859eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455748; x=1796060548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=cLen9dyG9LGS7JoGw6bl8+2Cxj2yp3xych94Sx7Yla3igJ6tZzdBYW57nSYuwHt6ox
         ofpc1vIZHFsJ1xWj/0nr/qQWjuYrXCnhlFd0BB4oB4VoKIl6kckAEfcOiBitDAiV3+VG
         h93LPAUXpJILeJr3pEfCdRTSlR8KfNgJlfuq9ic4lqOmPwkwN5FacHgYRz/b11yvYhXp
         f4sGnu7n4j8FOPBureCxCmaXFRj8chbk6e06PuOEqIaV+LeyNy3U6ZFf2Hnl4vwkFhNg
         KnE66QI8+ckiGj4R+0wUSyjOIMGwAPkf2YP/C7fBp7boweGjer+EKCDkbwt31kp1M2sQ
         bGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455748; x=1796060548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=QaU3gRH1MeMfM0AKdNwZt8AHrDN4k7u3HDp2Wf5mv/EqWvlWx2QImaiOg1GOuSNCzc
         entXI25G5h2UMa3lI99E/AkVSzeoOtf9M6pMpLL0NHbR8KHiTqUHBqF3bTesdhXnBqv5
         bAQ1V8fSE0fdmpgUDeH6SOnzhjnKOPhRsEKD8eIz7gOKjcBJxWAA5smko3o6O2cvGM00
         TqSCkytY3VY2EJZv80LfryupwXVZZdFwtnYqszQJMRRM1zs0MF21rSEpwUMQCajcH5/I
         8UKU8xE+IiSXV46TAsm7/3Tl4YWUswswGnBlxagnPy5056q9wuNNzmeCWbn7QCb67WT6
         MBvw==
X-Forwarded-Encrypted: i=1; AL+hErFjjUtaXRyg8G/T/pdqQyiYlehLWTVkh5lAHtBvFJlxz7aGlvqN3t7HOMeK6mxkW5SY89Maf8RYjV+LFAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kFG9mrQXYM5wKaWGZ1SzNYJf7q7QHXHnqLDYnI8sFxuJVvxf5
	qYwJecSWz7gGwvOd0EiJGB0nddF7xfiTPfsAh90I+dhyTN34b77BKXJ4
X-Gm-Gg: AZFdTZe9TDJJGCPaSIkgA7VTVmFYNKcGb2OMc7yZbg7tvLVapIBnZ9JKInBDk71n2uk
	vm0AOVqJqo320azB1Qvjk6lDLziv9J2TF2lX+3mGLWPLTSy+5++G9yPR58xUMoerfYAGPEY+aH/
	7ObQRcbyF7aVNNeWOYarjfjq5Jk4vrSyaNbVqqSt7yUYTKwYFqMG0wRqiNF2iVV7R8ISAXSyryy
	0ix4I2fWQ1GytsZODnWESM31XNCfo6Z6HdjUW+AXY4cPAmF9nmJHd1q8om1dhHWPKSYaV9pRCOI
	f1Q1l1AfbhPmuf66fWGMMlEm1NB3JZzt6toGrmLp8aoBXj+ph74meBl+BSsc8QJlxnxRKCU2XTW
	AB7e6nD+ycYIWymcoMRLDZnP+CHHRAdJBnb6GEVMM3oJmCVlf+4kRnV8ElJ+BpQCPYaywo+Ee7A
	h1DOWgX6N1U7ktMCouuYXpbx7XTRmgqHXxXoN0+SCOQBxMq9rDdzFSudiaiNfmcR/69W81gosSE
	qgi+s8jKZqPzUjwv3UQ/6IOabbvHUY0QF9T2zyuYohlU8SMJ8fScw9hz8w36jPaKkmLNdrmIctd
	/toFYjZzuw7pONvjFwwVp3DjKR3Y15Z4bgggLMTcx+O0N1Ohun+AO/Au6hcwek/aawXyamDiHDj
	kbYq8
X-Received: by 2002:a05:6808:6f97:b0:574:34da:2992 with SMTP id 5614622812f47-57a0a93033amr13407130b6e.27.1795455747731;
        Mon, 23 Nov 2026 09:42:27 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm9481238b6e.16.2026.11.23.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:26 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
Date: Mon, 23 Nov 2026 12:42:25 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
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

Document the Radxa Cubie A7S and A7A with their Allwinner A733 SoC
compatible. The accompanying A7S DTS uses the binding, and the A7A
entry gives Andre Przywara's upcoming DTS the same SoC fallback.
Radxa's Linux 5.15 A7A DTS already uses both compatible strings.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

v4 -> v5: The only change is the added Cubie A7A entry, requested by
Andre Przywara. No Cubie A7A boot test.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..c2ac34cd32b9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,16 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.53.0

