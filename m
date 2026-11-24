Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550538;
	b=d3BfH4oiRMj4RKie5dRNBZuDOyuZl/lK//Im9KcM8D+t7NJaBYNzqjGQ+/NcDs5gSnCo
	 S9cQvmUCV+J7ERkv+2TgFcBsjeLjN1q6IpknSmVlr/EDiAFOqRWnMn4F7wkDZgUNQoQvF
	 k+7UctS9Nnkq2gXwj7ok6AAagSCvr6tt6xVSVs2v/kN8paNJOP+nwKaSdtj+2oNvd0cJL
	 lSs4cAngrJySV6DOhh3imu/Moi9VJjFGKev96bvffooGUHcCMzM6cuFapHrLTOSO5JE2g
	 4weh0feURAa9gdd0AwX8NUTprg3as7Mex4r2TMKF3Kk77KmtwZOkB9/wKE6feAegH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
	b=kRZHnRsBkuQTf71oMIgFW+P+UbAU0b3jncwEcYgotcdIRFGBOUYJbYfCUSXZQvL8EDOj
	 XBs2M1I+hAoqf0tCdXDuVWX1xffC/gzAofOD0fgBIB5+dFiY9K7HQhj3A7+TaR4+w2ojX
	 UwWNLJKNB0Hyn4uTClYUgEDgi0jRGuXUVDl4XdDRt15HLOSs1IJJSmMYD+0x+F6lTCoLa
	 FHVEj4JLII9jJhMoBBbdsktKccyCOS71cyp+kN5J/+sK3VRVKkbOiE/ZjtG9kDZIEluim
	 HTE8u45pALnxD4wwBmNNII1ZrEPN3Lewm/5Y4+65V3T1Dx3SeyOimQS/PeW3uYuv6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C39606A6B6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C39606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXGQ21132311
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=; b=i3fp15zKSnYDtfXL
	12z6eUu4/VTtjGc2lcePyiRftP+y61UDo/+pdLMNaGNwYcd/TKw9SgQizYgxJoIe
	lfWeNQEXGsVa3FdDN5IqqSx/zHZGfv5Il90dCdpUlK+TOoQ9hy0AgY+k4gaaCPyK
	BIMYh0/ackSVhDz8F/Lka77G1RDzM6dcH5kiunCEtDnT9xa8aFYV1WDteRS1KT5V
	0alo11H6TY/2h0xEO6lMSCyRqQObC9BuuH3XsbFRmnUUn4crQ+NCPKcm2pw5NunH
	ZZYNNZLCFpflGr9lG/WUB405kmPWG+8THdm0Nwv6iRHe/iMPVwDeoyjr9QCW/xMR
	cEpLnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd8nut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a4540f2so36080585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550537; x=1796155337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=ixQDEJ+Uq+T+W8OUIEtBUMjm5aQ4+HEzuyThNyVxQIQonsgavURzKyN9NmortfJIQt
         0Dx78KJ1sUICPxrsl8QChOlIb/rYVDuQao7w71J6R5OrCLDznmzUbuxRmvfAGdAtRowO
         upciD05H3e1oCVrqt7EhITHV84xVUkbZvFEdbTljnk3a+hqO2+9nsDjssgmGSddw+tD2
         yujYzQ7WqscaUTMmKr6bfXCALs1NzCZPeCHwAsh3t4K1Gu4EmzuBvYzXm0afxw4C2KqK
         bMZolIahlZKqeBOF+uspsGn2eWp/nhYFhZpmtkNwtD95Jr+hfWXGRq0Jkp36gtTDHgsO
         3yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550537; x=1796155337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=Vi8RxVzCpf7P0mLAmc9fx+CKAN2z110cGrS8s4iZ0MODfMzG59aGo7V2DXrmglXhU0
         znN/R6eu6ny1ghJgyKlLJLvaaPjPAlsV4+B9OWpIgFbfUWMnOrKqqudpgMpVmsmSco6S
         eETT/Msc/umBEE0Pv5xOG5hvolY4G4blAYBFD4nX0ERh9dNPFHz+WvoGYFV+e33Icevl
         mjzmFCUma6iPvx9opw/1TUowps7gk95XUP3z0LVok2C0yVsFsG9mIJ4Jnwb0pF42yP7p
         jKKIfigWq4sZ0T3Jrl2uWif48Hd8wkjXCxDQfaJRZvTMhN5uAWvA42s/1u6LxBwq8W28
         d2vA==
X-Forwarded-Encrypted: i=1; AL+hErF5NgdN3snnD2sTbJm4LwmEAH9L5vTF6e9aHi6NOuRKxxWUzBD9pUsxXqCKcYsqc4Dpx4S61EGZVM2jcPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r/eoPUt4pMtfFZVwTCvVUJ4yO3XIogBQkqXk8J6d7p9ZOtftv
	74Guc+gmat1kKymGUu1HxroggAEcksC6bqqM+PN4LwmC6ZAJHmfi6OBK6xJpK0Y1ZmXA6tBwMAK
	TFEkVykRlRLN76VQTCYznHNM27WeL6X2VAPJYt634n9Lz4p/0wFtQXbt4famEsDcNT8Q=
X-Gm-Gg: AZFdTZeiK5/j0TlJVxd2kz8xb7ojqL2RNNtCqFmirdoYCO+q5+82BvGTkLHMOofXSLY
	szGGHvAkLK3+FyranZTBu70FDWGPUJMiQQfxVdqTNN5ibJaS363XT1zdT1GPzHG4pkr+grEYMte
	cUYyU5AOS3reSVPi/s9H4aOQRjzasejF5PMqXLB76nk7dPyb3ZGGFtH5Tekp0DhwLtoGVaFsxqC
	pXkrCAM46cjGX6HHQ9wGnYLEqcXYCJ24YaN9we2IdBmWAJia/XUzYap9JIiI9DYYYsJWtBrpkQk
	wmB/DDJh0GbBLE81QxCgbm/ZYeetWwn1l2Fd0KRLDB/wKCjqwCI6Na7gLIssacq3mtKBst6+Mdx
	XraconHrg4R2P1a0OiL7vaC+cqLXp7KmLvA8LbNoPnXut/i5EdHMKwAgUR8JlT6vcqeCOOFSTow
	1bg00XVgo=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941330085a.2.1795550536702;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941322085a.2.1795550536057;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:41 +0100
Subject: [PATCH HACK RFC DNM 12/15] thunderbolt: Refuse to activate
 DP/USB3/PCIe tunnels
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-12-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=818;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=xwW3bA6llgOPKSqs1BeEuZQOAAAkb355SkxSOtj9lcU=;
 b=z/91Ffst28wbqwkdjx3GfJSrokIzn34lkqLhPQ0QHj3mOadUBYwq9mfP486m5L1tFwqCcuKFg
 U9LW3XliwnnCDiVva3RM6Kb1InyIgYlgQjJ+9aP6K43DNws8/DYTDtY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX0nEqbFs3VYo3
 qcyBLd167wLs6JBg85JC8aBTBZe6RhQyARm1NB6x3bvOzL3Getwev9zotCXlVIE6R7tvupDSXmT
 od2hGc5gNjCY50aYGqgSO1tFJb5krbs=
X-Proofpoint-ORIG-GUID: cnXe0QkHZzkTRcqGN7aWKXApT3cRz4xV
X-Proofpoint-GUID: cnXe0QkHZzkTRcqGN7aWKXApT3cRz4xV
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05ed49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Jr2PhzqEZPgRj7HVupcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7Qrx225g2YJj
 ArySZ83CcoGBlK1l7F9CfBC7WDZ2Da/eN8vS9fBLDuMJgJxu0sFX44e84nbFDPrfWBUh3TdQY90
 PQSnsqUY/82aiHB25JNl2H7KEmIYQ/dk2iktLHX9un2svJzrjDYZ3rK1Hnn3+ppNUQcc89ATfVF
 NdlafrVn/xdqB6GJFJDcLz+bLTehzL+vyYSZYVIkcLFLHqhCAvytdTb4PK5L//XQgrrGozBmzVN
 YxC0tWB/0MuArZH0i07ynQwKDdOZZQDAhFAuHwc8zFW9qAumcz6odFDFAU64JagGbGT+EbIcr4T
 hjGtRR7bXUtPwM80YYL6RnfGtf1DsAJDYK9GN/bDj6gjXoF3Ku74RWgOR9H8G/Y8uKH6sXHsp2a
 xX3UFpnW5YiknR9Apjz3PdSN2BMGVAsKoQgRRD4DO2hAhHk6yfL6A0Tp+aArMIj8DL+RomcgWle
 mEwTrNK5DxjdCR4KRbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is for demonstration purposes for anyone wanting to try out the
series on real hw, keeping in mind the constraints detailed in the
cover letter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8145657835c5bb060812770a303cbf2649082a55..8b497da596b99d7f9d2e04636caa9896617af2e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2430,6 +2430,8 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 	int res, i;
 
 	tb_tunnel_dbg(tunnel, "activating\n");
+	if (!tb_tunnel_is_dma(tunnel))
+		return -EOPNOTSUPP;
 
 	/*
 	 * Make sure all paths are properly disabled before enabling

-- 
2.55.0

