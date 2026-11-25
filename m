Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596194;
	b=o9ac8WB1CNiGcldbUti2+b7Of7AmEsM6ny28JxKQ5D19Z9N0iDYjFBDhl4heSIMcaVY7
	 g6J1NjAolLUWWbI5+qSTyq4m8zZt6NeAsKAfrvoeq8DzfInCbxKJBXWtYc378tcsTmXmT
	 NOW3MigwWHTXcDSKE2waP94h63M52z9idQKrxCYqhfL8RIJeYC2X9cNbXXgXsBWQ3E6tf
	 u5dgdThSYCkbMz9zEWs7renYJWlsMnDVPexkiysXgBsYN6sHbURC5tHZb3cDKagCx2tQm
	 4FwJ1EQ8/idl7EhsjwsY7y/dnaC/0J3rD747NqxXWDeJ/wjX1X7It2822stRLTWYz8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
	b=pCUB9TEVLfsNn9TLhlinY2sQUU5LfZoP4odfgd41vfpUqH3RchU5/c6MpeyLf1xhzeTI
	 qjXEeFz/C4xiSbiIhpgykLtBF/tpL4ei3szLEJzEUI8zSeK2oCX0zjYX1SeVma/xjpBjW
	 Yw5/3EF31hgnnHvceoJAYbN1drd0ykKkSLK6/8JQjMOVmVwa3MawFCV5MNGoy7EoEveYe
	 1pyX5cyFWrj9RYJeRzASQFWOS2Dfa4lYLaTNRsNY1UXhmerwhiWWPyHck4tDDsV7dBaoi
	 zeAKrbgZPUi2Nx99emXZzDOl0t3t2pUOcLDBqvdexU1kWWuAoEwK9Yen8u9CfCfhN6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHn4WBpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QCXB/524";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B8606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHn4WBpT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCXB/524
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Zq6300022
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mkMPx5pZu0MJCT37mBs5hD
	dYCQOlPFYux99EQPGEygU=; b=hHn4WBpTKIYyhJrG83QykBmEsm5R4JykuSSIOy
	GjV+jc7cAzz34j0Ays+Ze+k2HQdNssCFnPw8Dhp7lsIedL9EDcnAthVFlYlm0wyz
	TEo+5sZQteBlxukagmeZ2wo3K2IBR0s6xlB+Vh3ceqfCmE+3yEK5yA8dVJOffFwT
	kimRc8hg/Ih+tBggC/KglL53Q7SDyJj+bmzkDKPIcxhFf+cv1SUqZtktuTS4xJPO
	pqSCea6KFHqpEHKzESnrSt52Z9rUeHpQSFiBVBSynIDlseix7s7zXPRPxzozk+/8
	gMX4gpo1U2Kug5Sc3r1doKnBOjyIw9w+GRz77jl86gHN9yHA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsq39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so5387911eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596191; x=1796200991; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
        b=QCXB/524mIuA+e0qJQUHYvyZj7N2qfDYte8T5uvFOxjNGoOV0IjY7yegaCmW38hrnv
         lyv+tY4dQ8Wes+X5TRiHiAKSH5WumHIzFEmNdJfn9HAn2NyXKTtTnvOgiAjAOe3cw9UG
         eM+INvOwr4sRNbbAph2XUfZKGK1XjeLUHr6lemFKPhVm83jfUvuypJPrAOckqDTXHY9O
         XURiOaa5TRMXSf7ck4AMK/G9uEb6otUxrpRcijpK2If79vfGFg2LuFDxfBqUXN8T51Fl
         TzPz51j6dhQ6tAiz1ARlkDQzqWVANAaIA5ZreFfJAjqyOubvHgRo3GebxKIcJbLdmX8z
         jTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596191; x=1796200991;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
        b=nG/ACpv2IGJX91hLXuaORBNWNF3T/vOvR47QkcrOJ+KhYjwDrfubHVm92fcjNylmQD
         u0ZB9ynIwXq8zOEMq/PLOzo+2X0UiIKuPiNg9APqw2iKJolAazNkX6dQImEHcSFdULYk
         0pHRvfmU93ltUKKmNjuEP/b+AZxg/LTq6XX/Q4qx+tY/QRcEDj7ZwjsYhqEdXM4QigFS
         XSenkrBICKYBX4c/NH3VNXYgCG4F2wNZ9HOoCv5sPYJAgNxe+oJG+5hkD1rzlAsjPmmk
         mpwG4YZnJ1Y+Fyny3or8oOjPC0zKnLb9dvplUMCHwpvgdWp9q8HKuMttBKdXb1jQf9Gc
         hiDw==
X-Forwarded-Encrypted: i=1; AL+hErGAH97oksvk38ITWGy0LZRHiyyf2Zz2R6kk1xWrRcPEWSSmPMkT7lJRsxvcmRi0p+y+pkFOkPusOXw1kzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iVeSPY04YYOrxCxhMxppsB+PYFV/zBI83JqlRjwtj5h7feyUj
	I2dUXBPXFoQPISFWbU18TdP5URVSGCaZtHYC/bhOkvH8245eyPxgfHttOXNHSG7MW3S7lFLF+Qo
	1wTKiYCE6KFRH3xfHDeuZ7iBtTKx4rhVvbBkt5wEmykjJsDQOU4sbOLPks1I5KWAT/eg=
X-Gm-Gg: AZFdTZepp1yKQim0OIqoI8Eef6ciaKDUvLiqqiowjeHuZ1ugo9iEPxc35cqgZsSEyI0
	6GiEOI9Jh65HnkrT/Ae18XOP4IT1vcXL0DW4202qz0bf4VrdVXD7G0Rp2kHhgtTh/dVRTPDXHTS
	38MK4M915o5DPEqfUsr9jOXYzRX4H8b89OZmswWpeMX9GOjulfn+liTSGTyS3mvyd2xmXVhb1eE
	lVuNcZmJGh1kwSLF7IrRH5BnE4wZREaShdXEzne5JZcAmkiLDnXLx9qH3uGLn9OaR9jg7XyWyZa
	6H3OQmPQXKLjkVOLMsUbKL3C7xw0d7aDSe3iDkM+jDSy4jqxuqduqSvKO04/45/n2WcqJn9eEk7
	Pk4aPSKPOjZ5VNkWklhPqLEDNzx09AfM01MFnwhKen05qvi854Zzyvu8DEhBsXrNKVOXVYCHNTE
	qYbXeT
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr15129857c88.39.1795596191376;
        Wed, 25 Nov 2026 00:43:11 -0800 (PST)
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr15129829c88.39.1795596190763;
        Wed, 25 Nov 2026 00:43:10 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:10 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add CAMSS support for Qualcomm Hawi and Maili
Date: Wed, 25 Nov 2026 14:12:59 +0530
Message-Id: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJOfBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNT3YzE8kzd5MTc4mLdFAsDQwsT42RLsyRDJaCGgqLUtMwKsGHRsbW
 1AGkVK7dcAAAA
X-Change-ID: 20261125-hawi-camss-d801843c96b1
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=3216;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=LCKglgHmOSMp0gqQvoaScETsQ1eifl2GUqlrW/x1Vx8=;
 b=tLcDx46uoLSaMJ8XkdOrASfldBEIHBZ+IrJhE6+MpYoXiTCp7sKc1nUbWZ/Lj2EA/DGNUHN16
 NJQHWbJMdfPD9eYZx+P0owYssq1LnmYwbSxG0w96H/s8FMugrjp1iRl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX07/z+XBUEsiJ
 RN/fwcsuKmjtdXTdEZF4AAcHP8qaybk4qMshaDWDjCv+SiAAl2O/0tqXHw+YmB9v37gAKkL+36j
 8Ly5ndPvgJKMccmGEwqcx2po36fFHsGMP9Ska155yPuJmmDkkeQFL+j42AZ8kXy6jYK0oZgwEcC
 0sl3usBgtc2hN442wUVgqWrM8YXjrr2k0ALsAJwl4P6zB1WSB7atW+zJkFfq/zZH/Za3b0SzDEy
 fKopX2RFQupeUNEKq58KD8HO0a2qQ/bS4Aj2VuK0nMeOcCENyzQT4+P72tKxHXmU3VMbyF8wh1a
 beLJ9nSBMkXfLm6KEqud/62cCZGgTsbpwo+CHuizp9KwSZByCqJnP881TziDNIOnj12XB38c9y4
 rxyJcmn/DD++A+MyBQwX8ZPPkLLCVF8zwS6qFuuMHJHMso1VUv4Ciwyo33GHiyMDJ+6Hkhmjehu
 4F0xGqNfJM6fPpvl0fQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069fa0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=PSXh-a3-1L_3D_hhYzAA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: CZf2CzBr39P0U_0uvM128YIQb4C-ViGb
X-Proofpoint-ORIG-GUID: CZf2CzBr39P0U_0uvM128YIQb4C-ViGb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9NEaMbHDEZUX
 ady85OnIyYL9TFvg/kpS/QWV9drGgWT8cVQ798FiCHyzIFICzL/J1+Yh5lcHA/7LS6Zw/LdpwC2
 PK7Inv/wTo2R2U7QS1AV+XJUXus1w7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

This is the CAMSS/media part split from the previous combined v4 series.
The I2C CCI and CSI-2 PHY patches were posted separately as v5 because
they do not depend on the Kaanapali/KNP CAMSS media patches.

This series carries the CAMSS/media patches from the previous combined v4
series: patch 3/6 (CAMSS binding), patch 5/6 (CSID clock scaling) and
patch 6/6 (Hawi CAMSS support).

Link to combined v4:
https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Link to split I2C/PHY v5:
https://lore.kernel.org/all/20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com/

This series continues the CAMSS/media portion and applies against the
camss-next branch staging to linux-media/next.
Base Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

---
Changes in v5:
- Split out CAMSS/media patches 3/6, 5/6 and 6/6 from the previous combined v4 series.
- Drop the I2C/PHY patches; they were posted separately for I2C/PHY pickup.
- Base on Bryan's media tree where the required KNP CAMSS patches are picked.
- Link to v4: https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (2):
      dt-bindings: media: Add CAMSS device for Hawi and Maili
      media: qcom: camss: Add support for Hawi

Loic Poulain (1):
      media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate

 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 ++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 417 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 208 ++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 217 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 228 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1354 insertions(+), 39 deletions(-)
---
base-commit: 2fe1b6509825b39a090d7ec055d094155af4e0cc
change-id: 20261125-hawi-camss-d801843c96b1

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

