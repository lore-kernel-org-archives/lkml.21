Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107873;
	b=RFuA34ALSiA/9l8bAFOhwJJy5BbHBPSuMHG0gHjAcUyFYil88YNGcIBQ5YWccpJq2ARG
	 SgC8KsA+qAkgqFp3Xtf0aOD/rGFI8xfWiHoR1sVitjUjYhwk2eX+ZxLQ/FJgOiyTUwf+M
	 Z6ooeAGuJISoUFU7Xn/M0MXUBK3OIwvpy8br3jErItbu9SYc3Lkz2HIMDBdxXL0ZXpLdG
	 RzIxmeZZTxbXa5LiwqdSA+63nH4bB0tWIXlnVUBWtTDpIrqyCZbRCxlbcuSN1sA4SxeFP
	 6GONocX04tF1qJpBPlorZe2wxZowar1/JgK0fUxW0Sm4C73OInkfZ8LQYYsejPqMn6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
	b=ZKJmiNtUzFTdQf75io6bh6WvO4pSwENcd2XIFGIQFf2XDldt42v8EdP2lE+q4f/2EPda
	 FUiQmL1bD1t4OIwz3nZb/yGVZnBZSQTlKRMEhRSJ2YgiQp9dNocwWGy9JxiZ98lXGM5Pm
	 vdaFgDzef5QFzqAnhgavOwRZ1V/Upgi8BWRiK98y7cEivle3HUcDHSwVMYsDNuS7EFHSc
	 wL67Xk6Br7OmaoMogE5CFgR4TSRmJ6nvbLU4vKvwrg0GsXPCXOEXUQB+fz/GAztMYcsye
	 t9cmnfdLBoyyCxDgyOHFEkFJ7xROMym+BeO54lpHPqLwkpzVunGQuN+KIfX9AF8B9zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/z+n7AF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2D606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC2D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/z+n7AF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJH2oh73323977
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FtJT6ChM42qLf5cqURCzWY
	5hoKVKmr/U8sU1QWX4Dto=; b=bpNInUF9dvYGSsRD0rnk3iuaSPxO5q+lT6ZDNK
	6LJlOVydMfad4PxIN4iSe8Eed95wabyzMx8c1Ci4qjbjxdlj1fw+TV+AYzoNXyxQ
	l/pwBxbw5YBwIZ58E86lHre6ZCwpvhDzTwrOgsGsCgrLKx/HZd5lmVhhJAXXvi4Q
	xKsfUnfvZ2EKFtZOhW8s3FRl0EYnXpabToigEU7taHZsMDdcmKYTJmW+S3nW0PMd
	ItQFV5TCfy5UK9V8aAqIgs3qvBmy357R6mbv/9gdcjJprY+V7vUJYyOoK4++RxwK
	6FHi6QE7zTvb5XRfSgmveq7WwZJLL41zLVAnlyJLj9HIdiUg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j255wg0nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso17664b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107871; x=1795712671; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=d/z+n7AFTRiiD98xcg/kiDx25MUcCZ5eJijxAFiK40rvqMq83bJbpbL0YybJWsNryq
         p8w44yum78LtdKX1hDrSu0E8G+cFe76aNJSsRk1fVBkYmOtypAbLrHnF+olErfsUN0tX
         ZBWjydMWRIFCoAaECNGShNREVJ3eKYjrrP3LUfTcZypSSNwB/F/AtCxJwRIAvAek9sLL
         TU+oc7jSD7fSMQLtNVNJEW9y4LDPwWs1z5Dt7N7ltvRFPHiSbT8yQv3kIWedX+zlXoEy
         AMHkSQ/upV0CJr5jsT0yF4xMYD81mkJErcDBbcfVDt6Ay3gbBzcrZklV6BoCqQ00vypy
         rMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107871; x=1795712671;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=v5KXZ2J5fKs1wCBHwZT3OTi+eVGyFVdFQqV7N1EGUuJ9l8M62zhlfA+ao416p5n0Sd
         kTv/FsFcl6NtgrbKVTU4c8ZskCVLLK72Qi5kW0HGc0naPjo9Eie9rByZ2tvj9SjqFk0s
         zxvcPCvK5gvHgfZYhhUKVXOKQolElZFZNPUcoyaglIZ/2olAR0yTZ/upESZcn2euIjVi
         z49P1DgoKOsjhJ+dsOjBYjVfx2O615ZuMgkoKB+pxPWM29NJBZzFN2/VHuS0roRHyx78
         Yr6QznEsMlfSev1aSUpUAjjBvKJ+R4i6KWj15+T7xMWqkZYHykNY0Zf5u7l3hEtgP/KP
         ISwQ==
X-Forwarded-Encrypted: i=1; AL+hErHnISwh8C+zp6E/5YRiSxX02UL0p0lX21M9tcPPs30OigaLOei+YqMZIuGe4tCk8hgX1ivvMkJBKpC7aEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GMMPjNFHPcwSysXEVHzndmhp8MPT5N0mVzLZM1dCGNG8td+cc
	fSypwSAywq5X0pMuOeXyzFI8jrNIWD9HvcXgBUsfFXeNQKYI+8whERYjVNSGYJOmX1ZHYpH8q2k
	GnIAfWHehVdy0eRiXOB3vedgtRQf5rB0b4+f5H8rZHA1klYPNmSl22SOiSVYajpYg/wc=
X-Gm-Gg: AYBFou3on6eGdexQy9az4+6/+6ZpaUuctozERlnt5VXB0mGR4+OFsbb3fdpVm6UPZlO
	JLVFYE2nAS2BmNBwNWNNNwxU3N5gceqzeeMHL1yqL/cVO/yzOFFXT0LHHtDlocRLDr6KsndIazT
	Qa+ubXl3M33nEDe0lITwmqbMRw/WoMC1R5Uke6p+OoRuitz4SU+TmENmWeOOFDpjPvxZyftmhFh
	J57XV4X+veF3G+vtdR59+DWEXgMqiSVOZum/GCjqC7EJnkECaG7PqlJrvS9wdaMcXvnKSNyuODQ
	2Xqop2w6HiSSIa1sa2lQPdj0Ix3RAXrksJgOkZOv4vhZg7rKA++er0vIkNu7ypyhUHd1wSC3Cvl
	eNpHwkN2yAgD7Z+UwjNZqH7ev2IZah83yYei/ubfe+58FrxocFlcCtRpNgO85HiwRYy03AXUJQQ
	==
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302101b3a.2.1795107871542;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302068b3a.2.1795107871112;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Thu, 19 Nov 2026 22:34:19 +0530
Message-Id: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABMs/2oC/32NUQqDMBBEryL73UiysUr75T2KSJqkulCNzaq0i
 Hdv6gH6M/AG5s0G7CN5hmu2QfQrMYUxAZ4ysL0ZOy/IJQaUWColK9FZ2xLadmbb8jJNIc6iLIz
 RZ3T6rhyk5RT9g96H9dYk7onnED/Hyap+7X/fqoQUhdZO4qVCV/k6MOevxTxtGIY8BTT7vn8Bo
 U7+6b0AAAA=
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
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX8drqvQsKwRwX
 cejgtSx2tdgw0QILMJMGvhUvUrG5fEhx4AfVT9/zubupr4hvvA1eoRWGH1fWYLLTu5VVKn+zwUr
 3otyAfDBCvSTIqygA/W8JXCF5xS/MRw=
X-Proofpoint-GUID: Erqrb5_igAq1mHYkwkssN9hLFMN7nzKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX6AS9S1tD8V2l
 8+rdFWl8VUeeKc1JaYJHiHyHVMasHyWHpuPlo54nKXWfBwX5KEkRWc5tN2EeE6M+QKjK4Kv42Cf
 XXuex4mkCRwRihrT7YavhrI2VMl+sZL1ul7ygPR3Ynwuf7Sw6i+jh4rI+6G7CZHcEm6jzhHUsYb
 ysmTgFKeN588p9qOHFQnjcLAHpJYsm/m9YQhw1cA473qIsSDRIf6SeHEyzJc6bPmkG6WCZ5IFu0
 O8BOTNaA6e2TXNCiguwNIap7VqbilX9+XtHDOngACCgt4fbPLBi41Mza3yE6hoC9dfC/EeU38kP
 hsvu16n4qUhSFqTJvSKVSIbtCJw39QnAqHgXqL56cQoBPYZURfZRBvlO1e+skqA4ha7Fpi9rZYx
 G5j9SS4ORUDOfmEtMjJbeAONpK6UVaIZwcMJc4L8wMa7Vi+N70nd8LtCJVY05Ciyw6krPSkhbWG
 3NDVg6GjyAusg0wJ6Gw==
X-Authority-Analysis: v=2.4 cv=da0VTnXe c=1 sm=1 tr=0 ts=6aff2c20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Erqrb5_igAq1mHYkwkssN9hLFMN7nzKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190067

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

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

