Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076745;
	b=21DKW0NyPOwnkkz21FKKVpmMJXZ3qpDOPxLWE1TLSYV7I+8lISsT4Epvtp0uP7IR0QBM
	 dzZWF4+YM1EEPS4k9p5c6OnPOiEiJonl9PGQhxBXrxtLr2Vm465MR1ovw3i0aoqiEKFV/
	 mYLGEKj+7TYxCDyvjQ4li1BAD+V6nOYSGhnCfmYoWBJHnQStov848xAzknKeP9O76krBd
	 YtGYs1GRzt7NTSNRpnYLlyM2z677FMu7Y9+694jvRFY1e05FD6tucWHYCjk0c9KhUcUYH
	 ihUSg5VS+SFZCByrTOtPI8YHJ/BJl91V7a2FsRikGt319JWCw18gL4gYPYgvD0FJPnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
	b=vg0NATa0b9XxKq/3Dery16hJteSMMH1p8JvGjZsLovLE68NH9p2xC/73CpqHcW/leRlx
	 si93LHdf1Oigq9otkxAp7HlclQrCFr/sDdt1/nUtAfIZ1SKjPXpfPTE5NM1HRca3r+Kwo
	 bPnR30Q13ORRiWiPpOVdB9lZcLX3S5AwDsgNIY8LnPE2Q5Nmt86CyInLLdc6Y1fo+Uke+
	 VH6QA73ysMOV1BqXN8raYR8JJ1JfZih7a653XHGpbCP1Y0M5kHa9A7CJIHRG7WArakyi+
	 q2m+UOr2UlzgcV2eciB2LNZosbU6Dnh+9yfcN1Q8NlxGamGmFU94gW+Y2i77ioHQL1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mPuY6K5Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVqR9uLZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDBA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mPuY6K5Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVqR9uLZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wK691007316
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=; b=mPuY6K5YwhLhWFCd
	ypMLasoj1giRpgz27CbUY8eWBx1RhMyx7NlkI7M6N/x796uKaSLQgL3X7FlRhho0
	Ih2EfyOI/JDYa8Er5upbDhth/RdEzQA5alPCgX5YktVnAPpELsTp8RU28WIbelYq
	8BGHtkdI224Jtv86gtCym5yxU6dQbjVn5vMHEm4tSRP1IjN4ILL0BhuA1tCIVBbl
	JpWMN1OBsR85Sq8kzLKJPSuB0mlLeP7+rbK2cTczQlCxOm7Rga0F1buyYJSoosvu
	UNRclSDghyi2vmtMe8Pb4qfUk0ilN1OQwkzbusVyk778cP7up2SbC8gRFTA6LV4s
	0WrtGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnusfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94970ad532bso327746885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076742; x=1795681542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=QVqR9uLZ77lEfWtUXtmVNE7tIxGivYfwVivxvVGtk4aqRIjHyo3X3VLlfPLsGfjshq
         ko+ipYq6rQKMv1I/+yLc1gumK9HVyRN/O6JhjGfLAzKxcBwXNXI1fnLLK29O91PRJyGO
         wJiKdRHSIaCZreHj8mWEHWuYDgwCrKfBcAnpBeMgOVTkzjY7oMCL/9P1P5xktY3VUJWc
         GV6nwj3ydkONvbIlGpPWmEqtrruX6rvqXf4HnEKMtuC7hn3BPGL6gHj46QhWA/o5Cx9k
         sJIx9vq5lcNqEGxvgoxda4lAgtghvIlXfHVM6tI7uFMbthb/Hv7FxGSPEuqi2lEPBRtz
         FnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076742; x=1795681542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=rTy9SrmMQazAYMbxqKwrRaULQvhDF8mxOetwicoU8DrkLuZMOyWpPy3fczgkzoECzS
         Ufav2MPNqB8fDsoasDFxUNrWOUT1iCwwDJWeawm0DUoPaa8+qOJ7sZMAFeOUbDNUee8o
         dEBQMPKMLC1NXNrqsNZmNppLwqNyjZlWtCZosnz8t4pFPI3lZEUkP66COVGx+LqjbnPR
         ufqyJOso+W45Q9S2Qzc0fPe5kvL1vHuqctdaKv8XlfpbGwlDBwYTaYUbjfujAKo5W3jz
         9QHXf5WTizVqEPXFgMfs2IIS6kBbUQLG5bleHXifO5SYwc7FGuFqScdafgbdxElMobqC
         CYeQ==
X-Forwarded-Encrypted: i=1; AL+hErHpZ/ZPSBINax5MNQYLA+z8DHB+RWt+5sJw0XBis3VeQqd+JAzBZFHv1MraN2FUaP+rgHK/G/D6Hd66trg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wfs/vTQ85vTJDcxpLbsIXJWyBPLp/odA2ycoQFXaCwImOyZQz
	W58v45S1niDOnCfYaCXLCALoUs1TvwyNSmgAWOmP1d3dabN2SnmaKMWfRn8tDJ+R2g4scWehl5A
	+SZWdEv3MBF9fsrMj/9dS397CE4BHy2IQB/Ep6Ukv4p5gj8AZVTPzcdIutK9Xmf4Z52U=
X-Gm-Gg: AYBFou3HDfAyaujKQ3bScSSyP2jK1qx4IwwioOpM5J2CTNxKcREnoZq3M7qz+eKfIBB
	bVLcMt8tiLFcpAmUKS46gi5Qn+4iYQ7F7U2qZzgYwHPYJFwlwdqXoK4SukhNQ0uDxCda/atnOlg
	CmpCRgZGdS+FOYitRoXx/OfSeY05si/U1o2sVcADxDWzvLO4wi+W5g84Njmt5SOo1lJkXv6n/g7
	T8VQi++hQkqrFmEUkz59CurP+QjnwOqVbJlkmZkT7Dk0u0A3o+ZFdpgSoCd3/QGhDSA1v1LhCyQ
	EcJ+QesDXigpQrMNsl0FhQ2Kr/nc/Cu5e2BfbD4Sqe2KtnmMnF1LzkrAaNVqI9VhwyqfYYcbvbI
	PF3qJBvR99hPwqN3gpxFYc2+K56Wo0fd3PktX6cdqDFsljWguuGYHn5cYj/+lY35bMlYyyJmbvp
	Mca7zldS0FZO0AQPBwwo7GjII6S1vnfxl62RWH
X-Received: by 2002:a05:620a:7005:b0:949:6898:2e4b with SMTP id af79cd13be357-949996fe1c1mr829346785a.66.1795076742506;
        Thu, 19 Nov 2026 00:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:7005:b0:949:6898:2e4b with SMTP id af79cd13be357-949996fe1c1mr829344785a.66.1795076742036;
        Thu, 19 Nov 2026 00:25:42 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:41 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:16 +0800
Subject: [PATCH v9 14/29] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
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
Message-Id: <20261119-msm-dp-mst-v9-14-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kSG1AwjhdD6UXXB/LAoKM+KcPZ/iXxLYW1hElXuN5Nc=;
 b=IHUvVKZkGRkoW7hQeHl3YpQ6YDmXlLanxPRfT2SaBkyaR7C5gQLgk1L/Uo7kZTHecoGa1oaHC
 uLBGr7s+ww4AFEIC/HqlhYOEJuq/o2w6Ly0xpX1nNFFCNkMNXK2Lf3W
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afeb288 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EQzsPIacjI8oO1SU7E0y9VamsYVRvClP
X-Proofpoint-ORIG-GUID: EQzsPIacjI8oO1SU7E0y9VamsYVRvClP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXyqKWR9+3mLIV
 /nla6rh9hlktHaH9WvI3YwX1iAAqV/JqDc7mIu2iO3rWKVTSRrVbohAJLwgUA9OESdkmdyOj0AI
 FlspCjRO04pP6slYLMlITQrQhZw2hjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2VqOv0+XkZzy
 D57RdfwvpfpV/rjDxYRc+Nj5RVv/XSQfj42yuurVsQq1ALCCiJ2V0+Q3c0HxQdAqzk10Fy2pw7Z
 jRnJwb1r7BsfZ+T3Yf2VPDsuszEmpiCoQfuhu6tK8h5vWieWIuiULuFoEx/OKqa+wHO3BgH9e7W
 9T7B1MUSmbOUoiWHWCvBhOqCxDlMo8cwc81C5RZKVXVR3fZrAdaf90+k2dK2MHvP1gt+vmEzVM+
 0GAfwWDib+trP2UYu/Uuhjx9WW5uy9yZYbSDXy7lQkkC1vKQ/e/fq5c0opw8Wbubm4zh/AZed1/
 cCWUD1yxthtfgj/u9vH3oCYLLVkIQ37eay7OOaBJKdL9xv0ywfKfoeZep8p4S2yEEk3mRuixDh6
 lzo5SGlxGW28I5/nrW9J2T+jZxm88RajPd8eiNHdN/bCidexAHwsvW8RttrHf+H8IScjIxxEmS6
 2ux+/F6F4+urGMsff5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..5e1c98371181 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1435,15 +1435,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2672,8 +2673,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

