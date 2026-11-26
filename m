Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674256;
	b=1DfH2EITydYCtsVGAebSW3p2S6kzdtnVg25bDRVlgd3n8XA6+FjJ0v8wRRB60hIhlR5/
	 9+EecfpCjBW3Gpb66i/c8mMhLWeOu2ug4ITYJBrG6B42lCKxYmt846NqmbSjGWC027Su3
	 MMsEgheBTw6m2a2Qf4PRYOWF//0VJX4Ex620CzW+V2a0vqFVdiwLonuqg4jVbb4nTdsUF
	 pTujZr2xaLVj6YhQ/H5M5Aeg9QHxBZQIZs7u68wNjXhR9XAlJR6Xc33tWQavg9vWs3h/6
	 sFbHi1ELCPMpWYHuJE85Ibp4NdfJrKR/puNcgjA2oC/+/39MMj/lubinpeyVV333vXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J3FBGIzfOGOLbBdoGHFxpDy25ir6Jn1t+scYA8xvL70=;
	b=FyFRINfgCST/f/V0eOrjWNyv5cm+ci9BXa5u8ptFwbyy6oBV5+k9YYjPgY0r6DMRHvaY
	 bow+SujXpFJdHEvpmCcZiRqB8svco5W5uCLN5OFMLPEjB5u5Xqom3yLLgm0A3Fsi3zLzD
	 bZvzvGOzKgXgHl1nR//hasMKMQZXyqyIRvDEK/wrGLdw/+XOsm73npQ8VzM0tuTFXdpKK
	 bRhryxhDcgNcCOZu69MiiVnyq7QZmmU6L3IvETdRb+BIHFmyhew11E3GtF+BUc7h01hwo
	 Qc5BBucFXpVQXYn1FcjLzOyQCUIP51OyRhPBjfbfAInWnYXs/DLTo/C6sLqOyJJRt1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3v5v5tj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQODLyXc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A49B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A49B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3v5v5tj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQODLyXc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36YN71686634
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J3FBGIzfOGOLbBdoGHFxpD
	y25ir6Jn1t+scYA8xvL70=; b=R3v5v5tjqe4wnKtTeumbsYVbqMrltzRzTcrzpA
	afhHsUTGENeThsYZH511lG5ssq40p0NvxuaL4hckafW9AabmvGW5L6C6hW1O6OFp
	Tai2alPotDak1XOlM6SW9oIGlmnounDy3RjHI9OGVzS34/VnQuJ/0LJY4Dkd1Hoy
	Q5CJ8273MB4ufGX6uEaQnMuYWPNA5OGYHrwG6MfxfN3U1BcIHF80bGMbZOwSBck7
	cFEthAocvQ3LT6lS9b/RQ7eWopqINA0x9SV+zyS6HRVs0wM9aUp2nnDS0g1aCI/I
	31b/GMhuiTXUVzJB0emfnrxxVBU3dLg0vB7e9wGrEZA9O1Iw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9jmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde6bb2c56dso3557422a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674253; x=1796279053; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J3FBGIzfOGOLbBdoGHFxpDy25ir6Jn1t+scYA8xvL70=;
        b=XQODLyXcTCDRdR8QFaWzFTBDH58t4S4tWxWhVTSQ/8u8CAy1r+Y50/uAklJS1FJrhv
         8l9XPXVTyoaqoEmZ+bgkFxn7VarRe30D1S2fes0tWACM7mnGwTpzO5BvDZxBjmi/s+no
         7Rb48lsyCKY9HDKHVyKIDe6RWl83MEewa8zgMqu9DBWIzNP0drBqR1IcXIrFNa13sPYo
         UPMpslZB13ZSYo2QBf69B0VaFe+VJjXsNMPSMB5khOU8WFx8jL8j94kBFbgBhFnJz3Ox
         /RZ37+BEQLYJQhl7zgWomDxeD3oqBWA0y9W96IVfl1WEEu645WAaB7lrdrkdLRbjaS1T
         EXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674253; x=1796279053;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J3FBGIzfOGOLbBdoGHFxpDy25ir6Jn1t+scYA8xvL70=;
        b=XKQ941J93A/m9VIYLXF4OkG8P0WsB27LNyQ5aNKP92qzTVIf88QlAm+7uiEKZXyR4i
         A3tpiiyhnxLiXalBNRr3wCjUZjAycyWldtNKGGGo8zR2rkXrTBrUWF6sQQLn1kfPUoV/
         Zqoq+GTH2hEF0oiusqZ2GKVysAJtzIryXYaL0zNdZ5GcAnMu3+XGCxWqqtkTaVXx/aR5
         Jj3iazukx5SjxL4LHzM98P/n4tNhusYEy8qc0JzfHhp3YUqQjmGnZee5DDqW09cnvQHc
         mgjIB1YwhdmshxVBJHaikpvO1KV/khTkxBCWcmVoGB/XVZQ0IlaVTyrPTctdum2gt8gh
         1/aw==
X-Forwarded-Encrypted: i=1; AL+hErGGui203O+02ZducW23f6NZMk/LG6rrv117RAs/DZNcrQP6/eI8A9ZFIda+fLUX0UuH8XR8APkzN6nY7qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lJ7b2riSdkJtkK3SWXfxF28uoIzC9yIVa2bEDjnZtK0i4k0bz
	hAGb6XcwpzZpUvq5f2iBFu3pUyBytBsjS+DlO6bhXnXQy2CaJJOIwgYm3u+aIuHdOefG0Rq8A+/
	CLCkDlRxoDogfYUrrKUW1V01vOMA8ZAKscxylrqiwW6hXFoVIh+JNjvrPYXc8WyXpD3M=
X-Gm-Gg: AZFdTZer5OoNwdDK/Bovhg8811tTqHE+2Aevcitd+knkAK5ROj57kEHZA+7mwQedDJ6
	8R/pJEJYew0xjBY9h+9Xclb1gc9Lw030w/G0pltxgUyKKWcDXGd6XeOUsX6GTnD2RIssgLwvxkP
	656f5sKCohfE1T6Szf9VaxE8QkW8r8sAmo5DR+DMuzVJ7krFDuoV5+hl7v/CRIkVGh9rpc/h0Af
	epBarA1QzPgPLWUQRHRrptUuRLk4maXpdwqk9V3+1WWn8jRvsgOOso5LFqBvSALMaVMaNBtSGNa
	hz/SNOerWkfEwGiDAlPKnF1Pv6vTF6MKIRajB00pRUVmorfuDcZ8COT1pBRt/mpHbT10yFcjbcc
	X38qMUlEZaLhHnd0lIFOdWJ06kpsWJslbER66CD3c82rZJnGX3tsyP6jOmKQKmpR0c8UmoOJtTq
	i1HeI3XoYA
X-Received: by 2002:a17:90b:4a88:b0:3b5:29e:11b0 with SMTP id 98e67ed59e1d1-3b5029e14a7mr2682260a91.17.1795674253170;
        Wed, 25 Nov 2026 22:24:13 -0800 (PST)
X-Received: by 2002:a17:90b:4a88:b0:3b5:29e:11b0 with SMTP id 98e67ed59e1d1-3b5029e14a7mr2682228a91.17.1795674252625;
        Wed, 25 Nov 2026 22:24:12 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm14988015a91.1.2026.11.25.22.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:12 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH 0/3] virtio: Add Qualcomm Display Co-Processor transport
 wrapper
Date: Thu, 26 Nov 2026 11:53:58 +0530
Message-Id: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAH7QB2sC/y2Py44CIRBFf6XDekh4Q/evTFwUUEzjRLsFNJMY/
 91SZ3mSe8+turOOrWJny3RnDW+11+1MIL8mllY4/yCvmZgpoZyUUvFjX/F3hcYvaTvxW22jbjy
 nnaOz2gmDwmJgVN8blvr3Vn8fPtyv8YhpvHz/iYaXK22OT4ztMNJKi8uEmEp2DqyNoajooyrJZ
 +9ykLZASiBMmLMQL0+EjpyuOdWxTLPRXhg3W02VqGMhg3Y2KGMFAn3hcwkKPDs8Hk/skXqM/gA
 AAA==
X-Change-ID: 20261112-jshekhar-qcom-virtio-dcp-e653604e05e8
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674248; l=3104;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=37r9rIxqHsKolBFf8U18UhY2X4076xQVrB7nUGywNIQ=;
 b=KQaJXbaSnHDbFp/1HrQy/viThm1OlwRqbbQpwKFWwWbOVXVb4WpBN5XczmAjE7FdhCT4INfWm
 oEqXMxcz8SxAzijjhMCbS+sCa7wckax1dnCUftOYQACRytxFAKNEVjS
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: s2UJyNut-V4qoCrjuuCEAikqzZDweyWL
X-Proofpoint-GUID: s2UJyNut-V4qoCrjuuCEAikqzZDweyWL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX8pNOUfq2GO5r
 xEgsQkxLY44vvnniy2XwkLMcRtMk7+7jhjsFZFywIE72RKsOri8zvVPX604BBx5u1l+KYzRWIS1
 TX3WJygmWLCG96Ce3pVGT2HCwesZ+Cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX0+7S1yD7tAN0
 fkZ7nf9A0IZKfZqmydff53osQ6mv63++Wz3z2dGg91UAlp1HAz8p6jUFTRTRzwqIZ8XAxFHFzKe
 CRT5psb9Pg+bjNPOoaRX9raYOoAXg0Cgvg8+0b1gyxfrL+eKK+4oPvrhh8T7CC2gB2ay0CUPXL6
 U23c26SIcrYRlWc7XgUAieEKKx75oRhPLJVLG9cRgg4QxV3CzEJh/WpLZ9DRIm/sTKe03N8ms3t
 jAXa3dl+nHjHGZo0YHTWpGau2Ulp/zoAgWzQjeEtuUiJnyAHi4+WxMBhiZhg9DtWe+jmVngIUIv
 w8eCxHhWshyZVFtXQR1UstbV9T/sbo50r6eU5V1X0kE390kqQ5n+3ksM3GPjTwQfVf5dNjWT31M
 UN4U3u3UH+TU5S/GnvSZqVVmbEisLAx2kYavdb29xN+Zo0nN57tcBxremY6x0XsVOMAQxuvDmkq
 /R+i19bNzmbzgR5155w==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07d08e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wU4vZm6J2YNF-1Yk8TkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The Qualcomm Display Co-Processor (DCP) firmware exposes its services
through a VirtIO function, but its MMIO registers must not be accessed
until the host sends an IPCC power-notify message and receives the
firmware acknowledgement. The generic virtio-mmio transport probes the
registers directly, so it cannot provide this required ordering or
coordinate the power handshake with system suspend and resume.

Add a Qualcomm platform transport that completes the IPCC handshake
before accessing the MMIO registers and registering the VirtIO device.
It reuses the standard virtio-mmio configuration and virtqueue
operations, while routing firmware notifications to the response queue
and ordering VirtIO freeze and restore around DCP power notifications.

The series adds a Device Tree binding for the transport resources, the
generic VIRTIO_ID_VENDOR device ID (proposed value 52), and the transport
and IPCC implementation. The transport handles device discovery, MMIO,
DMA, interrupts, queues, and power sequencing; display protocols and DRM
remain in the separate function driver.

The proposed VIRTIO_ID_VENDOR value 52 remains subject to VirtIO TC
allocation.

Dependencies
============

- The VPU IOMMU series provides the IOVA handling required by the DCP
  VirtIO transport. The Hawi DT series provides the platform nodes and
  IOMMU descriptions consumed by this series.

  https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

- The generic vendor-specific VirtIO device ID is being discussed with the
  VirtIO TC:
  https://lore.kernel.org/all/20261022091645-mutt-send-email-mst@kernel.org/

  This series uses the proposed VIRTIO_ID_VENDOR value 52, which must not
  be merged until the VirtIO TC allocates the device ID. The corresponding
  DCP function driver must additionally match the Qualcomm vendor ID and
  the DT-described Qualcomm transport.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Jayant Shekhar (3):
      dt-bindings: virtio: Add Qualcomm DCP transport
      virtio: Add vendor-specific device ID
      virtio: Add Qualcomm VirtIO transport wrapper

 .../bindings/virtio/qcom,dcp-virtio.yaml           | 147 +++++++++++
 drivers/virtio/Kconfig                             |  11 +
 drivers/virtio/Makefile                            |   2 +
 drivers/virtio/virtio_mmio.c                       |  17 +-
 drivers/virtio/virtio_mmio.h                       |  21 ++
 drivers/virtio/virtio_qcom_dcp.c                   | 273 +++++++++++++++++++++
 drivers/virtio/virtio_qcom_dcp_ipcc.c              | 193 +++++++++++++++
 drivers/virtio/virtio_qcom_dcp_ipcc.h              |  41 ++++
 include/uapi/linux/virtio_ids.h                    |   1 +
 9 files changed, 692 insertions(+), 14 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261112-jshekhar-qcom-virtio-dcp-e653604e05e8
prerequisite-patch-id: eecfd66a55b8f2b7b2fc7d76d815facca0489d00

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

