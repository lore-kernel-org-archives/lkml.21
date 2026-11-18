Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006923;
	b=qGSKpB8IlbQapQx+pZuyFUuLSoJ1g5vYcHPs1gL+RsMdV1WaY2ShTTv3N5Hdk1AWZBrK
	 xCzsw/j1I+jRWCLQq9j4vvSFRCHfKdiPwfnNVqXgaTZOWZzHCjYLQTegXMPuxQwkzg0gG
	 qtKbcQvsKUwz2Y1c7jYCo8n+RvTf+zPesIn61RwqOWVt9klaZ42SoPu1trkBDPOFku6W+
	 5PVumtQsZZUAOHRXqYDSw8ICjHishqYr3nR7NLd6r28jKguamXtYsGN4X3sk7gSUrOFdL
	 JJzO2Zgx4T/AcViF8PuQNCg+igULubRp29XA6Eau2BMdl0E/SjH4tNYcd9iyBrvVMyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VwDygCCHelApyhiED5Cw2gQ6wU1HbXqnuZiA13TW/S4=;
	b=oIuwzzggfFIiA4Jsa268KZoTXGmapISpxC9SvWP4IpY1X6mDRQnWeUyoK45mlfolRpD5
	 NYE+oBUEl4u6dzG67WJAdiJCqdxpOVHG5Z1eTP9G2MxlZMN0pNUhHQS7ErqbVvSw8k5C7
	 9zgcXWCB0LeWfAcbjXkFdYX25PyJmzAu8Wd4XY0+Tbdifcv4Goqp4mfMZgOqi72pdOZou
	 zT07AOHXadhn11kkD7YTt3pe5VaMj3CVLrqyVHJe2RhaVj3K4pu9Duqf3Kqx8dIT2ncF1
	 Tqac3bHZQRmhAVuoExD44NOD5bucjT9vI5F26e9K5OH8mYDwQF8Es4vehDJLjA0iFvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K6EEZRdn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57629606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57629606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K6EEZRdn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLFiT3420537;
	Wed, 18 Nov 2026 13:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VwDygCCHelApyhiED5Cw2gQ6wU1HbXqnuZi
	A13TW/S4=; b=K6EEZRdn9ruKRGw3tOcjxQBlUFnnW5+LrkrthLDeM0yCzRV5ild
	of0QpUGFM7kYFuslIdcQq8QqIn8JTbxF6oxSWozs8rMWXLTPUjWurv8j0+zb6bxj
	QYZg5vlpttZGqXZH3AS5k9SsW+iThJ7qNCBTzV6pk8QiX3EIIL6mz3aesfQoyLVf
	Er83Ht/PnRMERt1Qi+ji9CXisaFO83Mtc1Vm4Nvj0dkeCj1/4mCeIyp1KbNKz7FU
	DF85lOjho3Wsqie4XWdZkkTQ5n+znxsCTPbzOn+f9FgVn3MFEtMWY9m6JMjtsFQc
	Q1sfz5JxMRiDt/Srr0XfY9tsgM5ylY6X9hg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u1c0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 13:01:57 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AID1tHY2756875;
	Wed, 18 Nov 2026 13:01:55 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AID1tdP2756837
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 13:01:55 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id D441B21523; Wed, 18 Nov 2026 18:31:53 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: akpm@linux-foundation.org, kuba@kernel.org, jeff.johnson@oss.qualcomm.com,
        alex@sverdlin.org, cel@kernel.org
Cc: linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH] .mailmap: update email address for Mukesh Savaliya
Date: Wed, 18 Nov 2026 18:31:50 +0530
Message-ID: <20261118130150.2877850-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: l6edkRMka3xfZ-WuenCmP1h2TNq3O9Qk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfX7oxQzl8NC26e
 aXwTxug4NwW3uUwCQbmQX60n25dYV6K8Pm/u6GV5sb3k1xfQZKs9htjEWU8HoWJbtG6MUuR/AmI
 9OuhchJXAneef0/U8YvOEp3cZsUY6a8=
X-Proofpoint-GUID: l6edkRMka3xfZ-WuenCmP1h2TNq3O9Qk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfX3aJRG9Ez46kY
 2xw8DEGBaWkgbyCJSPvXg/tN2QOtbmbTs1juaGF+kzATQPsoZ7xefgcHwTbsm5h6nv3hqXwHjsA
 2LehQhic+5xo14vcrScATR2CM6vNtHPJ2wwPWJ3KexFWe4ZDY0oW2AqNOSmIY9eJl/Lf9O5ihTM
 YXM1CDWPuLBcAQjj0MWju4NEMOED8J02csHHT4hi8JjfasEad0h3En8OZ5hBJsJ/Ui0sMbsi4Ej
 pX9R0AvnYsGYhv6Q36DMkMkUv0b4BQzCVP8f5bxLMjcdf/1+xNHFUmsZskYxhDOk3nPnKG5l8td
 6aifvGrXncdCHxiTNz/UKb/86CMW8nZZOG3rBYFWP/B0hYK21wzoo7vbPw6m2LuG2fpKRL/QyvA
 gzvysxIWVRaSINdqODPkhmVtdnRAWupvbtfK5ILp/Vrblyj//ShLlCXA02BzoOX7f2no0z6OiYN
 1dXw2YrYI++vtySp4/A==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afda1c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=4M3rY-l1AAAA:8 a=GIY6ePXaAAAA:8
 a=7CQSdrXTAAAA:8 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=sozttTNsAAAA:8 a=Oir6XmlsqzsE75upo00A:9 a=05SGkpJ4n-ZJ8d_kkqUt:22
 a=DqLKOb-_9tDIbq1NXmeO:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180051

Map my old Qualcomm email addresses to my current oss.qualcomm.com address.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index de477b76d6cc..de71ed445a42 100644
--- a/.mailmap
+++ b/.mailmap
@@ -699,6 +699,8 @@ Morten Welinder <welinder@darter.rentec.com>
 Morten Welinder <welinder@troll.com>
 Muhammad Usama Anjum <usama.anjum@arm.com> <usama.anjum@collabora.com>
 Mukesh Ojha <quic_mojha@quicinc.com> <mojha@codeaurora.org>
+Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com> <msavaliy@codeaurora.org>
+Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com> <quic_msavaliy@quicinc.com>
 Muna Sinada <quic_msinada@quicinc.com> <msinada@codeaurora.org>
 Murali Nalajala <quic_mnalajal@quicinc.com> <mnalajal@codeaurora.org>
 Mythri P K <mythripk@ti.com>
-- 
2.43.0

