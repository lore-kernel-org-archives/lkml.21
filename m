Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169463;
	b=vuyBN/tQpSDVf4mN273S0BVJrpylp+qBIpczAUrIRiLzv1ic9uLZiC9WYrqmW2ZKIOd2
	 gVgJw2QTDm32AuuBpmkGSkUvapPp9Pn4FgtzfvDJA441Ws16DDCl3/V4duyshmNm3VnWt
	 UkcYVH81nxkDW9hDogyqJWoCt7a9xCZQURvfPbEkXf7Y5GhOi9AF2RSgiGi1QiBpGMmwV
	 zu2VF7JSuEcc4LnLtagkHfpG1JkBEp5Op8muXjC8qVCZCCBP0mpds8KjXflZLIo/oZwUd
	 XcUszB8vGins5PoMqsmkrm6JFyJCmefOrw7YKjstsAk6qXASh38V1gTlyABfy7BF/qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+X2P66M1lXCjV9DI3ActaGpKyPOmtotCNbn7tD4AhLo=;
	b=HR+7dal9erZk1TN5CjO/7+6JGbA83AJikzMYVAs5KCsPgGW1IhBlJ4E+W/UrOLyO6mMy
	 L5CPYtmPdzYz0qR2P/BxVkI3DntwHu8Bao4e+NllKi4PEx0h45KS6y1+UzewzVutgXysS
	 RWv69WNv7HGI3MMthmM6TjapircXTpzC/mS1eC1FNBF3ga9WMNFsElQ9qUhltWgL25ftq
	 GhUNGXhfawKsrvMUfakJ7AO8xelVW/P+CbknYTrFN4rMVX7HBUO6azxNecYMz2aQf1WG3
	 S10o63PHxwzT0PfaLK7hdLGe8+fbVSp8Y9tU6jItgXPUCbZ5FxBKhLiBVYagJkpnJJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rB43Fbn+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A7606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98A7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rB43Fbn+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so380946f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169461; x=1795774261; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+X2P66M1lXCjV9DI3ActaGpKyPOmtotCNbn7tD4AhLo=;
        b=rB43Fbn+qwmU1ELgHG0hARagsN5peq998DdnJflLGLIMYogt8npO4/0Dsut1FPhHG4
         CcCTnM3Z9AWehcuiTvv2Gj2Np3jXRh7ar1uUMut2IBlplPKe6oKlkf82qR+IjO1zQJU4
         uQjRwAtu6bgUtbcGuhV6FdB6WFclgNLl6Nw7VWzuflSc8Hu4qy7PO+w/kpK8yqqLoBfY
         Ses3vx/IOlbss30hl53LVqar9O2pmjBp6b9t8YZgIr4pMIMA7KiCXsJdEjLylc9T+JBs
         tyCrs9Xj9mRnvOTToo91qQvMsTEVtkuvT3tgD7kKTZCXK3IHXL3bGElircoXGc5MSGjC
         nwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169461; x=1795774261;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+X2P66M1lXCjV9DI3ActaGpKyPOmtotCNbn7tD4AhLo=;
        b=YywPIkQbYF8aqrn0wGmq3zizVUxoO+NMvqXGlmgVCUZvzbK+UTme/4Z4NzW6mncaEi
         Y/fdS0agxcTJLww0FyP0HXzBtRP+VrTrsRN3NANTQXdiSo3gmCLregEtCnunSOz68/Aj
         1UtVYU82B5PGG7E6KJ0HBNozwKDWNx0NEHZMZiD8JQ58XhYWRxEmP5zPoy4JfBhMg+Oe
         IXL+L7v9ZpW1hf600bNL15iMMzsLVLH9aMcHTmwNM/rxN2QE9FKButi6J5ZdNE6klLAq
         +B0BQkI4LgWwptVh5jOpHkOAVDVvCrhOQ0FElRmmz8LRSRUCgv6TPeANzE+ixwkZZh+r
         5XTQ==
X-Forwarded-Encrypted: i=1; AL+hErHGr8JNDwMIgYp8xKwu/r5zc+6DaBLcbXCBO9M8Uy4DADTG2G0aaJqXkp3Sir5A6RT8VZpy6ujqZABIEvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b4bnjWsM0OMn9OBw5r0E+WOrQN8thDbnTm0LObvy3E/IY+ztU
	DoLo/uCaY/4IT8T3R6KA0d9CJ1VSw9s1FNBzQ+/yy+YW2kL+8OTI6Svmt8WBKOGUv2U=
X-Gm-Gg: AZFdTZfJpYA6AsbuQdfpW3rL8bwkPiMvdbsEUVcLGkIsI1jmTMifcWrPU7X6/1JUnX0
	Ju40skxomU2pHSjZ/5aMFphRjJ3tu3tPz0SmzgjqFr7iYmyKigHIT3RkCRTGx8YE4lsuw+SsRNS
	5SFxUTcwIEs8jDZzPs2tE5DR033U314YU9QyKKpB1GYECaF9ppCBCTP+91CKrenBDjyJlLD1++H
	IXO/YfFaMahB7qspzVVtmBSXDuR2OU0bJU/1uOd85W4OP44uRF+APaeGQ9/sMr373A9RI0XPHph
	moXDcsOd3ZQCgbZnyaE/s2v2g3x2ZNolPbKVwz+rKRsBXCQb6OdI8N9rWT8V9LS8Bxelvitj8ee
	ayy8DG57NQPvsg4F+y1uCVZvPx6MLh8zUke7Vzx9+rCFUoGuNFSaGPUmwUQwnzzRwC4/ZYLS0cC
	8hlZZCn9+ShD5VTpNLHMjV/d2uo0GutI/+Vx7rHiAqMwUTsRD65nbyqdbHlbO+VKIH0E30K8dEa
	IUS46wEJZzBT0mDmhPbyKjW740MT+4ym1M9R4RPovnYmjjIS3cAlzpmaaDBfnHvaYkluSljZFbh
	zUyWRvfNd1dlgbgAGtwi/SYtgCPyM2fm25fLMnOZbzoWznSbQ9s=
X-Received: by 2002:a05:6000:470c:b0:4a6:ad0e:6cd4 with SMTP id ffacd0b85a97d-4abb759dd4dmr4599736f8f.48.1795169461013;
        Fri, 20 Nov 2026 02:11:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm4674937f8f.47.2026.11.20.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:11:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] regulator: qcom_usb_vbus: support PM8550B
Date: Fri, 20 Nov 2026 11:10:57 +0100
Message-Id: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIALEcAGsC/yXMwQrCMAwA0F8ZORtoyyrVXxEPTc00wrbSrGMw9
 u9WPb7L20G5CCtcux0Kr6IyTw321EF6xenJKI9mcMadrXUGlzlLQh3D5g3mMXhvCKsSrlQVbU9
 xcBfLgSK0IxceZPv9t/vfWunNafmmcBwflZrqz4EAAAA=
X-Change-ID: 20261120-topic-sm8x50-pm8550b-usb-vbus-14baf291e8ba
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dCoXljQk0vCwBnBceIsu+9Qc7k0ECyYukQk/bODbAII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrAByz/VqqfDxo0w+8gq9XP5KjuBclG2X/c2x/5ir9
 2g5hGhqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAcswAKCRB33NvayMhJ0fOYEA
 CF6kEIoP/fB7P/5O94hVj2It3YLHcH0SkctguuSe6zXULjqzwfle3WkOUI2jvTSUtmLFPbhT2+h81y
 OTozs30JQt6YqRUGUouq/mBpZsqUYBJEwwyJPk5wKIfFM2OMloiyFvYDu3Kzx8z6sQvEV97zE1tOgo
 4q/5TEqcfFqqS3AHyk3pHav77LKZNgxScjWU7aWVZrlPQlOowwqCb/mBGh7QUjDRk9AxO2vvGUYp08
 3GQ0sBSZwnY3/9bGXQvLMebc+u1YmeCD6aqA0Rzajhny2YFzxiAMoERtD04mg3/xKHmYGdqPiK5ua6
 8LGI7EN87DwtWII2Ah5PIWfsq2taGY0jDEQN+ot7ihXNKih1PmpPhF2EoU5lNTXRuluIoQkDhgY5sw
 8S4MAqSERLGzskl5muZJY9nrUoH7226VyovbgbvLQCSdhcA0wlUDtgNPgd3hbSoCcT4QMclsSIzFt4
 bQtR1QZwkW99OKuxQRSAYAGRxeO3ygsbjCYmLbmoP2Y3Gduq2Q7v10MD5kCPweSnBNvwGEdC+WAr/3
 Rhwc72IaCyzyv3T9ZFGUMCbj4Um/VVO4MQLpVk+BsDMREn1ih4HKRx7Mx4yLK3tKn1IIbavg9PSQi6
 F0+HrmAj2mpA0+d7n26x6+jhQ+i7EdZ1hVup0MEkwojXIjn+/v2iFgH4NzLQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add support for the PM8550B OTG boost with a different
register layout, supporting a current limit encoding from 1 A to
1.75 A in 250 mA steps, then 2 A to 10 3.5 A in 500 mA steps.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: regulator: qcom,usb-vbus-regulator: document PM8550B
      regulator: qcom_usb_vbus: add PM8550B support

 .../regulator/qcom,usb-vbus-regulator.yaml         |  6 ++++++
 drivers/regulator/qcom_usb_vbus-regulator.c        | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-topic-sm8x50-pm8550b-usb-vbus-14baf291e8ba

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

