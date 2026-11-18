Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003639;
	b=GDVebTl+1xjJbZ1ftLCBZ+PGRDJrM+ZWbmBIVPlMyV2bCCIaZ9jXxr5yvfcjO+vJ8vSF
	 AOh3oKxoId74lJHbOM1htQf3fqQAPXNLD9+0Xb9hrkd/H7YwS/+iZ4TOtb1xp5HWJ7Tfa
	 SXOGcaRHN6DYNo+J9DI/3t4XiCLOmJeHtWgKoECDbu6PSfW78ZNbZwblamR2cvZUQAkL0
	 YXj8dmH04XKxLA+WCIN78ng9wY0M3uP4vW+i3qbi2XXtG4bVCtwQRjkrlFauXXx2fFBK+
	 lRDwITYe0SfB4IrRuE7pvK79IPVZ657qrCHGGw0PpXQcVFpl1pTwsZD+VSIZ/3yatOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=fUm17JQiSL8bIvX+kyxWuzcU4eyrBA8kF68NE06YypPr+SvVQmZMm+zadMBjp0iXZQkI
	 aZy1NwXHSw0bpsO9plNsbuJYvqWubd+fSMr2XXKiT6ob0FemHLnMXj7LS86MWZsvqTZ9f
	 n7JlLxPn6JBMNN+J9yM8BA364OZKFii2aYpWtKR7oc5qBin16GpamcnGOi65pkGCiruKo
	 /fOiWc9MKIan5Llqb+Y4qvDJc5ULgR1QhYw3VeIMuarDxoDV6ArdiMM3M8oF6oZzeL8q1
	 vhOjHqZs6zcksEYyZ7GTNU6VVKujrcikoIfWeGcyAvxRzbAyOojsNpDz6cYPdQzxe/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A20606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A20606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso473769f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003637; x=1795608437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=rMquM6ptDsutIaiNx2Yw5NPovGela4gqxe32OKyBmkc9+Gr7c1LXKVFsiz0LwoHMGi
         580ZTI/Av7s/ToqUw3YGWhaZdKj7L+hk4AC7B7/p3oUSV2yaMvuL4fouNWcm5dvtEiAe
         E6O3Oo9LdLfW/a+SEPyGwjfbvyak/8GurZcJQhewbWGcsuzxAN0B9s/B0EsgD/osUoyt
         c0GJIVMyfi/frV5jVG6gZdURV0zzIO+LR1T6rddoFztdIlwcozOBUT/HzGNxP/7c5zQ6
         vFlHINj3hmsNKKhkennDdAzLsee+13zqdezn44hmvFj2mypUMX0AKnSBH9DuMy1DG1jC
         gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003637; x=1795608437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=dkmDhH8639VsmxnVmU9WeD0JYHfFZKAYC9O/NibAQOYvsUemQD+kneVgrToy1boTVo
         Wjmp3u9K2HAA68HTct6saVwJiZvdW6BcNfPSRcnelY0NEjVoUrynDR1+0z32WEIxiNnF
         Gi+22XG/jyacQ3HseisrjWmBIZKzTtWFQb3cMpHb67arecLNpEmQZ4elTPPOnk2Oal78
         E5KgKIsY47Qkm9nSPfQy4ZBSGfS1kf+IvD5aWsCGPRHSsfSs986Icz/iaCFyMU/Faw7t
         PJBardRXw8Tp45xYKlHC7MbMMFeF6x4O7/0fsgkUc7TI14OKqHKae9HLuag711KDyuDY
         fVMQ==
X-Forwarded-Encrypted: i=1; AL+hErHgdJU9LD2eykG+fRsIKxLyyAwHtz5wvqZU+V53Un6uKIf3cUuVpoczxclivtLetnIkLsjSbSQJDkqI/5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OdEydaxx7vr6cMaxWHktLF5PGng+2s46ocLc+5gqQjX/HMAnw
	8gYRN3xKcQYzQn3eQOXXoHRwR9ndEzYT7UVtVMJue3/MTIa7OND7dkok
X-Gm-Gg: AZFdTZcN3ubSiTWuld6+zm8sX1uof0fzOmbptXZaYBG4EJCaT1wkHls6Y6kQeUORCWr
	Bd/BuR+7yOhnwBh2daTqtjdS9HuoCMmC8J/TIelARUqxCyex9fU965fNzbSqr5I4ZRIlvaAwR+t
	OCDL5orScU6DQ3AFXAFikRuveTR3rTNzDgudCS+xKb6gDBeGtMjAEOfGnBTrFDJ5trnROhB9mkq
	P4zSvHaPZF/IGwNq70jjCmzZGk24/Eb+bUuKTJFqpD6fQ1rtEaQnT/mh2U4U29c+HqZOo4c2NH4
	Czesch5akN/hQbXh5taXVCN8jRx/ZqRcjPFeDPz/eh3FWZj45Me3C4LcGjuF1noSBqfLT8ND2HL
	iZllSSoGZFTYjmE8jdD1wTWTY1SBBONxKvlVvn3k78Mx4jzi6Z0fSC+xWLmzKsdtY8JSbVjC/Bo
	BEm72UA1Mo0wwyxWqffPum0bzUxiZZhdOlA/XgASgb75cIgr4qjDTGSEUAy7z8Z5w/Su4jP7gkX
	xQUcFSzIINce1XtRC1nh1nsTFX7C6KijuB/h81cXUwDKphKZoP3aZkssz9GyIvLtzdZlmqJp5pA
	gPDRh9ThbfxRspxtTzC28c1wzUZjGZBTlb1RrrlC/PNRkKHcawP/2IL5AHLrXvYoY2TryjbLh5n
	nRsZuwZ4QUkwJUz+6LQow
X-Received: by 2002:a05:6000:41c9:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-4a638eb6cf5mr4646275f8f.21.1795003637378;
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 18 Nov 2026 13:07:05 +0100
Message-Id: <20261118120714.31505-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

