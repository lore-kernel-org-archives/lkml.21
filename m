Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578267;
	b=D/VjH0X4dNc6U/1dsg+mhu29r/kzUE3IzUgNak+h1jDGR0sHXONvfoMjq9VUq+6AeNUc
	 Z8+zIYuHeCcMlJJ22NV4jDr/4r4cbvpouq5Dx95Jfk/Dp60dB/A8b942pmR/ADWEfCWrj
	 8urIZDpR9rTqgOhTs6W+3q0s+P1AioJRN/ETpuvkkyaPDiaq/N6BA71PtSin1UPEjUTkz
	 H73y0izC4ALpiU5LoicR5HGWCb2sXwpXbOY21X7fVxY3h75UDAEsgRbBbzubppVGjCaaL
	 RlSBA07lVnc7D9+nVUyuBp6mrNczATNTJ0i4tpnj/NoMZGQFlbOQS6H806j1icjxBxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=3zk0qEtf7nDko/yzKAAlfMAriwUtotoXUvUAljAC0SMD6ZvWSLLOKdjKNFB8DhHzUXaf
	 kSf4amonXeKKjhrQAHkH/EYLZaWhXWZAzcfYVLR09nn1zJgZDJE0Wo0BgEY8NwLkPW1DM
	 av9Gxgnc3otnTTAIi5DOAEl2FMK8wbOLkFZAKhTwBD5b1n8BXLGdmDM7wz66S7ORJnSaH
	 kqfHHf7sdM1Ir83jxO199EnO1LZ/Ao7I82hRFyl+JJ0083sbmebP2PQRuePLR79Q5JJDr
	 tbrPuKuSYT4FvhV8pUsM9HkxgcxnVSai8HoBS9wlw1SzmO4VcIyaCH1yu8pgLdytq5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SufE44Nf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6A606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D6A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SufE44Nf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so1695015e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578265; x=1796183065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=SufE44Nf0iNE9uoja8l5aVwkLELQGBnnQSJnkwjjhyh+2xNjpXzsAoozPYmtygloR8
         XCTUXFjT3+t29S/3sDK7LcWZlA16n33y9wijZwHX6Ju80HJAddDGn4X7BJuoxGfZyLYj
         hkVfLXm4ntm+nwjdWfyzsw22laugJbD+VlTiUS51WFqjYW+ZG6kVM4gFIN/QsaW+Y1fC
         aAU1Ie+c77crPXv7rlxquXOEpdq5iUcbk9Bw/fQXVPCbH8V6mcT5VSFCrAHpkFwLMwqW
         r+ANRdiqb4fabO9ULg0rSB9NuToAJUGV4l4allUCaSpFyElERTRBJNdlXqDf8UMAlmtw
         OvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578265; x=1796183065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=mLPU+Lb0fLpwGgAWvOhyjENQ+JydCbk7IKH9urSwF5+4YLFXN+rrICGElBfB3mfigD
         Cj2yPkb2HuBiDTigGUq7PbqD5BsbYBXJEmusyKNL4kgputqGtERItb7NztwZecLtfLir
         DAAlnUlksaHzsxFzR06crZN16uZ3UbBII7yzOLjBwf10XvBWEy92j/YbUGArTYc/LjJT
         QHxfrsmYsiJN27mPYY0oKCAoIqIi05kUu+oR7bzZ4nA1hF6SD0c6h0U0oH861xfQCvby
         0I1P6aFTVdfrDc6evp7ip2n9cRlr1+9EXRFxdB+J3iPNRfIPTxSkRrMv2fjptGofpXXc
         vaRw==
X-Forwarded-Encrypted: i=1; AL+hErGsNCQshBKe6oq6b3SE2bWiGjDmIRK3py+Ch7wxz48Xt8NBuPJMUSpvcXP5ZEU6Qj+2rfOWHB63l0JAaqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f0yoWJUyofw+mppNTMTyupfKmouJ8lgsS+GNn0juIhXwkOOKK
	QCKH++O5gN0uCgpXxX/zHxHbANfske/vfCs9ZYmRSC9ptY5dw0UxyCg4
X-Gm-Gg: AZFdTZf6KwLEpljou0DTbUlHq9SmHmEgWZLzIPOgZGenMc1gkk0XiUa1n/C2/9nSpbD
	ad0HVUYzAZrS48svDiWDlFBA5vvKgkaxENFE3YomjuWHAtJtwJtf/FOM9M/c4VU00Vhg1lOjby4
	4Zeay+Doa9G2vVktQSPEjUgu3ICC0O/pF1YRLerqc/+5CoonnKk+XpJe19KLIcZZKOIW4AfLXyd
	jCNUgSTVM9zXs3dlv45YLIXwAe0ubg5Uy+B5o8/i0A3j7pe7DeL1AgOZyThQ39VXBYoR0MMoKGW
	6moHVFqfpMKD+aftuCpDYDkzfzh5WGOqeQI4VAjTcv1lUHH3nh2rb9XVnmIotuSTNuNWf3tgTu5
	zasZiNwivsS+K5xbe3JEmNE8xAuLdGTXEB/Uqt5UMb7muXTst3RIkTTTCau1DvQ7lXaHe+KKVMC
	9A0+NfGizreqnyoMjwG/aO7IiDFKbxRQ/OO1dR5NH5mgG2FysM1p+7bgmgeyn3dKlY8//jBRIDZ
	VMCYYcoBeWxcKmaGzSHeNzBQdg8gkBl6R1FXda2plkTXWY2LkMdGzTfxDfw8s3/YL/Y4NTcXcXv
	pdHB7l1LHbtBEjCBvOJmu8JwTNCNJZryR60muCM=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr314413945e9.12.1795578265228;
        Tue, 24 Nov 2026 19:44:25 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:06 +0000
Subject: [PATCH v3 10/14] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261125-halliday-dts-v3-10-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=ASSSZ1iPRbCJcDXI+svsrzgQJoNbt/i5IYWaxMLqGZRF5nHWw5kJhARXjldkVDjeYGCb2JyQL
 2OZ0LHRj/DeD6xQR3UFBtL7exxUKJQpjnA5HrXZmN3rAlw9HlvDVkc9
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

