Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808707;
	b=dF1T8l1dnk47DeYh0rqOG6aZ6Is1/llbI9tuaMckMGJ3vvTIuX6j4bBeUQ9f7JCOMNM+
	 4V2ar6OBUh3x1cBfKXrfbwKzRAn/cVWr7Uf3Xp8tapJ3w65VXmBRzjCQGD01ArjAUOO5p
	 myX7p44Sr8GxEs5tC4W8Nx8xj2KlfDCkt6yzo21JRUwDpAnfaiZiZ2ucdcnMPEpAaTtzJ
	 AslNPU28vdVPoDh/JTGbMqpJt0RYTAHVNm+Q4YTjDRnAkhfL596sVzdR4L63aqW2oetwE
	 9wBXWjmR/1OSvmvodNtC0yFBtQe/fBNgKEGd+JIS+OE3NFDFU6vj66k+KA+9tZGTOtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=;
	b=kqWtMDI3PZJ4whpFvNYo/md88WStPqy/cXZInpkEcWDIa9vNm1F9FeoJPyyMYxL9gwk+
	 JFQI7H+WVc3f+kG+RF3mAl/C71+sDL0Z/tLYsw5k4QaSkB1alrVFPBsxo4nLm+kLXb6YB
	 ZTwjZ4atDo8A+qsdD7y+92Sj8EOLHLyjuimaYQCuHPDGSK8gOzKv5Q7MYIBBFLB5GqV4b
	 KDf5TBLAPJXTuaaIV0UMucaKY8VFq2J94JOjKRYT53B81o9fCDMDneAlm/jrdZkPoYUX7
	 An+v/RbIWCATnCi+c4DapH53te4DI4VINScvN5xx46b7+pRX/NnUmtMwnTIi5rDA6Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFUcnRwx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpEIlGG6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BBC606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BBC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFUcnRwx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpEIlGG6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJTkHN525483
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=; b=jFUcnRwxj3UDWVp2
	cYiUDO4PyRw9CsG8xYDDvpUA98ZBPcVDYO0gzQUBsgo5c34qKeE7r6Sp1W5Yb6SM
	nFgCOI7YAP+C8EbEqkbarcxO6ysdqOz91MbMk2K2Ao0rwqPO5l3TRzWK0xJx0j+g
	TjGGX/2ihYW8A8XF33YhSbeA55U/lExbsuV9yMyGKbBTc12a6osf4d4LVBy2X0N2
	WD/EqacNx+YW5q4oA+YffhcOB0tLKNTvt9UtJAukkxARAc9XdSq79mbsRN0gQRoG
	ZkBvTCzUY6j4b7s0yykiSFc6ywM1jV18BNt+d7K9inVjBj3vkh4d7F/gd5oo0wHF
	R9hEPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr12t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so1796075685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808705; x=1796413505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=;
        b=QpEIlGG6hH4rUel/nsCXi0GrjrTCPfQ1vGpAbLYYpVkzep1CYnOnOGmRSpSQexpbRS
         aoiM4Q+2cBzJ1m1HfgHrnOJk1fbXqI6ZAXE8Qh58Bu+JyxHifpPvZIOzpi4gDmr/kYdg
         MVHPatbVcMc0GGet+lLhDQtf/sXugBRX8Mok93pnWcQhz8I/4AGUp8odQL4dEy/lYuHD
         13tbXM3fEBvyhEtO488Jk/bsg+hizzA8fK7T9WUm7kK2EGtogPgvay4j3u0/kuPb/ix/
         jFUZpv87WbLxc8R9mK+GtjJULi0VGHbKGsl0kjkRuoB404g9DruecRqo8qtfDMNXIO4P
         IAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808705; x=1796413505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekADTNsGBXddQN7XdChV33/pXH1c+6xXo7T+C+WpM8s=;
        b=c8xpycyNnqDrTrZ0NnQSE7A4fUwXeR4xQqnHRAwaYGsZMBXupxTVnopxL8SCu2ejBM
         92/8CVLHiclRTVpvbiCszUhZf6QXgtjqAH3PSln6Gv4/aPJnZlG8Ya6/H8n+aHNjkP6D
         VbKm+kHdFddw9A1IXojrb8voG0yDeQH/KV5qI3BL346a2fZGFbTs/gC4gIHq85Ap6KZB
         az+MvRBsU8b/C2mtIpbDizMzD8WlUE+hAFHgmKenRXFKmTzXo+pTDMDfqW9HkkW81T3K
         wIG8uv1QhYkuRXmSyHMzWHEDKCzFtwbz2wdga95xGWbGwM0DmKUDq1xOHpyYPWCDRzTq
         VFMg==
X-Forwarded-Encrypted: i=1; AL+hErHSxCI1bDcKBIyoVHVHE3vUyhahx3OykfhoB8MJOmpcZb9CRHKkEdsZVYH5T8PJHCrUNvptDUXYFx3tZu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WggWCGzgyyO77ZQ86jPQBY4VelCbe749UPKtRU3Ve5nf08Qhp
	lTnJezz4o+ZheqDjXXNp7YLEYXrjT1IeoJH2TjFG0sB9oi9I5IQajkG9PkoWkymX25fbZmF8Aw5
	EAFJHPrm8QIONH2pGJCT/1kBzF0D0OSK7/nlYk9CsM2bMy3e59gqjKfpVdsjZ33qG5/s=
X-Gm-Gg: AZFdTZeBYRbgDBY+GddQQ3i6wXlOElKLfeBMf+gMJpArlg0p2yvS7DAH0gezjBWl478
	WA30yce5s1mjS5U/52XYB0oHLDB0onBqGpvbXZnq7ER9uGvn9cnrW50cAoyU7T3Ts9t5J1pUT4k
	jfgoNtfncjtrTd5QryzfevXDedkMxm3sBenUjn22JWv1Kw+O76Msm+z6Fh79YB4eJS7Q6tFLBZN
	0xyRNMD8J2CC+XsdB6K1xZMMpPpMRt6u40MjCHQXMbZrOPA5dVJTlNERcZlvUU76qBAyq2HFsBP
	BCDucPMiUDbxUTdIDetwt6iqN1mLVzkocormBP+F3aCGiDIBTe6oPD9FQAkevKSY3g2spJHUMz1
	DdlC7WC0cjbUHBtXZnH3yW5s7lETiWh3slgkTFmMk+kr2Sk4P9C+yp2lKXxEg+yOnPpmu2h1enG
	cF8mh/1JIY1g4p6AndYCnzB6cZ/MFbaqQg21XWV520TCZEsJhT8PNNIetLwGfllQ==
X-Received: by 2002:a05:620a:2856:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-949bab28427mr4818613785a.65.1795808704722;
        Fri, 27 Nov 2026 11:45:04 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-949bab28427mr4818609885a.65.1795808704301;
        Fri, 27 Nov 2026 11:45:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:20 +0200
Subject: [PATCH v4 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-7-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TwRmZcwZxmtcoSpUxQRG0/tQN2vHRVpxkXVxOYQdep8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2g83wxS45mEF+GFA4n2REdL0v6dascALSSD
 UQsGStjqnWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndoAAKCRCLPIo+Aiko
 1Sy5B/4nsR8V///tktw3GGSW1RIOKe3FZ7X2WwFGdZbpabyoNQmgGJCCHOmKhueL8IXxqoMfmxp
 7Thx7DkXurmF4/l3Uwokinzs8Rges3aa1K7yDgcXo2gvzRWk17CRd46Mwl571D7o5E7Zsyc5vwt
 Mp+VUyK7kIwhHJ56qbUBg+2SfJiTq/dNUKNEfdEUZuESnUwq5qKkaj0nxoPtLrC31zfWnVvr2HB
 5m1O/2nEw6D+nsiyILgDcFllmgYKSyZ9UdpGGCevAKxpn7+FuXl/Igw4JOvCV0inbmJ2zZAyKkH
 pr8lDoP9AjEmQI/LnrGICZEL9PRccadLRkb3PJgfpaXL9oJA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXwXICH0JB/HuW
 Yb/S2wF7YjI8sgWH0tNwRMNdN8jbQuCQ1d6S0XGNJ4j/solMKjNGer6KOh2VVMuXB9st4Jj9lNE
 rJl8q98Z0mRdF7zGr8NA1UVUNGulQkoIUade3xrIZgORROJWHtD1r3Zn2wMPHhiIv89U+w+dBYb
 lnC1JEWcJfG1by4Ne1yUq3dPQW/0eHhoKj8ceGCt9glEWaU7VW0kEngB7Y5z0cLcIAW7F+KZ6RU
 2pDj3tGsgUcVFME0+t2FoYDKjI8Tthi5b7a5M9gpmYJvZ/Qg5SdLn8YyajbhIIGLhYG/GVV1kpN
 9dx2nWkolVHYMs6m+/JIKtQ8tmWBhLI552BiWU9bUSFy32vwqWUOBzOSrzHWXKuyjCBeqVdFDAV
 TyztuXBYCMkPcf82L+8zZ2WrURLCOUaaraYg3jQwACg/7cqTQHMoXNYa7AT6ZQ/XFwRixNiwhIx
 bplADhrhITCmnq0h/VA==
X-Proofpoint-GUID: hLJnS9I6C68G9MZH3bQlndoS-hBUb7sr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXwmH1w+oe1ASJ
 rNZhx0pkDHEIqd73uSb7x3EqzAzAY3Bs4gTvG6r90QRh6S5kSEsc9dJHfM8x1WEl4c5TZRwW4xm
 dF+H0Z4+BLQdZaOMpegfB57KgoB4JQU=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09ddc1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hLJnS9I6C68G9MZH3bQlndoS-hBUb7sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

mdp5_kms_init() returns straight away when one of its later steps fails,
leaving behind the kms, the runtime PM reference taken around the address
space setup and the address space itself, and lets the ->destroy()
callback, which the caller runs afterwards, clean up. When mdp5_init()
fails, however, it has already run mdp5_destroy() itself, and ->destroy()
runs it a second time: the global state object is finalised twice.

Undo the steps which have completed, in the reverse order, drop the
runtime PM reference on the error path as well, and tell the caller not
to run ->destroy() after a failed init. Fold the hardware setup, which
can't fail, into mdp5_kms_init().

Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
Assisted-by: LLM
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 45 ++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 085c23820f46..30af8ef51e4c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,9 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
-static int mdp5_hw_init(struct msm_kms *kms)
+static void mdp5_hw_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	unsigned long flags;
 
@@ -58,8 +57,6 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	mdp5_ctlm_hw_reset(mdp5_kms->ctlm);
 
 	pm_runtime_put_sync(dev);
-
-	return 0;
 }
 
 /* Global/shared object state funcs */
@@ -198,24 +195,26 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
-static void mdp5_kms_destroy(struct msm_kms *kms)
+static void mdp5_kms_destroy_vm(struct msm_kms *kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
 
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+static void mdp5_kms_destroy(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 
+	mdp5_kms_destroy_vm(kms);
 	mdp_kms_destroy(&mdp5_kms->base);
 	mdp5_destroy(mdp5_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp5_hw_init,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -506,6 +505,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +518,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +539,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
+	pm_runtime_put_sync(&pdev->dev);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_kms_destroy;
 	}
 
 	kms->vm = vm;
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -561,7 +561,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
+	mdp5_hw_init(mdp5_kms);
+
 	return 0;
+
+err_destroy_vm:
+	mdp5_kms_destroy_vm(kms);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp5_kms->base);
+err_mdp5_destroy:
+	mdp5_destroy(mdp5_kms);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

-- 
2.47.3

