Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076740;
	b=YZAOMoAjTh2bnr4l3Brx3+dAfq8mR7siIyt/JdlBcRq3kvFBqhHHWYOJdIMzekrq0AJO
	 fTPUnQ9wdxCjFcUws8sDmRV4+GXGTWlur9v/7hDzmWQLD6nD+dehqS7sDzJgBuDIBHb++
	 F5lkujLfqf1/iXNM95jsZRtY/Tjx8rNPpzOHv0KGRb+xycbuBBOcowQG1ITEIcz4z+9WG
	 OZBxkyOppB5hXxh2GLShh/7DwsI8QGaEkGyI5YuK1HNh/XR6cJGASp8U4jYWpRSEcd9lU
	 IuZ5ymRPRJqkrqg6iJpkYhx9FfBYe3JQx4WXx/2Z1Zjn7HX4Sljb9ueeGoe4HKMlK8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
	b=rNxXjpwuLZ4zXcg5aIUAdelsP86GLoWs6prR5dTb7IrSiBPlfyibOYlMFNYo7ojYT6aJ
	 8HYDC9p0Pm6CVjcVW81jrrOYOL9vQtPbHntBl8xwDDN1dIhvyK/ZijoR0ICmVc09rTWns
	 yNqoGngg0NJLGpZZrSZ/UiXE43pYGRILI5TrS6q2P7NAX5NlaGYUCTJS6A69M1lnOdhDP
	 uplPVThSe15+tfw0Ebh11qkK5QABHmf3YNuA7gV5xHeJrGwOqaoQ2nbLcbiJjhxoP6FJy
	 bC9RqE1LcfadiCL/CzKwDRJ3wlJiUmcpIQnHetgS/3DFx9THwzWmSKctx88JP2GGqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ2s3Qou;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9LJOgl0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D7606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ2s3Qou;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9LJOgl0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vZJs330763
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=; b=UQ2s3QouN4pqwK+0
	RtqwL9zz/LeAg0qtTN/HR3YxBKF5ScikC+JuUglIkqm8eVqdcPuqZRK8j1ejjyO4
	CSDk2jJ7LO3hxYyy8CsU1tw6V4xsy0GDmVnzWKg7Whz1o/cpmAPEOcdjSiuj34WZ
	IhNVYuusXtJy5nZlrhjccU50JdJcXq/3oCeRq0QM/sINOqNFCgFm2oOc0I0E8Hqz
	kYQ49VUHQwGICN74H9odT0YEgKveXMZPsyzyt6bIfSKY00wJrCYmZcklfKLm0atS
	yfRE4O/P18Nz6PSLxKions+R45IRNJqy+Scokey1/047xJH9mwfKa9FhApsw3eBO
	1xRLbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkgem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so144573685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076738; x=1795681538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
        b=Z9LJOgl0CkOXqUqC0Fgd2GdjSMngSBnQo6sA6yn9LdzVSp7ZdDIhlB8k8nk3wkeglI
         Ct+0Di+NaN7OE0K94Yjs5zIvIkyqrOls8u4fslJpVnswHUJZGSVs6usoCLd9mAIOLnlm
         Z9EP8y7VAKV0NlZL3QA2vlvuPggHTxTPnuIPKuvXNOgRYWWlo23rKO92MqdUJ/AZrdO8
         tR4mwtiLuUxn+U5mewzCvY7AlKVooqllr8R76uGOAZuvkomoHBzah6QLkNEMNUWJgTrr
         mPaDitOVtOpI0IZfblTHz94eC57Ef2ywpJRWNG5viaeDrxfLVdLE1hHgdasP58K4zUo8
         dUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076738; x=1795681538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXjmyZcm84bx7GLv3ncH/xGNIzEG7bes+15keoRFI+0=;
        b=E3gMl3Aaqj70qBAW0cVBeH/iKamF1OiXpltGiG8Nb77MQQMwO47tZ8cGJflT2dimJk
         /poeaiJg3A0J1lrQhX7731FFm/2OXS6ugVCHwJrUlh6OZIcctgQ+ePwnLJUtf7miS0qX
         y0pYE01SzLLCWoyBT4Hmyx7m0qFYDmGt3UBcOP3BiVevfylzUn104MLP9OFcd/46hmJ8
         np4yxyJN6wW7e5VEHCTyw/0SEFYrRDEUSv7nCNDP8aJAa+Ry//7I2unz5UcY4yLCMC3t
         O5hCHMHAuXVlAkN+tT4NU2+GfXtPG7uIk+5Uq0ba9LsJP8lLgCQ4OFc0ZlFn5qheUhoG
         /G3Q==
X-Forwarded-Encrypted: i=1; AL+hErE0rdf/TXDCMCiqULP7WggZLtPsm6SDOuIHNrr93Lu1IiSJAGQoC+8/4NCIPcNWqPBy+8ss/wEzaS5V17w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oY1qjaPGYtqbFFC2xD8nHXmyDgwdFG3nrOcsPUCD4/QSRyqO9
	Kcx0B1SCcZxVLFYg8VUM82KhMKYt+27EXyYV1uJ/lmxt6WyPj+7bJBWn4byMqy7K8DglqF5PuSf
	smQwoYeVA99koplHT7qyDiClL5iIbkjf7iNtts/pqiayuAjntga7LoB4LyC8bk5/u9mA=
X-Gm-Gg: AYBFou2YllO0prvqOCKfyTW6HnPgNK/J7M7h2/syZlC0VMimDJ/tzZQnkd3kyffaMsJ
	ljoI80yzdj4k7DfTwv5/0LHPaKkBEQUx6dNkDL7664r9jklhw5u1UiCNQOyQwwwKhvST6Py0h8X
	zGCzmgRxiNLvnrunKvwO5dd81X2GrSdlQQ1U7nAhYtx9irEPPnFlhJZ2nNWk1IUW0dV1YMRhPbj
	usoB5VUUmRrUK+/DDU/qZL8ZSKCBEbUHNLeU/QPImrd+5vJaG7kRfpp2PeEeROjaUAL1Mh45EQn
	+rEm2HnvCqsVtQ4ksm9vB2Kl8arJLYKVIUjepa/NztoxNXjLBjpuREf2/P7Za3rGxxhwY4QC06T
	qj/DYRiHxUPAZKS8dA9ojJ/KEVdJUXzl1Lelkw/bbUDCAK6ol25co9MIt+HIHB9H8oJPsdpztqM
	jjWdogeOM6JCO5wfUAaJi0jSFWNebLy34HROlU
X-Received: by 2002:a05:620a:130d:b0:93e:7156:f814 with SMTP id af79cd13be357-949b340aaeemr57656585a.11.1795076737643;
        Thu, 19 Nov 2026 00:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:93e:7156:f814 with SMTP id af79cd13be357-949b340aaeemr57653085a.11.1795076737110;
        Thu, 19 Nov 2026 00:25:37 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:36 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:15 +0800
Subject: [PATCH v9 13/29] drm/msm/dp: add MST connector creation and
 topology callbacks
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
Message-Id: <20261119-msm-dp-mst-v9-13-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=9238;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RagWELnNOcsg5yVGhJwCjO68hxskqfF9xg+etUHxKNA=;
 b=19mX1mXArlGQOMEf3NkSUYzv+LxYny9IMRQawZ0+nWzv/6obmqasSLrbhdytbvqcCFc+cvNoo
 g8CgZMqJWkxA+fT72cA5yyP6l61IwwnYq1ys+pD+fKs5V9NHQDNmM9S
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: jrCzW0GHw3-lK6GBQ5AfJoQgebxachD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX9gUk1RTTPEOU
 GayhMuixP1anYkWrY1COO+Rzl3xo9IeHAvMotZc/kpBrxQjIiRz2LHeX8kYP5b0ZTogJC6/bZM6
 8A6MPe5MFERS6WLRyIAT7TY3HOiDbuK+thu+QFkcPrroJnJODRfkYLuCg42oXCKSNthnMU0CUcU
 LacjShypCOem8S7RR+bF2cp8pzyrLTAOKgFmmJ4aCoxmZyupziiqYvSmD8+yM/SACnjCipSlqep
 hpA4XB1AvdLn9Wc5u15TVb639Da6cEUW/in+4JxNACsKT5uNP1VtUqCyFe4jOsvE5yIDHghLyEC
 xZX/83M8jwfHo8Q9kecHBG3dbvK6w7EDhMtp4T1Vy0/klcS63C2H31AlWWLDNJcpzcudRNjYzP7
 C15HffgPgAsx5O6f7tjvGlQh/K+QAXI725rdCJkA3BXpxoRr7k5F9nm1eMXyU2MJ8T2f/GHhTMp
 jETKmTShKM3lKsVZdEw==
X-Proofpoint-ORIG-GUID: jrCzW0GHw3-lK6GBQ5AfJoQgebxachD7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXy44LbpoUOEVF
 p5xaYbI3BZgtge04GGi76UmCuL5FayJbNsoJfZg2Tl7WUWOkDsK9dHgsFsjGwj884BRM61whWIX
 6A7moUP0wSU1Qg7wmVLja/8UFTyZPKw=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb282 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n5AsotsA7IsgDgQ4TjYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

Register the add_connector topology callback with the DRM MST manager
to create DRM connectors dynamically for MST ports as they appear.

Each MST port is represented by a DRM connector. The connectors are
attached to all available MST stream encoders, allowing encoder
assignment to be determined dynamically rather than being permanently
associated with a specific stream.

This enables MST sink ports to be exposed as DRM connectors.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 242 ++++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 5d22aa34c521..a2900ff3b0ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -7,10 +7,20 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <linux/pm_runtime.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
 
+#define to_dp_mst_connector(x) \
+		container_of((x), struct msm_dp_mst_connector, connector)
+
+struct msm_dp_mst_connector {
+	struct drm_connector connector;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_mst *dp_mst;
+};
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -25,6 +35,237 @@ struct msm_dp_mst {
 	u32 max_streams;
 };
 
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+	kfree(mst_conn);
+}
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct device *dev = &dp_display->pdev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	if (!dp_display->mst_active)
+		return status;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	status = drm_dp_mst_detect_port(connector, ctx, &mst->mst_mgr,
+					mst_conn->mst_port);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	const struct drm_edid *drm_edid;
+	int rc;
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+
+	rc = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return rc;
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *dp_display;
+	int required_pbn;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_dp_mst_connector(connector);
+	mst_port = mst_conn->mst_port;
+	dp_display = mst_conn->dp_mst->msm_dp;
+
+	/* Use minimum possible bpp (6bpc RGB, 8b10b) to avoid rejecting modes
+	 * that would be feasible at the actual link bpp. mode_valid must not
+	 * depend on negotiated parameters.
+	 */
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
+
+	if (required_pbn > mst_port->full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+
+	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
+}
+
+static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
+					struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].stream_id;
+	}
+	return -1;
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *iter;
+	struct drm_connector_list_iter conn_iter;
+	u32 stream_mask = 0;
+	u32 i;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	if (conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	drm_connector_list_iter_begin(connector->dev, &conn_iter);
+	drm_for_each_connector_iter(iter, &conn_iter) {
+		struct drm_connector_state *peer_state;
+		int stream_id;
+
+		if (iter == connector ||
+		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
+		    to_dp_mst_connector(iter)->dp_mst != mst)
+			continue;
+
+		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
+		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
+			continue;
+
+		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
+		if (stream_id >= 0 && stream_id < mst->max_streams)
+			stream_mask |= BIT(stream_id);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!(stream_mask & BIT(i))) {
+			conn_state->best_encoder = mst->mst_encoders[i].enc;
+			return mst->mst_encoders[i].enc;
+		}
+	}
+
+	return NULL;
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+	struct drm_device *dev = mst->msm_dp->drm_dev;
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_connector *connector;
+	int rc, i;
+
+	mst_conn = kzalloc_obj(*mst_conn);
+	if (!mst_conn)
+		return NULL;
+
+	connector = &mst_conn->connector;
+	rc = drm_connector_dynamic_init(dev, connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc)
+		goto err_free;
+
+	mst_conn->dp_mst = mst;
+
+	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
+	connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
+		if (rc) {
+			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
+				mst->mst_encoders[i].enc->base.id,
+				connector->base.id, rc);
+			goto err_connector;
+		}
+	}
+
+	mst_conn->mst_port = port;
+	drm_dp_mst_get_port_malloc(port);
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.tile_property, 0);
+	drm_connector_set_path_property(connector, pathprop);
+
+	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
+		    connector->base.id, mst->max_streams);
+
+	return connector;
+
+err_connector:
+	drm_connector_cleanup(connector);
+err_free:
+	kfree(mst_conn);
+	return NULL;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
@@ -35,6 +276,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 	if (!mst)
 		return -ENOMEM;
 
+	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;

-- 
2.43.0

