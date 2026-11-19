Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076800;
	b=hq4hP0s4/FmgePgAyW/ZLCpEmeFE60e3xtrMxtmi/2Ef4NddkIzdbqLOqj1TJ+YJKe8Q
	 GQR5fnwLpcgCLD7oz3euSq2vEs+hZxzlVeuA5a2+nX7CgVVeWP6bnmAYVZ1YCMlMMgg97
	 qUPgK75Omjznba0owDM6sNB+gE0CcrR57KVxEqB72lzPJQ2zOUUD+XSLvt41o+5wUBzUs
	 dFL9XTLPU+wY4QnlfuFsrFF+4FDebxv9UJy7Z0/RKelBFsDCGpLRWfibfToQHvgRTrrVl
	 WpH4c8EtYeJWAmiwaI33EjlZw/ULGhgjfhIC7JUT7VVS/pDWW7LUQJiRB1C03Qf4niQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=;
	b=xSZ61yB422+y2klEdrOHBzz2yIed3b1T8Zm6g++HOdPC9weSTX1bw7XjEhNMV11jTs9y
	 5anm1OW8i/TFAvAfHesMFQ90JPoPFT9JNrt3uPnqtVkAdEWL0BfvQEfROTZp1/zQwEW5Y
	 wTGXmtXV/eZU1nCuC2nUqb+djjEx0DWFe+KMF2N0hsjshkFs0kCmv9uS3HnkvnF3ZE58U
	 LWr1mVFUKlNGDeHqd+lSKDFpxN/Z0HpeeiH/c8ieQB8zPCdO8TiD+O5vNvppOg98Jt6DM
	 /7LLRlbA4fjvGGl7gM94PSoNv+m0ob7BV/8FnUgUyytz2nuMsHu4x70oT9P6l0TTr/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqYNgnt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BPG/Jvjp";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E457D606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E457D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqYNgnt1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPG/Jvjp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v49C1962348
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=; b=mqYNgnt1ihyJitfD
	o4liAA+Ong8B8jJITRvJjay0xYP6nRThep0pAOfItFKXRu1dQcMBpu6zLsa0F/3T
	QPi0aomJkXgTmCxvVMSps5noh37lZZDhH3/SCMqnWsfdrl/pG8NYhPSp4RrqgJGN
	UdvjkkVfc7UiQK6U3xF2JSkb05TBTMlXqSuxTyiBIFGiDPISNLrlxbF0soNYmSe4
	VODR+g+wOstLwU6vj3K0wPemNE1MGv33MfbwRp7Ecblqkd3mELEiaSCahicVSHMq
	MkrRtp9c9WjVP4cizrma1xNeOjQ8w6YipagYBF3gqjkgtI1yhsK8PDw8K6bw8vHD
	Alxmtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcu933-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so520100685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076798; x=1795681598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=;
        b=BPG/Jvjpsp7HwoFHtD124oWw6txS0rzcZDYkylnRamqyLUObMKRLC7Zp7blOO5zPjx
         aXsF8pKiwd+d7yIE6MB8Z3DiqKvCwZ+o+brYK7k2j+8joff91m8fRTB58n5K1N1zGkKf
         CpIKGBREHxJcYxrptW+8ApohXvclPa77GrkXLa5+xEg1Fcm8Q8EzBfUYLLpLjh5XEPFE
         8ebl/QsRxEOJ7CQEtKF1TAbkELCc2z+JtvoRnqNkkORlpjsW/HBi6vfLUKro7uP3OYP4
         SNn4IrRj11d1XSQ8MrYSu/dPB7bWWMrnYQE7TbjIw0o4yzqiHIbWKe6CaFSem54an7/d
         Fs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076798; x=1795681598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=;
        b=lymbNsXeGNFxekYop3T+BocJ/11VWwjnqlVVfLjgcKVFapB/LtPzHh400kj0a9iazD
         qwipchtWqF40UC4QB6sfz7E8qziHqJK1ItEUW1VnfkVfikLzYQVe6nGMefeCA+wT+kD6
         9wFOBbs/Txb7C7TvOvz8uH++QMuK/Z7pUIizsxxhf8whScDIoUqY3Vv0eGu7hYjgXFHB
         qRMpk/gjrrWEK1id/iJZG612RcOieyjp5h25awc1lJNylBT66Ft2ZcywXcXCeGfQfpbj
         a+ymg/dHaJTdvOH6ppQkRHEoSTDZc4u7rFdt7ZdZ3028wLyR5jjGWrtintnUTV7JS04B
         WahQ==
X-Forwarded-Encrypted: i=1; AL+hErFKXzzaVEUgeiB7jCOPznbgZlucRtNPhZhxd2rEUT2u7lMN8eqzwQgh6Wz2fx6WUPDlI9KABBzptj2JEQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZCeceRSIxCZ9nmJGVzOcB5Elq9HDMTzuS4TpvbKaC5h11CQCY
	EunAUQrcIvuqfvL7NvQdOFA6lY0vmk34tYGj8gTnOs4hy6owYhdkl4EHnOcKcF3Zctk3tH6+ms4
	Nm+4XQTgFzoQ31vjYVCOHWWPXe6HrawfZp/r757vAMj+5HDRUHkU6lDp/B/zpEiX9H6M=
X-Gm-Gg: AYBFou041BTnASbZucJwF0fFbflFFDeB7jaHbsoUR+RRKeQUKLGHNV1x5pDQPwK26ok
	CcUz/UJyQ0S/kPme8WgGTERj+alLzfSZ0GMfTubQTlljiPqvirdEYk+NuqIhbVWNpospwt3yhs7
	voY7zZoJ0T2NI4LvNXL7bSMCah+e1WzZy4jputenXpudwBIzq0tGTwH0r+UYPF1TiGPYidiKiCR
	1BOVsBPy8AI6zM936DLSfIEEoSo/rUV1wO2EkQZlEYGb2rMMCNuTM8M0hbNX0Zf5rLnobb0wFj0
	fLPLCiNqAP4L7eg0MtlzR1Ys42dx6qaIv7Qxl7PGQahDTmZyODn4DjCDom4gxiotCtXEoqZ1V5n
	zr9oPyWeVdPz0ZcadvWKowBvw9iAjNr7YzVKIAuSxzZJ/mYxcMrNHwLncGJpD0UiU8M4PlC0PNQ
	bjXZ/IlvFG3RnCzn0BOPBXUY5REay7H15SYzo8
X-Received: by 2002:a05:620a:608c:b0:93b:bc51:b40 with SMTP id af79cd13be357-949994b44b7mr855110285a.2.1795076798001;
        Thu, 19 Nov 2026 00:26:38 -0800 (PST)
X-Received: by 2002:a05:620a:608c:b0:93b:bc51:b40 with SMTP id af79cd13be357-949994b44b7mr855107985a.2.1795076797565;
        Thu, 19 Nov 2026 00:26:37 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:37 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:27 +0800
Subject: [PATCH v9 25/29] drm/msm/dp: mark the SST bridge disconnected when
 an MST-capable sink is present
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
Message-Id: <20261119-msm-dp-mst-v9-25-ca61be4edfc3@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1383;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=smjaZ/vT/tQUxMxQD/7GfIpJhvqfExIMSEY6fhh3ViM=;
 b=lkf1jB2WLX8xRaINB/7tk5FQ4sYX3U8Xl/o+IjlQnqQmQtdC9BEDpHM+jn2CmhElZJgkiOz/b
 IuV6tPC3rl6ASvvkD0wKshj1a3LDEbbr8Zp/MemXPwzbibAq8REqvi9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afeb2bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E_DJWZ853T03DlUWG8wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0xxqJAHVgZxG4ulu_rBvOlrR2HpZkGIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX0Bo3dIVdIghW
 d9JyQYwYAtEyoMA5QPLIJfBsK08y3HbLdNZEZDJDAftqXc7Ru4xYS8AHWWL718+zW7TSEjqfxMO
 xN0exIVa6owIWPdQzP4vfmcR0pJzMbac9zwvJa7Kd5DcMw0rM4jQj827OhrYJUarmDzbybK6ORa
 wj76K8LFaaloNs+/tbtnDpYXbBpVIPrR/a3m7smXyGslxwt2trkuN+3C8bg/Sho5GGdbiEvd0Is
 nz7R4W97O6V3bQcZgwY20PYyYOHGKzyCU2IbNlu+2pcH+HbFtgbzTWHPFiRJbXwZDbMZvlDWPq1
 3DJWdxHXWHUW58w33P7rHQCVCevcEnRCDZWVYh+lCA/tUCvnXyVxcSzCVijk5pmCd/QDShP7Phh
 Z4QT6Z/9yMcNPRZ/xI6vTu2UjTwUT20XSG5oRd5bXcb5XGGNjLov8GbZHeDUqU61oEfz/O6p4Bf
 hZisOjq4ihdfJkg9lBQ==
X-Proofpoint-GUID: 0xxqJAHVgZxG4ulu_rBvOlrR2HpZkGIa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX//wmvKE6txnn
 92NUznCH8AoGCL/YIZYNhiSIcqZRFFDnNojbw0jv86Shcsj/GrnQsAJV0lYENVEldkGp8ubO+Jb
 k4Vh9eYDudEFfKEZ31BxMYYaoZeerm0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

When a DP cable is already attached at boot, msm_dp_bridge_detect()
runs from the connector notify path before MST has been activated on
the sink. The DPCD capability read at that point already indicates
that the sink supports MST.

Return connector_status_disconnected from the SST bridge whenever the
controller supports multi-stream (stream_cnt > 1) and the sink reports
MST capability, so that connector detection is handled by MST
connectors instead of the SST bridge.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7f5247cbae03..6f1f9dd3660d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1063,6 +1063,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* Mark SST connector as disconnected in DP boot-up case */
+	if (msm_dp_ctrl_get_stream_cnt(priv->ctrl) > 1 &&
+	    drm_dp_read_mst_cap(priv->aux, dpcd) == DRM_DP_MST)
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0

