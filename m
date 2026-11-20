Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190095;
	b=e0ernHpihNRWfGIbI1wGjBuDtKIu2zxc06a71CpxvWRHtuE1f4MwrfnPeP+vCeVZa7ky
	 tGPVt8sgyP9xOF2MtuYkGgjwg+dClkK1dH47nObINbdX4Xhp2JWosmDNRi2/kZR5GR1Vb
	 lMcV1vLLEIDq97/UqpYAsaXmlPivBx3iA0j1eMxH/e362nM3Ue+iIt4zKEffh0fwLEkw9
	 OTkRbQ1ifUh9u/x3yCpWmBqAsRJ6LE3gIhN+l5i+xMjodpYn9AMbnmO9OUKS6N8V7g2VI
	 jXkYIBg8x381uxUCSdkB71vNX1RMD37Qk0ko535QkqqKIOLjTE68GRtIVjixyseO+kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=qi4ZwOj0vDBrEE3PWUogqrEhsR4aPyaXrH3HEuJi53fwZKopvkb8egUu8ZI3JkiPKT6b
	 pYfk5azvGP/mJ7BUxfTLTTm6wnuVVCkPNSUR2mUHdqUCdIRLHNMwyRk31Ch/e39NzI7Nj
	 TJ9gKOGdyqFn/gq8KWYDMKJqTlNm3Vt3Vo4zyhv8Dt4CooW2vbXDXbx0mDjgz4ShiQSbb
	 6Nent0ZloRTOU6AfavxQ9kdDjvbhnzMz4mwp/K3KSyGbrLs7FWF2Au7kojwC+sABOoK4G
	 t4cb8f05qrYLwx9NpBSQlOppv4SR9nNesSOm6xYoIuq90+BKkv9pYkqRzxdHMdrSu+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05FF606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05FF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso829040f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190093; x=1795794893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=C9ymzV1nmJJShkya7UcSKR6iPDN+n6RuxSd56u4zS4owB/0cvJp3RDW67ws+Gmp9Oy
         JxkSDl1mw5dfJV7cYJf1CnuPNq33/dywYRPcs51Z/1PqES9VB53htY2kCtrGZZHijOLx
         teyhPFNnnKYqEPMEQZo5lIg+/YPMVhfYBIqmI3bq4n9ha6d4mIcSse0j+8r3/ZHFpyFr
         WeiAvffXOcPc1haHpB4IMFkmCXmC9Y4WOziIjRLOEMZil0DiqeOpJQF98Br5cMKFdLjB
         bP67IuLd2gKNBPlgGiD1S+FbgLuFU+Bup66zVZR6ib61yBQMSNyG+iFQHkMB8KJy6+j4
         eDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190093; x=1795794893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=HKda2/582yE5SKJUz/5mkxCOI2fUQI22ejlU6rKoM1WVn2WQg95EvWVObJfqqBxTHK
         ThqZDKB2+Q9PQ9UAFUBr0U+FPMKK0+KpRd4Q+P8W9OvYtYfhbykRvBn+oW13R8uDnf2W
         XLTPtIrJ6qg42lFuHLqpmDaIGk1fLPgBZLe+DzO8rvr+VWKW9nrraKAHbMyxjbXZTjvF
         Ic0kgn8pF8uOLAIW+wIAf5ZkxJ8fQuZdDRhFXZFo9kzzQrUtQJ2oF74PDOhuXjruZhvK
         JPvBmV/m0mhqYKshwqbnbxKofZT2cxSASDew0xfDd1a4eivIs+30Jsc8eY0TTC2Wu3tJ
         QtsQ==
X-Forwarded-Encrypted: i=1; AL+hErFXiQw4uBNsixT2Cc1s1V9ToeY2TKO260AyZ3pLSMHUdvB0xFSX2fBs9/NezgN7EdKl5DrpFhDAi+usuzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f/An4oAWq/rXOEWR0/cuXeZ1BCzK+/S0iMpLj7XNexqFixF0W
	9APqnFdcxkMrz3gJsqBbry0AQeyE3oz27KAZa7+Vl3RSmU4smue7jKGG
X-Gm-Gg: AYBFou07VAYHEn2jAgiM8ZK3Z9sX47LRZMGvQHprT38Mf+6KfCzPhvr9Ar78Ina3Oe/
	UoP08+uuBxzHg9n39yeUpUIkZ4RYUSBguW1fvgbRE4hXWQbw9PvZrzmWdlpzIMGCtAGFHGy4kpV
	EmgKGrriLOp7NCBrtZKp8Qj0/4P40DM0R6MZtSBezeL5Q+AVNmR/7tNJwyYr5twNH1jLTrQZ0ZD
	7P4bfvwP6wyCe9mXEl0VtEIoImqEflun2c8q6KJhBTGNpZ3pjPfbGx9aBlOJc5bw53QnHyzaRyp
	RxyDjTUXfNRR78gfAO0ZDH5afokN7ikN5G/lIQgOspgo+7Xu+XmDjCwsGO25TLFE5V1D3xHUyY6
	AQWuvK+kmA2Uh2LHjQ0uSIREKq7hF0iZ9MyKZAWbZqB2yi8Q7ELisWU7hEZyOXEmc2CMW6T4plA
	diiwwyCJctW0AV3fjbIoBcSry4B3TrKtfGfiZda87olG0aP15Ed3EqsH6LwlM+ZStXdMjB12fF/
	jMwqe31JzC0fr02XpYaE7yRaZ5bA0S5ORicS/b3ZiTAV1s3CGfbXFOuIeK93uJ9ZHgRgwgUKwOL
	fPMotQQ3NPy+x33Pwix6gNoc2KSyoMCStUEHCrh8j2aSPo8eUG9g1nbGYFO8JPMzKJX5p8PtVXM
	=
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr76390745e9.16.1795190093061;
        Fri, 20 Nov 2026 07:54:53 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:52 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 16:54:40 +0100
Message-Id: <20261120155450.7719-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

