Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076749;
	b=n6v8xlH4n4N9EkRFFAMD5zieh8LTnDyQk5GDoHIMkDNZJ74UETWjt/w90A0gUk45suXJ
	 skLImHfxwMZ7gWFBJWzeTIV8GrTTnBzGJ5pd6H4/9/vBD9mZLMg1nJpLggi0BNQyvj+H/
	 XoKioJN2x18hUY8PChz+hnd5Uij5ByLF9qFaqN0yPCAHE67odyVsZYplUA0Uu2PJFQygp
	 3a3hvfSM9LL7QYR8hqXx4tvSOXiJDr9rMQGxcz+B5CRxUKqnpw/l/IKafTAd0Sw7OGsJ0
	 /g4FISqP7J4O51tpCpRoTG1uaTmolvEWKUzBiCs+7x46su7tWyjntaCcsDQ6IYphnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
	b=EyAuznWTrYLlyh2Nm3y6eo/LPxhes6QeCRI5+Qttj4/aY0HTtDZpuV0N2DuW7OpaLY2Z
	 TCxL3f7bpyoUIbMaszWmBHgyfaMjW6r8FcCYT47tMFBAe4k73hTDcTN+edkk+Nw8i6A3r
	 cbAPJGXyeaOfKJh/w7RPaMQI+0ETUubufZUwThg5ocBlKQLPWLq81lZ2UZWp9KRJvpqm8
	 /iNFa8+J5iuKGXVQg5ikEsbv65uFTvAPKL2Oip9ljACs9uODI9nYAJngYA7fL4IPUI1s9
	 RWfL+6oh3fIMGDgh7mxIJJD3zTJERDwkFn8k1ovvs6E+O8XWC3y4r9BrGGx0V8cfVNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KFhXYTCQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EOxOnwWR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F5606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56F5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KFhXYTCQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EOxOnwWR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wIlQ1007280
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=; b=KFhXYTCQTzU0T9am
	L6oM9f1G5RQ6sARtwtFideE1kyur9o21yIa9sdtC5Zq+VG/Ike6NkZ61PhhcucNH
	cWcld/L6yvN//lclvNBM9SqahdS3sqrPfsnHCQ4JVGooEEEEyN0Tzg07jLExy712
	cpym1nc+LSb+sKC9d6kpMtmP7UnpDGx8SOG+07JCJmUdeP5sFwy4dbTq363ElvBQ
	axoOqJlAra1bua5b+coAmsNqtwQKk6A5hHkWmXt0ldEGHCoO0TjvPBS24DXZTSVs
	hdx41anuTnlg+Guw735+fG4nj4idVtQE7wuo91Gx9MCUONB7Ug2PL2xj69oX9l07
	Jg8Jiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnusg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so344003885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076747; x=1795681547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
        b=EOxOnwWRiBAy6yfFPDuyH0DvKQ+UP2SzC9E7ADUmqO1ZRzP8jRNrg4XEQRQy0+7pfB
         AP3b+I0yw7tjuC0yUAkNWkPqmtTbKIxScQ17HO09qrXpvoqQJtjqUZGrdZUcZuKbEj/Z
         45NJbubCZJH7YnTruF8iQ8YjWvA3V9vJ+SVfHghb5wY2pmtERzu74VAdSWH5O5h0mfIQ
         ZYsy4RiR1d4rrKkeHlD3iANCUTE1jjgOcqU/PRVdclMi80CPsUAHonFd1EdFOs/gAtqq
         MogWJrxiDK0WxdLAppIddxa5AOh6PNt9pqW1pp+EX06o10GoeBWcMN61K7wBeFXq8bTj
         E4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076747; x=1795681547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
        b=H1WAvzxBkfWC81HClheUjhfElxoViR+MCQcpHZCGvDWbjT8t/RYn1pmSKCSMkYnzeh
         7A/vIscZ078jO+SFXKNiLMrpGijXWr6w/wPk1XVpeYWHAy3PvMkI1OOxvQjl8THI4Ox5
         iaLjUbF51EEaMOKHXngG6KoPBpg1i8JXJ/+g32oSkopna4aFxWZVXz7+/NVA1CoaVMXd
         wMG4W0/l/0bOCqCiORsNu30tt/j0cbVXNUHp3kPBiSkb8kccMmDzfcadmued9tAm6KjK
         xaBmbemFhXZFDAlUtMate58dE9D9wJZmu6+r47z4+079MLTwpSHTavoAApqn87sC0wOc
         mxlg==
X-Forwarded-Encrypted: i=1; AL+hErHM3ynkXAI6ydTapvHAKBzSYaxg3/ADyb72HJGXjzg6tCyShRg6kZmpH7JJr8LjclptPIPorTfw5oa9/0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CfSKcxsq1e/1UjDiJtOIDZbbOZXpOjlRcViBy6e0o8KC4u7qE
	JlVMnzDssKq2WHX0BP1Y1vEz1vjqwf/uZCX7CoOkO9YEZF4SQXh9z0rwAkRfDcWK17DSdrVNpzo
	mrOBW1E+vJoTA7s6wkrMt5TxAv/X9ycZyzaRJFEQYb4vyrlYpzcPPpmmMa/w4I6acufw=
X-Gm-Gg: AYBFou0u5rhe0sEV9Tvm7+A1UNHFG00qY5qnzCMDXaxtQjmU89a+CiA1ts2iuOw5MvT
	vhdqah8fmw8P69h6T6hqEHGh+9CUT778Uwofx5B3DUwUnb6IDVqz6MqVBMsDcMDy7ZiNeWghZyI
	YLHInEi125H53Sq3GuupOVxzpqgahRvlaaei2Ppd9NO2+8yGkcc7O+mgFP8FYQ6j9Hk4rLOD8CL
	Bi4M9/f8x9rxtLw3fj98Iq0NB3e4uCdCKahoYwuPEo99isj10J7IQq5JAree2y1b1lcT3bnmN4u
	BGsme4yYWmW1cLcO0HN4xsEZVHLhyuq0NvzZjd55XH5OEi/Z7vwFKI6Ik0pmWo3s+omrrQ4o0qJ
	jHQARjO2SHTTIyYxmA+fGSft2q1V3yktXOkVByy+QgDegXB6+hwU/VG6wLA3rhk3bMgAwdlMndV
	5Q4B0+krKQLqkHDl5BqDlwdKCWaMC7mBVHR69I
X-Received: by 2002:a05:620a:700e:b0:945:f0ca:436a with SMTP id af79cd13be357-949995f71d5mr967527785a.2.1795076747383;
        Thu, 19 Nov 2026 00:25:47 -0800 (PST)
X-Received: by 2002:a05:620a:700e:b0:945:f0ca:436a with SMTP id af79cd13be357-949995f71d5mr967525885a.2.1795076746972;
        Thu, 19 Nov 2026 00:25:46 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:46 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:17 +0800
Subject: [PATCH v9 15/29] drm/msm/dpu: use stream_id to select MST
 interfaces
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
Message-Id: <20261119-msm-dp-mst-v9-15-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2469;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=wXTPAT6DXirv1p5bLwSDFrvILw5gZg1C+bWv7KYQNRg=;
 b=pGhF5oxPjBqKieRi1UII9nLYtUBklqY94eIK+ZbUT5+y/21cnuMDTorlDwTeeNkkKloGBcoKx
 NblVFGZ7aB/D6rwCDl3N1HOfEgsyOuX2VIUHLrAXuKYvDll1opId0OC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afeb28c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m4XVQ0OAQ8bppu2UB-MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _HOibS7PB_Wz5qy8lvuTQ3wFUvXzhNoI
X-Proofpoint-ORIG-GUID: _HOibS7PB_Wz5qy8lvuTQ3wFUvXzhNoI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXw3oD+kOmTvb7
 Wer8s+si/OBhll/ONim8Kt9GKMqv0gZZZ8mr6+hcLolNA3lGgJkgHyAA+DR6qm/rRaYiTH+eIfW
 ILy0ZUQWriJV2A+5q5YEWuKyKu3E/XU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2tyNVf2D0Qsw
 bCvvj24Un6U2Mo5Bmu34ZnFN5Habmgz6Ihss/CfAvZ/2IrgUIuB3V43/++Jmf8gfZ18LE0qQBeR
 ZFw8ba1/cxfLWkGeAWNVLNps0q4Hm2oOoeVxX9emFMXicle3BWfAPQ2VNNagAAVFn2Bmon//Nq4
 BaH8lHrUMX1i4cSq6ylFjeUqJskFeHkKdspnAH63gKpyZ9WplhVpY4E0TgVwpEhyEVK9JD8fGBZ
 KTUhS4kAAcWWs6iR396pdA8Z/pjlOflqtOiSt0Csq1Ch5VTRLDe36qRqXtSp6h6NpXQiI19modr
 emTfcbADflzefhmAArnETa1/w2VaCmY3lCXJ23tPHaZ1m26DvPvCODKgklzYbgCJ6qtp2nhKz37
 C+B3mCu0/TeCS0ha7tV5Z8BSMc09Tm2uP6dDW+HUHXz9YrVg7OgVNNINxHczYffWNQ8ZOJkNsNh
 5jxCjJ0OXiRXg9KycbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

For MST, multiple streams can share the same DP controller, making
(controller_id, intf_type) insufficient to uniquely identify a DPU
interface.

Add stream_id to msm_display_info and use it to select the matching
interface for a stream.

For DSI, eDP and SST configurations, stream_id remains zero and
behavior is unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5e1c98371181d..a8dcc8c684eb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,17 +1437,18 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
 		struct dpu_rm *dpu_rm,
 		struct msm_display_info *disp_info, int index)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
 	u32 controller_id = disp_info->h_tile_instance[index];
+	int stream_id = disp_info->stream_id;
 
 	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == disp_info->intf_type
-		    && catalog->intf[i].controller_id == controller_id) {
+		    && catalog->intf[i].controller_id == controller_id
+		    && cnt++ == stream_id)
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e76137..9972e209bd580 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 

-- 
2.43.0

