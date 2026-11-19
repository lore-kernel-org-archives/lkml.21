Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076770;
	b=eGQ8obhK/gqhuzbAB1HXC19G/xtllDfkXTPnpNGCuMRzZw3lZ9O9rU/UC/figUVQcd6Z
	 g8ABANev75tRV3cBgmMgFGWm2z3uyP1+A5EEKccQaUuMycOBHTAtfy/yvWVMc3/+p2F94
	 kclVzjiJCB7LNSB5TWV7dGiJ13FXNOUBGnru6Qv2za/JJ4c48NVTdSwtxW8CGo7v6IUjV
	 HdgJU9lCi5WtEDp3AiPLAhCO+EMQvMQzd7RIzRgpjsRv0pjwX8m0F6ayCCJYK8SqGNHZQ
	 clnj545FNlGWJA4pYEhDUY40Nam/v09jLDUKlqdA+LONkEa0szgoZPMB1xM8UXIAzgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
	b=vRDNectzvYAwmH3l63kBMhGw55bOi+XvAb7iO47NmJVhyRubMzledrPFfy/32AAr8GJw
	 CPVY03rVgmCbv63z7Ptq5bLIwDiJH4uoyjdOza5FQmeN0/tX8NCebVci/1xcJaUv4CNOn
	 zOaAk/ljdRgBvYzI8E1V9YT0U5CfLeYfWl2zRIxPgXECbJGOiHogTznqRU6rU3iffB4Nn
	 WYrNSuvPq6WGBHheQoWoW6q8CrnV7tgUFDNtYdufsRmpkUhVmcY7L/g0Klzf1mDFHto+Z
	 pJv0nGNxE4dr6jDGlqrPyqtorjHa5MXtYZ108THA8soaadg9gbsuKghPaqz1QwTu06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7zzZ9PD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCilxa2D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48D606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC48D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7zzZ9PD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCilxa2D
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v5Gs1962388
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=; b=j7zzZ9PD1VQA0Ed8
	pPMQmJnYDtKptd1xQvebwue/yI8DyMX3NafLoMWsyUWLVzgy3+WAVAGa0g1C/XyN
	iDXbj28EyInn6PFCSPusH8N/M0s25nE76OWOBMa4y1PCKrgRCuDE4jq3URANolKd
	fERoI+dvMYvTirfcHMTnAh/VyLJgo2sJ/kqG8zzFIdpHx8sjmmGH0dd2rdIJ/hL5
	Wn+saNCr8rh+0BaJTwT2clDuOm6V9PEjNpV5U48ZdVo8UYzqHal2NBbh0C8l6+Gw
	kIh2GFyJl1gMDgWvNjL46f54gjOL/YuXOF/HO5KmFHPxX9Mo4Sk6bXfx4cOL8vRy
	NYW7Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcu8x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so323102685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076768; x=1795681568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=HCilxa2DQihbnXUlzhFLbsJ/jnYbml2ZIojNR9aaZ6a4z0Qc7CZjpENTrbX7dlILSW
         RqAHgChdtk/FaF8tKaigdcd6VfTURR2Z8kZnkBHm8pdFx881yJrnIfM/mAcXNxHcr2my
         2jbUPOjdA4/diehFn39h/LQtdwlNhgSKLRW4bAtP66Zzzi4MEzKNHBIjoqaeKsU4qJ5B
         z8fSJmgArXf56MiqWmBWS5mRX5ubYIIWk8n7zBHrwutdDSKON5C36CSUWC7FEW8gTvY+
         5BbKVwv7+nXpdupfCcwziiP9nMnxzT/6hq1ckUoiuYAQe9aKI5+iSJe0IrH+ZLMo/IIx
         bhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076768; x=1795681568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4rHtjcLoEgHmTrIQMGqgohiSxebHUZsCfl7SswHqEc=;
        b=iWNeSv/w7OPG2IzRGDF2utLzrh62aTtczQ/dCthEaxu7HHJeLvLWrlRW032tm7qcga
         yU4kSzdazoBEYNN/FqP6VVB8CkFi4uvJpzIuglIGVyVhz9CT/Q5mvQpO4h2PejFbN1kO
         1wJ+dFCvk3UZ4CYKOqCPMqeRArnN6kRDphPgQiMEeR5s35qKBiYPn3V6UuI7IrX/Dmdp
         TZlCvYQEc6GX2y3ddyuVAHNxZgKtQrbQlyyLo9d0XfeySvzlynGqAwexDt5kZbZde/ca
         Dj+v1313xN1odDKpqAWdAR2imGmAhUCbeBLWisnrfKf5yHz8+tqadtlmPr7SpgP0YoHe
         zQVQ==
X-Forwarded-Encrypted: i=1; AL+hErGaWm6+eLrIF5bXL+9Jkcpl2r05ubRINmT8dAxlavk7RgmV0Ke+6f0I47oGJbG+QgVhUCAgeMOmnCLTuOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8iHdda0zXQrYXC4Iqo9EWfoS5rJgOGgY8L2XhriyCyA9Y5HGJ
	MnLJIXMXcLGKYs8F4GIo+8yQJqiA4QDEpxjKrOvjpzB3iRuIpCz6T7fdgjZ8walW8LWI9bDJiG6
	SrZs2j0W5kWk6rRNoJQPIrUeIv9kWq5orNV+06bSHb0oni7gb6dV8YI3poHuoeVdur9yO4U+JKE
	9Ekg==
X-Gm-Gg: AYBFou1nArj88YiYoIrF3J42nKUhamEZQQmJB17ztqQnKeGZyLBZ5r9KsMmn/w0E2Ha
	f+B/miZGEloLX5krxa96/3SsKWfByS6RRbGUhLWpzLNYij6/41Iy+JzJK2hNpVZObT0mGFAVaPm
	9pvr3JtchAaJJms39pGdfIqICxOl7eMbIZQqRGnHgMesElvT0MDYZ5mtPpdns/O65M/eXjb/fZ7
	fLubDcCRr+m20GKU9XX9zisU59FCdYGxYAGwl2WzWqHV1UehDA5JQgRXsXLYZJN3XM1xCzvD+bY
	hMVF0Zmh/FSY4xxxM5JT49PWeJrgM9OZX/dz8EkHh6Ze8KQXBN6aM37JakLXiNNCoKEhnkuJDr6
	ItOx1wJKEH+7sXnfPeSBcgODZLOmaeztwarevgcvPEoNKm/LPTT45e1++QKuuEq7OtJR4YHl69W
	/L3ycZYalLWlBoLs5vonSTZFT6I4QZkBBRO2fN
X-Received: by 2002:a05:620a:8086:b0:945:d852:1618 with SMTP id af79cd13be357-949997b027dmr874904485a.70.1795076767538;
        Thu, 19 Nov 2026 00:26:07 -0800 (PST)
X-Received: by 2002:a05:620a:8086:b0:945:d852:1618 with SMTP id af79cd13be357-949997b027dmr874901885a.70.1795076766978;
        Thu, 19 Nov 2026 00:26:06 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:06 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:21 +0800
Subject: [PATCH v9 19/29] drm/bridge_connector: suppress hotplug for
 IRQ_HPD without status changes
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
Message-Id: <20261119-msm-dp-mst-v9-19-ca61be4edfc3@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2989;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kGM6WlVxmPmHaLD/xSO0chVTuHvRgAil4JXoPE4JTA8=;
 b=QyGEOnbfqUEyh4z4URkbSIR1JBEwHjBBZvQHuAxvag3MSPjsw+ttQQZg7TVpKjLt45fiq4gWt
 hB1iMfZJtsZA5TlDwUjQdzMrZzPaSxRO9FdJL92CuzuHxLnFJZ95efS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afeb2a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XU51oE-CMt0mn-qX91oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0xMZdA5pdoLsuHoAfWvu0fnO7LF7k1iG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXxq9Gjdbgo7ra
 FoqSGVdLnaYf2MLfkae7Gd4Qop+MPahvOqQsxxqHz0M5wBYz8WWCHtmWtagYmJzosP+2btiKhUN
 7i/idTWSyHYh92+kddfO4IDNpwhzL53Dl31GbiFQ0FeRrT5NaSyhrwF37zKmOamtY5vXw5l/mGP
 W8g/bC2FqpKm+YCzzau/uqFXxKEMFr6RjlCBwFZgHdaj4jgx1nGOcE2i4Ge/67CUp98QEtsqWYg
 rDpxaJsLJyRmBX1NvYYeMB2vhnboaqtlJyIpTqcWBZGzksP4gRnDS3gfq7JPMfr+XkgHYznxdme
 oh8ieLEkxjq9v/HHOaBhhnbFpnvmFbSDLpYctJIl5Cgov5mBiFv/glWrkjMNJOS8E+LxZ9/zX0B
 cecB2IRAguIq+h13SzGokbMoAcTf4UZgFoa1jbMMYuwctIAm3wR46TrVdME+OpvK/ju6PsAY15q
 hwfKgB2vHGh5Rvub0hw==
X-Proofpoint-GUID: 0xMZdA5pdoLsuHoAfWvu0fnO7LF7k1iG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXwAY4GG3eTI/z
 mCa728TOQgooM5b8PiE7y2gUr6u5a/Rw3TQeloxxCTGsgJSDBFn5l/t7Lm8qw88gHdnIV4MBcpo
 VI89XewbsITwG9YG3593a/7OR/efouk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

DP IRQ_HPD does not necessarily indicate a display connection change.
It can also signal link status changes or pending MST messages, which
need bridge-side handling but do not necessarily require userspace to
reprobe the connector.

Currently, the HPD handler sends a hotplug event for every notification,
without distinguishing ordinary HPD from IRQ_HPD. This causes IRQ_HPD
notifications with no connection change to trigger unnecessary connector
reprobes.

However, filtering out all IRQ_HPD notifications would also discard
hotplug events for downstream display connection changes on a DP branch,
where upstream HPD can remain asserted. The decision therefore needs to
use the actual connector status after handling the notification, rather
than the raw HPD status reported by the event.

Pass the event to the bridge chain first, then call the bridge .detect()
callback to update connector->status. Fall back to the reported status
when no .detect() callback is available. For IRQ_HPD, send a hotplug event
only when the connector status changes, suppressing IRQ-only notifications
while preserving notifications for downstream connection changes.

Keep hotplug events unconditional for ordinary HPD notifications. An
earlier detect may already have updated the connection status before
subsequent plug handling reads the EDID, so a reprobe is still needed.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 4ade63306653..1d4502126bff 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -160,15 +160,25 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_bridge *detect = drm_bridge_connector->bridge_detect;
 	struct drm_device *dev = connector->dev;
+	enum drm_connector_status old_status, new_status;
+	bool level_hpd;
+	bool changed;
 
-	mutex_lock(&dev->mode_config.mutex);
-	connector->status = status;
-	mutex_unlock(&dev->mode_config.mutex);
+	level_hpd = event == DRM_CONNECTOR_NO_EXTRA_STATUS;
 
 	drm_bridge_connector_hpd_notify(connector, status, event);
 
-	drm_kms_helper_connector_hotplug_event(connector);
+	mutex_lock(&dev->mode_config.mutex);
+	old_status = connector->status;
+	new_status = detect ? detect->funcs->detect(detect, connector) : status;
+	connector->status = new_status;
+	changed = new_status != old_status;
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed || level_hpd)
+		drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,

-- 
2.43.0

