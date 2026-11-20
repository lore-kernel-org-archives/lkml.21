Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180889;
	b=pQaLv6jgAiu39ZU9dThaU+UNBU8nAajGGk4/P5qoWGvPJ8UwTprOwP+c1W5Go+KtOT+1
	 KNRLrKKG1H81mMQfobY4p0zweKqi8hTugzQwNFrkcGXYY1jleUxc14rS+JyeQLMsDnmlb
	 Dnqfjht4AbgEcIn1KvKMswxYBDTi0DMpVfNAxzugz2DFzxSNC65uSAWd5BWXOnnfoS7nc
	 6JoEnMpVYLmz/IUlift9idTHc/RG8yA1zSbi69Qbdt+UFp492RUxliDVI4yx+kdImF9Lt
	 15evWv1Hd8YD4y5rC4ms62jiSTLR/NZeyj9KAt1ekhl78FACHlijc1y6beE1aF6yhJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
	b=F8OsPpQRu0jiaYXUat2kF8Xye9c8lgvutXsa/O3xtguu96Wa0FH4cof8ZgWxycUrJ8wq
	 6DBpOMmDGYuw4iEsuX+ciI5nphyWE1OCscPWiAyjKMvAXgpdsMTNUJtMhuU7iXW0EMZ8S
	 1hNycWxnnYzq0MNwwEzEyX2eb3r4OukPBvbOeiXOECHUfJ/JEAlMsQX+OrtEmEE0Cgg/c
	 MLcJivR1bYAtR23Y4hjUyWi6cdgup6mdS5ZIcZDYTxRkGCAMela3omU9/eSNegKaWwBcd
	 OU3d11n2UPDu/qRXtbYK2/A0NB7r1F/8NE5SybFw2OdHhzffUuh4+nKwFJETBJrZ4Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtJ4+czb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2kpymPD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDFA606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TtJ4+czb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2kpymPD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxqW556450
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrg7+etryRTWAuLxtBfLDW
	2Eg3be2tf/bw8+JoHgpTs=; b=TtJ4+czbDjFczLGUkDuR7/B7HmxNuQO8lMsgTY
	X52BX3jltbAXLFtTGxbsFDny+yddZrZTHmGmA1XZF9arxQHPryp2MvyFOw6lopNG
	pb2sGBdti/xflgsmPgy2GwsB7w8mZOJIVoGLYRd1Tepw/evn3rbTSH+2jzB6Q/Vn
	5hjLNvQU4CcnxV29PSBIlcTCsNZg4QsTJfTS5/YU5FhHHMyf5+QorM7ubg6O3bln
	2oK1RieByqPx7ogJAHvGs2EquSvQC2e1M5XHCLXix/Hy0U36WtslV0dJ/DrBYiyO
	Ts8GvBCOoafm7XWyOAKvM/qoyYuhEbbf3jMOKLqnfwYt6ZSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhxru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1333367eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180887; x=1795785687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=L2kpymPDBL1rX5zrjUzU5UfL2E6k1iK807t7d4UrkkQk2omIyo3nQHawYe6ej5itCS
         JZ00gNLB1glSn460ZK3B+mGSkpXBFQpXwTbFjT7S8u9bgT7F1IqOR3/VqybHRhi+Vh9l
         Tvx4Be1rRPNytsMHILy3UTde7EnYQ0akmmkWoAjaxdldeNEfWDTy2m0ZienXi10O1ho1
         imYSc3ygQM9+F/FVnHXzW5LZcaqmolWvMWgFD8I1On0ia1ExJ/jyRmHJrOq1O2VH8Dhj
         tKT3CXHjPBUYJFDPR/+YWuHKZvD2VMN7T9l7CylRA9jAWYnMT80EbQAEKR1nuvPYcatK
         m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180887; x=1795785687;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=DpdeQ/SKc5bEzWrIuLoLOesa/Chq4POQdWwq0AE4J2F9ugofzFytAjKcxd+BGYQvt3
         p92gcpKOoeQJ5hOmpgPnEl+m7HSPhNxEr+p/EIEFiN41bHKDe3x4gaibggVYGTKY+xlf
         lPwtgxcZf6JrqAS2qn7qpJOlt7WsSqxWzl3DRy/c/jbhrZ1qiXfGvrGyMObv6F3DnTwP
         wh4hKoZoJuMHS7K08CzXh3PG3/gabdGPEM1CQ5YHFT35VaJQrf2+ybwifcmMB+2OSSTL
         OojvlrehhOzC6Lvx/tDlgdyj43REzvPQHgXq8VjTuMGkbZBVwx9UIrjjHyvdktdH6A/S
         d2ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEhxSwdOaK/Vpbw+choNaf/I3hB5al9t+QQWHhOSRl2oOr97CCqE9i/yYfjmNn9lyNuiKBeGQ8cuMAHQ0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D8qnzBKRt3a+G3QlehSmcWmOmSTvrkeoDjdmH6jD0EGxPavex
	6gXPuvZuxKx1sHmNHyZXm9BXpZv79jUCuEMUISIXoLTy8yIAwb6fZiFAFxM7ldOOT7EV8QYXvMA
	JtUx7/oiN1sdglynSk3i83dYAhJkOZMR31X6NNUJQhC2c0klKn3AqEKLQUqkweZYWvg8=
X-Gm-Gg: AYBFou2c4rIVlOAss+O9D5WGTLACMBkfGf5JuPGp6wd9s4ppJHbukqTwLaQiJopLclM
	6179chBdtPccy+2YRwjNPjze8HdpabaBvcdBPoeFiPW4WoP/oXRy7PGH+aQteRFea+tj4CcafE7
	lPvu5jYkn5CB4y8HiS53vyvKyO9/htPKtbR++gzXWkNk6iUmYN27o/EPaXbHFrS+QTjjfZ+rPeu
	LEQrCKzo9x1QTZRHt1bArqJXTg9UECpG3Q9QSjEDOwB4eZKZPn14NRGapkgXzbH9ZoCDRy1lIO9
	bl/b/1CUZh/jr658HwfB/N4ot+nZ2Yv0EexSAZtWesz+8yW4qR5ugFyhoWbAiEoxGiNO+uHzT/A
	I/crGyOOBQ37/kO8kg7I8T4SmeO+7LWOaQEA1g3JdyGulgmJsn2UaxraEUpbE4yyE
X-Received: by 2002:a05:7022:170c:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5568f522fmr2443698c88.38.1795180886341;
        Fri, 20 Nov 2026 05:21:26 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5568f522fmr2443662c88.38.1795180885600;
        Fri, 20 Nov 2026 05:21:25 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:24 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
Date: Fri, 20 Nov 2026 18:50:48 +0530
Message-Id: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADBJAGsC/3XOzWrDMAzA8VcpPs9F8rd32nuUHRRHWczaZou7s
 FHy7nN72BJoLoK/QD90FYXHzEU8765i5CmXPJxr+KedSD2d31jmtrZQoBxEDLL0+X0kyUclmUJ
 0UQebdBL14GPkLn/fscNr7T6XyzD+3O0Jb9uHzIQSJfimAa8aIo0vQyn7zy86puF02tchbtqkF
 oKGlaAkyA6CUg1bIuYNQf8JCGBXgq6Cw9B5bbSLNm0I5l9AMCvBVCF69oCx5abrNgS7EFCvBFu
 FQIm80S1HvyW4pRBXgqsCcERC4+or8YEwz/MvT529xvUBAAA=
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=6584;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gn8GKKFb8CdZcuwQevOhAFcs7R26w3NdGhQp1McDMxE=;
 b=dM/3SNWgml9wXdyMfpjZaIYwYw+5Jn97cywblwWml6pxznFZDV1ap2gXzSuQdk1LrL0GaCWHY
 X7Njj+B1nqkAi/9gA58PgKIMXzWVZ8Cu4YYQVmAcwc0h7CmEMshRFzh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX9ZGUGrqqrREh
 31Wjb12AGit/QSSXB4mQO0FKNCtKGbIgLWuL86d6Xfwy6CuU1lzJkL6keDbU4VPf+O9aCnf7wpu
 NKbMVMk5uRhdCOSn+Kk5e4RE9lv5G15/DjPfEbCUactJ2O/9k6gmgd/E25ozkdEPN+esHqlaLCz
 D/ObXK//GY/wT5kyB4ED9OI88LHVGkyg6Ks/q2GemhJwDy6jB28SiQnLHPfOAXRgwKfNX0imZsb
 0YQ6CIgGMqYjEqmCr8CTwSBj3Q26BQcUMouASAjqjSyeBP1zCFE6Ccd2nrBhcKt5DNM5Vbq0qTt
 dS8lotLHHmwl/lU+rAHyZ1GXlNPUZoICR8V0MucYQ7hsGxg1m7YXQvy6YP7l2MBf94RyQt/pzUW
 L4Nx4qmtNbN4iR8X8QyWCtwMflJBQxHNXdepnfZPQ9sGnHblkcjdOkjCDYHcve41jJQIrfbDQi4
 0HY3IUoZZAycqRh+8kg==
X-Proofpoint-GUID: PaM4Zf8kh7t240-b5s4ImlkNPSGVUlhV
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004957 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7yht7nwCIrXBMJmmVpIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: PaM4Zf8kh7t240-b5s4ImlkNPSGVUlhV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX7PV09fWUnpa5
 9DGwHanlcumd0YXtvIIkHghug78mnOcsnSlCKgsOjiQO171MsUMEgYvIFsUYzvRJfIgzuAtl8nX
 TKN3lhlixg1giIDs3jr2+ScM4NtD+cM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
default, with Linux running at EL1. Booting Linux directly at EL2
requires the remote processor firmware IOMMU streams to be described
in the DeviceTree used by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
generate -el2.dtb artifacts for the Shikra EVK variants alongside the
regular DTBs.

Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
Gunyah by default.

The series also moves the Qualcomm PAS remoteproc iommus constraint to
the SoC-specific bindings and relaxes the item limit to accommodate the
remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.

Komal Bajaj (5):
  dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
  dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
  dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
  arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
  arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v7:
- Shikra: drop the q6apmdai node from EL2 overlay (sashiko)
- Shikra, SM8750: fix the subject and commit message of the EL2 overlay (sashiko)
- Link to v6: https://lore.kernel.org/r/20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com

Changes in v6:
- Define iommus with a description in the top-level properties of every
  binding referencing qcom,pas-common.yaml instead of in conditional
  blocks, making patch 1 a no functional change move (Krzysztof, Mukesh)
- Reword the commit messages
- Shikra: allow up to three iommus entries at the top level, require
  three for LPAICP, allow one for CDSP and disallow iommus for MPSS
- Shikra: drop the per-item iommus descriptions
- Add SM8750 EL2 overlay and the corresponding binding change
- Link to v5: https://lore.kernel.org/r/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com

Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
      arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
      arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 28 ++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 30 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 15 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 33 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso           | 30 ++++++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

