Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578248;
	b=1LCykdA8s+Ugyo1i9x7RaI3OxBVRq9WBAC19agUZaobKO5+Wi+ES1MJkJ878r9CRBL6+
	 huj5K2ViK5KfXK3X4QYIjTrRyMOayNSmRWxW8z1Z22iQ3MB4+GWNCsUaPMrbcXsBGEvcr
	 5uE609awWTIL05zSaBMuHopnuTgZXb/A18u2rm+hnALMoNRjIyWJTOjyZ2aGgDiIReFjy
	 LYEd628wZbpUJwmYFK4ew87mPzgfCVyFLu/Egq7VFGRmolwmChnjJW78bMOWJpfjqKo88
	 03V0slKQCE1fPNRK13bd2iKuYta1T4+u/FYN4sIid8Oxt5HXAniq1dtjO1/Lt5mi7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
	b=CjhossnHiM7KAShwX2CVogKZurjTYa1nwCta7zsyphwQ8/Yeq8pR6LLFOEVVWBgpt/Ww
	 mw1uTXBOvNvFyO1Hn8+i5DnAbjLtA6WNcthk/3e1VBWOlb++5CjPP2K3NpRLe4BzGbobs
	 Igg/m7E6kS+Unz3Oq4Jj90ftY2a4m6pSANi9fctBSm+Z33OScQLopzfQNFZw+F2ZesOEC
	 Fqp7Fi8th2UUuxrpk9qBKCFOOhNX0avuTE422EDXAWpikgXUrPtm7ZT5Pa2u7Ih7t6u0U
	 VVcKrxN6OrFwEthk/Br1T4iZQO64qQT80v8FTLLtJSuUkXd17DcIq5/Pw+6O0pZF41A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJnCPDC;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D28606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D28606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJnCPDC
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso64939975e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578246; x=1796183046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=yYJnCPDCwX2z7GW0KEzZrs4pq2lhpcKSCvfZ7Jxb5FFkSXbRD/DKL3imKFKjuozlx0
         PjoGDpUiZBJMXXrwVVv65xOZtRHEQr7Mp03mrKt/vzdLw8MJ+WFu49aJ+T/d37cNt9+0
         iyyRKW9IcXrsAWM7+n7HO24S6uBagb+7QbJE1odzSFgeGL6gzPo32tZiTXSkOPZdF8SQ
         lZXlXY9dCMKGWuXQqoNmMXGhc5CIK0sJZ4AfyM/TJgjzKVwfBbHcTRqrhathFIflxn4I
         m8Ek+pAdgoCuX2AZC4asCQrNaa4et/XMHCzHRzgNV/fFDwwF//9V/YDf75TCkIiiiCiD
         PQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578246; x=1796183046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=ck/t4mu8fIUaqVc+KlGikLW9B0P/sRq+K75bGpIR1oGxzw0HQ+oqTgvnYHy9m8fRFz
         TtsAnLodl7n0Wf+ESBx7Ztxx3r9BugGJ6kYgaclkAGWPILVcGX+WONYYZoS/jJefwC3A
         tDiLgor5hrRXbGR/0Moz4ES1qfrAF6BweNrZ5uxUjDweixRP1gcvIoG2rEoN0/mTW59p
         O9DSWGaMoUytfyrgIianmPiriYi59gerCmIjxRVWReUsRW10vCyHJf7x+AEF8TbwqymM
         LF+yt3SiL/Qy58lRCJg4cOk7qofW6b5/khlDlnbDMwqd9KowbkEk4ikCj2Q2j0g9lkWt
         NBYA==
X-Forwarded-Encrypted: i=1; AL+hErGMJaD/t7gse3mwl4X1UJLyUenfujyAobVnNZPVEHS5EZ52yuplSpF64S1857MZTpPwfzEBKNBS0a1RTXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WumiFwYL7uirGPGy5x/jANIpqTajlFgvxFf/itPMQ6A2KToPf
	TVmSC4kAAPODC7DIufpnc9HP8XbhlvLX+exSoIfmhKcmLOgwuwylt2OX
X-Gm-Gg: AZFdTZetWap1j8E/1cCxPpLfGFGNPA/dicEvprGiiwpfyW+6RrRX1o8KuSEdFCA4J91
	ejpjDG0ena52BWCmsWbBujNWi0wkQWemhY4ToeuZ8BqWKyNDdEhg1MjseLeorK+Fhe2ysNE4UQB
	b72GzEwfQNHSo6NvjHxK0PtLV0ZAbEWR66RGpLWeJL+O215YsuG7y8QyvqF5peKcxR7h+Ko1EyD
	uRIQK3iboG296eSGrTZb0s/1T7YFzL9xxnO7MblkZ5ehMA+49r4g17qFyrdin6QUY7eID5ptLUK
	I5g0NXbVNIsyYbpdUoBO6j800IXho0uN487OsIL8alNPetm/wkFQFcBUhSHKNyDSfBBpjCh3DdW
	6CWdicipLeYqzrfh2AcfkYktLZbNJEGm6MDnJnXoZ5s/uN0uUtCyUBezweeeAasOHljZ6hP1i0P
	IGOO23rUZgQ581wq8FXkl4ZmOEIutNfvlxNmmT9xxN7wGhUSaeaLC99usXiIAj5+JladeI3Kppq
	JQZor91dr+e7Xx0I2utyi3gPIbXdOKgPYgCC+IBkTnyTL1JhkDORkhl5o1qyQEiba87r33tIU1b
	fb7CEhlOKbqPhxJh4e2NWjPkiM4LDTx6lQxkcQ==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr345180345e9.32.1795578246276;
        Tue, 24 Nov 2026 19:44:06 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:03 +0000
Subject: [PATCH v3 07/14] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261125-halliday-dts-v3-7-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1101;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QhWGZ2nDLik/AVSmlPnUVJyIcZFTcrhPWPSMCAukIeM=;
 b=6AJhs5Z6f/n9pNkfdd62Z4MaOrVcciMknCqzjBkVEi354abH/HUGDZk9PowwAyDuxfg/8VsUi
 qlXYQzCUXxLD5rZQ1VTRb8Bh7LUtJE1bI5xcjBVOagvzX82tdchlf+N
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

