Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578228;
	b=cK8Pw4Dx9nXeGul/fvoI2GGxy+oyh3On39UKx5GhYBm6iNiT0LmvupW5X2x0UoBWNHyY
	 s8laTz/Ww0tkHFhnrP6BMzbt/Ho4vObG8p9Bf6Va8IMmpjC+OzuPFCqCdLTc3CVRfAIkZ
	 JrEhe8IgAwHy1I9GgcwLizhgEmHiMiZ6F2RBT8IbrTbwhWa3dpHyv9n9Co2P3Jm0LAy51
	 ooUVygmTfJeAJhwlypLZPh98PfAxONKFrZe7+Z0ViKMeVqGsaYBjvEnYpKGNo1+UMuMbJ
	 Jz2GAFSoYXwG1oxJJYUVoTz0KnDEHjydwTBtBJbv0oc/nkFsXmOAZuHsu7oxWTeHLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
	b=UNGCnVxBCpUN1La1mzqPbrHhKpdNyZL7UC5XqKFmkh/3Hax/kz7OgUSr18GDITS5Ib16
	 b8s14cT9FM1+B8IMfw1zwbHcD2FIY8IfeIW+PRx/lkwOKQsjQUNXwERKz/kOI34HilaIt
	 gEpEL08hKb2bmMwYTPExx82/zdzb4aFa/dNSAxXltgK+uodAsIundNVDij6lvE+bkrqxF
	 7qbx+an36GizGDoghK2Y6VpeFjbNLEvAM558WGrZJ2EvO9CkhBgE5mY7f/8WVrSsGXroG
	 qX8MP0dcvzH22aInUIeqaizuxPERXHqtazI2semh5TiLTLdU64PS299a0kK8IcbuSIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aAO2IER;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25932606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25932606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aAO2IER
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb61185057so33999515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578225; x=1796183025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=0aAO2IER8kB/PZ8lVTz4ay0gUM3UnHZ/vSUnCLSG1JyAoz5XBu+KK21LecUcxMVVPv
         jsWMrr2ej7wBkGLSf8knbqOSbMCkQdfrO2H4N9ahqoxf9PkhuCMk6yKJ7aDsuw1Sllog
         n2h6BpZ1eYdLP/1TkWg1m7+VsZgy8lsZOcBvobJ1rYYRa+rc165fSgbxd2iwaIWTmohp
         xI8SWD8A92goVkdIoTQEWJCO0+eeww55ZY12t5skqCSUwNhKBJmDg8DwQBPFg/USKm9z
         q3u4ku2M7AyMbCbVEsn4NWbOtiIroMB03dZehtwAeTejOqd33rkDhsXaDj0ZB3S0ZgJ1
         veug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578225; x=1796183025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=B9GGpkCmirG0SkMNmju01twRKvxedIijexhEzFYH1UN2t9zRPyZCh+nIIbLVp0RaXK
         KIznLnm+uL/QOf2CcIo/NvmDR2o+wTXlctYXrX1IRcmq+/R+tgj5uczOCyQdpmQ2Mmw+
         0lKo3GgshwIt+cJ5Xmo7xLKGGjnTMiEOqbybBMJpM7ree1OLoTvy63q1FXFGMWZ5/eOs
         XmziDll2qWCxfn3xaJ7iBYqWsbAaknG/kXuwegPJSFHDQLT5GeCZNYkVlT9tRI8U5OG9
         yVsfWtfHlKVz1sXbXFT4rtNzBkP/sOooMC1QvXQBoZ7yVDs0Svu5M5iqY7nMkQn77S1c
         pz+w==
X-Forwarded-Encrypted: i=1; AL+hErF8pGW9Gp22eRSNETNV+T3j6hrrywFqulplOdCW8J7nCJqgHK8xn8qhM1Eo24p3buIvgHpoIdBWKSVPqfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8+GRBFXP8Nc7cTOVTzMfH9dz7i8ob6o/J3a2bRcvrFh8OrzKh
	Hwmlfq5Qp2qGEZd3o5jLijH1s9ThFvRn0rGFZ0NmYuZCG30M85SZh8jS
X-Gm-Gg: AZFdTZewrBi4ee/gqZsnyDPt5G4tIZD74XvEzG8nwcCHNZSzBxTZLxuCfL7qhMEQHx5
	JWr4McowAHPnJbZIGDZ6ykZ5IyoTRU1C4hAylHm1nTLNsdpkXeQNdw+eyQ/6MDMlSjDYyTWnNtA
	YEuyB91hB2t41m8lr2Kbilj9WlmmMzcApAkgwK12aBIZtLbQs72Xog3XqNSl51ccgWm+sUWC9rt
	t/24LAmHiXcL6SpTTgJaBwvY3tABLcZduVlkbTag9s4p0dG/6Wj2iIu33mtGqb60JjYOxO2Ivf/
	Fu2im3bEU/ODvWi4ODWUzIGEzBS3ACJpaWvbf7g8jjtehLSFMHt+SsDeX1r2ZnnG9IFI+jvLQ0b
	EvTyY7d6q3RkuzQy/ZPKHYN8968xO5JGPB7yB8OUzeyE5uv+QCz+/2vbmbgp4owj5iItCe5j14t
	TocbX4LOOgOHeQFLzMjcgmFJdT60kie48NujHkLuHKIiVMlZhW4Ckj3jtokbQ/1OYvg4tFAudsY
	Pjgi5u2xQsW4k1FbdjVSl/O8I55RHraGm7MJXfPWLJrHEYepmeI6lPegO635xQoCF9idpKNDF+M
	YtudlGNMHwKXTllXU6y9/ABa/a4a2ttJObiYNg==
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr346060575e9.3.1795578225601;
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:59 +0000
Subject: [PATCH v3 03/14] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261125-halliday-dts-v3-3-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=xCVPapQpg3IOzKVtAOHGmXsvfGx4fLaMkQfgRrvbjtK325rtMzpV4avhI4qPqmiTdlTgkoLxC
 dBxQBhGhobHDwrnWCUlsJvGEoN9HKps7J2KipZyJFkE2yjFIhJECBv7
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

