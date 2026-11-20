Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173073;
	b=NYRLHCOKJGWtbAsMClfUvtHBn+bjc4ZfNR0EXwU957xuD5rBYmnXGjDq2swmXm02GVJ9
	 MTmVggSgwngQWtsROxQ/OuSNT5P8Fd1c4pEhhbRtNiVHRRCb/5aTLZinQv7x1IDYBDSKD
	 OGnhjLLbemlhrDrvQckJZeifhv4oP1KcrZmApt9LILbe6o4ykCMldKOhDBLpuSOSmjWV1
	 tv/iLl6ZaQbwlXnYSo38ZCNynK2OYnChRFTBcoNmNiHk3AQDHf0bP4nZNHjMSwzOoiaEt
	 wGD6bXYN/pGDjyefA2nOoj6zSLMhGmZebCHuGtrrIqPGIoz0p4DW4QHV15zk+bK/3qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a40Lv0ekGRLuys48DhtObUK0gzbJg8LFj1hB3aT9n7A=;
	b=1+TURZaazjyb/sxu5EcmyFkonw6tZI+vClSXR2nAgYnugx8wfOJHA/9rJ3WQazkJgyxU
	 D0ia7oD1UbjKGMqfzc3ZxhnUp7GXp/QZlNS+fgniVdvazM5fpMYEl6DaQM4dBPUZ621sC
	 FqA6V10Qr7/nEQAqa+I8lWGHkLvHdfRj/PRVejnhM8EYBBRU8HMBPBD9ojX9pkRQnEcpf
	 Uz+w1WOTUd47ODyytXLDtFGKh4/FqpCF0Io9uboUpoWypYXJ8lykBnWidnezqstF4BqDK
	 zyiSgQtEnjKEqp4iwLoyYVwk9Zbw08CHiljD3khg+4LTX03SczRYLRG5Nk8z8X+6h0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eCFJGYLf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFTOnt4u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434860A3816
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9434860A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eCFJGYLf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFTOnt4u
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwPC2155219
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a40Lv0ekGRLuys48DhtObU
	K0gzbJg8LFj1hB3aT9n7A=; b=eCFJGYLfmXe1yiWnCmPSQMeIugm9NKZSz2Rs42
	zApDgsFxw8wIq7JM8GtWQdHFn67QVYTWbfDxSOqIzMyOebyxZGhwwZ8VVbMwLKx+
	zj5fjQfjoYskdtaaSojpeCyc09Kpi6ySOcwl+OnCavZDcbkWJeaEBmT64FgAmZ6Z
	MIf5JRdE/iQrtT6SOKhem9QkFP48+23kq2Z3a4bVGbo9wWstSDDGO8NkcREQ8MXi
	hbDgu/P8eWB7ejub0U5DP3Q9gUGUp0N3r5xu1lcW+Vw/QDKH+1hxYcdX30jhysKE
	qdF3xQ0ENYZslILSRM/+qtbT0yflmvKLieboTBrlR0O6NBMQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhkk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso1805092c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173068; x=1795777868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a40Lv0ekGRLuys48DhtObUK0gzbJg8LFj1hB3aT9n7A=;
        b=HFTOnt4ufQR/heaUIIdFB1SY/XJ7xOkMSMmBrngi7LRmXA7Jguy6x3xDqFzHSB4Nmj
         jZG5TJ7uC+29GxDO1hqOGh2YLN0+hQhvYvt9oy2pTbednRtG+zW/aMx4gGo4jUfPY+i/
         GlhpbtplwokUqqfgH5cwUYtpOahLPrQQznSGtGdRyJwCIAoCH0ewl28A4zpw9v/jBc4m
         JPI/yjusONMfV4FCpo2ngRs+TM/brFikqf8nhOTdh5fmeM3NfvS9DjQME2Z1UYEUd6Ea
         F1GFCrbJadJFzj7rnjc86vlRdiBXIzopAXPcuqTvNfPFe3XFZSoFoESqdG6nAhQh34Re
         Iqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173068; x=1795777868;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a40Lv0ekGRLuys48DhtObUK0gzbJg8LFj1hB3aT9n7A=;
        b=TKKjTV6J989ZSdOcJXUo9TrhHEKWI+fldG/WTeIHwh9/kriS9I4Lkl88o02ZMNtx4a
         MaoMjirsxKZgcH+HbzsXisU2vUnjuo+Y5+qnFAnL5+REpzZ02Iocq7X17yzKjHzWMOUN
         Ufvk8nzF0RdAFS6Uv1EErPBZLIvsrUtfBvA1NmL8GSFBdFSGEUEWWeCHNCEmWaHn6P4D
         naYRbzNRgEcQbzR3p8OA/HAhEFFdOdC1RAXUUc5r1vJXaKvKzyTUdkFb9VSeNM7TAewW
         7ZDah7udNZ1AGGBi0OnnoG9Qz+KpCL9LuM0u/VHC0UtWxyChIxIk/EicO1ANKKfOP1S5
         u3ow==
X-Forwarded-Encrypted: i=1; AL+hErEsg+jCtU9K4QMCMewbRsoBUiggPXw2TwppJ9XLLMBvc1GRwPZs3AYpOKL/Ngv+SpLQ9sY2+V7E8zdpnZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qx2LiIJNEgSeWZKFKgsG9Elu4s+dt6NJVl69KZcIL4et/ynzk
	5/tIS4vB/Ce/hWmxpzfAgrr0NDA/VCSwBKV0EWEKSThomoirOO7bRlojP3owaW/zb965mjEFaE6
	7neZhmH6zvWnrgxOCLof4bdaPhf9Az2aQqskfI/7t58OjD5x6E9sBk0eVUmSIUM1teq/Zr9IKt/
	E=
X-Gm-Gg: AYBFou23SunX598nvOFGolj4Da41IzW2PVk9rGa7yDGjbJT9LYSpSVVcJnGCD1BIVgY
	leRnwOjwF7QxC3c3TBVcatz9oWzpdzVOgewlrvr/qTts7AxboTUiAt8kzLaYv+/1V9A96lcTtQM
	n0B0DQ7MbQB2l7TyfqtOwDISx3/HQH9FgJzp1lEZUdcFLTz3RHXE0l2uZbSlyw/DsnLofdGPFLE
	OPflHUJUOlVPdSJdzXgty9ocaGye/HnmO2WRHfN2SeD/+RDfwt+cEMACN+GRE9gSQsmAjXtTvyf
	MjT/I5LWvfLI2mLKBcs1YQ0fRXrh36QjvAYobTnVEeMJCwWIDhhgoY6KDOXuJdRrUgl0xsqzp6G
	KvwwS7xyERKPyMNfNXf+FKZ9dHyUuMwiPuYwm/HTULMUK/7bXpiab2MJpIDlq/JTB+2CS7XgCw3
	xQ74gDBZAR
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr2890488c88.29.1795173068156;
        Fri, 20 Nov 2026 03:11:08 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr2890460c88.29.1795173067639;
        Fri, 20 Nov 2026 03:11:07 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v7 00/12] media: iris: Migrate iommus to iris sub nodes
Date: Fri, 20 Nov 2026 16:40:50 +0530
Message-Id: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALoqAGsC/3WQ3WrDMAyFXyX4ei52/B/K2HuMUpzIbg1N0tqJ2
 Sh59znJ7tbdCI6QvnOkJ0ouBpdQUz1RdDmkMA5FqLcKdVc7XBwOUDSqSS2JIhTn+3wOY9+vNdt
 zmYFbGC5YCOmMNJZ62qGyfY/Oh6+N/HnadXSPuRhMexP1LiW7GTTVceVTWhNsAX75cbVPOGtMM
 BjCtTSKtYp9jCkdHrO9dWXsUMr76veCRg0OMSS8ZXR4HtowAM6s8EQNXCpLmSHqNa+1yeG1E6a
 mstBZUJ47yVjdec9AgqJSeE6F5toYL4wWjKP10mtI0xi/t5dmuZ265yHs3+9lWUI53koLWnKv/
 Z9Q6LQsyw9exMU9rwEAAA==
X-Change-ID: 20260701-vpu_iommu_iova_handling-556e969a1f1c
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=8526;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=nd5hOYhOmQbePqVpVnYqGi/XXm89BV+StxbCqY1SZ8k=;
 b=Wevnc3f/zvxIiJbcKCjVzUcHmK1zZjvFmWfbmWJydNPhoeFuZZI953xhJmEO//qGNuZZepSwT
 BZS7fVUG8ztDySCRXzMNt3A9AsCeAot0lC5msrtlayiVWXdJYHuqtj6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002acd cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=cpw3F-7VUnyQw8rkHkIA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyiIDiG+WNPWL
 3t3tXQ2g8rkjNJpZjSojr1LevJlsonvJcwws/O2ogx+koiL30M4jedlAY9slm7T7sfhzTwEtJ1X
 GzfhEiTlwOHFK96lJ2wGRlHUNwFZ6Xa6vwiuO/rjULZBB3Rr9b6BuRNLpf023PVeVLbLfp4Lixi
 ysZx33MGh32nBReDf9GQWPqP6mjcujUyWNZlReYvrVyZxHKG7wSfUws0O1jN18FgrIhsCj7099K
 AVOcqJwJTG8RNh8+bYH6FZgGS2AuN17uOc5AurBKdeE6nmXIHL+KHb4ODsGqGg1oxVPasEub+jD
 AbNlpdvYgpiCqFi9inSXWPbfWgs4OvQdPa3Xe2AqO/1Mp9EoLhOOFL0jGuFCOdHGpwG7nzMp6ho
 LnmzqV0rQsqVvHvNQ/aPY3N497yXZpqHDJA4iUQ9mUDA4/Klpc3efQbS8wHXwBwS7J20yDZz2La
 YOQz25SUOLqukoUj1Bg==
X-Proofpoint-GUID: EuBd2ez7x04v8ElC6S8i3XKFN00Gz72p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4DgTp9S8vCqP
 QoOBZc9hF9/qLN8/WdUB1FEq7cxeyCS1vgR/Yc72cV339BfJTwNmbSXR13DG0hgzDbng3xDkkkD
 mPKTEMrWoRBN/0L8S8QSXbqZMhlQKLM=
X-Proofpoint-ORIG-GUID: EuBd2ez7x04v8ElC6S8i3XKFN00Gz72p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does 
not restricts specific streams with specific addressable range. The 
non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
pixel stream can address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+

A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer inside the low 600 MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix was made in iris/venus driver to reserve the 0-600MB range and 
thereby prevent iova allocation from that range. 
https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com

Given that the address range restriction is for specific VPU stream, it 
should be ideally moved to that stream. To achieve the same, a subset 
of streams is now represented as subnodes, so that each can be 
associated with its respective addressable range.

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The maintainers agreed to proceed with the subnode approach to address
the VPU hardware limitation.

Reserving the iova address using "iommu-addresses" requires it to be 
placed in the reserved-memory node. But when "iommu-addresses" is the 
*only* property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong to 
reserved-memory node. A device IOVA range is very much specific to the 
way device own address space is mapped, and not a description of memory
shared across the system. Given this, "iommu-addresses" backed by a 
"reg", should be placed inside reserved-memory, otherwise, it should be 
defined within the device node. More info on this discussion can be 
found at
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

"iommu-addresses" property expects a phandle, which does not make sense 
when the same is defined within individual device node itself. 
Introduced a new property, "iommu-ranges", for the IOVA ranges required 
for DMA memory mapping to that device node and when there is no physical 
memory reservation.

"iommu-ranges" is defined with the schema PR
https://github.com/devicetree-org/dt-schema/pull/207

Patch #4 from v5 onwards is now posted separately and not carried as part 
of this series.
https://lore.kernel.org/all/20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com/

This series migrate vpu3x platforms to subnodes. All new SOC having 
iris3x or onwards(4x 5x..) should follow the subnode approach.
For VPU2x and AR50Lite SOCs, which are being migrated to iris, the 
subnode support would be added once the SOC is migrated away from venus 
to iris. There is no plan to upgrade venus enabled SOC to subnodes.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v7:
- Addressed sashiko comments.
- Rebased to linux next.
- Link to v6: https://lore.kernel.org/r/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com

Changes in v6:
- Addressed sashiko comments.
- Rebased to linux next.
- Iommu patch #4 from this series is posted separately. This is done to 
get review feedback from iommu maintainers.
- Link to v5: https://lore.kernel.org/r/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com

Changes in v5:
- Addressed review comments in #4 which seems valid (Sashiko)
- Added RB tags.
- Link to v4: https://lore.kernel.org/r/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com

Changes in v4:
- Dropped Daniel tested by tag (Krzysztof)
- Removed depends-on info from the commit description ((Krzysztof)
- Dropped the soc {} in example (Dmitry)
- Addressed review comments which seems valid (Sashiko)
- Binding patches depends-on: https://github.com/devicetree-org/dt-schema/pull/207
- Link to v3: https://lore.kernel.org/r/20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com

Changes in v3:
- Drop iommu-addresses from reserved memory (Rob)
- Defined a new property iommu-ranges (Krzysztof, Dmitry)
- Moved the vpu specific context bank handling to common(Dmitry)
- Dropped fixes tag.
- Link to v2: https://lore.kernel.org/r/20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com

Changes in v2:
- Fixed sashiko issues.
- Moved subnodes into common schema (Dmitry)
- Kept the firmware name as the one defained earlier (Dmitry)
- Added dma-ranges to specify parent-child address translation
- Moved context bank hooks to VPU ops (Dmitry)
- Updated commit description.
- Link to v1: https://lore.kernel.org/r/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com

---
Vikash Garodia (12):
      dt-bindings: media: qcom,venus: Add context bank subnodes to common schema
      dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
      dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes
      media: iris: Add non-pixel and pixel context bank devices
      media: iris: Route buffers to the matching context bank device
      media: iris: Skip DMA mask setup when the core device has no IOMMU
      arm64: dts: qcom: hamoa: Add Iris context bank subnodes
      arm64: dts: qcom: sm8550: Add Iris context bank subnodes
      arm64: dts: qcom: lemans: Add Iris context bank subnodes
      arm64: dts: qcom: monaco: Add Iris context bank subnodes
      arm64: dts: qcom: sm8650: Add Iris context bank subnodes
      arm64: dts: qcom: sm8750: Add Iris context bank subnodes

 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,sm8550-iris.yaml           | 17 +++-
 .../bindings/media/qcom,sm8750-iris.yaml           | 16 +++-
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 15 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 15 +++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 16 +++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 15 +++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 16 ++--
 drivers/media/platform/qcom/iris/iris_probe.c      | 85 ++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_resources.c  | 41 +++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  4 +-
 17 files changed, 345 insertions(+), 50 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260701-vpu_iommu_iova_handling-556e969a1f1c
prerequisite-message-id: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
prerequisite-patch-id: 99bdcac6ebf8b12961e5288bad65e7cd62888f91
prerequisite-patch-id: 5ea5af6f15d0c88dab1b192d74ef4cd938e69227
prerequisite-patch-id: 792dd9c2022019b38a169cb1e6ab84d87316b833
prerequisite-patch-id: cda71b749bf72bc68adae87d8a34bbbb9aecc5f7
prerequisite-message-id: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
prerequisite-patch-id: ea985fc3b351931adea7940855e5219be3a2bed0
prerequisite-patch-id: 5b6c27159dcaa5c06b59ed92ad39824e002a9f93
prerequisite-patch-id: d9bd004033c1a7b4f02f5fc1390a5e21ee6b38c7
prerequisite-patch-id: a2ea5644cca938dfb766227030f1200fe9e08cdc

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

