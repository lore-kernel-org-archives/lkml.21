Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578238;
	b=28GDDNH1Ic93RxhkoeQFwB5w0Hi9nUoUE/MRcIZO5JvI1U68drPVOlfRWPCV5/04h0iZ
	 vch+eRCKhIf8K8z+Qo6BU7gJB1DC9XCfp5IOAY4UOKvub7ViBI/qTrLXokJEMEc/6C/fv
	 PhbgSCoZO4YRWtf5EmufdpPVUYtbacpgYD1op4aWYaz5S0CeeiFQsUk6eBdGsOAheKzhO
	 2PqGk9Mp99qgL7U2dmNOTVOqQyCdxgBNLDSZjd0mFfzOkB+dJw3Z7aeqQSeA0itgvXaNw
	 E3lS0KzAkm7BYUruhjozLvl+K3WTx6cMVPpIr8KCQQp53dvZhRo1eaqVQfMRB+g3QTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
	b=Kw7q54wU6WP3mXrF5LCWjjG3XSBGlU7IeRn3bCAmshxG1Tz8tHFFNU2CFXizjgSG9jqP
	 DeTkWMMKQ4M0B6K5TNkeNaWBA6finUfEygXdslPdKhMZTZ+fZKyCsgXdr2MVSYE+rDUwP
	 NU1ZNUGfIXdi+/98ZqyQv8VRXSTeV711sw9Z4qHk/QP7ETYVCmY9VjqICx9xFmBi8jHtA
	 asakvHw8MCZXf9xMJfkJUhvI5oV7fTK/TEpwz15DGywmcbydPcViHpUyk4r188qQhiz+N
	 jNBVIuhgAjSEgDbhybwULww4dIH+sBMjMT+9mRleoejMW1KVTJlLaZcY6vXWqBi/o1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEBczsA7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E07606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E07606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEBczsA7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso28446305e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578236; x=1796183036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=dEBczsA7Csa4wYdE9zU2ZWCuv3c+lNyP1g6pcCOAtEbnMrJGhamzSdETIVfCY7ZagR
         kX09bl2bERUvo5yj+3/MV0BjBkSARjKlcB2IH+M8y1FiELtNsF7OrcBNCuj9GZ92sJUi
         Ool/Njo35MxX8MCXscU5+lEkX0wMN0iAE1HgqVRhGboodpHuVjgFtUR4qggu1dQycR3d
         L/JwWOYt+d4dZNxOcOHnHLEvjr49y4nklFPyI4Ia30AuczVcHnVqCD+J1JCrA6pb1nSw
         SknxbrCq9BsEdkeakbZLckjVjTdpyHmCg4R6qiYzmIYtSqlHBgi77W5p/Q+PWI0CCX4j
         TS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578236; x=1796183036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=d6xVyHhPgjmT5FC7JWCIpKPv+I+HylsfERLBCSC5C2Oqd7wkWIxryQhdqjiu5gWPkA
         Q1tlTQy+txBAYu9RspQkUrzCj3ZK60Tt0Y9+42LTXBooETy7n2JWT+m4PIxjrmryvV1r
         SE45cqUYmSCMBRb5xln3PDNGiuHH2Kk/mdLh8zNo9fmC8KGGxgdK5ghmwwvGfZKOnvLQ
         d047uKDFOQ9E9dD727qM68tJ/72w69tbg1pqga2Dc+GYHI5Z/MO2amAUttJzS3Y8CEK6
         hutdDNIhOXuBb8MZrtTNqzTa+/u5K3BrZKWlCAIYwnKYU2tqy7fHijcShrfhjHGY7Cai
         V7WQ==
X-Forwarded-Encrypted: i=1; AL+hErFIgDzIKqC6nQzy4olkHPcN8Zbz9Tn567AmsAg4SfYv+38dMoyiTvBAJEsQB9tLcUrmKdOcjlm2rG5GfN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sI25rgV+2d/LzejDuQOgjcSdqg/3pZWYYssW3jfs+LrT02S0U
	p52YZbDtPGQJd1JafilARXY8ExVqFdQTlElV/JE1oIOZ7u+wz4KqWPGq
X-Gm-Gg: AZFdTZe1vRI9pFqtGRMAvxZCQyC1/LmMf4QyrORym5n6tFhcCmwQDrKCqA2KyFuYD8x
	rLAn+uDkOQf8oBEgQG9Nu7+rf6EYa5uOdxde5ss4CRAH/UXA6wkS0yLqBppZ7eEtvSLFG6LAyVz
	PWBde9A/6jkqjPdKieBC15ON154WtOkayDKc8LSKuIQd1A0Pqa4sw/4PLY0zytxxszU8gOkUyxe
	xccbQzHDfoH9sf/rhWWK2EkQDJ2xVuDHpjC+zn5br9b3TuzhSqx2dUpUt0nDEod9T8JYkzLRaTS
	6o+Tro5OaUAKQSVJsGM7nR1LUuYpPsor8CkGfCOqD7XSJp9ys3BPs82QaEa9/oMj4xyDKlevI8x
	B3YsW31vpYLVmBqq1oaAQXJaFetsUY7iqq0yhsDND9mKvdUnahnwFtlb1Nl0ZHwxmmxbNzF/R7m
	anqlGPswDGwQdiSs1uKt13UuV9fdvczSEezSBmbgKe7tIx1kcM3eqmkIm4g5WVchSWLx78gHvIO
	ugyFnTdRJ6mkhk1gSNBJiGt+zGYYtq26YV8UX9KTaJvwlHf3/oyO3J140bcne2TqEAi6fnzPrKT
	LSNrgjH3r2uTFkjc+Czm/TzTj75worryuyqCHw==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr352610575e9.19.1795578236299;
        Tue, 24 Nov 2026 19:43:56 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:55 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:01 +0000
Subject: [PATCH v3 05/14] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261125-halliday-dts-v3-5-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=961;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=vc+yCVm63yJiTEyLJCU/ghFkRJa2TidHkMEEWzw/3Gc=;
 b=Yg/VSr0scUN51i9KpRAWHfU1hj3WxUg4RAt781FW4PuuF2y193VAPyf14yap65FpsWKVde5Xo
 6se4dVNbdKnCzQeUFO8eyXXWtGTKy5TyIr8La1GZjrp2oxL2C8sTpHU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

