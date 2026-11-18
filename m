Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991405;
	b=uhZICMWeyzhd00MGi2gB7kd60uCIuZNxtRp4DM4xKVcYABAsC7p5cRxua6nZoAFP+vFh
	 /Ym+MtDj0ugOLvfBIFXSdYcseCRW+eu5HIdG/6djH2HGMmGaA/CuQQZphdNks0e9sYAid
	 PsYGiIEE1m1TWqQIn07FZsZ5B6rSCZJwPFydGvQvYQ9nCsAMe6hMiyroE98nmfpoS7tDZ
	 OqDKb7+2McGb6+2uW+5r5M3CEbeslFeyfZ8KqGo2KIpb021Ogpk/A8CCM7tQN6Tyb8ctI
	 18an6Tw/qHzGfxPC7U9EBmNCM7Xd6kCoI0vPOc0GFmSfdRX8YxNr//BNLygEOshvp0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
	b=PCNQkw1RsHTVwgAWVA1+RdvBeEHGyuwXzxaCI5enl0GkYmQMwIZpKKbC+L/a2nAiIFaC
	 mhsVZLv3nsAISz+flmMRgRgay4mmHjCstGrKC3oLd74Vgleg+cIrW/5W65mgE96HEbK3x
	 Fxhp8hQkFLl34Ww5dXsrqwxVa9676exjE6fUcNSlZZ6iTfw9w9gTrLIUObxi3IptKCZN8
	 okKFOXJo71woo4D2Q2fJWQC96ogwiRJiABp6azO8Cr9X2Iy7y8z1Odhk0e9iSSE6MtvL8
	 cbn4cmV43idzs5ry8xhVxrkGYtj3rxK645RB4VcZvo53MH1biBZdnj+omA1oV/sXtUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE63A606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE63A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1096152eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991404; x=1795596204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=RjW9wJMxBIaMicc98otnJOiMl0a1Yu3BFmOqdcpDp9B5AkZJr5Hox6m/x2IrOo4xHC
         IF+3eFwuS0Ymf+BE1X1VGW9jHnvT56gUg4zmnV3298ZZ1IVExtqDffg5jaOEm2bDowfz
         rvxkclyiwP1y54h2htM4Q0SCk5iW3rt5klpywKPH7QLiqw1jx+W6Y+i1qVMH6pHekANs
         FCGXtZ0H9OA29PD0YAKTCCgWoWQZgM63xd2OwswLmRypebAUWriQ34XKT82JzXRE+yPx
         /ZnSEtE7WPP9lUPOWdknOLhpbrA561rFilQla9YLThJMPlmjDo5JT3VRx2V85Udt9PBC
         QfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991404; x=1795596204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=omgkMhS2WJre/YiStboboq7dy/ZSCExyh5z3TAxVdiypEM3JUyVRN6rIn/NWwDK9Mt
         E58ViWXuLXyG5Nvtl5XPBi2un7jvYQDySBp3bOzxhLNaWYFqg+ufVtT0m319Km59K57/
         oUTZSxNAwBczF17TTHJgZnbpQGr0yEoIiyp0bpZqatGY39Donwt8CxF74fz/ZrSQDxWe
         NCb7GRlFJaOyeg4V+6C8pS6pRoEqPzuAoWkSiOkIz/FUQLXjTq3N8U3WVpJh6KVpgnX7
         ybiN+nH9R17tCegu8V7MWx5WcwhCecKm+A30qK9SGZYEMx3rKVkaCoanMUTlWvAwbYhu
         +NXw==
X-Forwarded-Encrypted: i=1; AL+hErEKdUQXAzGmcrMAyY4RAaRrgwyWK7hEyjfTbD0XD4Cqnx0Xx67Id2NQkq5W90/LJnHuLh+4RBHzVn/k2ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ttoxmi2f0yS9ZmPzdvQrB/HGRNF4+VzHUr5prq+/nhlhT1I2u
	KjMd3+BiBTGzBful+86/XnNCD68TRzjE2hYh9fv9ZfOsyPLTnLzBP93gW281LwBuvlSg9w==
X-Gm-Gg: AZFdTZd29mWiCb7fmW37D3K6kLNreKM59cNmsv+3h92grEX41DAmsX/NjWw/j/4lMVj
	6036XaChlaOZ6P3Up/f4MU4Z618BbDl6NW6HK0i3Htxh2HF+55DDQEZuCY9nK165g6f6ijchZAI
	cab4HdIwXo9P/pakMj+xwU96kSv1HOk5H8qbKvVSa7j/l3/j/JynkIBh9LBTlEpUAVPhRIZCnrY
	Tlh3XPrHL/tkSC/3PK/CWQDHZ891HSfWufTcTvFSGyr9DTaad5qt/zXdTimdWbFN6uDJjNzuBAy
	N8NxaV0hd04oB24fYH8dKMjAZIeIFP9vTkZJdQlBtWh5o6+psDucx3y645oA8r0dxetdi9vlPCA
	BLITUOteISbEeceyaVLEmLkrUBBdAtPifmi5ZsjaHzhTEIjsDZ5NK2KtTYVkROQmli8UuiH3dCn
	GV8zsuZAFSlyTKilOtTLuIgxpGC7gzbhqp3fJN0LY0VrmnpGRDPTUAUecQHpDWT02rm7dNO8lEO
	hzE5T0zKZkTPS4CufNC62bz0UqSAPjCeRclRxvdCkEgCsIO3+h21aJk5IjXfybdHWAERrknOAAu
	znupNWTRH2nhzYtUPf1tpUhECrFMlLYxXMIQ7Y0VLK+L0rY0GsTK6G93ScKVhZLkrtTj2VXsOuv
	yQf3INQ==
X-Received: by 2002:a05:7301:6f0b:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3828101fb1fmr2002654eec.7.1794991403757;
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:42:59 +0700
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-1-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

