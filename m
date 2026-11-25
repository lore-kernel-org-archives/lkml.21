Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578243;
	b=YQkhcQpCbRvBRo7ErYqY808jx3Qjxo5DlOW7CIzXMBgarturshOGw5iYvvcRCkv+uogf
	 pqlTrdKdclzlq5WVgkd1B8c9vscAxqZnsStP7VSvErMp+SNvMqIqdTwX8q61Zemm8DNDu
	 UPhTSpq6PGct6s8Z9D4JMk6+MYcASx0OrunJL1BmJQ65NkPsvsOcWJCg+BBDw7AeEfhEe
	 PRLLvt50TCkS9a/x/nL9XJUrHjYKR8Hzivcp8NIQMetp+oLkMFlzdpLN2gzWrxhClr9dg
	 67xfGPckhMXUdn010k9glB0PqFED8U5tiZGmL10CCmt+BWG2GpAdGFw2FEeg0RkGaSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
	b=KhC8QFA/0jioFQdwGHmwlYQ/kFB+5RIAGH9pEMgTESkVJTxWvZNwHkRBKzi1MZ/Hc8k3
	 y5mr4/BcZ96B2d20jtvi52Po6vkxTjCi1Q0VAMAUnAFRznBp7hgftrNyvOYS+j02Jyh29
	 MKM21RbUfYCINicoWu5tSJU+VDWKzBrLtcwMNuVsMe0Xg6rUnV+E6WL7mTcMsRj+IHlAu
	 LRqFeKbFvtSP8XLZGAtQkHPuy5RnAflNgTVqH+mBSjLXXBKqix4uo0XqYKpkm6pfEY6Pm
	 WDBxH+9l9nmUNrcCeVHq8AAmqaDKkj3W749p2aHRdKGFQDD5p0H9b36gwRvADjOrF/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpr89P2u;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F46606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F46606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpr89P2u
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so33328035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578241; x=1796183041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
        b=xpr89P2uVdNEVRU6ZFdn2eBT/t60OkWc0tfbtiVYSzLsut2olIQ8iMmMG03Qu8AXhV
         czmwY8klQILCpnQxdFXqLNpFHHOS3Fz70w915u6j1DQXaPm0RounccIivcFGNkTf7AUu
         Nq+70UK9MfiygohK2bEE6CLN+4jPinKxmEeKqfwkKmoHDDzWt0yNUPXMaIXugfvdARTl
         hp4EfLLqSIbgqR46C0zYggsGERYvEiVipCsnV5Pu0km4Qm/IUdXE9XNzt6Nv3V2YkFQR
         /QVF3UdadDR4/OB3HYNvw6ycaxZMdJnVuqLL/wTu56z1P7BgeqaDw9Eho8qpcwOOcKw7
         MHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578241; x=1796183041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
        b=mGcLa5+3F5dPUtYzi5APIxcNQkRYR+q7bwZFZq45ZDiu/Vo6mIz/MyVBhK6LuQ6AOX
         omfyBGUfM6nKcnkIGRClXBvMXA73cItDfJwbnExk3cvydwkmrALlTk+bmTvfYp5xypLz
         pT8wImXeWPT3KH7ueMKNt0tDa+GVzi13fvZcLb73rFXNzQCWwzImfu45y5Jg8aVGAEAT
         QHq3NmZH7Jf0qnsRgcT0fI4Xb2mlF4kljziWUEOU36iZtqodVgX/wsJKzlO6atO2B7Di
         mzy5aquhygbVrF+Yk4c53gthQXOCHck5cKXeLtlr+k7Vb10l6aLbkJzmaDMNZdtou7TV
         YCPQ==
X-Forwarded-Encrypted: i=1; AL+hErETogosabY3/j3WSYPApTUD0DkC36QAGSfYgOA87Yrs7Vkg1XhIRWAjgcaiOnFrtNTYKoOPUGsyDB7Rwv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qrhTtR1k6rxFkjq20inXKLCozesbVQ8/DTGaKmwKJ79yzNXsO
	dF2yR4/V06LXj7IX9avipUImUxV9HRXO0XvPk2pqqMgvEnAiifqt+Knf
X-Gm-Gg: AZFdTZfYra+KT5Fr1rFQ5wyTx/e+UcNNS42HvYTmrY5cECo/QSGFgOLzUn+Zw27PkjI
	DV7EKYX3Bd0GKVoTNfahy4Rw0/62kD1aCGlvBRuxHS8FrjWawzjxyhv9/zcAw59UmgYPvSDwPeI
	swiIevvO+RzHqRKM3NznCLEpdhlnx0b93QGkboo9N9Tl2idl53ngGOeEFDmwoZRixwPEuEpEhK+
	ChFJzSKSHFEZXRK8SO2UqJUNx8YZ9iZwiRd/PmtaHTPNEH+/5eOHFGwpd0T+jj+YtHrBbauaEfV
	yY6iYsWT9vhDY+3c0J3sy/Wv1IgtdlrUnrKq4k0ZlLGZMnenbXBJw3ta5au1EZ7PNF7v3iRxAIX
	hgpy4LejSvd2CZ4Vh0g5Uu4J9vp2ipZO/b8IDyjmhV6Q/FRoyvss+q7Sx53gF0+h0aWYJGvg/Bh
	sHSHtmCpXEd6uGqDM8h4/5K+q8qOLhBwmZUm34QlxRq6GX2tFefeKH8B6W+OGYDlHMNRnMnTmYP
	ja6bfqRCWv4sjwg4au4KSNsW0eVw7W8FP7Gl+hV33P6Hvnj9TfmVbvRmZWKo3iWE+2XA9Bb2zoU
	JAJ/7hvXdrMNV/hy/ut8aOTy9eSlc8CTS1mPgDqrzB5ZYxjgPX1TEDwhzhLp
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr321134335e9.12.1795578241263;
        Tue, 24 Nov 2026 19:44:01 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:02 +0000
Subject: [PATCH v3 06/14] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261125-halliday-dts-v3-6-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1066;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LnBBJKb9fDjzFgKcPxLWG+G1ECrWNheGC13yLk2PP7U=;
 b=AK3HsTIHMWrfVz7oshpUweVMA1RMXUBxsZdz2vUtNRXnyYZuhyvlqRD0igQTo19XNPCP3yBIj
 lrBLDzvfhh3Dy0LccQPBEZwfCNYpwtXoUv7VnuZeXacHd0nFK00aqKC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

