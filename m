Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674574;
	b=Qp4FEVce4dMLCoO9CA6ZAX+hDKr+mFPl/ShiiNmiH+1xsLE5lJgT7j6RG0Iscpr72Ssz
	 44sXMcY9ulus64MHXfhw/6TG3QYxygtAHUoO9epCl44D6tw6J+ksTKRN7M1Bnuqat8RvK
	 /d/pCT/Mcvayz9F6qPGaPxywmJpUslbFdqABQOpAPzi+z9n+mx3moSDMh5a4oS4Umpm50
	 PU6LetpiS6uXFpTup3rscFeA6UPst1mGIQGrpfnLTQvP1a89rDnhszJIF82vUKYcUjGqX
	 ilelcpBNo4LFMqh9IIm7fC9ZDbXJFQs6F+VnbqPm1VbgaUbaOuwn3ajj4gWynW4VOHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S1PfSPwOFX0MWE8bPkRfQgTr8TnbUtpYuxljXaH6x70=;
	b=ilXzHTZdEeiVf8U2vksIH0/1qc03+ZM0a2dc3mPX7EArnR5FymBbC0Qtxu43AWNlOpFR
	 7vaL3l1lPTj41IT8iuuyRcuh+pFmpe2pSFu/Ovu35466EE7e3q6DgdKz6wR/2Yb20G77b
	 IDX/q1LfQOZneoOdIEeU1p2pm7h5E0ehjET3pFTSfLzvlYqfFQh9xN1Tl4POYsRqjQ0xY
	 2HdNuB+zDbNDgEiAcF2OycsxlxnVjgtUpU0gc6ksF4jvSdxncxX9QkJ06fRa2ZACHph2R
	 Xerqyk8rEpfj9tLWsNL2h40lhvyX+Z4cKJmXmi+PwufraLe1hTIKU9QVP2j0reIt+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PkJkQQdH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSZ8160+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5120606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5120606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PkJkQQdH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSZ8160+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36WOm1647554
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S1PfSPwOFX0MWE8bPkRfQg
	Tr8TnbUtpYuxljXaH6x70=; b=PkJkQQdH0xbVgnXG9CyAYK6Q8uY2L3DWF/nsA1
	im9xk/28t/eZAFgcUdLVXcj9Scalrj/QoyGfvBPBZ9gB97b/5LaPR+AQfSy/tMqQ
	+HrgK9bgwFJTHE+OfeIxEhCftKcK2fefje+CC9tcmcz7gbo8eNEo8Hkki7tGWlvY
	LMqNfDtya2gh8Y3vk240gWMq+UODwpHI6r1IOkq+HDRisAAeXhGfZSi3R0C7CJzX
	xKVk/SXCDKVbVbmuuPi5dok928hFX7CFsbbcQmsEllR/SFB6knTlLg0hnp+7E/F/
	D3vR7lh0wneVRhQCpvqjYtJo0MqNqrjTrLGKD2Uc3AajaSCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahu1y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee2d612733so53639905ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674566; x=1796279366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S1PfSPwOFX0MWE8bPkRfQgTr8TnbUtpYuxljXaH6x70=;
        b=eSZ8160+33e2oEHhXip88djGgUjK2yvt/wJnqQg/I7i4FAxDeUjHaP7x87fyBha7fn
         E5sJsQZoTkHIXcM0LDvZCb30zdtf86QMnbGmI13e7XarEIoVnbNIkI8XfN5imsKmEWNB
         U3rRfBfRnJCVZ2WhjOAKcKxERiPp67SsaFbF5JPcKPjJteisieMuIhaqwuEHGK3bpJsj
         ZtNPu0gO6DDEHw4iT0cedXMIVKeALz24Pba2tVUfGBO+Vyog8vDokjWm7M985z2dPwFv
         6o5oHD9P9yQKf5cG6SXOrDtgbjgZg/Kp7coQ1xDlOwjhP4VOAQM7JBUUCXM11okjQjzk
         rf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674566; x=1796279366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S1PfSPwOFX0MWE8bPkRfQgTr8TnbUtpYuxljXaH6x70=;
        b=QsfxEWF+RMgdcclEzdL3kd/OwS4Z0B94iC9BSk4VUQRpuOt15b8uwjk6vCmps57SbP
         3251hshSRIZR9eUSOBhT9XYdHHlNpJOgNzq0ZlUQMmKrV4k/N/i1D44OzQSbIOoKyQ3A
         oTJsUEiHSYMStPuIsFid8twuvDZDu02dJ4xLURV80hQ/bUv3iFZMcjNm7JNt7+/5p0vX
         ZKfhct/Mg/sthSIIEKQquUp39gvfCgKOacvm2mrFZwcKzRAeXfrst7HzK8tJJugKS7V/
         9+/Rn0uGFWCeulqjyGySn29LvvB++1Ma5+bwC/XSnTkIOXYlHfmS4o1fsrQsNZOTRc+E
         E+FA==
X-Forwarded-Encrypted: i=1; AL+hErGBEt5kbUsT+8wdVlCYvtbCOsrRqmFacgYsgm3YuFoOcFGtuFXfqSM6y9ikFAtcDcHCOk/+n0W2DyDWASA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n6JRJ4Nix1wHY9pl3KhSZIqOWEAzw28vHaYnffvEJ++MlKJFu
	MQ+cPbDlU2iV96gxGK9X580UvWeJhNHaJ+4LZs1L/SKIbXUelFMAA1h47EGMzPcgYX7j0/0Lv0+
	46SGXInL08uldR37G8YwNpyvfvBqJDJP/1dwnSeRZN0jaVY2MYaDOjn9i/o0Ckzy0g3M=
X-Gm-Gg: AZFdTZdvuJztEIRmPHrKJKHo6+oZ4kg0XXxA4O/tw0mUJ1uMivu/WbKk9CghgoYJ5/A
	KIsPtfURryTeE4eSJavrS8FF96Ox0suFiS/TeK79TAYOygitZ+rzeYV9O196g3qSRShParmQeIb
	4qF3y11umixLO/WU27WMEfrVFwnJ2WRa7VTqCHJJLxzj7oWxTHxxnOT11g2Gar2yKs54LpGagmS
	owXn765+6oJGcFIfqe/9qHU1VGz6bki8LrKg1rVUOPc+85Qg7oX6kNycXUFUseLJAx7HxJXcvjO
	roO2oNj5ONu1/j9HKtVKzScj+KsO5eElfsNr0Ri4Tm6Lp2kNvyIVUV4sDZrb8eiRZhN69ZcR+4w
	Mock1cKA7Rrc+TtvgkvRD8ua769OOxqh1sg0AVTTXY3CQ1w/h2yJh0Zv5AHq/YNIiMPJJiV1E+I
	2RKHWD/jB3
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr100200435ad.36.1795674565637;
        Wed, 25 Nov 2026 22:29:25 -0800 (PST)
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr100200235ad.36.1795674565085;
        Wed, 25 Nov 2026 22:29:25 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:29:24 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH v3 00/21] drm/msm/dcp: Add Qualcomm DCP display support
Date: Thu, 26 Nov 2026 11:59:08 +0530
Message-Id: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALTRB2sC/0WO22qEMBRFf0Xy3Ay5J0op/Y8yD7mc1EzrqIlKY
 Zh/b9RCXwI77LP2eqACOUFBXfNAGbZU0nivgb80yPf2/gk4hZoRI0xRShm+lR6+epvxxnHwEwb
 T+ki4JFo4VK+mDDH9HMSP65nL6m7glx3z18gwr3VqOWtosovv61DXAPgYlLJSOhOZ045Fr4NWw
 VAZrfeWCNMGQnbOAKXYQ7BrXk8/pv79Zj8OeEt5SeMhulFMsHaidcFq0VL1PpZymVf7XYvDpT5
 vO9XZAnj/SUvXtIJrIlQreRVx3MXqxZU0TEgCtk7qEA2zGl2fz195Myc+SwEAAA==
X-Change-ID: 20261112-jshekhar-v3-dcp-e89cf035074b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=15813;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=8adzhkTct+L8UJxlUtsJlP+OozclkRKTwrEhNyQCbo0=;
 b=zhrpjcY6ZZY5QoduKoGWgyUCTnPSi3da2MZzYzPprK0W+GjxuQ8abyYGni0Nh84SFKKhNI7OH
 NQ771JwviljAkuoGHLXY0Mc8HV6QODjM1Q6H5uQHncsELKpObkS7TEM
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: ov-2AS2811WIbo5E043zDfLG3nMqUwhj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX/5sLrQr7RLbf
 bI4R1TGTz2sHymihrXMueF3CZcUGFLyVXVTvV0QHJzcWpcX0gUy6IZONQTxpUFh0Osi/h5xdwUU
 Y3Lu5I4ER+423Fh9zbTpk2N9KFpF8NQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXwEMK4CoNE8Ba
 cmqOt/OUg+UK44fY0PuMyqVvDwDkSaPHeyi3F3QdphDyiGoVRKH9PgH7YmLvh8qKFZ5nlpD99Yq
 V4Xbg8tewRZR1T5dmE9CFWuwjZXxGCiorUpQ78ivCpa6pA+8Uba9Ws0JUY5CIyFa+9FLWSG5GYr
 yLY+cGdwdJ1aMQRXosHE7vijlZD+pSWamTfNpeFRMD0vLBUUlD5/AT7PYw16RdCs8qJt5+RATHZ
 l8apGVZ3kc3fbq8YWd2YwApFGFquvxjMOX8vnrxtn1pwEKEYQJHQ+BDKRBC2b3BmrGduUiuHGD0
 UnnsNbJAv7dLFYPj88tyu87TK4rpj0nym0GmWOYr3n9QSncTbinVl/jTMhVO/14/QEpy4WgSSqq
 phOIuxp/hNEDk5EIVN+GpwfswNkMQ1rgma6K4dHi8GRFBNaav7lMQV06TGyDOjJL0DrlbVPcPjf
 s/3f1xZD8n1s7XNAitQ==
X-Proofpoint-ORIG-GUID: ov-2AS2811WIbo5E043zDfLG3nMqUwhj
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07d1c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=zd2uoN0lAAAA:8
 a=e5mUnYsNAAAA:8 a=FiR2urJ6vj9GDEvaUFUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

On Qualcomm platforms using the Display Co-Processor (DCP), firmware owns
and programs the display hardware. Linux cannot directly access the display
controller, DSI controller or PHY, display clocks, or related pipeline
registers.

This series adds the DCP display-function driver as an MSM DRM/KMS backend.
It discovers display capabilities through HFI over VirtIO and translates
DRM atomic operations into firmware commands, while preserving the existing
MSM DRM device and userspace interfaces.

The series adds:

- HFI protocol definitions, packet helpers, command/response handling,
  capability discovery, and asynchronous display-event processing.
- DRM planes, CRTCs, encoder, DSI host/bridge, and KMS integration for
  firmware-owned display resources.
- HFI-based DSI mode validation, display power/session management, bridge
  configuration, and DCS transfers.
- A DCP VirtIO function driver that carries HFI traffic over VirtIO queues
  and handles the DMA/IOMMU needs of the display function.
- Device-tree bindings for the DCP display function, framebuffer IOMMU
  context, INTF graph, DSI host indices, and downstream display connections.
- Hawi device-tree integration for the DCP display function.

The Qualcomm-specific VirtIO host transport is submitted separately. It
handles IPCC power notification and VirtIO-MMIO register access; this series
contains the DCP function driver and display stack. The function driver
currently validates its parent transport using the device-tree compatible.

DCP is integrated as an MSM KMS backend rather than a separate DRM device.
Firmware reports available display resources and owns the display pipeline;
Linux retains standard DRM/KMS atomic, framebuffer, bridge, and event
handling.

The initial implementation supports the DSI output described below.
Split-pipe, multirect, cursor-pipe, partial-update, DisplayPort, and
writeback support are deferred.

Tested on the Qualcomm Hawi MTP with an NT37801 DSC command-mode panel:

- Display console at 1440x3200.
- Panel initialization and DCS transfers complete successfully.

Device-tree topology
===================

  qcom,dcp-virtio                         (companion host series)
  └── display-subsystem                   (DCP display function)
      ├── framebuffer IOMMU context
      ├── port@N ────────────────────────> downstream display endpoint
      └── dsi@N
          └── DSI peripheral

The INTF graph endpoint connects directly to the downstream display
endpoint. Firmware-internal paths, including the INTF-to-DSI connection,
are discovered and managed by firmware rather than described in DT.

Runtime architecture
====================

  Linux DRM/KMS
  └── MSM DCP KMS backend
      ├── planes, CRTCs, encoder, and DSI bridge
      └── HFI command and event handling
                  │
                  │ VirtIO queues
                  ▼
          VirtIO core / DCP function driver
                  │
                  ▼
          Qualcomm VirtIO host transport
          (companion series: IPCC and MMIO)
                  │
                  ▼
              DCP firmware
              ├── display pipeline and resources
              ├── DSI controller and PHY
              └── display clocks

Probe and initialization
========================

  Qualcomm host transport initializes power notification
                  │
                  ▼
  Host registers the VirtIO device
                  │
                  ▼
  VirtIO core binds the DCP function driver
                  │
                  ▼
  Initialize HFI queues; send DEVICE_INIT; query capabilities
                  │
                  ▼
  Register the MSM DRM/KMS backend

The host must complete its power-notification sequence before accessing
VirtIO-MMIO registers. Once the VirtIO device is registered, the DCP
function driver initializes HFI, discovers firmware resources, and exposes
the display backend to MSM DRM.

Dependencies
============

- The VPU IOMMU series provides IOVA handling required for firmware-visible
  DMA mappings:
  https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

- The separate Qualcomm DCP VirtIO host-transport series provides the
  IPCC-aware host required to expose the DCP function device.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Changes in v3:
 - Split the patches into two independent series: one for the Qualcomm VirtIO
   transport and one for the DCP display driver. (Dmitry)
 - Fold the DSI-host schema into the DCP binding, rename the transport child
   to display-subsystem, and clarify the shared interface-index namespace
   and IOVA cell format. (Dmitry)
 - Model the Linux DSI connection as a generic DRM bridge and use
   struct drm_dsc_config rather than duplicating DSC fields. (Dmitry)
 - Move mode-dependent DSC setup and HFI mode validation into atomic check,
   and send display-disable and post-disable HFI commands from their
   corresponding DRM callbacks. (Dmitry)
 - Remove redundant NULL, framebuffer, and vblank-state checks; use
   struct drm_rect for mixer ROIs; and enforce blend-stage limits
   through normalized_zpos. (Dmitry)
 - Remove the portrait-specific width/height cap swap; check max_width
   directly and leave full mode validation to firmware. (Dmitry)
 - Reduce atomic-check diagnostics to debug-level logging and document
   fullscreen-plane handling. (Dmitry)
 - Split the Qualcomm VirtIO host transport into a separate series,
   use VIRTIO_ID_VENDOR and validate the parent DT compatible for DCP. (Dmitry)
 - Clarify that DCP uses firmware-delivered display events and has no
   host-visible display IRQ. (Dmitry)
 - Remove redundant/unused Hawi pinctrl states and clean up the
   DTS formatting. (Dmitry)

Changes in v2:
  - Compared with v1, the series is split into smaller patches. (Dmitry)
  - Reworked the VirtIO transport integration so the Qualcomm
    `qcom,dcp-virtio` wrapper performs the required IPCC power
    notification before accessing the VirtIO MMIO registers and
    registering the virtio_device. The transport registers the device
    directly.
  - Reworked the DT topology so the DCP INTF output connects directly to
    the panel endpoint. The firmware-internal INTF-to-DSI path is no
    described in DT. (Dmitry)
  - Updated the DCP VirtIO binding to document the Qualcomm VirtIO
    transport and VirtIO MMIO register layout, Qualcomm power-notify
    interrupt, IOMMU contexts, mailbox, and firmware-visible IOVA
    range. (Dmitry)
  - Removed the interrupt-names property and used the defined interrupt
    ordering for the VirtIO and power-notify interrupts. (Dmitry)
  - Added panel bridge and component integration so panel bridges are
    resolved through the DCP DSI host before DRM registration. (Dmitry)
  - Tracked CRTCs using firmware display IDs instead of DRM CRTC
    iteration order. (Dmitry)
  - Moved DSI DCS-buffer mapping into KMS hardware initialization,
    after the IOMMU VM became available, with rollback unmapping on
    failure and before VM teardown.
  - Reworked IPCC resource handling to use managed IRQ and mailbox
    cleanup. (Dmitry)
  - Moved IRQ-wake handling to the suspend and resume paths. (Dmitry)
  - Removed the ipcc_valid state and made IPCC initialization and teardown
    follow the channel lifetime. (Dmitry)
  - Embedded the HFI capability cache and removed unused capability fields,
    feature flags, and callback state. (Dmitry)
  - Removed VirtIO config-change capability re-query handling because
    capabilities are consumed during initialization.
  - Removed the temporary self-component shim and registered DCP DSI hosts
    as components. (Dmitry)
  - Added optional GPU component matching for the display-only DCP DRM
    device. (Dmitry)
  - Made HFI packet-ID allocation atomic across wraparound using cmpxchg().
    (Dmitry)
  - Updated bandwidth aggregation to ignore invisible planes and planes
    without framebuffers. (Dmitry)
  - Moved DSI topology values into atomic bridge state while keeping static
    panel configuration separate from per-commit state. (Dmitry)
  - Removed the unused DP catalog and resource path. (Dmitry)
  - Removed unused HFI hotplug and error callback plumbing. (Dmitry)
  - Simplified HFI buffer release paths for callers already holding the
    command lock. (Dmitry)
  - Exported the generic MSM GPU-component matching helper for the DCP
    backend.
  - Replaced deprecated DRM logging macros with DRM device logging helpers.
    (Dmitry)
  - Removed unused includes and fixed indentation, naming, logging, and
    error-handling issues. (Dmitry)
  - Removed status in DT bindings and commit subject. (Krzysztof)
  - Documented the DSI host DT ABI: DSI hosts use the generic dsi@N node
    naming convention, and their reg properties identify the corresponding
    DCP output index. (Krzysztof)
  - Fixed the Assisted-by trailer order. (Dmitry, Krzysztof)

- Link to v1: https://patch.msgid.link/20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com
- Link to v2: https://lore.kernel.org/dri-devel/20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com/

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Philipp Stanner <phasta@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Flemin Jose <flemin.jose@oss.qualcomm.com>
To: Mahadevan P <mahap@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org

---
Jayant Shekhar (21):
      dt-bindings: display: msm: Add Qualcomm DCP
      drm/msm/dcp: Add HFI packet helpers
      drm/msm/dcp: Add HFI device definitions
      drm/msm/dcp: Add HFI display definitions
      drm/msm/dcp: Add HFI panel definitions
      drm/msm/dcp: Add HFI VirtIO transport
      drm/msm/dcp: Handle asynchronous HFI responses
      drm/msm/dcp: Add generic HFI display commands
      drm/msm/dcp: Add HFI DSI and panel commands
      drm/msm/dcp: Add DCP CRTCs
      drm/msm/dcp: Add DCP planes
      drm/msm/dcp: Route HFI display events
      drm/msm/dcp: Add DCP encoder
      drm/msm/dcp: Add DCP DSI host and panel support
      drm/msm/dcp: Integrate the DSI bridge with KMS
      drm/msm/dcp: Register DCP display pipeline
      drm/msm: Export GPU component matching helper
      drm/msm/dcp: Add DCP VirtIO driver
      drm/msm: Support KMS backends without a display IRQ
      drm/msm: Register the DCP backend
      arm64: dts: qcom: hawi: Add DCP support

 .../devicetree/bindings/display/msm/qcom,dcp.yaml  |  159 +++
 arch/arm64/boot/dts/qcom/hawi-mtp.dts              |  108 ++
 arch/arm64/boot/dts/qcom/hawi.dtsi                 |   45 +
 drivers/gpu/drm/msm/Kconfig                        |   26 +
 drivers/gpu/drm/msm/Makefile                       |   20 +
 drivers/gpu/drm/msm/dcp/dcp_crtc.c                 |  721 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_crtc.h                 |   85 ++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c              |  708 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h              |   60 +
 drivers/gpu/drm/msm/dcp/dcp_drv.c                  |  193 ++++
 drivers/gpu/drm/msm/dcp/dcp_drv.h                  |   43 +
 drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.c           |  988 +++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.h           |   71 ++
 drivers/gpu/drm/msm/dcp/dcp_dsi_config.h           |   67 ++
 drivers/gpu/drm/msm/dcp/dcp_encoder.c              |   29 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.h              |   16 +
 drivers/gpu/drm/msm/dcp/dcp_hfi.h                  |  264 +++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c             | 1150 ++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c             |  191 ++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_dsi.c              |  166 +++
 drivers/gpu/drm/msm/dcp/dcp_hfi_dsi_config.c       |  597 ++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c          |   60 +
 drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c              |  325 ++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c            |   63 ++
 drivers/gpu/drm/msm/dcp/dcp_hfi_priv.h             |   47 +
 drivers/gpu/drm/msm/dcp/dcp_plane.c                | 1042 ++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_plane.h                |   36 +
 drivers/gpu/drm/msm/dcp/dcp_plane_state.h          |   37 +
 drivers/gpu/drm/msm/dcp/dcp_virtio.c               |  310 ++++++
 drivers/gpu/drm/msm/dcp/dcp_virtio.h               |   12 +
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h  |   78 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_display.h |  105 ++
 .../drm/msm/dcp/hfi/hfi_commands_display_events.h  |   90 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_panel.h   |   27 +
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_common.h      |  182 ++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h      |   61 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_display.h     |  464 ++++++++
 .../gpu/drm/msm/dcp/hfi/hfi_defs_display_color.h   |  247 +++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h       |  287 +++++
 .../gpu/drm/msm/dcp/hfi/hfi_pack_unpack_common.h   |   79 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_packer.c           |  106 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_packer.h           |   65 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_packet.h           |   76 ++
 .../gpu/drm/msm/dcp/hfi/hfi_properties_device.h    |  102 ++
 .../gpu/drm/msm/dcp/hfi/hfi_properties_display.h   |  480 ++++++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_properties_panel.h |  198 ++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_unpacker.c         |  157 +++
 drivers/gpu/drm/msm/dcp/hfi/hfi_unpacker.h         |   77 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_utils.c            |   62 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_utils.h            |   56 +
 drivers/gpu/drm/msm/msm_drv.c                      |    8 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   10 +
 drivers/gpu/drm/msm/msm_kms.c                      |    2 +-
 53 files changed, 10654 insertions(+), 4 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261112-jshekhar-v3-dcp-e89cf035074b
prerequisite-patch-id: eecfd66a55b8f2b7b2fc7d76d815facca0489d00
prerequisite-message-id: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
prerequisite-patch-id: 43f30570f31419a014962e6012f98f5b341d46bc
prerequisite-patch-id: 08ffd8da137637eda4fa6d64a4a7fc5a24ea80a6
prerequisite-patch-id: eca5d1310fd57c909cedf1668e075acb966db4ba

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

