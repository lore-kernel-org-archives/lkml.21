Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205492;
	b=LZudH1qBr/A/ivSEc7ZVGNx5jBlEXv3LhLGLpx8Q4OI+N3cvx/VLfNsnOpuGokbxp+5F
	 JteeC4yF5GMQ3CyvQ2mDftUIcYOFE2Ze0JSn8GXWPv3WO1OM9U9oXTSZbuweRysijtLVq
	 TjzROYzVOZs33D0SsOCnfnpKeQEo+D0BzmALSUuuk1TsyoiS4AGQsCKwd11JLSKdRX00G
	 gNWuQu/zP7178NDBi3GgScT/+DRltd04Nw23itLByp2XqcYOEMMqPLEj9bD8q9+xHX4/k
	 KobRD+OzEQNo8fUAMbJHzjg7S2znj5s2/hH6dByBTVj2tRwUZAbzi/i7WPPuDyfVnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
	b=LdX65Eg+B7Owiv4VBJBtiv10jQz8TF+b5nozut64x6/SuzpxbWbc5hYhe7iyrE6ZboHl
	 YjHyKw/b7sDT0O5tFBOfwHTmTsDkyqeOklbW2EwH2H22aEStjsinft+6z2MOlIMT8VwgI
	 ETs2mLaCwAhTFU7FOK812k7EKBuwoLOVTZUGtnyhfpV97JZOefjt+97S4dvqHGsr3fCHu
	 JfOGXv7lU6O9T6XV3l/n/lflXaen3fG1Ce1OivPQdBymyvgPavoIwKRrdY82YtuWsUMn7
	 jziv7meXsmoBbEOMbgi1/ljO8TT0/w5W7hU5HVkqWLPqBLOs5GRbvUqDqOXN9Yo5ibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caX+YDDx;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736260A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8736260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caX+YDDx
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11018075e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205488; x=1795810288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=caX+YDDxbdK7lOatziDlxo1NbeN67mglyVy5oETr/Bg/CVDK8WbHmhkGJNrTaJhyfq
         L658wKUIOvvPgzjTnQdWj+gQkuJ/fWwmQwTEpocdjJ9bNQZEZ0iN1E/eHLd9+d1FD3kC
         4p9jeJo1Xjwh/wB52phrpgqgm+3c6cs39cBZeknpGHCebRd9+sZD9NrG9r16Eri8jIz9
         wDb6UpfFg7J7mYFjUV/VcuzGYD9hLMgTh46e9R9l3TWnjc/UAWnfb7E8EJ+b1IbdHqu6
         Jvl/ly1YZVOYNnY6KXYPTbcsxoOz8VIP7GNuOeKkaocpO93yfSEUXzaYBZbjWJXLJVOt
         ScMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205488; x=1795810288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=wtRqgfumy4SvJOWhlKXhg7aE88myHp3wzS1/rFT3J5hy0d6TzBcsJj9akIM6IoMEhN
         WNJzuQ7XrC68mG8CT/18ZqbEcsM2UvX/O6mKcHVYHHUADiFiwjPBAr8m9eeOSxrEzEa6
         E771ZA8HIpMgJ4IAeNsm46V3tpH2kqYVt/yaOzaoC8doXvEqH9DSzA2aX/QKYXSQzkfL
         CibYhPFZ0P17selATRp/CwehdygacDPe5sSuwbkYc+7Hkqqd0y8B15acA6HmO5rv2VdH
         GK0erGOl9IP6kFg0T61DdK8Q6IZcScrSnoV5cT4qFjomLo+m3izdj9GNyvjSzc3E3b22
         P06g==
X-Forwarded-Encrypted: i=1; AL+hErFCyv5EvhhxJJ5NjOo+vRRbH78Me57YiQvbvvJRkFkXNruhxcVhuccGrKKRU63v/LAX7hYwTkpqey2RTPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7dOV4V0qRCeQp774DgCF9u6oEbt75Hl1P/RMNoijTZunF+efy
	xEluW30DmYyz9VGk3rQvEbH5k0n4uOk5/xSs9wzUi3CusrUGJBvw1Lft
X-Gm-Gg: AYBFou0pGtWSPFcKYuPo97DhAm7V6GKz4Ge+q7OuV1Sod+ycL/MdxOa4MyEJqtN8QV9
	mY6MMBfR9FOsr1G2joEf37f2u8W0QAUNfygW8E5K1izP5dMsbPKOYeimOAsbGK64hpcqHa53jep
	gBaiDPybJfojeRokBF9t83ztFLR08j+30q6qhrmVLmSFPpzNLeTgGFtjo9CIqWTnRa58lF6ftZR
	vj4h3fJf83EephjNuPCJxLQ1/R4P4fH/8O+jk9R5dNLZCp1OwYUpzoz73EyNgyAkpz8ng9tvn2H
	0Ifoh/L8go/IFk4iatr0rpCA7rfxGqFATbqB7F7/M+6IIEf5cjpVeVdrvrvnMLhIk9qJ1rUsmEz
	a5nEPe9TSnC47ktLJYzlERl4P1ACBbs9PxlEOr/cWjP9vZYU28DPd/0EiNIFdgHFVQ+13WlxJ0L
	c7tFbjr4MADZ4Pvq+cZ4aSBh5pLaw5Hj7rIzNIdvenWhDqWIGyAYXFOm+WlOKJSUPJxzEh2fxdn
	X7X42ObuZhjslgEhr0fzntYUCzMeUoxmCj9H72XYLBuSZSZ+S4w2SmgEwEGsvK96WneKbz1SzPZ
	wp9ksQ+9rUbJ+TyOfLTpHidDdbbH35ZGZJSccacRq5mGSShp1Q==
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr104686305e9.2.1795205487788;
        Fri, 20 Nov 2026 12:11:27 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm115561275e9.3.2026.11.20.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:11:27 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:10:52 +0100
Message-ID: <20261120201127.90969-2-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
References: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
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

Document the ASUS Vivobook S 16 S3607QA, a laptop based on the
Snapdragon X X1-26-100 (X1P42100, Purwa).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2390568de805 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1350,6 +1350,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - asus,vivobook-s16-s3607qa
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
-- 
2.47.3

