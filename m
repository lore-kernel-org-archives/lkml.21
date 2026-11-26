Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669176;
	b=LetO/fs4VFs8GM9foB9Dc98jzQKvXp3H2eQAnN8BK4QtuPh/+P4MV8NLqovzE5r5nqUY
	 i8h3trirkNtj/1qFwigLKPm2+u1BF60B2C60DWBgOJIFVBKuymjViEyULhxFyvWk4kC1E
	 zrne0jkifHODFcNX7+5cg7EXjm7ljAE2gT8cW2xLxnm9oNoFfzaeax1dfByB+F8ZVzkWS
	 RdW2YdXTwdtMymNaw3zH0NyC6nV2UK9kcVLs/9p/kUP8kuofh174N4ad0ozTyMlbWseyC
	 /VojChNibmGIytrDPWXKHLWUmEQfQxwpW539Wwd31SW5o/ycyO8I+aVLwUNe6AQ3MDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=hvR65PKXbFWC84kIQuebDBdZGsskmmyGj9eJpk7bAoq6yfPNAjGCIOJgHaTUCXcn5fm+
	 3fZMADDAmUn1e040p6THlHWG3mXQytd71aw2ssY8OsIzHA6KbHYocVV5cH+OrZAnKDZ/f
	 h0ZyJWyJLrpWDbSD3i3B6d+yjIdEwm5jc4Hvx1Vkjyedl7YZrsPA991XPGw1KmN1gqvEE
	 hylEWzb0wIuH9qdjhsJd06Mnt6GiNhopepSL0ss8n6P+LEba3549ooUIZKlrkEUtchR6C
	 mBXKxGRqmDTuXYg7izp3pssXhW3KAk262p59YXiwa4fVFzmjNEl20acgYc3c6/zHncA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so10953799c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669175; x=1796273975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=NFzPJxa7EhtRIB8MazICb1dZm6fNciu0+eLItxW0oiWruoT5aOguqNE9G7jmzxP/nA
         RkpbDJiqDE5/e/XWOmDUN9BV9cSiaDUdMuaUhMM5Z1F+/uyFtVQotT/LTzXewNqPOcrK
         541FmdJagqAoifV30pAUDCG4f8L7RW4NhtqiSqPAIzbhUAc+6zECJG7U9IjNiZrzGU6Q
         t+0xX+hdpAo23j3UIy+7AbGneIcGJTSZpbhmnjOS00LsvKUAP5XNqSiAFcbuW89YxiVX
         0ifHTVOKgbf+QXew0DyLfF/gaqOm2d43nuwGJtKoPISb2Lrlip4DV0RUkvymXqVvE1aX
         1tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669175; x=1796273975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=b3NcdBkihFVgyi/IgL6nug2P+ii5usRj6A7TMdhbpgCUWte2k7vzfm5Z73pRfZc0Ox
         scL/FqFsnKCpK0knbvgC/3exC8z3b8s1GVGTkSJWCvhxeKC9/wQb3yQyutJ8B5p7vsEc
         UMJgYqu2R/mJDWxaUFmBntfHtL7kNR0jJ2BgQxz43K6FxKuWNf9//cdIM0bGTdcXcyI8
         86BAwlG0rAHGE6KYDXXqi2iEf3GBKu28ka7WxXrYbD5rFooKTIrS7nPO40aE0yAn6kEN
         p5C8G5dJ2TT0EC8AZCtSI+aFdWEnrTt82YM0Le6zDLpNDjyrgLJt3TXtJqTmQLIX76qm
         SspQ==
X-Forwarded-Encrypted: i=1; AL+hErHwrWnZEAY2c/BpOyL/pZ4MVjAqj4LOEYPMnFh79HlYLtz5wWbOWUjl+K0XhNZPyGNoiXVoNjesg4IDKTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kAPkB2BOshKta8Vfs58RsFYjPDn7UZ4zS3YTwSEwsY3PeAoGt
	qFABWt9s1ElByzCxQdp/Haj6XqWb9QdHjUSN5k8VBRkLKdqOTpxLOVxV
X-Gm-Gg: AZFdTZcL1vIVmqXpPCmLk2APJqm/NHglJRfjp/HiEZXCdGQ0ABSAvcG/VlykqeqXDPe
	jshTBrcyvJMc34YDNzN8Bp0AZxCQMZtHx6LG4zjiuag5PqMWGGxKZl4XYARzsFbu8tHQiaDyg/5
	M/W/r1U7ay3xcYtff70irdEoaIh6Xybo5z+rH8ipatdwVctC3Qd+JNdVOL4pkCxsf2FMTDap/N9
	yQ9uq7QLWQk3Zw8zSIH38Y57Se+H4EfNkpGOe/fKPmGOrPqir1Ix2ffGNO3XUvKdrBREQ774KZv
	R551mxANceknHkaDeRoqONvpkvOMYozvceEN8Yp3dlmo8kzrUIbfCcgvgIBfWy9QIqi6jJ/spdT
	N0wtlr9cs+qCVvVTxq4nFoSAHFwwob3U81+blh//AL5Vj+UV/7EkF6tyv1TKTbZRPMIVVbdvjYF
	L9nvnl82uycwBkKY8D9UgqaOp6ayb6q1/w/nzj169qrdjzk3qFapIzmiLB6cb+5DMnEQal5SOBZ
	RB191OleuNhoKFnHQL/2po3HlIy96WzJjYyWAAY2dKDYmQKBpN2nr0lCBI3crswASZNiW4uXd6F
	XKm8DwcjighpMK9RZRaKVusL7ZIBOwayvl1OoO8rG3dApkZqYZZHPKI8t1lOgomQYoDkXbFPCHi
	BAtkXdvU=
X-Received: by 2002:a05:7300:430a:b0:382:7375:1306 with SMTP id 5a478bee46e88-3856fc603eemr27572642eec.14.1795669175490;
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:12 +0000
Subject: [PATCH RESEND v15 7/8] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261126-sm7250-v15-7-492014ec0a52@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=8XP+FxMcNtFvSYN8lg3S9ocnbk4kDsIE+kYG7fw3nlTEyPSnWVN5CZnQShpMnN17s5A1283xW
 e+Hz0YVjyQNCExYfLFHhn0nc2qpGwYHJGGrY6U07WfxPHY8D44hRghs
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

