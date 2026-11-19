Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076692;
	b=fSnsFVMQSb+kU8+VkxawkHnjO+ApRuSjyrdFgowFm7gy0CXCCQCiy+Pqm4MKDHwa9p+4
	 3JXvFspZhmbNMFr6xhvUTs3I8C8kfTAvueb40klb+Xuy2mlPR1PrsIm3T9ayItxWSNtp9
	 aC+5YPbfqwPOJcSVAeqxF7cutKvUUAIu7+pfBUyjV/T+IN7n9pI6Yl5F/vooa77IzdHJq
	 qVhB4+03aG+VF7Slqe7GaZRrUhdpnvODNRNOMcW4bIPfjjxsHodnIlpjfyuA3BgjhZfJf
	 MsHGOBlCZQGfp08SmpJEDALs54KCyX0A5DPb5QQre30tS9AUTrcwsZRPsXjQVsnl+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=;
	b=a5lcIx7B7jlgxO60FdqmuIZwzriQrBROo2g9lBXRCp9ZW29QhZCm0CrA1tS4OX6KUZri
	 tvte6234gNqbnTdwTxT+1ZqujG9/5gKsJ7MQVIZ/flWoRwQJkgxHiAyXrY4lIQhpG+XTt
	 yf4brNb/VfQGg83GmnGrmtBQvjXsoTdqPhZpUA4sZ5fke2NDB0ZI17yX35btlDSM6WRKA
	 2ALaSN3IZ7m/1Th4ZIuL61tdkEeL5u+wEsbcPfsYRnRp/BRs/AailgsQ0EPzJxnqlR89i
	 TahwmHZ8WBAmjd7m+ft3Z6clQbDOi+2DJ3hMrya/M6wyW8T6qZINgXHqRssbup05v6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrO9xm18;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkwNltls;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2721606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2721606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrO9xm18;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkwNltls
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWAX330694
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=; b=VrO9xm18ONRb/NpU
	ylhuJwFJC18TsRYVQI8/SQj6MbM3eK+dw0JQw5HXlP9I3ifGujNNcoZeInhtGm3a
	/Qpg904QrZOZWGHr/amauHr7iz48KN12fEe3KC76iD+AsLI5VSgfzRdGb2mO9zoE
	f/JKGGaPzc54fF/An2cB94r+hpl8UBMcOYoT7ef7sEg95GennkG6eFYRpYyzS8pC
	IuqzOLjUM5ZPe96APeEYyxdkweg15iEdki/y6qmzIxK74S9p5NFkEhklztfebUK0
	LVI3o8VhriDGVo5KK1n4yaMDfCLwzkLen7mFH0eo9vomH9TAy28IFW26XsfUr/J6
	wT/87g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkg8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso39264685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076690; x=1795681490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=;
        b=hkwNltlsY/JIn9JCZmjw+v311sWazu4pJwzZrFS8Y+3JBkxLEGxy8MwS5OXlA+pw+G
         FzpH7L/jWCOBXn4bsakH+BniOz8LUxGFQkY86sXBPFiE+yqxI+o/DUSK017JQ/vXxpx4
         bqE2BFOmLsYQNMm0XPFS/pYGs87M89+LIadLNi/o3Zgzd50uLmwkuHRBxm8SsFILDWF0
         kLS4bIIqXRFvdh8zeTJbBWdbjaahF0uqHxFGiNgWstFNYEKQZiO74mGCeSbIsm2PpS6H
         WpFtKmMPQVbCo8cWC16omxVMcaKnElMhq0Zc0f03xi3/U20gWg5C2nUsumDVQRYilkou
         oc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076690; x=1795681490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=;
        b=lb4Oa1GBuCwq/tL/JZ5A9pD+6ILcxWDwI8m1hkvVcaxUg6j0HScBV8cRSXAsnJ4jcP
         UNFwdx/P6CqPn3SPiouUmlm70fWGur3rIJ1TWRMyE53wPUQTSBXvCq3MYkA4KXUrkKvf
         5qfZ2Y3lynoGDuop5elzA+8vgOP6XrQ00jhJtLS+9cUYchc2kQ0JTtyQefHIiMDuQv5K
         lTfSk6WyR1ZLTAt53+cYFHgPlWXH84KFQhuNMlJVyzuPQB/46RH+gGC8KmsMUeGbSN6f
         SD+1NydpdfHwvttfMgRSqwHYIlWguNTbHomqdajMQm8AFo8enb99Y6adNgzrQkRSFrE4
         dCXg==
X-Forwarded-Encrypted: i=1; AL+hErGvkaQUY71fPYgSHzrh2gkSwziR1eQQ3Ir00E8csYmOedQTOeWWNYlMGNEHoU1CLAnuthi79/towsvqqqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VUflopBZsNUYZ34izrBjzCnrEBEruopCoUqhO6iTTO2cDtX7X
	ihStUHWAPw3kUECHs5WtMqKXKNSlzh+scpolRmYDaBjhr0AlJRYD1WHU3/V3W6x/XVuGPGaSl6n
	BewNP3sAAv13RbQiOp7rIBLaG3dd7vZ5NFzBXtq98svKGh1nHPUE53gcgUOTc+aqNlgs=
X-Gm-Gg: AYBFou01iPs6qE3jEA8QbLk3irljP4D56hVcBr3y4ka8mHRwC6/+34YjqJ4E+t3m9Xz
	abNewH8RH+tpevV3S0sbrbeuwKgIC7GcuF0bR950r7OOFJHI02jzpqcE77L54xT0vtKJn/5FVL3
	CCyZGvDtEr70/dDMFuo8WVVUae6VCgo1yNeGbtIBoPjD/RBWGWzBSP5vZR8HCc2+VFsVxTKTXrm
	1iDbLM21Aa9RsPsIdQXFq6rZLegEH1Ax5gO7599V4rKciXDqAP+9SmTdHJkSsNdliaqFEklMdKp
	HstLK8oduwdPPMqylpRu96OwSvnxA+AsydjZg81nlS92Dj16SAL5K8pnfATVtDcdaF7PGN54MdL
	HP8vNqfD53X/0w5qw6CK8Toq1HHPQslmweWwPRLsRly800huY63HIeRK718Rq5gNL62tEdO6mal
	pvjz2rIkiRZ/IAVb53apLUFhgsU5lTAmFRKp8K
X-Received: by 2002:a05:620a:198f:b0:949:5cb8:6be5 with SMTP id af79cd13be357-94999635325mr1037945685a.76.1795076690348;
        Thu, 19 Nov 2026 00:24:50 -0800 (PST)
X-Received: by 2002:a05:620a:198f:b0:949:5cb8:6be5 with SMTP id af79cd13be357-94999635325mr1037943585a.76.1795076689957;
        Thu, 19 Nov 2026 00:24:49 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:49 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:06 +0800
Subject: [PATCH v9 04/29] drm/msm/dp: no need to update tu calculation for
 mst
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
Message-Id: <20261119-msm-dp-mst-v9-4-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1017;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TSeJBOLP1a7Z+WiBEdBGkjRZywx54RLAhctKfShmiQk=;
 b=TOfUhEt15F6oXulgckSfuYLjMgPa7VHHyJlfGqx/ohK3le0yLRWLeDePU9ls1G8NEqZi3FHuB
 11hVZOqIp9qDdhyK6ka0eo90NIkcG634zNnw0Bro+M66ys+2g/sMgwU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 409epyVBjl6UvL8w5oJPZaOjIDq0vicO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3hU1yxFoGbGQ
 hLORWqpPLxUbqok05Z6Lrt2QdUfUeNZJaLWFX/UZnFIspZCCi48B20oUhELW8Rhm4lNlBeZanO4
 vJjhQPEggxStgQ1avjSbNH04fAL+c5ty1on7UmTMcz6lLW0LcjQKAKe3nTzrOR6g6qVyOG/GyD/
 L8E/CeHqSivw9m1bRCt/7AIfyAsvGNF5Ah28Rjkux1ByXuHKHPPr7aYqUlz5lzZFZPSLpm/w++W
 geXhDzToo7NCuI12Jm3pQa6FvXVkbdNDQOHMZr0bBVh4krb4KFVD2rvLTo+3LZGOiqjwr7eNFLo
 c3OwTETG5kHJIz5M6pvvHeYhSDYqUIMlK7uTYJCDwKHxCQVOSfSsmFmWOoe3fkBwDUToT87dMFD
 cqoN1daVpZQAWQt6Rq2oTQtYP9VmIxDSOi3Fyzz93P3JQ6/hKpEnzt5Cn5+8vCfgBN1TZ3ASVo0
 K3EVaNkcX40Zu9P8s5A==
X-Proofpoint-ORIG-GUID: 409epyVBjl6UvL8w5oJPZaOjIDq0vicO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX8TVZJI0fdXS5
 nreGaf7tb0nzUO3+E++AJajfbX1a+xa5oUrXRwJWQCOX5Evb1wHSvOicgtBE486Z+ZDph++YBjf
 k+wRipuyJqds1hTvcEhFb9wDuMf4cLM=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb253 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 41c653652695..f3f97a800a73 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2712,7 +2712,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_mode)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

