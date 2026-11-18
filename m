Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016258;
	b=GSpyDjoryYzNofTvTKSF9z5ZJhxIcnj08h+FjsqP/pLAEBpjfP+uVfYGRzfb/L0JCQ17
	 H4GN9zhl3ll/BAkyABmVWIkX5YCQh6ip7GJrKCUkipU4nOsLRBPjvOA7dRu9379nIrTH/
	 yI57IaUxg8wWr9NTOgTxjmsr1aI+9yRIAEc7n0aH6ljt6OmQL70yim1UJ3ICGnusigpZ/
	 Dr4nATvgSZI5op3/D7YunlP0rpBqzUa3kNT9VeYQVgfTVAiqHDw0Y3G7gW7SB/E9GVn1b
	 CIBuwrsNPBaiR8++rZqd+hmOx9LisjznF2m3ymCkBYBXLacL5vT4h+/mMXdiHmhJG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
	b=AHYWyNsb8OypPfC8Heb26J3uWAvEWm0GMQ/MCMhJiIfM8xUt/dcxDOZX662tvZ52uz81
	 EbloGyu83m5fx8pnMDeKNtFk7EDfqFInUZ34Y7rh+Qcf0v7OypYxf2HKa7Krs06QLcCqN
	 szAZT7dL8M8eYMVUJwYr0dIlnEA9S2l3C32JnmgqntNEekcvMxPR2NOu9HJDSckt2Qo7Y
	 qmbdpXFFxDFU8+Oygy7KlnOOoiw5PQLKEzPGPhPXpGo6xZVGVDBz0rW+5N0ZUM3IfksCe
	 yMMjkKYl5XFl+5cjLjWRDJG0UD1g/mq7Hi93E8M7gN/tJA+kH2gDv6cksJSswxtGaHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/CR0GMr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMcXPcL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B96A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/CR0GMr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMcXPcL0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQRft3846738
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E3TVw8XJ6Rg5jWJLudhPiQ
	Z/2xLyIljqKLMLiG7k+vI=; b=X/CR0GMro5+Da6Ax6Osuc6gXXRvITTq8xDucFC
	YBi4kZsTDQUiMgT/0m3sbVbCajChLRpA4N7lD1WN+dkVVPXlF+m0vTZQem6XbMXB
	yUmAB7mnmcWS8INQhLVigfxHU9oW97PbdSWxFgO+5X5p8CO+3FTHmIU/Ytqd/P/R
	ZbCsyCHwtGWiAqqy3U7uDgeLIEabFjLrxiQuWKEPSWrq7ipwCgJTWghD5kmFJQmp
	QNZheCfc8ofLgOJgudyNvCno4ExJsBSjxxSQ8Wfe/hkLZYa1605kvaBFMB0L2lOi
	KRYK/GJqVK8aJO0mEXquzIcb7LCMBVjS93XjOiykPxy9LKTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvaurp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ec6cd898eso21653516d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016255; x=1795621055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
        b=gMcXPcL0AbAkUDKCs5qkEaRp0EVX6Jzau8tQuK+p89HDqQYRmhwlJpZ0fEQIK8jd1x
         RS1wsKEHyPVw4u4kWYPFHURmnh0Geq0YjVBvYiymG0j2dGOEYdQTmZphKi+vegkT/LZ7
         ZG5AybP+GdWsSngcjXdQgwdoxC3yjhXdNxonRX6nAadk6csKdwVS/Ur+3Ls8up9d8fYW
         YaV3X3C7R7OpXaOVJTZIv2gBT2FT7SDZl51kK+Sroz9IJ6KirJor6jUG7HzzvsGYtLxw
         yM1SQn7xHE8wT2stzd2SCHw/+KXUZqTiNlNi2T/fbeauvTzWh6S830a4kR4+b6hLDtBd
         HgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016255; x=1795621055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
        b=0TfUWn+e2pZI8cbJInilQDUbAFzYrkMZQwShWKf5HKzENLvYE5694cvoVchlwOWg8l
         vR1iKn0xx6k27CLFN6xTZRS/nB4MFxmImK7r+gwwca4XYndY7Yxo24G3aw0y4uzCBxXb
         gs9l7a2f8iIYyAdcffqUJJIGz1Nn6NkdLAOzBoYKKRR/kmhlZCDOEBDj+sjSGomCwH8B
         wFCBX6AwAbF9092zdorrr+69Sg2h2eQGVOUJKNqt6JYOLEZpcW7d46vT8hIimNboWeIL
         ot2ILBn+knuWbuso8n6FG0/VBCNiXXSSg1ny1HA+VdGrWIgsei9wn4F4FprwmOGXX7ti
         RMKw==
X-Forwarded-Encrypted: i=1; AL+hErF/IeVen9XpouAMz24KzLGoCQA2fm259nhQFXUD9nOpxhaPjK5WpZnYv8t5UR7+NZ//FLIqEifVobSBcZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XdAr4Uex2bB8neeD/YweRh48tiDDL0YmKqU4u2sz488e+NFqy
	wblEkzjsS5o/pw1I+y1xVtdbdYhp3yOFPKOYuR0HtjBHAvoPGImhr6PVuRBSch0D0qPxlVwkBp/
	52uQV0WZLrbiZmTcok4T4UC334LgolJZyWCqR9OCcEjC/Xu5fu9D2HdwOXFTBvbTRMMM=
X-Gm-Gg: AZFdTZfMZThiCrUuXqd0Ah6h61YNV7zBGIOijqHVcbnnBL6SVfDN+hXECMGSo6D81IE
	6terF0/HluYUNhaK/UXGrZa9NZBJfd9rCRuk/kqDFSb6MFoOAdlSG4FOLVnNbysATdWbSX5Joc8
	yOGAgdglBacJKCpKtHnC/oVuhhPQtq/iFQZvzX76m/SY/iZM4eSJSaJS7gjf96mlNItPALXSqKn
	j+kyzupMSRl1MUKan9muVcXuXsSkHSR1uxRq5jp04Pmv2YSeSVUt4qFTTjwxbvYbCilvjejNPiU
	jCJGv1yFDQwISFdlsbWvZ5QXupuK5LphSjGp1emYjBXXlp0RmfdG4NicaXPUPZsDA8oa9zMrHq7
	uATf6XxeTCxZJaTTDwP4ggqoB6Ez41X1grlx2TY0KcznLaC0YV55Ns4SgGUBwGCBAvB5PCCkag1
	xkYK/ZSD7KS/yN65Ht8K+sZ5bcTtQlHXMU/l8c0mhrV2q7IKqkQo4arnquuHQG
X-Received: by 2002:ad4:5de3:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-92114e9e201mr45357856d6.54.1795016255346;
        Wed, 18 Nov 2026 07:37:35 -0800 (PST)
X-Received: by 2002:ad4:5de3:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-92114e9e201mr45357196d6.54.1795016254790;
        Wed, 18 Nov 2026 07:37:34 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:34 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add Glymur OOBMSS support
Date: Wed, 18 Nov 2026 21:06:41 +0530
Message-Id: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAnG/WoC/22Nyw6DIBQFf6VhXQwPUemq/9F0gTyURsWCkhrjv
 xftpgs3N5nk3JkVBO2tDuB2WYHX0QbrhgT0egGyFUOjoVWJAUGkQJxQ6FwNwzyOzk+w6ZZ+9lB
 wnjPBKKlqCdLj6LWxn0P6eP44zPVLy2k37YvWhsn55ahGvO+OAEaInwUihgjyQsrKGCm1oncXQ
 vaeRSdd32fpgL0TyZ8Js1MTSaYSs5wyw4hS5Ylp27YvcjrRIRcBAAA=
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=4276;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=sFemIgyzO9lvPSe4UIL08ftNFBoZLUN3QQqRlbQQp5Y=;
 b=1ozoYVmO6bY6Fs5ARJ2bx6yNupGqbXe3ZChbQtawMvzHdate8Qoq2G9NXzPPzUhKVBuSETj1W
 xHSEBnMjKtxB5Dn3azS9pgjEhQ+mQZRin/da7Gghg90WhXw2L2XU9Ep
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdc640 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=cAW_sDYG8GF9HDSd8bgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ePlyEL_azTTUJY94BYjx6b_bTfU5_aul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX/TouqtUTp3cF
 KtRa525RXI4xVsLKvf0e88Fpr1yPUmY39OD1m72+tgwPQPkVCRv+qtm2jabPypQj7egrtHA3qYJ
 JKglRnEJEAHs6tw7kAx3yWirU5nl4Yzq8gPW9toClWJVB95lz7I/vV8mz9WP/9GeOlTBl8Bz8hJ
 MNNMG7VU4+EzHJFxO/cXnzayig4I4R4ExyiL4POZG+nLpef0L2+OHfpUKSfTev8wG1CICdQsuJ8
 hzeiksSSGBtpnH9gcBg0W5MiEkS/6dMbK07vijORsz3kP17fP2tOFfhzvW8XjBRacsqMA8wiTh2
 a+Jt1zdp3tT+HiHkntD+YHopjL111IiYmvVESKkOYlsuqbkNiKs7zD5r+Is5Dm7KknV3pegynf4
 enNAdh/3OuAgT+i8cayYOSzodibyfojMDtY989FMvSkY8qSWwVobEanS+ecuYSTrM5bKi5sSqvc
 zghySMt8E3jegXc6xtw==
X-Proofpoint-ORIG-GUID: ePlyEL_azTTUJY94BYjx6b_bTfU5_aul
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXzzpjNFi41sf0
 YKNLQ17jAnTtqycxsSlMJY3SdLShYU6xA3s1xmdQD4uRfs66VJoAXPFngzjjvnmbMjumfVckWx+
 90V7V9gzRrGf0cfnJBZWgRPKXoVmXco=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, Glymur-specific PAS parameters, and coredump support
for PAS remoteprocs with secondary processors.

The OOB diagnostic path also requires Diag Router support in userspace.
The related open-source work is available at:
https://github.com/linux-msm/diag/pull/26

---
Changes in v3:
- Release auxiliary firmware after loading and on start failure paths.
- Shut down the secondary firmware and DTB before the primary firmware and DTB.
- Allocate DTB and secondary PAS contexts independently.
- Continue primary coredump collection if secondary mapping fails.
- Register dump segments from firmware images instead of whole
  carveouts.
- Move secondary dump-segment registration from probe to firmware loading.
- Map PAS regions only during collection and unmap them afterward.
- Place the Glymur OOBMSS PAS entry before the Glymur SOCCP entry.
- Add Reviewed-by tags.
- Rebase on v7.4-rc3
- Link to v2: https://patch.msgid.link/20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com

Changes in v2:
- Drop the redundant “binding” from the subject.
- Rename the binding file to match the compatible.
- Remove the IPCC definitions and invocation from the example.
- Make the coredump commit generic for PAS remoteprocs with secondary
  processors.
- Shut down authenticated auxiliary processors before unmapping carveouts
  on start failure.
- Release TrustZone metadata on all MDT load failure paths.
- Assign secondary PAS IDs only when the corresponding firmware names are
  available.
- Keep PAS carveout mappings active while coredump and debugfs trace
  readers access remoteproc memory, avoiding a use-after-unmap race.
- Support coredumps for relocatable PAS firmware.
- Free registered dump segments when removing the remoteproc.
- Move the Glymur OOBMSS PAS parameters patch to the end of the series.
- Link to v1: https://patch.msgid.link/20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 358 +++++++++++++++++++--
 2 files changed, 477 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

