Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578233;
	b=RhotrUsrXQoFNI9DIh4UC62cu49YrV7vwVkrpH21YDf1fAQHC1k8myELNHe/0O46cQBE
	 TOBL1ODDsMd9uPDiXmxAcqQXHcRDZyEK8SDwsilqGrhzC+eTSD2+TOoV51qLhZtxBMoO9
	 /HwAC/WV4X6kA7vuUq5X3LVI9duHcPTozW6YiAxcuNr4xDfaAGr7QZQvvk5edozAXeS+z
	 L+vHjWY2eXIq4+jhpp51T9DGeowGtDMJLCZ+zpQLv3vkrZEANEbH1EbYgT6MduJVUqdAL
	 9MHVcBUpNHk0YwabL+Vvg4RiZB+eyz0hkao2RAZ0NciA8lZgx4VWXXfZN4NQntyBGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
	b=tC92GcKfixsV2qM0hSeFSvSD0R/5znX5avJ0GMLalQ9rjG/oPhuuaOuxvzJBboscg4KU
	 /tLsQi2zKViZQQvCma46EB1m6ZJdPdSUdvpn0mT29Q1HHijtKuY7PLgG7kJt51UQ+wHKn
	 J8kVpf8ZA09rQ/OXvCfafgaZ1a0gx+ekeI9SDcNAiIkvReuD+02neXgt3k0YyqNGEDVtb
	 2GuJe7TxypmVJHDg4+rZZ/GaZRfRdmSkhuyKXUtfRxTwq0scH/gYl0WZVczlXd0AcvGqZ
	 OQ0ZZ+tvHYSi31JyPH8R68NRdtnaekxwjjOncfgP2zHvKaRjknLyPxe/0UvkmYfzRCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1ED9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so41904925e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578231; x=1796183031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=nk8tnEm8F0P2E1eehLNgHEIiXKzmAdnv1GtH/CF8tgRUFnMdxr5LS3wLsOby7S2Q1a
         cu5bhPH6llcMl0Bd4Ml3YCNlc2qzQVZYy64BU5JCXGdyxYTYIWgn76wItDfnowDbq+tj
         mBu/u2AoC4EQMLN4E5+BKngr2RQbPOWFa/jkefPtJmpcw6O8iLS9NHjTaOlxM5gw5aE1
         TTT1BHa+N0e/SyZxRABUIDdmTTKnn6jXzsMzYF1JRXep0cV+iS6lgDbG7uwfsTTzKX8i
         P7xAltyFkuPxXGNxubmztICD+yHtWeFb0K/WzvCEm/RQin7lrSfWUIrr7aelUKKa99i4
         BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578231; x=1796183031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=L7SrUbpKZ73hBj/yIloUWkWkxBIGk5NnkuY0QMZesCC2rJ5+WR1vrjdaWFSeS/nrV1
         ejP/4bEo7fMb4EPgqykcYvFmcxnMc2a0voCkECAmcCvFIPXExR44Nmd3lubzR4X8oHiO
         KCsoxJaou/LeaudQ8v8UIS7vGzPyIfDRhKg9AYILq/sqzb7IXRhZq2AO9d+kSERpzOhZ
         gfRzi2i2cuZUHpmNUdRuOnuknTiKpNOhalX6GZdxYler8mTaOemRw98W6y7fJ1saqLAv
         Vgil9Ub6HPCujcumyGQDxlZe9tfbsr6ItgTQTZEzEpU1sKYqb4r9EfAIcd8upYgpyXrO
         5YcQ==
X-Forwarded-Encrypted: i=1; AL+hErEkhycsnsSl/Yugg9j828nwGOINxAW8zF0eppqr1Osyu7aDbWKWEWN3IwrZzNxsNqnA4jRzEqZ1526qLpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YzkxZxRoRZkRCZ1cQ6DV3JA/MYMclkxhUBbnIW3pjLf4nPdeW
	RdDWxFiKLqgMDBn51dV0rLp7OPx9W4V2MMwIOujBos8DYG2a7nb5Lvds
X-Gm-Gg: AZFdTZdNAyiW+Ziu2oR42RQLGSAqVaSUuCtvGTbEYeWXXQ/nWZiEqlIGrc32bH9zaeU
	n0HtGz4XdbTxljCFb/IRsQf0eqHXmWkr+w1vHNyVQahXNlWWaZgm5epO1kDOrySFsGVfZ67jpt0
	0qrH9ZBd0dMBY+AGeIX4wVOKpZm+vkh8wMpgPck3dqGHnBOBZ8qJaLiqUlgrBZXnPoxU8iOvIWX
	K1g/sRGHujXshE2b7L/v63l9mW1SSdiuPjKatDmP7z9AKAYVW+er701G8ldMr/b0yFfczHpT5+W
	xwaG4MjOwnB8QqFzDFU/T7YkT+oaQl0KlpSW7ZIA6wPbWlMG/z6WaVDL2Zh0+GrZKvy+79eiQVI
	7jXKQnANk0BnEK9gC/vXhEXcowP9zyBUFAP7HgqPZ01oEG1OehtXOol6Tk7dgbfVHNytYUlzIB4
	A0tKAlZQxsr9im2di5p8gCR1UqgyGo2IJZq+omg7n47Lr27EzP9fj+a1b7mThNpGsZO0+V6tNht
	Imd9daqE6/8YSnx/NQwmYxtqMdEEwcmV/FlwADqNE+UTzxECCwgRoDw3tshk7a4AwiWVq505e/k
	nqW5RdrAR2A61np/AdLQcgalNkDcOUHP0FZSEQ==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr298467665e9.3.1795578231386;
        Tue, 24 Nov 2026 19:43:51 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:50 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:00 +0000
Subject: [PATCH v3 04/14] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-4-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1362;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=rZ5xhc0Wj0SK9I/jsxkVVRd7EbEiuk5dcQZat95a7Og=;
 b=FzPufPd+aRuNJyTsxE9xMnhrwTERQ8Vq2nvn15hQVL6HtktHPs4XaCfbTVnTG1Tm3lVHQREl1
 vEmjvIE2KTICBxf0qc9edU3Nbke7+MDNmTz+aRTaj8sSAc1QRotZJxE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

