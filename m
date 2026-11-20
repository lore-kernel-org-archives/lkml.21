Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160043;
	b=Q9mFSSV/JA2BLWLKiQSV9ZOCO7YjKOo1y01+kpWQlQVXrswhekYJNlijhEc76Xu2foed
	 qLUoCPHbrzHciRaBqpHbWL4oJhfR+gYudzEWcOi0R2/XFCGDF14JWl2nWkPA46vhSblwI
	 BiE9LtO+31PTZs59IKH/dXLPYQcbzSffzi+zB738yeY5+taECQNXobej01eDg5st19Nxk
	 lzH/vQ2Trbbl9xM+IqBNXsuKC9UpIVtxH3mgREpPQk6Tt545lyYfCh41+1A2ZrurXfjrQ
	 VynP3l+0wfBqzZdQSpoJky6e45/n+euhj3Roskm6g9B88VtUUUAuDVEHWMQuE+EE+0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=qFql6E4U5qjJRsX3g+R612snJpYbz4kNkxS4esfpZJcYW7V1AsE5x6rx0wyUQZF2JSsB
	 zHmtWZnaXp7y2tVlaS+lae+EH+iu59tpzbx/V3j/jwuVXijrh/NNEdeaK6t9jO2RDQjRI
	 qsMRWUy5M79Ou1GDUYnUFGakzt2CxizsLKUB9R2H8CmUfWzThp1iI2WlaEDAchVhxn+ZE
	 elElhRlOeOZbkKtL5FtbE4pzltUAe9OvbKcnh/PQTyE2TUKmnnsZXMFj0mODP46ncwnZC
	 fJCWN5LZyYIdKdfS/zC3S9K9FTP4ReZ/iGx5ALyg1IGr1B1H9516SQiMGiiaiL0XoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E881E60A2627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E881E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so4068135e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160041; x=1795764841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=Ac2qP8kZtgMyE/fP0ZMJG+N+JUCH4QENZ/z1bfsgbihnepp8xs5U1n2OVY2dfM1Ybz
         8eL9nbD8ajZ4xAXX5Jyxp7gYiy00V65DPd4lvr1WAsKMEeB98T6LxXPRvnVJk04PidcD
         BMspLbHPsfTy2TciIM1ZHJ7Uu5HfkTkWM3A2FQpA9P4UW0Q85AQTlAkl6SUwwhB9HWp8
         weJ5Yjufokz1DfRsoI1HB09H/j4MHX83XDecIRETVHcTbm0Flzp30A28S4b52j3aC72u
         dZSBlUbcdaT92aiYk5uXidatSk2144fZfZpYQDrsaNhNQWNUGI7xQ0QTjNAeAlB5X3a5
         9nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160041; x=1795764841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=OYrhNWbcP5j49k4US1BEgrPJRrTFSdoN9eeLS3mkWouUuqXNKLfmzAqcEjPsRIyFhd
         J452ZCb/XsNT/uENr91FVgZE3AJFoQ/PmIzSbZgP3P9lHZvteI6cBTxh07G5Lmrl6pBG
         Oy1cwpOy7PJmNKrNPYA5zH1wp8GTNt5xHMhQvE0TBhl52kJNRp2iHnhTD1kufy3AHdzj
         E7LbFwyf09n0dhfm+lXnFmQtzL17QBVVCNzg/DAbBZ2pf0a/eWica7lD2tFP+tq82aSO
         ePfhST4CawzhnnTk5E+nEWVFQPzlJcHeO9L73Vp+b8zJt+e1tOKXGRYtehWM4esaIx25
         UcsA==
X-Forwarded-Encrypted: i=1; AL+hErEML+daVVg5r5whXWTR6j62R1LnYI3ATSc67dPGoTzkZ5ZlE5wyuHUWIolZ1Cj+x6lXG2dIDqLup8rr77Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M/Q7dngB53IMXQ5SNAjknp/MhYyzdY3S/s/BzNG25OOGvKzr8
	48rmd5RpFw2vND+bJ97maMGi6Ph6W7WGBNxjLtGKmDydx8IjjCBGqqGU
X-Gm-Gg: AYBFou0uLewfPPM5IqhDoT56CRc83P+d2t3J2PiVAOsljreetCrr+K/IgaQZPgOEhtd
	GgN6mjCCFjRNiMx0BT7FS7rOxk4b7tBm5cojjzXvAb1nQxkFmGwU+qZWbHKLZkCvqaz+2xwDHjk
	D+p07TRrIJhDFtPIkA+cSMOizr7haNw9anjNZSDn6Q9c6cx4A3M6QquDCssBxJpcCxsLoVVbADf
	ZDznoqCYYlLfUYc37jpkL5wfJ/MNv7ss3JvFzhy+OHOQSiwGuEB6uSuorewkrHBSfTMy2cWzvRc
	9kBtfXX2LrQK8uo0KdOzi4cb8ZHDelu6hPhf+032yEKiYQxjvuTz1EyeE79dhd9jexZgr683UH4
	88QcRP9bkLJw80W2iXfTTpKVkWMvvoXi+5w8NPpMJModv9XXoGFwgbA7bYGxYvva08M2ZdDy41Q
	lbt0N6BQTHWyl/1AA0a9GUClWLHrGoelmzUnm81bHvczEbjo4CYV/qzZYKnKjc08UM+T5uBQt7V
	UjVPFXsh+Lq1DctSfIZUlSpfvHLeGKUIF9y57iDxRhrpD4BnnDPuFSizS3eiHKvALRQL6FCxnGP
	HykNb7CUpiqtDGDKmBrRMSsYw3rrZE7QppGGjS7+/ik8wa/rC1eTT6+jhQRKb4PkMVxfwEHuDhw
	=
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr41369415e9.21.1795160041183;
        Thu, 19 Nov 2026 23:34:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:00 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 08:33:49 +0100
Message-Id: <20261120073358.10267-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

