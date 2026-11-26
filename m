Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669142;
	b=qwqigJyd15cYF53e2AMOMtNhFzhxBbCwiyBtyLKeksqXN3pbu0umk4wWaPmbBoHHp062
	 h+MqsAzFu0kjDW2Ta5wgiwiRGKToMFWPAoi40Xg5vfF6BbOh4emk2gJqolP9dtVU5tyC7
	 XKjupfeshQkJYHCdgQhIQHKHV8P9FqnuU6hmbHmtQRwbHwSgZisyfLKgcWV+0NlEN1S51
	 s6HJuxj60b17GUR8ZAbBIKC1NSVK/RQTPa8ZZNVGCudVyNZq1tZK09C2VaLUQQrecxnlk
	 0U5CjsISV20YQHRGQ+AV6ju8b+1tROoa5yof0qYDlUIm5+RJYYmAjXb17HovYdjYjxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=r2xcYr3v2wvNG0iALha+MLsCo89boIxkaArFRzgtZ2K4IqbFlj5Z8JBbF+8nanlEOIEB
	 DbO/g4pFZjD5C7GcutIHU9JfCHwqvrOk95Jg7pv8RPlw+0hiYCFSW4mJxBD6KoYO++tVm
	 kVaUk9eX+ykYKrprnv5mJo8TkdJAogdaWXU67XYyBs3NkBGoJNsbT6JqlRQE8FWcTS32+
	 x//xrMO5a184ZswrNtkL0w87huIc6s3Gk1tYd9DHg3WOXJSGehZ/OScKyHTnJZClQe0Nx
	 igZMn04iCjHp1GjAg81iFAfvYlE5NNbXleflOQatWbUmcnTXhw3P4AetFHpGbsgcJjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1315606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1315606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386c336eab8so3054053eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669141; x=1796273941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=kSCCzsYD7TTe4A2sL6/ycJJjMHyhno0Gm7v4rEASckt7CADBOTSYdgZolwxbk5ly8G
         ysTH5v0qRaf81Vg/CLag5o9PIut2u/GrMvkWnKTP6/Pwm5gX0B1XOgvF9Kk1F0NPMw/A
         gNdqG3H9A56JnEPxB/tym8sSNQ0xdU3BW7VyEwNal/q9VseZZHzJRy4Hn+HzVqHdVpwd
         9Br4aEBGYslbcoSL8Hl1hFXNBFMqN6N7lLK9hsyUVcRR8xaSvrr1nSAMTM4vJ3kRNapb
         X/dkNWOYyYezCQuNUgyh6p7lfHzVVhmLBUcQkl9dZhBG91WDyReJ581nLKjT8E49GXHm
         rX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669141; x=1796273941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=Nltqd3t5ZDOazSllTNJxxcBxfBJfGCjm0KKtKTUNOn2BVnGhzNfo7VVGkrfRtYgF1U
         zKkDVNfIMRGmh8kdNtFqv7+E8npMFCR6SWOHlA3dPWnO0y3/BPgS8StCuAPmrCeKAX+s
         VhlXMijQOryPumj4VX2BjjQFxoFDsIvoAnIMSJ8Of8dX8HhSm4qCubS+KszYxRbzxIMU
         jMNctYovq8ic+/Y5MUbqr14nNG31ekOUXydnk+o8G5je0IF3KXsosCjqIQI1XA4miPs2
         pZceGdylZV4uMqxGnQ0C63JcugZGnmowGJ7AAurAxs0ZCHTOUbe1zJnxu08eQLbofl8k
         f+zQ==
X-Forwarded-Encrypted: i=1; AL+hErGVDNjgbIrPEk2OAhiOlCJEEIU4W6XZnzfMTgk+0iMYU7lLWt1i9IzmW0rjeP7CjBKz8uC2wQ1gD8rPL0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oh6kNOlW8u0QE0j7JvcRL2lXnFG3YGpJKyVM3B6jqpC8NvtJW
	fcz2oPabCv5dB6aLFCXgXKhcBA2yiaXD2xXqLzVPAbofwjgroWI2Sp46
X-Gm-Gg: AZFdTZdg8k/mQL0wpViFAbdlO0JRm+gR0Zsh7Rmq6+gHKu/Q+THmCpTCtoFTpPzU7sB
	vzSaAT2kL58QRI480ZvP4ck+kW1mhHIiFTlOpkp4nChj1eFy4vAHzqMBxtn/EY8mmQ/K0IwpvDQ
	SbyfNJgKw5vtnGZCNFo24gbMfmeb4+7e0D0x1yx9nDZgJTazSccPKgfoCBHhCIzZUW30I4/h5wf
	/2GzCN/bL//n949nKxx2eJh8bwED2bU/OI0Y7olm4ugrE1FIUMdS5F4Tkorw3meni3s5GvEU54b
	OyzqNChz0ipzrTh1mBytAc/VvWF7LJI24hqzyFi9f6zz+N/U80nBwNkO2Ez9D0+/qTUczFGmZZy
	dKByWk/0jFp4mKtWLvsY8cVw2cACJQbMiKS9lbgRPG24Lak5t7ClcEzxSZZwNlp2EQ9bYKdAUnF
	Xy/brvg14M4eeAq9AqtfHocxmT8wXMfVIRUR1dDFOC5UzRn+TKE6IiIWVc9TmZPMRRZMsLlPZ+n
	wAgm7cZ8S4fYH7LUIufM1+XbaBNek0bODxjEw/5vMt3cY7TU5B3xYxBYJ7pvAzYE95HWyDsOYk2
	33JFA6/XwwyzQTeYguYA4VRA/kkL9rvL27xBu5BEg9YGU+vsfF5H4/fj/ImaxmTEQtv27Bd9ZgN
	Id4VbTKo=
X-Received: by 2002:a05:7300:cd86:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-384b398741bmr30143044eec.5.1795669141005;
        Wed, 25 Nov 2026 20:59:01 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:00 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:09 +0000
Subject: [PATCH RESEND v15 4/8] dt-bindings: thermal: lmh: Document SM7250
 LMh
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
Message-Id: <20261126-sm7250-v15-4-492014ec0a52@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=buX/Uir1r9Tf6tM9hX+yZml9fjYOnCxBqpLAg9mgfqPDutjiJqzrSC7fD/1Lls9r89OUWSfqY
 4QvPYYL9spzAIblrGWW8QtgGHnWwsrntmH5gOADX0P6V/5pn1RhOJOm
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

