Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076724;
	b=J/V/QqYmVYFHMuob4UmgpV9bZRmLx7u7ii27UC+yz1DS7SsxZMnth+Fh1DHSv4ouoEHS
	 vBkWaBh4lH9opOrvDkht8fkLy1Qan1nx3pwlZqBe1qE5dQgTA5RM0lK6aKSI200jhBu32
	 8hHd92Tm1bN/VbuCqKYBazI7jbUIBxNNKZPT3QSizxvk1UybcK1Z427x+tHgLiZZ19k1E
	 hp4rZz3W2cJ8YinYDFTBX6YVuEQY/WU5NZ2JuSC/jsBZ3XzAYFVFXCf0UsgMwmxbLHcQp
	 tTKJ82E+wMntJtLFagoDUeNSj66g5MkoC8sAP8ThLpZOXS2/1d3N4/2Odj1HvH0TQUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=;
	b=GFs0iSOOEUQkULeeVmajwjmIM0XpaeIAjzuQpYbz7NDZXfOSBL85z+7Am+VzgSVoW4w4
	 VFh/l/geIQYcsUOzf4CQlb3v3mECR00uEEAJ5YjZi6lfH+//CEqSzVCgymTHX1v/TTT2t
	 sFaHEGkjV8cFCMx0SMS2KBAdQ/T/S4ZJN07BecsuizsdLapWgSZGtaztgLJ96JT0Xp7oj
	 fQDiN0sO4/nGaXthg0Jsp3TAijMvr5C5YU0RSieVK+z+PXRxDVoyZ8eicyntIPiQgYW29
	 23VUYIu0skJIXE2J5lIwWfCkvP99xGDHRIQFkKb+Ydnz5bpxyNrai62BHbij+V7JPUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m96NYnez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKHPL3Kc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F9D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F9D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m96NYnez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKHPL3Kc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7FZPU1602475
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=; b=m96NYnez1sZID3NH
	owVsgQARhDZexVeTLT7jeEuE2hQUUD0tRJ1kG07Nwg+WKankeYhQgESHj3dP6NwJ
	Rh3GkOZcC4UBoco7VD3WWUiacuUDx2G2NIwW91TGjK/f9YtHWuJWTTS+/JCJlth0
	23cSpBb3ZxaDuixuISNGRVua6GWeGP5gjJqM3gIfctib8R2qSLdAG0DPyrMdOEro
	u0FP4yJBD3QN8UFO1/SLDqWFDTLW3DXOwY72Eo0az6FC/A6w0AnY3+xKvuklHLFO
	pYjjeJ6gvoBKhbp5ch0JgAjKz0ysdiBxfWm8fm3zjlglOCVx6Jx35YllLz+t5A/N
	EESYvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8ght-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so525006385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076722; x=1795681522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=;
        b=aKHPL3KcWl9xZzV06HGhm+vk+mhjgqnAVZwMtyqX0lnlGPYlMD/heVSeKdLMz6DDyb
         J7vMaeudGsKWpSxLZmDOb+c1obCd6BLT4dBxG/ODEf9SERZPr5f2NQA0y5me7iq3rQUk
         m1KkaV3j00/o3yOY+hsTH+KgOnINv01cjygZ0Fk0oCWktXUOE0OCIdqnkGUPf2BLAL2p
         e9FIaScs2vmsn0mrvIVGvTduYYNyeQ12BdYfHeY94lpJATUDi113+LtektquAnky7KqP
         bK03TJHDS5IBeOJlShJdJgj5HCYNbQfl3bBFeziQ+9SyC8ZqYoECxmQeIV5hmlr4C+Vh
         Flkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076723; x=1795681523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=;
        b=Iq5sSTTZO1D4JPunD2A+oURMenVpAE6m836V8z0YVdNia4G0Y+BGTUoemRZekexjlV
         G653q0/GamShIRtvgLpNZW89dzripLdCSWXHb5rED730rasndGA0XFOw35UXOPELOpO3
         C8NyqKoFF0nc2W2t6z2XXKkV0RFfl8P7wfCz3ZaUPDfQxh5aCt6Pe5HVS/xs+TbICdF3
         JSWrAbVSTimiQ6/yoar3WVxjsO+YcbcacIVvf15DiZ+gGFA0sDJaVtO8Poup5aNb3Nkb
         9oZd08McUVQxKbwinXiMmQ7tH1nF2HKEKZWTVH2TDDKhjaL8AVsWsEE+fzRfmYEWZBSc
         QD4Q==
X-Forwarded-Encrypted: i=1; AL+hErH/5km/NerED2jsp88yV2ItShiYJi305Hri4R2DapaCrAhGkqiSI8iHjLjiCJeyF+HJ9NaPsdmRrH84soM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WXWhrJXC7VbngrbeklGOEdy9u1jF9iuhf1mwxHlDK5NAYfTdL
	BOrpRzbClkZ7SAeNhJzvFS3w/je3Yhtv5uma7icv5Sx1WxWvtE7ZDxgJb2b3ItTEX6Rdr/6ZPVn
	0I3IhdXwZ7cH3podG2/zAeTvMwWrMOaouxtGn3XRq2RVX5zfPbVDM65czDEW3+IrD6Lk=
X-Gm-Gg: AYBFou1LTPh1vKZoPOLL40CxhLEGFKiSkgem271OS0IilNkHKaXr5FX9Hj3azkpZAnY
	m57sUD9RS+3nIDokbpNi+ZAtcS01iBuR1bd4FyIN9OkoxeeQ+E1JlWQP/lFTA8QMCLScU4xIqtk
	zDx0/apo593UAj59ur7t1vE9MAlBk0q/km8QVEfWTOqp2hJ4dueAcKCCLcf+8xBNmUKJT5/jXSx
	142yNWm7UPtPLIPbNQXRC6jQG/I3LNS1khqw7NGuBz0G+i3eKRFA4gN5qegL2dwSOkabaajbX3y
	aZXjOhoqNtqeGrMqpylrxZGtlFrLvBOsxeN02BCxHNFNxe0mRIe+2vu1sYOJ2NBDut8md/KyGao
	zwQDftKTQUTcHi2Qlc4aSSWhI7kKwUvVb5CVAh7RyG6TdZR5b09QVefwLs81k568C3o4kp72G0x
	L+Choxpnv2ooc6JxNKcD42ekfe+HXMp8UewUWs
X-Received: by 2002:a05:620a:6301:10b0:949:ad9a:c076 with SMTP id af79cd13be357-949ad9ac1demr127397885a.82.1795076722561;
        Thu, 19 Nov 2026 00:25:22 -0800 (PST)
X-Received: by 2002:a05:620a:6301:10b0:949:ad9a:c076 with SMTP id af79cd13be357-949ad9ac1demr127394785a.82.1795076721924;
        Thu, 19 Nov 2026 00:25:21 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:21 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:12 +0800
Subject: [PATCH v9 10/29] drm/msm/dp: add link_ready to manage link-level
 operations
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
Message-Id: <20261119-msm-dp-mst-v9-10-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=4145;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=lHXbJUjnv0+TY2wsZf5fppD8DzUXiA1zsh8PozRg+aE=;
 b=IbmTIzgusdeBavxDHQ2ePQOSARduXUVYH8ZH+82pZ1ZU0eN6CEwr6b3Y1FTJtCMNv/sFlag0B
 /MHt6gFNVvODvCZrZ+jftuNd5Y1hYVtHu97/OVIxNod5oZAyhcl4hpW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: dhWSC7YuYZ7WlSi6D87qCKkCoqUcWnjy
X-Proofpoint-GUID: dhWSC7YuYZ7WlSi6D87qCKkCoqUcWnjy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX90gUdUn+EdR7
 04r2B5COQnBKmUGejhz9I8r38PsWCrjbxsN7MeinoB2mIBIBjG+6EfQk5eJ+3LOqqOZqc4yNU9T
 1oSFWOE7nthV7mpTvKHhwK3zeSkCMVg=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afeb273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EJHzXNQmAnllz_DQdb0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3lt/Agf1BxGN
 Kb+r1j3bLqCS+Jp8tC0PZvGN36uePz1HLTbEkH8dKM9PVHxeb2o3Ooxuxe4I1/40lwLSXMhesIR
 o44/5DK+iefUeXTCnaAQ6R8oMl141fl5kP9HUSWJG4Obbr+8zjGSUKjoA2KBAr+h+7UlYJTU6n2
 S7Ccj/RzSL1syZ76SiAFhta88y588BR0V7nvx8ZOdlVHCnmqwYgA0ja4797KTyb7E55r4X/baxa
 bEgr1P2s+Thwwtyz2nchAajNMfOUQ/mAPPyq1b3Gt1BN3to3P4i2jR0ONlB0SAY0MVRaOzUb3nd
 dNCJtOaLSsqz+mLRyRyCsGdBeDspQDcM4C4BdI+EPTGGZr59XkikQiudtNRQJnuI9ueU8q6ZwXF
 eEV5aE8wLMsue+o3mzwR6VU7AukXje0zZ7Mcw8iKs+s/pjDvueY/ynTzLtin1O8glZBa+pkRCy0
 86Ml/VT6VTUJhEd3D3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 471085744c7c..544b76e2c6f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -645,15 +645,19 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
+	if (dp->link->sink_count == 0)
+		return -ENOTCONN;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
-		return -ENOTCONN;
-
 	if (!msm_dp_display->active_stream_mask) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
@@ -662,11 +666,22 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		if (rc) {
 			DRM_ERROR("Failed link training (rc=%d)\n", rc);
 			// TODO: schedule drm_connector_set_link_status_property()
-			return rc;
+			goto err_pm_put;
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (rc)
+		goto err_pm_put;
+
+	msm_dp_display->link_ready = true;
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1504,14 +1519,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1570,6 +1587,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already disabled, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_mask) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1588,6 +1610,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index f6ebb3d409cf..b0b7570cb16c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_mask;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

