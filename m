Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076785;
	b=5To6ExXxmBJpuOooDXySjx7O5canJx9Ocr2XOdqBAPtCzy7IsBrzC4F+GFWrME3CIyp0
	 he2A6hrolKDMchRjMRc3I4oscGdlBV7o6knjpS9rv3ADwBZkXiyngac4dz2hgGVhQbUkZ
	 udNobVGTgHV7a7OYWCZYX+pN41npbpyp7LczTaUM8MygEgiL+sWfiFElzebKlkvRPbM5e
	 cZ7OkfMhoKU/t197P4kxlnl51sWEz4AkCRMqKt7syNH6QsTBFWNn3FoPV12U1fS/Wj0LA
	 Va+5xk+axZyjnHFjS6Moqlx87U2Hk/hN3LeufPpPa3lRZHSlSl4KorVKUO14NfibMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=;
	b=Hvf9uLOe5LoMnwGzDcXOo2AmLobrzWyp7S00lu21jEqd4+l16PVkTFcluihpF/nxUM07
	 4VKuzqTk6MtpNgepNTyut/DsF6B7QJZ5HE0JEf3/hAa19wxY+yx+12AUie5aBNW8PhPx1
	 GkMEB2HKRJjp9k7LM7xDdKNMWX6eSlTugZr6Fu2FYFgVUDq/i68aOV86nbYzUpzBpPVNO
	 6MrPBdms4kn58ZNYU13cpOo2Ndj0X0BkqoL0zYcobKup7kf+j7DdaSe7lcSiVRtbodv8c
	 X7ofW+NSusd2yDsLALGxVncZnZzuue0IOKN3RqwIQPSElSofoyPwqUtND2pMOhkqURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeE4XOKZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K4KmaJ5Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC4606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EC4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeE4XOKZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K4KmaJ5Z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vE0n1681157
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=; b=UeE4XOKZ0qGuqGbB
	P3n+1cscfKUln7ktneDNruBq/4RT6WQdCBa+AjoNIyUW3cvJyEf3cOaYddGcVJcb
	Cuk07cGZ3wSO1WWpGmHamMcazNSQYYFiBAfJCk+YYA9wYk5ZBCZzpr0/Tc7RU1ue
	cbs6H9gJSgPKKsXu8GWZSYnbw+mharxk54P7hi8jdKfzkDSTYGg3rr+9MACT0fZx
	haB4uRNrm9mMxkL2pSFb+mII7I8NdjdjIGKdpkYNUHIhP6n/ou8dDHmq5KuQDV4l
	DQwQ2XNtaWKqRuJd5NQ6T/iys2DevnN28YDFydwPoG/Rm/GheXXQPXjpg4Qn6oWS
	VqMx2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcss3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso294052185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076782; x=1795681582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=;
        b=K4KmaJ5ZE+gmTgjlS2Mew1dzjQL37S62KHZFt/ekxAg0k/f11c8YywPzu1szBFkF6H
         uDuj+E3hGkJfyq5NZNo53czZ+qvD8R3fB638HnksjGK9WwJVl7L1PiDfUkRCU20SFxUU
         dqY3h/iZWv9bcVodwpj/nCJ9ZtejwgV8Y2s/wYzYq58AhR77Q1U/egp+dcG3tsoe92YR
         FQ9LZ7ltYOO9KETPN02mE8UAm8QOWbyuWpWJacMj2IUEZ7D105wakXsuiEVQdHtBUz2I
         3KOUCoP3QFkbIDpUCC78FfipK9CIlYHlgrMLkpzonImjj7OVRLYF4gncvv0yzRjp3X+z
         cgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076782; x=1795681582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=;
        b=OuzeU9xdmNDupfoLAEkSd0zo88wiYB6ol9OjRu+BjJfT4qKdOpZYxtb+EcqvSAtEHJ
         /tjVOICktJGV60/27MEB9wWmHP4vORa5Pp/U3tA90KIjOFH06OahrYkDuHdOyxSAdVip
         UN7vZWOtDrwuLFkQEFQrpbbFeGKQfLiaMt5u65ZNb5glM35w9J3sh6NcDtrAIOD/KWX/
         0CZKoMLn5rvLTr5Xz5LWlQ32gu/vUiY9smOrVVl0Mf6NYFGkpibMRMTX+5h8HuEHvVDg
         5vonUtVVo/2frvQgEquni7mfjAljdJ19vSKXjPj8QWjGIAihtyAxTlPTj6dPoJzDTdWK
         eeqQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ79gfqZSdbVqyXkZ/wP0RGUaxw4BlNOelmFMDUJFEWYl+VHAFCImXc3GNfKLi2it5Z6W52mT48rpQN0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g1whss1Z+srtBep9VX/y84cPgzkgameT4UqZDM6Q5Ha5DIQHq
	hIwNaDjuwh5qchytTgLRYqjC1sAysdZ3qOv+ks3rfpNVIBGJhNXO3brmOLkXFLSXMiQnkkpCS5J
	Qe+FqoT3ZTB7bs6rp/dws1SrUoRKe4yekPVmWhC8k11xYQ9ITw5Od9ygxK91zMvSh2Xw=
X-Gm-Gg: AYBFou0duPlg+jdJDnsT7aNvNA4YJI/NFDynprXZH2muCny1cV5BySXmjF9av34rfrD
	XL8Ft8G/Af3OWsVYFc/xsvWurjxd7X7rYOM2RvtEX2JLLj20ToOjYC8CpQ9o4ST9HEzLo7JNiip
	BgLEIyojdi6jYANR19fiWk9iEXA8GjiD7uFv63yZBE2kuuyip9hCW9DYSp1xbOjGIVYHJ7+xlqX
	CfnHV81Oo4HjH78HABp4ooQVKM1LxBeWvESjbwWM/FsHUpCVsBCkyK9kRJvIDif/SNvPdDPmKBU
	uZ7Nss69y1+zJR8MnhVmG7s4fPemde0GNsNEHCkCVZcTU4Z5P0pZZXwrwqvd6TZ3BaBi13M3gVb
	votEDKPyQTNXXIMGvvIuv9aZ5Bb4P3u9bDPH49KSVISiX5kshzH3bAXZXN8GTnjVFeg6776XPVC
	njC5xJlQG2LUC2J7JahxmL50Hq5lTb2H786Qvr
X-Received: by 2002:a05:620a:2685:b0:949:3ec9:9d6 with SMTP id af79cd13be357-949995b3c78mr1017346685a.43.1795076782448;
        Thu, 19 Nov 2026 00:26:22 -0800 (PST)
X-Received: by 2002:a05:620a:2685:b0:949:3ec9:9d6 with SMTP id af79cd13be357-949995b3c78mr1017344185a.43.1795076781955;
        Thu, 19 Nov 2026 00:26:21 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:21 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:24 +0800
Subject: [PATCH v9 22/29] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
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
Message-Id: <20261119-msm-dp-mst-v9-22-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=3343;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=AdBLBWWEc6vpplMBiBDW6FZCSILo6YakvdgN8c22ZTs=;
 b=+cOROUkoNEA4cqsakkFCRfX2TKkrdR6dgMiWA0GRDTHUGDl85/u79RVBHRNfcxXdqsnnpL7wD
 pjbanPSylqGDo606VHITWT3mqohyUnW6SUndZHOlpjDzt4fW5zjsReR
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: G9-MHsTfmO2MNGHu6qsagc9XUOkLWrzE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXyQbYdGbmHBCl
 jrXiIfsrh5Xsb9pu4fVo/fRs6p5n6fyhG64zCDsd3JSXzlxOUwHAwIEEfksILLPoRDP0DnB/La0
 KNwcuHVSPm7CHJC5xeibxC7Pv6dqWvE=
X-Proofpoint-GUID: G9-MHsTfmO2MNGHu6qsagc9XUOkLWrzE
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afeb2af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2eiYZdc86yft
 m9vOtXMr6LrobKtsrOcC/rXMxDctWXCftY5HYPriELbOX/bdYc0CdMTlgZD+WKkmQpyKOGdJ5U5
 xYCP0lwM/5XBRj+ulc/f//C52n1R2C00NDRiAJX65fPdCjKPV/Zgf3B7EXG8uaO4ovtP00Dia/U
 NKRqeaL2O5E/iHzeCobJolfmgndbDPkgNOVoufsbvz5gR5vvFZshDZLxIYwiz+icgKLNaU2f+mu
 t0XrEZ1xO0GOoUDTX9BrIuhCxHglV7pYcurFfCUBnYREOqWFAHLMsU8jeXIG0N0Fq5SH7XXn1xt
 ApSsk0bQ+9btHrwtz/lPgamxw7boeS/ztB7Gkbmb6fDYMrozjS8eUkkbxfFeO43Feq6KxHG72L7
 6pMhK7jm0HqbLExkU5Zt1fCqpcwAerauoJkNsK2Vyda3BogdaZudqavc0nojZ+016uKP4XOf2aH
 vOY+GGEENseoDjEOQOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
state, such as connector and topology changes, is validated as part of
the atomic check.

Hook the MST helpers into atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits for
DisplayPort MST, and ensure MST commits properly wait for dependencies.

For SST, non-blocking commits are already handled via commit_tail(),
which waits for dependencies in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 drivers/gpu/drm/msm/msm_kms.c    |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d3..e70e5088cfe53 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_commit *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
@@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
+
+int msm_atomic_commit_setup(struct drm_atomic_commit *state)
+{
+	return drm_dp_mst_atomic_setup_commit(state);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 597728ec6f3b5..ebbc138935c43 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -211,6 +211,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_commit *state);
+int msm_atomic_commit_setup(struct drm_atomic_commit *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state);
 struct drm_atomic_commit *msm_atomic_state_alloc(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea6294484..33ab30300e16d 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -29,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = msm_atomic_commit_setup,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0

