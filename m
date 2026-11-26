Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669165;
	b=EK7bQmmjFl76XLpIdfF1cupMt+HhFBGpSnfhnjcrwgjKolOk8FNISN5qdrezDaCMDMgI
	 RqwjuT/CQoI2lT+FGTgnvjWyJXj7CzR+5QJXmZUuLdziSwMo4DFdbAZN20EVkhKt417xE
	 2DY/9Q9b+JszsA7cQN68UcWHnrsUyc3dTCHb8C1WYgptVbSfyR0zRevfLUuuKjdR7EKJf
	 +XfmcRTady6C0Ro8EnEEDxF/VdEFlXhekrIkVFs/F73Ce3DSFmJnJ5E58b+lsnuzcmCMT
	 +qmcFmpKL3N8n1nRZLzWr7xl3dwZpQ+YjmwXjBcunUSzbv+jfxPLZfPRxUWxhHaWgQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=SLGwxD/zOSrgXr17kZdT5itKML815H01jpHIRZVKg31QU5RvEzS9pU3VyOWdJWhOvRpn
	 +H+YOjCy3110sld792tE22Uo+3vlvD6sefKaQu8RCIhkFbvkkwOj4g46qQOetTYq/nTbY
	 7dBKFkko42GkVhwmKd969ggRJx/SozHRRKM4SzUCSvq9YA3WtP+jnGOPTy/y0SlitL58R
	 hxhXPRZzKnX198NjIEIKh5PzvuLgL1U0Jguc7Gc6d3dCJk7PbgpqVP62F9Rpg1QwtvcPS
	 JILXsIHFuH8PLB5oaFcPPyOXl5UQ0nBOG1vGV9ZMViKvYWkHRD6EfE+Wktnw+wm5L+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B9606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0EUPNu5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3866a784546so9015202eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669164; x=1796273964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=g0EUPNu5vCG1KDaEwv7YBLGPLoMP8KZ7WoVFgrp5ESMpyu+wnidD/QLjIVYThZWUke
         Ub1fy5iT1lyS1Qhheq8ppbHt23EmO4mUDGw1PnB/2unVy2R2bty/WC0iuhmSLyp0Vtol
         2YEieXVlMiqDv7YQ9yxEeaT7nJeW6ag0YunW+V496cdBOJMzP0NzKs+3mbwbv+GGBKav
         JUNncL7d7oCSkyDB8BzA7VhpkDJ4+jsHDI1xIbf9en0rpLFzRBJ6a8R+6il36uFagNYs
         I/bhcBDhOPC6Rr9qb5NJeYOwMjbU9ZOQlVVJIJyVDQK6v2RMFlEEdD6L7CfvPq/ECj4W
         5tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669164; x=1796273964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=Zq+QM++xjAGASCTNWY4qKHmpKFnG0fsR7C74RVKFgetCT9RxDDzvTuh7lq1eXyZfQR
         3EiD+IwiB8x5PhJJJ+EFEDv1y+4xVSg9v/ddaFK/dfXkqt63nyUEAGxR1y79jo45F4Vz
         xb9o1H5LG+x6rS5OXFGzvDfqLW+/9TWa9kCQGCbvFkj9MVM18JUzXMVazHEOKT4fBPYf
         krZycXsUOBuvvrpPvmd2y6Vs1eSqbyQ2dpmpz9hzIjmz+CHUzZgh2nGAWTzV22vJdyQ8
         jhH5HkmrpudNLxdBBvxSCtIIwrOhKpv2Bpe25qM1DphsXFFdAPMsyerSOg6+iKh5F6Xh
         58vQ==
X-Forwarded-Encrypted: i=1; AL+hErH7Fa7l8Zot5YiB/DXiTGjI/H1xeTMJfYGCZBd8m3OqspwRGJiG4cl+v9S2a6WooaUXPnjONQ2a/tmwV4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ce6/jbenc5xlP1UuUsPcj6eDP9gqcy0zH+j2KxZeEw49fIwLg
	lC80/bJrA5nY7BPPNDNwhuoMDaXcnH1YfDbnmrIkKlgB1nOy/3dBvuOm
X-Gm-Gg: AZFdTZdtP1rRUamWuQQwDRnYDmZiZL6kxIfnhYiRz0NlCunUMLGjJJVgmHRWfv8+0yl
	I0KAN/7ZmyguiSqTk8z9PCH02+B8rY2qrCnAWTB1c9HrE1jPeiFEgYN2R+r4wSz4OTGmTvd0EoV
	Yv6QVsBX1rwPGt41Bp6SmurEpGPwNNy71jzpUKnBsM0mWFqmt3OQyo0tujea9zLrkjf+M26x8Q2
	Ug1YrF/YueX6eWYxQbKR3DRaiJhKot1EwA5QCyQTams+MNT7h3prfaIn5alPEpiavkUgRcYr2yQ
	gt1oDl4lFZS2etp00Q33oSjsHn/5CPVaCxGLxSQHZNnuHAHOIUP/gotid3DG0NSsXQ7tg9Y5cPY
	QWtFhiq+8nDZ3cfmeylAj8H2Eodt+NXfv+XUHI55lbiZJOmblm9aAJnk6Qjs6hZBby2Qox8KZNA
	Z4kVd6+b9GvSkoJ58QWPj05vuwBBSPTFH/uY8RfR9Tdmbo+cwvpXNBXX4M1+TDkJMcHMqlvL33W
	MZzeABc/+h9Z3+BmfY27Z850oVpENb1cl79SpB40DxUBk1dwEG852qBSYfmIdCI6ej3g6Xq4fR8
	I8rViZwsrK4piUzYZLoOKW8cwNNp4GKiUHYrT5H3XhSgiQS6GmvThP/NPsuNAs7ilhjGL+4XCZZ
	qLrSvPdTUDyPzE7IUhh7KdQa+LvnH
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr24177940eec.32.1795669164035;
        Wed, 25 Nov 2026 20:59:24 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:23 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:11 +0000
Subject: [PATCH RESEND v15 6/8] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
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
Message-Id: <20261126-sm7250-v15-6-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=r2mgp8vyKY7YS6WEV6WlbjzksgxAH2OHXCWlysqnGLfAg4qb8dWAEbzAtXsFTcCD/KseGgpZX
 PcFCJVXO5ABAnOZzv5+RU8kim3m9XyqAWQLCECJmV50I6nzgtR+FIy6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

