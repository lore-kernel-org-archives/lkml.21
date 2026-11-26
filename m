Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689731;
	b=qMmIplEqw0FHgPRMbXIDaYcZeUJa5V8Z2Qj5SWWr8Ri3we2BzMv9CuXkiDfTwEpst7hq
	 hqzL7lllLQIu7bx9oV1hdzHWF8c1JYlpvgnGZT+swg+MnfMXIugA98ItBCMZKAVzoeNLo
	 imUpHa39pQOvOFW+nvu0cDTNlrvM4vx8pNEJtqr1DP5qVE68G5a39s0jf5KQcurj87BrZ
	 67p2kdIQFVFAxQCwbx+/UZPmxDuwupbtCeAf9NRAKmx0UypJGiZnHsdb2pwjwAwxoFD05
	 JFGRe9M+XAHZMc+wGcfNrYyMd0WntFQYFyTxaORjs5811THWW3vnaxg0cTXQ4FkXyOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
	b=VnbWHSFk8wx3F2vYlM4H6pfqP+FSTYe8FwUBsPH4MI8mC9ylbKaIKwRWsMD97rCqF/H9
	 lABXoTXWkwaXEzP0LoBSNKifKUsxjTDs4TpIaVDU0XtsN5JdDApk+HjoduuEm/n5MQCnD
	 0depjbmjDrOdLM7irodq4Y+dlqIpethMHhSlhox95r/RZt7ERoGmufFH+I7giaVPgyURN
	 3GOzqcSV6hhel091brlO2+2iXHwEHn21cPfBw8BD6Oq/GUl7RqMBpcDZVIZLluyRQ5B9n
	 KKbque3gbWMtwjBVCy/NNDkGDRCkNXlE9eHBc14gctH7R3TRwCOvpOAQDqtzfEIMqbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2O9bLqf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sl0A0SFY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70FA606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70FA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2O9bLqf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sl0A0SFY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXauV4002069
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJA
	z+1FO4Ek=; b=D2O9bLqfZQ+ueWUx1rHztnHWSor7P1LSeNxkGep7ZmvpSkwVAef
	VF4djEgYv1nYdW5YB0WvtINv36V+egw6F4oXF+XnQd4U7oOL/cKK/SKzPFpAjlKH
	CIZBzG7khoL3AosMd3smf1Z49IW1rSxyvUFV1gwoha+ySrX2FnOEdlE/hlZw8NBd
	n7eH2OeV3/dpQLJGeGWzygXf/3nAzHRsQf4hFxqG4C7S7tw6NAYZtmo1wgUxWtWp
	Q7pLiZyvvKOOTac8oI3QrcNCAHGmKJ1IQH7/MwlHylNnJ8F6J1xgm4/03z5TqFbv
	Q/aDtxWbjfC/zTAoDLnjhbAIBgUzWIWJ1Qw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaujdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso11150770eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689728; x=1796294528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
        b=Sl0A0SFYUzBw2AmrNbzESkYobUG6oVas9pX5cp9cN+0EefifixVIHmESFKxjib2UOk
         9+xS4rWx7dzu/3D6W/kAlS+npkalj2ky3hT6YctiSWejEkE48WVXZRHN6vuhOYiC7wgy
         msEv6X3rNOhsxagsZsCyCJpT7QjqgqaQtSFO+qbiZDE9d2vggtm/ZsYka9HpImnj06fZ
         sfgeAph2AMH16a+4NJaAZtZuJn9Rsy4sD/bH51alr8d9TMRU/7Y+Pf+qN1ubqanXtvL6
         BLlXypkVmbkdRpZJ6kNYx+3kIVtv4QaHw7UQoRZVhi7Y3LkoQ1lsy0o2VNrzPqSs9FHr
         4P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689728; x=1796294528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
        b=b4NgSKURusJ06V5VR4u/Tr5obCtxeGvbfLgw8OW8h84xUum3ILYeZH0AVv2+pZIM/i
         CNetEiTsw9sfqOAaz/cFSAOmScD5rnCpuFoMDIO+P+ixa3Pgrt0Bd1xyNCP5FYK0XPhj
         vYx/kw9GnjRYE7jzWwQrVNJptXYebFoSo4JrZFgxlnMumCwRx30HP2+HV6NICAQqFilz
         13/tP6DzXnaqhTMWZDN5qL08gm+ccBWpeg1L1OQJ5ANSTPBMW3DmgSC77LhbWsbSamG5
         8t/FNtY7jJGAnVuNkaHY6+76/mekK2UatqCB3BCfNGNWIJe7idZTV53s8c4iiAAdJ7qx
         GIew==
X-Gm-Message-State: APuU4Z9qIXwxDk0KEGeLjKTfUZ7NppjMalayJ/O2/jrJnUiLvA7YnrWv
	IPHyCkVxX/w7aSCPU3EKs9yLQUnuXJLbUFBZmqORsrPuzbrHN7NAEBgfe2ITrtrmpmRLKZVQZ57
	3DCOw4jp7by7zyMV9fmIidjJBHodt1XaNy+UkLrF86kMqKskC+I8OvJjbg7zb96W6PcM=
X-Gm-Gg: AZFdTZeJuGhkAZ7rtp5MznFcD0pOP+VRxaciXvhNhJX9IFDrVjnVBFGHCrq3BRbSPMp
	v27cJhsmOHTCqXcbC1Q6IVp1D+Rps6dn2kdCFqFaH690+oKNSFMWA5oa+wqYgtvgqnRlt8Nwftm
	BAmqF48dYu4DRO/DjITShFUBFPS2outMSdoFVfpQKOYLhgLSi1BiZvU3sJrCp6zmGnSpK6jVSyL
	gCLzYvJrJcnFJ49czM5NqVl9M7bolH1dvDnTypTzev1X6HMMJIb0VLAdJDputurUICEK+PKE7R3
	2A1XrLXNF5QxdHpEv/lIsNCzy/IAEzY42M/8hJmGUCjp920bL4gkg1nGYduwTjyz/exhxsIriIC
	Y5VeKxOSIxziUNPtOiKUt33A0k//9L2kXF5a+yzXCvvogsq0qjBpilX/aG/dtMV+pHx/rDa9bD8
	CQ7A==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr15496841eec.29.1795689728268;
        Thu, 26 Nov 2026 02:42:08 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr15496819eec.29.1795689727698;
        Thu, 26 Nov 2026 02:42:07 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:07 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Thu, 26 Nov 2026 16:11:59 +0530
Message-ID: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXxJgR/VwfbTaJ
 m1A0KXJOpxlr+hG+E/gwu0Q9w+2PwB25OE81OA68KExF/o8FL/eDNpSW7m/c+bGKNuvjCWcLSTZ
 v5XJFLDIubtb88wPfoYDr1aFgMjHZUc=
X-Proofpoint-ORIG-GUID: is48oxOYQtHK9LrLy-nLlmuAbVv1TUzp
X-Proofpoint-GUID: is48oxOYQtHK9LrLy-nLlmuAbVv1TUzp
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080d01 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0SHhRi3bvSNplQcU8zEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6FDuJJFkZgMG
 39+zduV//Zvxe5ts3N37p39T+hhD8ptZg7u+tRgjNlkz2EH+/3tIY7xWMrv/Xx6IMFj++1bKxMH
 1hggcMsQSKjg6YZqaw7MK0hf+Q3Cup7lk8ml/5lVQSmp9TnP4PsPc1Oo+xfNznB3MC04lxJooKW
 dzwktImyAxvz8jlzkyR9Mnmvv1tqag2cWfumuUgSraX32FifBXEmhJOGbQeM1DPrb//5ttGYCF+
 Zd6IMvi4ZKSYAsvSGKZocKmIfnc8iouCX7x4ExdEFZVc10Z2wpMBXo19HH6Jxh2arMZsvLv7cz4
 kxo+/o+l/t0bpgiRG5n0n57XxfdsGb4Mu159/B4ar1ht5iP7HbEplDFjidnUC+olovLXfaeDzyg
 208ba9ARKl9+CCCNgUp2+Bc2P9CZg2I+H4spQHMvmOwYU0DltM3n35Kx0z0ixFRuMpvLh0ypH0B
 3erhLZeNRZ+cFC2Ni6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Add Cypress CYPD6129/CYPD6229 Type-C PD controller support for the
Shikra CQM/CQS/IQS platforms (patch 1), and CC orientation-gpios for
IQS's usb1 port, which is the SuperSpeed-capable port (patch 2).

Link to v4: https://lore.kernel.org/all/20261123122857.2424213-1-akash.kumar@oss.qualcomm.com/
Link to v3: https://lore.kernel.org/all/20261012094835.647882-1-akash.kumar@oss.qualcomm.com/
Link to v2: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to Driver and DT-binding change:
https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

Changes in v5:
- Split into a 2-patch series: patch 1 is the base controller support
  (previously posted as v1-v4 as a single patch), patch 2 adds
  orientation-gpios for IQS's usb1 port (the SS-capable port), using
  the ucsi_ccg CC-orientation series linked above.
- IQS: fixed vbus_boost_5v to regulator-always-on instead of
  regulator-boot-on, and dropped vbus-supply from both connectors.
  Neither ucsi_ccg nor the typec core ever requests a connector's
  vbus-supply, so the v4 form (regulator-fixed wired via vbus-supply)
  was left with a permanent zero use-count and got disabled by
  regulator_late_cleanup() shortly after boot, cutting VBUS to both
  IQS ports.

Changes in v4:
- Rewrote the commit message: this is a single patch, not a series;
  clarified that usb_2 is HS-only and usb_1 carries HS+SS.
- Dropped the unused ccg_typec_con0/ccg_typec_con1 connector labels.
- Replaced the re-declared `port { usb_2_dwc3_hs: endpoint {...} }`
  overrides with direct &usb_2_dwc3_hs overrides, since that label
  already exists (empty) in shikra.dtsi.
- IQS: converted the vbus_boost_5v GPIO hog into a regulator-fixed
  node and wired it to both connectors via vbus-supply.
- Kept `dr_mode = "otg"` on &usb_2 (and, for IQS, &usb_1): a separate
  commit (9b8dc188ffa6) already sets dr_mode = "peripheral" on these
  nodes generically for all EVK boards, so dropping it here would
  silently leave the ports in peripheral-only mode and break Type-C
  role switching.

Akash Kumar (2):
  arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller
    support
  arm64: dts: qcom: shikra-iqs-evk: Add CC orientation-gpios for usb1
    port

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 107 ++++++++++++++++++++
 3 files changed, 217 insertions(+)

-- 
2.43.0

