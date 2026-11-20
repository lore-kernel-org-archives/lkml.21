Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171477;
	b=bCk8lEWthtfh1boDcon0+gK4/BUtawW1GOovri3SVybdmE3epItoNC+z/GZjtN/RhH4z
	 +QjGmwrT95DDXhDFqwO6GwF0U7O0EJsi+3Bgxkn79OfYBV3BXSqJl9Bygqf3tX8C5Y4cS
	 04gFnOltEUGpaXvI2pavQ5PtIibX1fAfEHPP1A51l5R4YoV4kAdA0Azyz1mMcOWRa+B6z
	 NaA5mDdOWn8gwBCJFfR+0xL+rK8P04z1dK3MeNMTVEAvT9FY1jX5UdidvxrdNuprgEjlM
	 yevL7D8CnSH7zSZy4y7Vj4q6ylDkpDdmanuK9lbtxjx6oRClxq/8kiXpWT+0ZMETFRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
	b=h21OgB6yyXXuEymZdL63zKR+25rtuVogcoLoiuR1ZWaWO+Eqe++NoAWI+avvPOY2+MUG
	 QQec50VFNaa7k0aJY5eskWqO+rez3DNDKef/oKultet7QwSa+yhUoHGrdUDdSBdeB+0t8
	 p8eU5yJSQD5QSKgs5jpzIOughSb03OPS3l5EgQ0vP8Bhc5Tb9qhRLswDBwi0ARLNj8keK
	 D9jSLB/sSQGXS4FLQn7Z8AL4V+dScZf367TTzm4C+6kPgSStTMIZZ1H/I0UQ5SphzCrwj
	 vp+ypt+POE3o0vc/f2TAEEGhPv9QvpBi9rd2ty1vXI+yd2ngnDhI8nNE8hRAWfZf7QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpLfO9iz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f7/7KSgQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D360A2602
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42D360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpLfO9iz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7/7KSgQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqew1268346
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CFNJfb0rms2y88yh6JoAtH
	T/4DKUKg5BrlVVksMmBdA=; b=BpLfO9izJdyIyPqhsPAUWIK0SMQQAiM6dFNDVU
	NqapiWQDW3feJH7UmC9fe467YOHGgwWqLYn+3iQsYBeiXCXhQYbSfARDuZvp1Aag
	PQ+Ef7AQDNASE9n0ld5uSBMSthVgCPpmChNXogYKy2rbxwWXizlGQxOWoYgHMkJI
	VHXf5VDGrzuoud3HFWNGZv1WfH+kFMCeUbEpkHmG2OLtK4Szr1L6TJsdKj/tpSBB
	INB3oQXjYtpcZV8/brKZpYYbVaREKC9pM0ME6/xXOJNWkoF/DHtKmGwn4ZtYyA6y
	Gj2n+IMOVruoA2JmSzs7Oe+DvwzhC6kQhZBXqSFeAihfhJJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t14w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:44:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1322163eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171475; x=1795776275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
        b=f7/7KSgQE/WBCZ2U7ES/+F090NTi5Vj/H8DAj9IBdfL2bsWGFjAfpK56Gp5bG67QMP
         dQaOSME1KirGzzAeRxPpBT8c6Tk7aqkwwL/I4XpiJNrRri0lgp/58zMbiZny7mxBpmcA
         UG4EUlCPLneaAcu9yyZhT8JvuWGTcQ47PkfbsmCWtbEiGx4mYSnnwrCXnlGemxIr/QU5
         xDNmXfsxE8OapfZfFrHJqOZQg2xavB32F0GRisIfNyjGya3lrojb7dVkVvgfeAKMj4Qm
         V2UJ/RnuZLN18p5EwAm12lpMHd+B+F52ip/fycta3WEJ36nO0Yk2I0D9zxYPEyZmQefi
         /yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171475; x=1795776275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
        b=a55X+8EbwtM182ixRDvHy8sEKWzQ/TI0ccooz+ztoEvCTRPKVuoofoof5JRs4wpYXL
         MuRcNyiVvQolr8OgParqSdUd1c4ACHmXDDtQCYndS1grvB0f0ub44Tx02zrUSCKUrwSs
         SyrYrehT1WupJll4fUqACGGCge9iLkfq+Imt1NfH/QeEjorTFVmM3h78vjGU9/H2bmEk
         3oewSNgV1+episW0ZONh8cb6hbm/EWOdcPWTKpsn6dDtkGcePssCX+WTAIMVA01XQMvk
         z/2rL10SZ4Qc9VzJa8Ti07ry+MQKph8tHHVSBy5mS7g5jzuy7jTcrc1G7QL71MvFsndt
         TwYw==
X-Forwarded-Encrypted: i=1; AL+hErFrIjQ8K0Yku4iqW5nP2HI1f+Kh8cd41hhJTFKQSEFLHBOnfcYZ7xe7zdVjfN0/Tey4L43ZaH+gsud2NMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AjS5vIBQzLZ2uVfJ48L6P2xwkHCEkAcQ7ee6u3vomk+p88F23
	AYwAFdeG6j4J5X9DxyM+vWPCrrzeYJJ0dGiJL4DRaCXKyY4LtAFGmNQ7c0Ulxu2O37RYWsy0++Q
	YFtfzpCi0xxMZfIwHLU3AU7o8NTAva9oktOsvu7JyrjnHZNJrcmihkflzJY8v0I6kfcA=
X-Gm-Gg: AZFdTZf+Xg4G6smPCbbl+SKUy5dwXslaDAE9Fsmkj50jOy1DLXrbr511N/C36HcJIbf
	hI5LuyE9o0K2noiA5KJYHN6hpt7OKK/RAZevUgcVvrivDuKUeBynCll9RZ5d6geCCeCmHb6DXQB
	BZvUyj6KoM3sCzfxpQ2yM7trH3/BDjXMk7MgIjZODdkQo7jbfg20PblnQwBo+b5rUQWYcn4O6Rv
	QyryNPhN5sEj0lo0kigdF6ZdJFYWJXn+k9S3mmPQPWBF3YGFtL77X5MBP9Ka+yawJIBnzdXNCbR
	GaRrMHaDmJ3kWwIGFkyiPHoLjluebSm0vJN4JyTKxRb4KRqrJK9MfTbhmqoz8zbxPGZLR4sOLxw
	EbkmBnssJNJGq0EcoExSOhr4jK+mJ5lg5dTBzBikItLDXgWFk5Q8CpN69icEm3/RmvS7YSeuB
X-Received: by 2002:a05:7301:182b:b0:383:b90a:3535 with SMTP id 5a478bee46e88-38570c2ff43mr2119398eec.24.1795171475203;
        Fri, 20 Nov 2026 02:44:35 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:383:b90a:3535 with SMTP id 5a478bee46e88-38570c2ff43mr2119366eec.24.1795171474618;
        Fri, 20 Nov 2026 02:44:34 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:34 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Fri, 20 Nov 2026 16:14:19 +0530
Message-Id: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIMkAGsC/33NwQqDMAyA4VeRnldpUqe4095jDKltp4VpXaOyI
 b77qqcdZJfAH8iXhZENzhK7JAsLdnbkfB9DnhKmW9U3ljsTm6HAHEAUvNG6cqirkXRF0zD4MPI
 8U0qe0cgaDIuXQ7AP997V2z1262j04bM/mWHb/vdm4IJnUhqBZYGmsFdPlL4m9dS+69I42MbO+
 ENBeUxhpIyuS1CiFgLkAbWu6xdRSclWCAEAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002493 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: GbJkuUxRj6_ozJW5VJODpcX0E3absPMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfXyzkwNKNOnTNJ
 0UJTfpbDbRrZ/JvacK4c+01kftrtOCP/nP5wtsjlOHu7Xp0L+LY4rsz9jmBZN1kOs2syLmisV3X
 B+c5aAa9fNKVOGmtpfUjU6d1wZdE42A3z0HuSKVMsGOx77GlqCVxGl+9JsWyrYaMC/xZjvsJMBn
 W/VBt8q4iCLmD+5aL191y0qUE2Ip6YPEAJXeO4YWBdZRmBX+NFwNnQ+/wJr63U3USAUo3JGOgT2
 UakK2heDcuqW7zZmVfI7Xz7J5WoC77LOnAnjEJ9l5OiUf9fzfcpU7ilMwUHuGd0RQMk9VYw7Guz
 RKnvr7cYZeuPN/+BAt+Eyxf14z4qAp53s8iKAfgHsxPjQSYUKWDJkbGNFYwZ5lHa048QulztV16
 vzhWYureE8ExxOysjc5Jqyho+NCQGqGyruhVhFWCUy3ENZxb0so/GNq9tr0bzQZvED0Y/mu61u0
 vpP1ty72paZYM10Ovog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX6oLTYcj61eEm
 ATVObnTRzUIFtesBgIqZ21EwgsJmdYWQZR4gMfu6WcBayaDxGHBDzrl2QuLOJQfaQzB+AHLk/UO
 XoxnNu7pPFRKYJNwGI4Jexxz79wIXts=
X-Proofpoint-ORIG-GUID: GbJkuUxRj6_ozJW5VJODpcX0E3absPMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200042

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Changes in v3:
- Collect review tags; no functional changes. Picked up the Reviewed-by
  from Abel Vesa and Jagadeesh Kona on the driver patch, and the Acked-by
  from Krzysztof Kozlowski on the dt-bindings patch.
- Link to v2: https://lore.kernel.org/r/20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com

Changes in v2:
- Drop the se_gcc_cnoc_i2c_slave_clk_src and se_gcc_i2c_slave_xo_clk_src
  RCGs; the se_gcc_i2c_slave_ahb_clk and se_gcc_i2c_slave_xo_clk branches
  are now leaf clocks with no RCG parent.
- Drop the corresponding SE_GCC_CNOC_I2C_SLAVE_CLK_SRC and
  SE_GCC_I2C_SLAVE_XO_CLK_SRC binding IDs and renumber the remaining IDs.
- Link to v1: https://lore.kernel.org/r/20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 135 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |   9 ++
 2 files changed, 144 insertions(+)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

