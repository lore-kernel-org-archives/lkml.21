Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578254;
	b=0twYZ5PYlo4XrElpUpN9g7uRqvnNqaXqJMQnxI+aLLhB97bW/pwamOmKPXMPtIdtXcg3
	 KsSQg2i+qrISSJpXFRryCjozzdLaAUCqGJPIPP/Rx1l/iTgDdvGK0Hr9pGHR2dwapLrh4
	 6YeQYHo2T6X0VUj/X6l3dij/vgNIV+XGefbiRtwuk1eQVaUYEWWIEWeNIg0wpyEb/Tn5t
	 CTnFPQRSyXvdtBTje7UFyBQXIqrNl3tKZ+s6buRCtmeqtcKMkE49+4BvVgCCuE+5OjVpK
	 bKJ5FOmEDt7sO5/+6leHBjsMvdRjoS9riRtzKz1L00qYSCsFUl68FM5FKLpu3h/RKDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
	b=s7BwFhJxm6hvitEZza4R7BsBvvj9jA6GekedhElFROBMmZVwJ10L7oipRQ4sAbWfCZhM
	 pykjAjrI4WFYE+X+MAi4URey71DlBn3sitwzbjViGCZmfGH9OVHl7RLBjVjoIZuCYv7pf
	 neweXGJyWChA6DiHIP4Un4fE2fxHUXu62s6zDzCq4NQz+L5kuEXnCP7cuqc6m719v+NUF
	 9lo4LCb+zCdEvxByvK4ifFaHSKNpl8UwpJXgP71XlakQSgdQyqBIpuT50I9QdXDGgzwDs
	 2/gp2Vnaqj9HoCbJO/S1+3ARWvTA71aScmYVM4u21+13bYJ6LzKy3AxA/bda8i2AWWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635E606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E635E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so34189985e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578252; x=1796183052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=lEdBuKcF0JncIpcutUemWRCVLwcBptVk45nftYoXdUPaaPEMjOXhRvlDgUBMqszRSi
         GjVW7ES9OlK67a/2KLB5I65GkIV14Ylzo/LfhicqUla0tHCcqXUHFVnVhyXZGsWk1GYi
         30KWFrA88HI/8R90LcNab9RdDuPnarcq6aW8IuA8Dbg3UasrVz81iXsAmAz52FFpSxkl
         kwCNrdjoDvsHBIUIV7L7pGx49IZu2fqgEP7oIu858HUHqjSUGsKRfpJS4Xm/DgASvkCY
         ohconOG9BXS7zsTTxG601/wjTYdl90IpxPDLaEEQRmhw8dfhpInmpWHAFkRnignmsUL1
         jNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578252; x=1796183052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=feEMk2BeGarLxXfUvJLUc1s+PeOkrRjDhdv0mJbjf7ZGjS9FpqdyFzapTsbAlnAUo3
         6Xtm3NjcIdNI/NcLQzs0G0qYBPIoe3peLTYMfpaVx5yxSCkFTGyRQ4VVXZ21MxLzOkZZ
         xW8nJHjWjb0vxcbwY2KrEeCWW7AgOYJN8+TGn/bep14Kc2J9fY8mEBd7I+70Ccd98Jnq
         Yr5EUEsn+kPizRhYuCXxo2pwlrnl5QfMGMQ4QKOhQz+vaDWMaU+ujV6o4oWpbFN17UTo
         pFsZpcxRdOfrdQ37jVB7xekj/dL0j27HtXzpEdXvTMcKrKim+uw2R5PD2Ys7rqCciC3o
         2GBg==
X-Forwarded-Encrypted: i=1; AL+hErGBLnPZO+sBZK6njJWQtP93F8lkw24Rb6qoZ3dE4MG+2jpnxr4NHVadHBwi3KHe3KkPeGcomBxLx0oEgZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zAnZaxgVfsHqeH3+7b+5VXxML54D3W31MtBZSopCXuLibJeGz
	FUuq6DB10Ulpzfy7OH3bWLVBjKJZjWQa01TJPXjqEQ7ppetCU6WdPVJe
X-Gm-Gg: AZFdTZf7H1TjMTbshNatq67iKm8CFMv0bJo16DeEwY7XTr4L+smoxlAsfAbrurE9dpt
	MrKC7D1y3C6Vuk1GBanNE0eZNlJkfNuai3y3Ks3w5+NEYNvHqRADOHVdOknDtsGHB3zCG0daH96
	7ray/ihiZDaa1k2hx9lgAh3PLAG2RTz228o/d+Gbh44yKUdgg3JKAWXZLVQ9vL7Gn8lMpnA06jh
	ySZH2kLqdE8AEt6+ielDkGNXNt/t6Fu228D4367AWwfgjzn/gsCsGKqz/BIyNIIMwrhm5EA60wi
	0JdwCW4AkPmFeCM5gp3TeUiohXseT455cYiXmCe/4fKdh+MN85/K1rOFH37J7sSy1SRaalQ1R7e
	GsHx4Wgkji13NpCczdL8cu3a45V+uZyBAN25feNxJpYcANsqsjUG43ic11eaTm0k9S4VOx21K5w
	gZb70RoWnqRLgd6rypSmBNc7u1gKhAsTtkvnSgzYL/VK31n9tIHhrR7AjPHi/gtq1S0V/rTxtK6
	rV4pzFkbC7Yn9VSKewYoV4Zlx9kf8K46pp3W+xYXeQ8BnUJlCfP9HrjJKZ6AfnuM2QikPeqkM2+
	d48obbeCNHRm0F4HqusshUf5U8giJr0qTOpy6bpmzpJUaGcEM81uBKJlEXQ=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr399963545e9.12.1795578252392;
        Tue, 24 Nov 2026 19:44:12 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:10 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:04 +0000
Subject: [PATCH v3 08/14] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-8-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=991;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iODhhsd3yfvGtcciUvxgx8qkDXgsEtkBlczLh6ZRfrQ=;
 b=lvcDevXHoUjfOVIKmGcAADmxVZULBy9zMoHqx2H32a0E3wUM2ikLAFlGNM8+8Y16B1yXdXwzE
 0y99BcDJDu0At3F9ibFbmmvIZEbRo82dQ3K+iKDoR8DVQfXtRsOln6S
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

