Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636362;
	b=gAaPhavGmfiQjafgSF3svkYFoTPdercOJ6HoHscG20dtaOaEe6i8T9os1u/5D4rsuk+W
	 I59rv38vZbJ6WDp2cyiK6MG2m9tBtGG6KJMReOaX16j85NU2C6CT8fFSyNcoYiHCpEuuZ
	 OEMaHg9TWAf/WhV3ljot0RJLZNC+X1MCCQ1IGyGprpATTBunTa47ZyREHQmBVnC9FZzHL
	 StvmmY9+aT14MHLB5JVrs8jen507pjrV/KjuOyjpVm7qZbjCj4UheYn5Yx60FvdcZHL7U
	 KyZV8Tp2BC1unbgE1rwzfkIEDUG38zaqkbAXiieVmK01b3qD2jD7jzmfNoJmwab2nJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
	b=QDHkMCHH28Dt53Qpin+ybU81fbYckCqXY7ru983TasRxHIWZI71z4XfC5TJCLY6MmXRA
	 ZA8bsQVftzjjzFOiby99ooxkVNOGmdV0AlgyQ+bFi0ovQ0tPUiwY6+ILL/dkU4T/gurTh
	 8EUoctIjIMDezikVSqexggWcw8GDkCdYfIH1gV1O4Gg980j+THetW9OqEDkknoNlYFC50
	 pygiDVueUwBvjvuXSWBeeIQaesZ/5ta7lqUxRV6tqk/vtuiUmDhYUcq/LLa6mrMMO6vuP
	 uQkT6BLeC3WvdU6xT4CBtukhOfOEN82AUqhG3UtuDq32YCdfpr50PlPY+FV+/mcrU/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93089606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93089606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAnMZ1357571
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5Ba6vNo1bD
	vLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=; b=GMgKYdXWZ0gm+Ob3m02qRVB5PEC
	4KolNbAyyw/cqFfqySAd59iHE29pI4+EZaCQ68iR333XQGljNnQX6fGglPumAWXg
	hkyjeFTKwNNw5KgPZAXpJIKo+AWahgqVtXrJvZ4rQEvQStZag0Q9JTzCNY+Gotfi
	ttaN6cf1TEDBx7lFoS0KFzSapkFr3yD5Zfmeg1G3bIvVrTBNufy3HMXqXvK1OGhP
	4LVwRfuXy2fGg/3V3LfGmwoarjdKnVGiKbU9ObaOy++RuzCoQgH4YVBWFCnTLPID
	ezWEBjcqJi2NUHXFlaupGGtlFErTBPFroEaF2iOYIkJloiLGIIQ93zUAjfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxsts5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so1063894485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636360; x=1796241160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=FDZ9GH6kamTMbugi6haXsezU3CeblbCvu4LGkN5ZoMlqf8SV+hB0jCQR0hvz3cUhUK
         vr8py4EkxqiY5R7b/aCBOt6+9R+Y/uOWgpp8L2qgU+Op4miMNrl6pd7So4xKwaNmnDT1
         U1/5Yx/gzfjeLFDfPESpMErqdp/s5j2dk6RN0epaXw+Nb6MlseBQg7E/+S/fg49CiKm5
         dWRphyNpD48KbYvQQ1FPrqgmL7Nq+Jw6rHDnpRInae1y5kUHq1nGIP7W+ZXaF5Ftrpcb
         wcWbyQWPr5aGNPtFZWKjNXX/wyfCj3kEIFtqjgGIcn5nSzGG7O8VbUxn0B3OiwQ4R1Ew
         Jt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636360; x=1796241160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=Nr6XwOSGGHDKMW3m55lq1ReQMA7cW79aw2GG96g9oCjjdm77kbqLPl7V3n/tZpjwI6
         V6SeweJl42orPrzPT6rNsjQ9aY6YaiE39yjLXYzQN51FLzSewyB08TlL+3t/MSI4AZZD
         Ry4VhC4lEAkcXTlBp6qlswf091siB1mLGmuzIEc8cBSJ6FAqwqMzrJnqUEpZFn5nQWDd
         qyc2y3qqqxyb87UuCoJhOV0zq7Qp/FSApXaj9EAMGDxU9KS4HAyXuz0VNZIK4GQRl/pa
         V0AmbH70kngYxttFA1fp9T6dF4LbFGvA2iZ2sMoOPiNddnDkt0EA4xqji9ZogRwztlso
         0gqA==
X-Forwarded-Encrypted: i=1; AL+hErE1v9EiikvkqZugIJ7xCmwEbrwEVm5fLw4P5FLTqutLS4Ma9/rQLCnyBPGkLueXgprGoLHtgF/8iA7Ksro=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zfTNBhvz24im4aqAC19hzT7eddFJbklUZoOKBm6cldxMSlO6f
	Ps4OggcTmJED43ES2vYsHGnWON4c8YFenvLMVtz6Vs3g2sbeJyVQ4cpRWjS4G6l/u//7gJ7vxqI
	dOYdowF4ML06VOhaZz1FPrX14sbkYCksS6yh09MqzqnArJUMcF84bqEmYbI93LVJUzpI=
X-Gm-Gg: AZFdTZdNTyGGlefmPS5R9qf/CqQec0MuB80ue5PLJgGaUEHWb1kIJ54OiNqZCQpc2jO
	GYP0ovyY37uG8MyyerIHT7oE9y2Dw0wiexCcHEemkxHafTffqrJdWqk8NPymRHN5i32mPg4Udfk
	zSmOoht665Ofx0BJEiHP+UI8NnUqiCvkqjRlZ6Z2rvVV6KOmXpgjmQE0wPMRHgawrEWAtNMuMRp
	Kk6bGTTA7H98e1CKG8AVT24XzXv5PuA4Iw6ADsJkSmp7sky9ByUSaVg2dgBwdFHxjW8XWOhGjlk
	Nu1jF+9f1gLTxLXv3TFadkyydFLIkrY1nzCltgM9s72yUfhg9cw+d93fIAuSThKpAWSW4yAm0+d
	P7rKSVF9u7mqvkvb0e5o+L8jxbJ/+NhcQgSZTJJ7j6rXZxOt/QO0DlJIHmH4zYW6d
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386854185a.30.1795636359945;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386849885a.30.1795636359464;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Wed, 25 Nov 2026 19:52:24 +0000
Message-ID: <20261125195226.1563577-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: YMh9K0JsuPPaaQzQZlVHN5YQDCdukmGc
X-Proofpoint-ORIG-GUID: YMh9K0JsuPPaaQzQZlVHN5YQDCdukmGc
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b073c88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vMC6Bm_45Gru1Dc4I5QA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX7Ic/mj2FqnTU
 hbGAI/ha74H+wKLefymqgHtY17YLmpFYW/l/kdimifAgWvSH5oFkK7xBWkCnNPeF53Hkd6e3F9a
 3w3XkmzdBIxbWag4mLsGZYAQTwaYg/5diYLETki28WeLzmKI5DJnbgbVjJRltxi1t3rnKJAJK9v
 cftazTR8P1D9vphO55hDopdrO8nvyB+3DFmAAzXCJZH/jadUlnvhpYyIXM+hGV1shWV2a03HWj7
 IW4TYKWuBBtn8YlWjdZb/6sSn1hXmnHYwjMypYntMJn+Z3pgGx6xFjbdUE/+JVtAyTB+A4Odbjs
 pIOFgAJ1b567o9XE5Z9s1ZCccB95fSzRDN6mMAzrz5CeJIjjH9j1QUcwGqsP8Vp+SUf6sXh3oq8
 ojCnzEbpw7+0qtxSvVpxwc+HmmBnqzD+ro0b5M6yXVbhu17i1kxJqnzCXFNZg5IeNfuXrfJhXjp
 nh64mIHkgoxdQXgcg6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX+OlGWnuIU+Qs
 mPnkrMvibGmUnsrEoFg7GQ+xpigdMjUWNFcoRaEX82d6IiHvOcMXtc1jSX7qf9iVjdPn3KshOIf
 Nogv6auY8ILq+B+H0MUSxgA14IQTMeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 and reuses the same
programming model, so list it with qcom,pmk8550-pwm as a fallback
compatible.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..e018f1f3532a 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -49,6 +49,10 @@ properties:
           - enum:
               - qcom,pm8937-pwm
           - const: qcom,pm8916-pwm
+      - items:
+          - enum:
+              - qcom,pmk8850-pwm
+          - const: qcom,pmk8550-pwm
 
   "#pwm-cells":
     const: 2
-- 
2.53.0

