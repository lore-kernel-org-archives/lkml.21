Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578260;
	b=4OwEECbTEZkMTU/X2Ncft+tZOEeET4BivFX5E3LywiYkRWt/fgROhTqZvRylUCm4ieYA
	 i9gVtJsDYG3k6vCi6cVEIJPbtj4Er5mi0dA+cfWC12vNiJuKSeBUsWUh1FkSxkLB48Kh5
	 x8TyO/AesUOkDaKN97+E0L6xFKzDUS2cGBI8raHVD7IfUB41yQqCelSoHwvObigBKTvZi
	 2SpQ0bS8nU09SticmfNY5LQjFCJK7OO9jPnA601Rr9mNsrmTxxlUbCalpLPu/BO7Mlsnr
	 y9+qrmxS+Jt5db1u0+Jdzp1iCdl2XVVA6ppYjc1oXY5DI3M7MpKTKPoyWaxXUsEJ18Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
	b=Tezi3TKfBArMUCt1IlENEpYi3/v/ED9DRh1OPgSg14d80Zhw2vScCkHiaIX62ERmkO/L
	 ewhl5uB4vtyANES5EAqQJ7avvzn+88TTL4pQHDxqBGG0i1EAyuCyyF3sD+KHnhtNfXWh1
	 MCo4YtPTdy3+19IAs1Vh9eE86eXIU5oBamu1TPk930TalyLwnx73LNdGeqv4oiaCQNXJ5
	 CYSqTxj7RsSsxm70G87dxNhZLU3jmjJs/jtic9M40Q6NajWsjm8HNtvRIwO6/bG0f2evi
	 oGKUXREpTRm8Mm+DZu098GVF6N4gDayoq1h9cPxVzuR0UCb4UHcx5j/EXAjajFgs9oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D12606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D12606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so49957635e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578259; x=1796183059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=laYSzHNNApvR6hkCfW91e7FyeGAkAKidR4abU+y7ghA8I/ig+rBp4IhezAN7BpYWH3
         f5Y7CPtN4xV7uJPIaE56Gva0Rp5GUYs5GwSqRjsJcJVv2f1+wmo29KWJzeu7eCxi6m3c
         9Au+o4hVYVaxhe0/Cel8skNSDR0POHCdew23VxzftD2vmyoJQvIikRA1VdEp4QXuCv/m
         hlsnWVQEES+Dp5ga9WZt8jZfea89OqfZ6LI28tB1H92eEcyOEQQHudx52eC5tBgRnRjh
         wIhDoX2puuAC+T+JmQLUJsdgugRJfZMB50IIm48HMGcA99AvePM/gHhJt3ufW5ZrcdLd
         r9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578259; x=1796183059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=DEopYCK/kYYz8QoLd7/8ovKI9n+grH4/dGr2AdoxxhWVDxpo3g368YRLZu5D3bRj5t
         r6wZPZ/g+XZpCDANXfQI6A9FS3jzvzex4www5VV8t/9FdR4WI/9l3+VmOPy0RfyTdV/s
         zYPyJN1AR5FCKLbzjRAewcTHjpaASdsyp984velHc3Nb0/LVqhIdybLimPGKHahXuscH
         Lg9SwMWQ0R6SEvPIDYq4tK+IUW19qN3rG5LEnLPA/4sZU80JfTJjrYFe6CVpN9Y5v5DX
         kUmUrJZ53sk+WGG1AS6PaoiQc4fWrzC1nnxROAl9L9eiEKiP/kwwxHGjNOPC/l1x0Qgh
         dvyA==
X-Forwarded-Encrypted: i=1; AL+hErFiZTw7+nvBL4PiMOnK2eyIEMC/Smp4oa4G+voiPgpP0B89FB8BgtcvBXw9P0QFpWn25QBaTGoOwEy7hPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qc9nxvJ9jWs2R/2i1qtRFayjY4jdbIf5UUkwxKnjMenRQAZMO
	JwgjEWCWyaq+2NPpYg3DmDbqNbGRJkJpWTvBkUE0/qx2WUOypAHCbjp2
X-Gm-Gg: AZFdTZcCYJceYsJVEtlrGdVGLcLyEmkB8yOPo4f4D3CiyPbJaxA2db3IhkcKnGo9x26
	VGEUFUYJTy+4x5QQjjVjdBNZp7ZVGQLjaDUtX0EgbclypSqkJaaYuWPZEicQ+7iag/W0CFhnFeF
	ObaZP+AyMQVe84Wf/416s+hmWUDr/70xHrhiVlYgz+CZ4+lCr4diP0+7d1NbbhFcLZhFVtLlGVk
	OrBoCXtYZvHuVXgmGBb+OW7dLWMsHrS4DyFPywWJ3cbvgWUGfvnVwl8H4x6W1piWJPwo54t2vai
	6Y4ouFr5pa+P9Q9AM61hnnLdpQUJ4rKbvaLMyktpOJt9noO4iVIf2IDfcYKjmzk8RCmei9nLpZ1
	hK//iqCVonCO6EYm3kkCfKcCSBjClfgbWfDNFxzGWfuagpe/+wMPoz8Zbam/WLfcVwvSamVzYBy
	uFP7Zkb/hLIerGUBA1+DRhfoCi/AQBMKTGbPmSLsbBqAd8o+sw/9mmx8G5WXh3/SlVk/fQpFaP2
	eFdGQtrWueaTXM8zQhYMuv91nu6IuhnabfLXsx+fZanMVBss8Mxz/Psdr61NRvKMEokIe6Ss0VZ
	NeDQPRnoiN0gfi5JJQ1aTMWDSbNiCZAbqljRdg==
X-Received: by 2002:a05:600c:b85:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb8892ca5amr333720795e9.24.1795578258707;
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:05 +0000
Subject: [PATCH v3 09/14] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261125-halliday-dts-v3-9-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=899;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Gu7LEPVBsHDlbEA7f0+bCh3HrNIpvCrq8874bMnEMyI=;
 b=LwuvM0V2lFpMa4PY9K99qzfFeTZgXvTT9zRsWf5xnLCKTkxZox/BBQLcveRV+2SwtDIXcUnAz
 dTyT3erZvMTCCtObEN8DKkAXoSDLM9Igo6aZR3InSklVdITD6tCjFp8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

