Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166430;
	b=PKxWEUJf/O1T/ThGobK7bF0taE4wr3jOXssb9rukEabzgZIh8h160QeTLV2gl/0SyPOn
	 kSDH9v3rnW9yaQU1z7i2j4o1kdbAbqSZmVJxdNVIs9DMZ2rfHZEfYyxpD5TMhsS/5iJWk
	 GJQbNcm1W0yh4jxtV38eWpkluZkssZCgId4fz3veekEInW9UH/XJPExZdv79q70CxsNuj
	 aQlhdetpnf+yRu8If7II5GyCd67to29rxjliA+uqWZjNUzVLiSYpEAtMGgtBacTKA1ryb
	 2MJvAhjlJo9Lbcv+wnwGQy6L6hG1wQkSV4FYCTfkktmnnhzs4lf+E0ajzGGDvNUTEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
	b=Ch1Ds0H5UDZdndbBhWj4Hs15AIfzEIh2iRlpVwFbHCfzSfdIEM6DqMSja9WOeyg6unAV
	 Tc5IU7m01PK3c5v/Tqy3dzNAYg+VpGrb8oENVDh/KUmRYL1cq4ZZk2ZmkSWnNuYVu/Ye5
	 Sp0ytV493CIOHJsHq9i1yCiFCDEHUIbAwLL6TBTZ/lFJtc3pRp4wvu3f8L+Ks1B2o7KhV
	 DXgEZ8N7ozyYqLQmai/eY+M+D4y9NsU2X33ZkwCxn4zkUqaHhsNQRxbVtH30kK51kgFpu
	 ZKqAhTrZS9zdQE2kYxLSnhy1d1F5mq6CdAUJstmGpIg2JBumwcns83zX7xsVKzilKTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sxx30HjK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAqBq1eC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A6606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02A6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sxx30HjK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAqBq1eC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0q31742007
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=; b=Sxx30HjK968a0r9i
	nN2cUmnoXw0Av8mzVOSMfRp4ONN06PUjpqFbEgR04gIGoD/LnNnXxPRLsxQ9Zq8i
	4P+unKEz3BRJ1/Pluhk5E2uw7MDuVCAxAQC9+F/esmcAwnBHl0zCYxZ9WYyHRvQh
	zq7lweKg1PCP5nHi5rWCLG5VCikm5xbXYM0hyroXWavY1DeejKB2294VGac4IpHj
	tQULnoB4SG503IpKnARyvT0erRPZDVOSpkDBlF1uIwOy0C9BwBwAIIFfVqlSDmxB
	t+aUkNkdDqWNohc+X30+8qDIw/0Z65I2ssby12ElIMQEkJcVxVV+1lL4GGy+ETJM
	cxvavA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yh5a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso658811b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166427; x=1795771227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
        b=SAqBq1eCWBQT/FankBbIFETu7bCbhxbSFxTuTlKkJ2TZV5hjC5sNdpLmbScKXZw42p
         wO4OTi/1ubBwEI1Wds/s7Av33pqAE3nYGQ9sycDkZikYUQUW5ewyGzIMejXZ9Xkbk1wG
         sHbtJLqo16TzPWFY64SkHiS9nLtbDizRbavJeB5osX9pZyPFMzrViJbB5LPm7C0eDgZa
         i4EGvyq0yGvBZRWor7fud3Z0lChbPSMIPSmMTw9aGtxpdHnjpfH6n8jrCmuzXw6cuMfH
         f6m+L3TOs4yFpMs3CqnVYJ21JoGRmgjLFnq6VHLC7uwyL3K6qECb+YU7PC+/J+nPdaYT
         0oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166427; x=1795771227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
        b=Ox1QFFojDY1DDE+0OVxKHCdyfSJiLmfSnEEsxiPFtob77XWXt7uQ/ThuUSGS3sec4q
         reChqaNP4oSQXOCQTfLlkKsmK7uo64aZ9h1sLJjKphqrWTGOiE/0A1skA1m9JTBXAAMV
         4StWBTXCVIn5kUUgM5/jnRsEWM744iLLtqRrTFpM19pD/GLo0/PkOcXT6Bn6mzivyQ37
         PzscBiytt68Q0DA772a/iInPezWok0miNABFjQHzVzoXK1q5hwan+j+fNGhqxcWBt0XJ
         xzFZ9n847ODXYVutupgtRtSEhQ1x7hzmL3CStxK6GopQebVeztuLZl4Nq8jsGgL69kEw
         tz2w==
X-Forwarded-Encrypted: i=1; AL+hErEUZwsgHse8rw3FzBxiX4DfBQPh9vihgIl5U81+0e0WfWR2n+jmacdqs5Q240CHvnQLrVtO7UMewBPBTmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nFq9RrOrl1OFqTb8z8VJf/I//EMJn7Ctzu19hMFoe8BbTPNV6
	csCC+MqlPNFzOgLMb9Wxx3uD0pe5jOu7ubLkVeP0s8nmTfbrNQbhw8YAQ1quGJlP9rYIR3GmMRj
	Xk2tSbDZ5yNdFtKSRP7clKQT6Eu+r1YITAWJ3CZ9Bk0UWNQ3bO9wwj4LL7Gnhz/vPYsM=
X-Gm-Gg: AYBFou284M6dAXrGlqPo3VBxLOvgzgeV4IpB/utDUAF++pHpON0BbsMIjjLdz2mSSB2
	X9MzaG3a6u3oPPH0fnlfnkwXyCAn+0JfS15nUgUAt6BIk0ixI2ed+wO/bjUOsA4vGcXKarexKFW
	mnbnVwBqrCrlg1zAeHtzEv4/9ssdBe/MWDUHzM55HJjHOvbysUQTLtRQ8RUQlorBCyPgQGcnyMA
	lCWXLte3fsIqSUDVLHsQ+LsLfnZywtPqsJFH7iGRoq98QeltICbW1FEg67MZXajnVrNmBaamLnN
	ViH0KsjAT4ULx55CPb0L7JeF+V8wxCLCM2bBs0ip7PA/yDJ70pr9Kj+CuzP5mhMU6OPiRnVccgi
	fEAKSxeWqZ3QKdUtyiFRmXPU5Muk+SasRQGoHDAwlW1KQts32AKBsI1aogo8JjFtNxqtV
X-Received: by 2002:a05:6300:6bc8:10b0:402:13e6:58b with SMTP id adf61e73a8af0-40213e6061fmr373895637.37.1795166427413;
        Fri, 20 Nov 2026 01:20:27 -0800 (PST)
X-Received: by 2002:a05:6300:6bc8:10b0:402:13e6:58b with SMTP id adf61e73a8af0-40213e6061fmr373886637.37.1795166426985;
        Fri, 20 Nov 2026 01:20:26 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:26 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:41 +0530
Subject: [PATCH v2 1/7] dt-bindings: iio: adc: Add "qcom,adc5-gen4"
 property for ADC channels
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
Message-Id: <20261120-pmic5_gen4_adc-v2-1-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1979;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F3jVIKW9NilXKZEG5EHwwNF+JBuq151qbC6+MY489TM=;
 b=8ENEqOoPLDHnJzh4eRJTEVq+hTwbYAEvLcp4kzvlcSiRgRjVSn+k7VUXrN6c2rQeOwm94xhUF
 j/xnvYGUOlUC/7vayoAhBUPFpJYPfxeB1KG4OvcYZ/AhxcJRN8Va7KG
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b0010dc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AKg146UrkyRmMzRSXpsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX5hPEUZ2dODqh
 UcjRzIqoxpTm3jMTfsCDGICqDK2RjJoebLIqyDnzNHhZYVdrtTG1rloWGHc7Dg5wDpLmw6D1m4V
 5xJednrGGlZAdxO14yMrFZXJYnPKmx8qqMGGFw/7L4+ZTCuqztmR8H2oc9i0IQTL/cG+Occd9bu
 2YTKovm5u81HOyekwh3cBdRVYfyF3zkL6ET0oFgIbM3xCxmCFjmITz89TYn0D1biMh1k+scZlVx
 bjys46MxUJFvZOJ3JqnvTnATsaXt+8UUd8Kw3tiQNPOYsHAWrtp4O51kaugjzaOAHXLlN6mRUuW
 7dFql62x2wTbtnMWvSc2osOg8f8Z4/mRJqXWbdjEkPWEZptY49ofd21MdfaycuvXDDhI7H0PFNs
 4I/6vIuaCah3I6Hdv5PWshe9R5i0pCendXQ6pi0y2xdcLXqt8e6rVAm4Uu7YMrbcoA01cF7uxpU
 84HlJzqMiNiRx9hb6tQ==
X-Proofpoint-GUID: 6CSm1OyCtKs8HT9pPKGZdEST4ygyAXT3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfXwdrIBZ68vIQI
 XwNvGCWp4ujn5Gtf8NxvG2rudKigXGX/xOGx6i8tVEHPrWk+BQZoxJ5zBFMZ93xAAIdSN8O72w2
 vhyM8YsXjqTTnsdX11qGSG+O9eMSULA=
X-Proofpoint-ORIG-GUID: 6CSm1OyCtKs8HT9pPKGZdEST4ygyAXT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200036

PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
improved performance, mostly at the hardware level. The main differences
are increased ratiometric conversion resolution (from 14 bits to 16 bits)
and increased bit field width for PMIC SID (to allow communication with an
increased number of PMICs, supported on latest SoCs).

In the Gen3 ADC topology, the ADC peripheral on the master PMIC
communicates with ADCs on other PMICs. It is possible that some of these
other PMICs have ADCs of a different generation and may need to be handled
differently (for example, on SM8750, PMK8550 is the master PMIC with Gen3
ADC peripheral and it communicates with PMIH0108, which has Gen4 ADC).
Add the "qcom,adc5-gen4" ADC channel property to indicate that a channel
is of type Gen4 ADC.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
index 149f4af8f4b8..065b82c41e86 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
@@ -83,6 +83,14 @@ patternProperties:
           This property indicates ADC_TM monitoring is done on this channel.
         type: boolean
 
+      qcom,adc5-gen4:
+        description:
+          Indicates channel is of type ADC5 Gen4. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen3, but some of the other PMICs it
+          communicates with have ADC peripherals of type Gen4, so channels of those PMICs
+          need to be marked as Gen4 to ensure their conversions are handled correctly.
+        type: boolean
+
 required:
   - compatible
   - reg

-- 
2.43.0

