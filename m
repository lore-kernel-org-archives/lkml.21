Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808718;
	b=P1puX9WwqEzH9VEP6BJQVyZcAWqh03VSDrD4+zLWPkS9cipODlQYEr/ae5Y5FWl4QAb5
	 GfqanYlVc5dy68AEvoo1c5mlHswH71F5ZIOwW+GidJEjNQ8dL//qsp7ZSQ5vikw2Ijz+8
	 y0P4hGWAF9MTe7nfY6QahR2V9bAvmj2exyOzmYozpKvwN/QlxVbiAhQY+mue3LOwtQRuj
	 lNX4m50FBUMHQJgsIZQVCC0LUlLhYqqlIYXdSjm3yr8409yyaEI/RUOM/Q3rEXfwCMv1f
	 YApHDYTeduafTCGqYjYkU2PPYeL24HjRUo6HpCa+nMaJPC/6SpCbfhMeTc9LUw1nllw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VcCsLT5EX6aB3PHtyFEtlY0PfXB2HfC+KFbRCcp0Iwg=;
	b=KJtH+2An07IucnKVZXA27HY3LGNs+FMRzfG+Bnuw/ah8IrmZtJPzALmm7TT5eUsm4Kw5
	 OvRSWNLq4Nvim6/Y1fDKO0P7Fjd2qdmPTxShkhm0Tpb1jWxTD13kk0VvPj/tkyE44SsME
	 gmW6GuRYNMr7TjPIAp5xlGR0mk+0jIAnAelI0pLanyKqbpb0qpv2K/HLN2dPN49lSB9G2
	 h+iggdDZ7LCn2V4oGgFplzb07/bsvK/d7eE9xwFEtjIE+bDP7vZ8EnKsstrWIApu/g7ky
	 rowiOk+kN3QS+mhJG/7HAiVnFbtlgzsQEUU6Efy3fRDpTKmnkEJlzpJ/m4x2altA6xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fRi4HTDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Npl6lZ1r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AD606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926AD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fRi4HTDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Npl6lZ1r
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJU5Fn526689
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VcCsLT5EX6aB3PHtyFEtlY0PfXB2HfC+KFbRCcp0Iwg=; b=fRi4HTDcbHTygF34
	W/L3K4HEOYfYrqyS8blnGMP4Ums0IO7H0quwkyJMkBNW5xqvSFgfCsnfAxbCPGwd
	r6qehQeERgVPL1D06i1dmOxMjKmG6XkFa4+e0boAIyQYjz3efydkbwFYy6xYFnrU
	MGR3Yiujxmpg9NR2EIkDpRGO5q80a20/O4xbvJniZcZs7XPmXSJO5Gu/ziT1FTK2
	2AzDCNKJebfww0QrtIQLLXAR7MAqQUdZA4VJEpa9s7QMQ4oyDfEmLUIrO/SJ5hq4
	g1+8SkTFZ9I9GQwpCNMDE1ZpNkPfhI+Rl9LQi65BC9Xll+MTNcSN9bBo+/gE2ed7
	cTTlUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr14c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so1368647885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808716; x=1796413516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VcCsLT5EX6aB3PHtyFEtlY0PfXB2HfC+KFbRCcp0Iwg=;
        b=Npl6lZ1rJvgkVNu3Jb2bUL7G2jX1uo8zn3P5q4bxa1YA9QJNizViRANWYTZmZQ7AIW
         YFeAC498p5K/VDRcO/QJMNMkL5YQKerjvBcp6xsDWTX3Ayatj9GAsFuEI/ng0ZNYmU7V
         ZLi/T58NYoca0NFzwYbeDDJ4yUgBOfEsoaCi1uij3kybyzCEPvaeWtsC2pfZieULmZGc
         mPDT0rT8Ot4BjE3Opj5hJk3296xDUzia6PQz9XBDkhOzvfAIN0wXh81mJ+5b1Q/3TCVZ
         sq3jfMTV4i0dDG7D99raql/Y2NWl3Cs1Uzz/7sItFUGIoIhnmvwYHWD/HIq49Jf/iN0D
         N6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808716; x=1796413516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcCsLT5EX6aB3PHtyFEtlY0PfXB2HfC+KFbRCcp0Iwg=;
        b=S2JmD0QShdEtK7NyKFMSBLQdXEhS9WebXWJKEdCBSm3VEFDaiJ3xPvLciyBnUoBAUs
         Dr682EmOkDUk0C7B56slXNsrI7fTvDndQ+whs8ypy4jft9nCsEecr+DLsJ+5BNW6JhoE
         uIBEBIgy2e1JvylEGq0nFgOicXpAGNyZbk7mlko4a8sCIVNJasU3Zw0yC8nblPls/nsa
         XijFVodxDNbE4Ycv00vXD9CnQzfPABLUbdEeTR8XDgAye5Tpj+fyyAUhb+NBWDcB4gxH
         JOn/WzafWQOD71L3JGiNYGMmz7lbeAtftAIIcqBMUKnX3/aNM5uKfo0iqex9BKM7aiqs
         TutA==
X-Forwarded-Encrypted: i=1; AL+hErGjcJAaBjfKdXJtjOmzUxNGIevltm3aNr/iucSSWpDCOcFAIL6mlWsuUN4ChSR+5ce8W3D26a1t4Q1OTYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kYN4hqovWtvKV6ww+GiR854+FVpku6qSKpeRGT8WDwsonZGA0
	LI8YEoSne7jW1KWVN7lfXWTCO2wQvYTmZkWZOxKIyWzeOP6HxFQNOy693LbBlcS3mo4tEvsA8Xg
	FE6E7eERd3GHnvfqbsbkOujKP8asTAXt4zFwO+sqf6C4VPj0fIHZjS2IjOSy27yjCpIcR/k4MFN
	2oor5J
X-Gm-Gg: AZFdTZeJfNFJeCgOzci70OcbA0qK/ppBuUGIePrGnxPeNEKbeOUzbt4yXYIpfl+HdLI
	CQnaxTa6MtRwOBuCfZARmr0Sz/096Cg89kwDm4XVRKTKxpdpq/VdjqPHAhBT+a5v59R1hqo9dPU
	PIGmUHd40yzaJ4aUj+Ta+saU0dQ/V+prx4xBsyrfePuyEUGy8Wkw60ty+OsccACBpMpbgZqYPta
	DkNsii6XuslG0M27sW+R/TeQnVYm7EAoX/oLL0hD8EQakhIIkiDxCWfuY//kZWYzWvvLwd8Af/e
	UGjTXaIpBD3LPuHZikU4J2Y6VuFa98X4bU/jl7zH81IG6IX5bOICDQIJ3mAc+a2SQapfzWBk1Ik
	c3Tsi0PzJL6ljYMlH99ZybSIQUI6MjIgrGJsuCchwO3TwMHQifvFmg2SPeOZhkDtIM8DAh8sB7X
	U88zw/sU9/AGV+3r2Im2los9aQ4EzBzxNhJGX4m2J3Sf5AKLoQ6O1cM4S9k6kQbA==
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr4689116285a.6.1795808715372;
        Fri, 27 Nov 2026 11:45:15 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr4689109185a.6.1795808714898;
        Fri, 27 Nov 2026 11:45:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:27 +0200
Subject: [PATCH v4 14/14] drm/msm: drop the runtime PM flags from the KMS
 teardown
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-14-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4805;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T+l+RL7AsJ3F3YWiD7R3hoQk39AscE23oG7jEwbc25M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2vARugP2tvnxr2rc+ruB6k9VsjK6Pl5sYKl
 CjHpVnKpsKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndrwAKCRCLPIo+Aiko
 1eBVCACk8vdqshMkeLsVlqOmrLsja6i3sQOjQCZHRMfD8paTkpDklFV59QKRhgio6q+B0JxK6Zh
 cfj10qdNejzryjMlqkZ21WKV8U9hRBAjfxn/Ay7cYOxYT52XOqCbtEBBLBw7MV38HpXeVaXUEBz
 cN71DaBIVmn0POT/3vfGAfZ+L5CQLq2Ex2PjJ6XdmK+2KGNq65X1J0m6p0RTuSfrTMsiOf9vg3Z
 F2uyle2IjYp7OjHThoni4HZJ6uUE3edoY/wdJ/Pw+fiNfUfAzBD02r2Zne1wOAgY1E33g2kc3Up
 8ERB2C+fwhcFpK7lGZtA+r4+Iqbv14sWkRmpYQJZ6DvsVG6p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX2rHQeG1cD8JP
 MhLN6hMsYj0W/V3fatZKr8vukDkhyM4jXl1jnDqpJzhY4OEqudK/UzPRuOHHaFpXg/KqspTVggA
 7sT0IBBc5cH5S5K0krknb3dpvlfAJOJxr1F+xzheL6SoxnW+eyUnhFB1U+XdhR5WqebKwuoJysq
 jdEzNNSYOA+lWccGhJvlTvW7kSyoT/qYlsUH4sPC0UdHREDvKeoty8oz+dt4ihYJaSamhC5pinX
 kHrtRQ/xBtSSL/O9/UFFdHvIRiJMzIeIlPe5oXpHAvOyLJsu789cZmpn9enPQypdGKSBSlG4xSl
 yQ1tuFf52jaMVNDhcfhLLOCjtEj+SUM7g8lwEVDJT17q0JBqBY3nkbCAyBT2I2E0h2GIydriNMx
 HM+RVxoFy1ciGEWQnEfvubXutB19T7bX+aTCZA9H3Sl1bGUnhbPOl2er6QnlXoARH2kAZbarXt+
 BXeSGBpcK6zwDtuPrhw==
X-Proofpoint-GUID: 0e3pyZKDuh8WEN0YdG1hJrPZt77CzL53
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX2CdTGxlm5PHV
 ELp6LYECwNOkyOhUDsfDavVx8b+/bBamuW0lFQTjsMaJvHRxnjjRKmsenUr0ciliYV/fMUHM3KA
 b0WokRLATvt4ZZXrCXkpb2ykJSHUi0Q=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09ddcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Yohvr2p7PhcuVfY586MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0e3pyZKDuh8WEN0YdG1hJrPZt77CzL53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

The DPU, MDP4 and MDP5 drivers track whether they have enabled runtime PM,
and MDP4 whether it has pinned its blank cursor, so that ->destroy() can
tear down a KMS whose init failed half way. ->destroy() now only runs for
a KMS which was initialised successfully, where both are always true.

Drop the flags and the checks.

Assisted-by: LLM
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  | 1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 2 --
 6 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3546efacba3c..e994fd267c5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,7 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 
 	msm_kms_destroy(&dpu_kms->base);
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&dpu_kms->pdev->dev);
+	pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static int dpu_irq_postinstall(struct msm_kms *kms)
@@ -1320,7 +1319,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	dpu_kms->dev = ddev;
 
 	pm_runtime_enable(&pdev->dev);
-	dpu_kms->rpm_enabled = true;
 
 	ret = dpu_kms_hw_init(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e39831a397b1..769b8ce6332f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -87,7 +87,6 @@ struct dpu_kms {
 	bool has_danger_ctrl;
 
 	struct platform_device *pdev;
-	bool rpm_enabled;
 
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index cb95a492e070..8b07881c3f8d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -143,14 +143,12 @@ static void mdp4_destroy(struct msm_kms *kms)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
 
-	if (mdp4_kms->blank_cursor_iova)
-		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
+	msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
 	mdp4_destroy_vm(kms);
 
-	if (mdp4_kms->rpm_enabled)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	if (mdp4_kms->vdd)
 		regulator_disable(mdp4_kms->vdd);
@@ -451,7 +449,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	}
 
 	pm_runtime_enable(dev->dev);
-	mdp4_kms->rpm_enabled = true;
 
 	/* make sure things are off before attaching iommu (bootloader could
 	 * have left things on, in which case we'll start getting faults if
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c..9dd829ec9401 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -34,8 +34,6 @@ struct mdp4_kms {
 
 	struct mdp_irq error_handler;
 
-	bool rpm_enabled;
-
 	/* empty/blank cursor bo to use when cursor is "disabled" */
 	struct drm_gem_object *blank_cursor_bo;
 	uint64_t blank_cursor_iova;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index c349eedd55a6..bbf459bff35d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -575,9 +575,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&mdp5_kms->pdev->dev);
-
+	pm_runtime_disable(&mdp5_kms->pdev->dev);
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 
 	mdp5_kms->num_hwpipes = 0;
@@ -734,7 +732,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
 	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
 
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0b..c0b163c4baa3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -62,8 +62,6 @@ struct mdp5_kms {
 	 */
 	spinlock_t resource_lock;
 
-	bool rpm_enabled;
-
 	struct mdp_irq error_handler;
 
 	int enable_count;

-- 
2.47.3

