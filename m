Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674631;
	b=yhPw5VqMgW7Uvz2zk5Ory5EJ4JoTs4uPkUQ24Od7cVH5XcK2uktjc72SQ4mq1RIv/QKA
	 qaTlAj5BXfgHvK8OqyWpXSgP/E1SWuX5x2YJYKrjoZxosa3dQjs7qMW72PUYt84jJ8Jv5
	 63a2TNJMK2eiD0BgLB2Uwol5agENMme2hqlVD8YF8dcfdJe/LbzAYm2aCiwKfM3n9sEDm
	 3x1gWBjSd66SDrbCJ8iGlJi/c8PC5AY+yZgMZmJSrvbRIL0evRWB3/cn44YpRXepAwqC3
	 hZBStsWOO0t4BEtyR9XhJdWkDMiTRfSiR1hf8tP4jtBfXufXxYbhbzvzzw+1m76gk3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=;
	b=frEMz92zJpExgatbhEh+dVmSIvPD16MWCWmsevqQ/SetIuNEWnc2chPIKKsppp6jnoc5
	 m3K+apBk+aYGnJHaZo5TwZc3+aUID0FBVtSrldKjEOpqVZbYX3ie07DTV75hYJnfkTXlx
	 PKv7KoLDdk6WCzy8n6fMuiMHdNCYTCNWTVwc8syqWX4Q3CbGSVHZFDJbJNXYnlxH8KZyD
	 TNHFxwu+LRoZBh7RfN9PQMTLZOvZtrVQmOj3BxG51Pn0DtjpruPe8++F5O05pjnC9Hw1I
	 lQjTOM2kj55LrW/VIGzejxpnJCXl8bjIj72zsVyvWgcjsufAOLjnWQs/ZMNNBCmSkvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kujeYA5m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIKMe6Qn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE7606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFE7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kujeYA5m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIKMe6Qn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36e1n170250
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=; b=kujeYA5mM7NFaQlD
	KH8i76l6iU0uQT+Jo5qIITi18WJMY5DCCmNWMW2iCf5rmUaUMElwmFilhAwk4ltl
	FMvA9WGrpHzVBJlsvZG78t02IYPHqHp3Huytvw9snHhwN5WuFhhg+LTphFzo7hBk
	5rkqlJT2l4WKka1TRxcztnCV0qCctbEXzyP4+jfcm+kfvMl0PSPtnyfWA6IlBfTo
	vDy+/JoaAt6dKIFJJKAHjorhzOiKlu1OyEqUGft+75c44Lne2CNe7dhW2+yi4FzI
	z3VGZc4sChgd1nc28UK2r60lS8fYi73V4DJaGY3a0HODX34sFw+Fi/z9T10F0wZC
	Z4Z4Ug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukv98x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:30:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2edd25534afso55783845ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674628; x=1796279428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=;
        b=jIKMe6QnrSsme0wBtCDO4KiHWwojfwXs1c0LxblNEbx30qJCBE2r27A8dNzgoCeHYW
         iDR+bjXd3lh+AvRW7spSgARkifICjLPK7AjT8+2lLZlwwC4G/y3kaRSyQ9liR5oUgHO2
         LR44lGn3G22k/78daNqZcHtOZVE2OVFaaxxl0K7OJ6duXrVQ6aIruj7WHYUa2rU0kBYk
         YNSk1IXZ2iWSf5NsOtKATrOOC3x1Rn608hnT6m1q06hpGyBwC6Okzy+NeQuGAO6DGBKq
         aCx2vvTMYDws9kVq0jX2HJD4cgPLrZPmPeSEozdj5F/eQXQkUsW+k3NdShmLOQfqUnNr
         dc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674628; x=1796279428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=;
        b=wKVu86QLDQkZmOpaJtg2MfwYXxlFy45UcCpZK0f2iorLnkOB4t8cPEHzVzdGHCJYj4
         POWs73AretigGpRBYu+dovLC+Sr0LbZ/e8Bxlnso3ZUCrf02y/Q3VfRu+14xQ+ZB7tRm
         e1utBqVDpn3ixanqSYBLpFs03mkN9fKKCzm7rlukqqn4OXZTdBxVpddT2WbHX+R7mdsd
         peN3MKuerXYnI5TaefxArhLSVkcA0FKdT23plVY0dvBKvgV2hDAZLHe6ytG4bTsagd9n
         /S80MGe3TriKMKYpGCa5fHmrZCyibsSinY7CY/0PyIGdyiM6YS2rXNNaS2ep5JsYDvz6
         MgGg==
X-Forwarded-Encrypted: i=1; AL+hErF+GZp7PLo4ccH9U4fATplxq0dKtTVTgg1AAeTh3utJmUhkuwqWnuBlea0QdCHOBiQyL46HJmXRRSv/7ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z4EfHE+TZ20rKPl0+vKUANizpMojC9wjGLYtNFtT/xUIauW5r
	E2hMpa321dvdpUx8Eiu+wKdjg69U1dfmVPvlAlA3XOd7kqRxsvRjlf0Dn4DpFF/+dTBAMRhR2zL
	WcTdKhEtHa1cHzg2Ot+LyFa17lv/7iM2UoqHrq77OAqdp+PJbflNYGzuCi/UrnKhG0gc=
X-Gm-Gg: AZFdTZfvHqPKckAzZtFpZ+2P74QGWM046QhO5v3UkGid1vCXwdsPtX7vu/djk9DLEFw
	YWsB7E7hwJpKRVPY/3fYppnFquwcXSuCyeY+llJEX4WKIS1NWP9faqUISHi6VGzIsfHv9spLdak
	wfPCy0rwBr2glEakBGEch75s/3keRPXuC6U202KOV74FcP1E5lrK2F1mtTqbjp3/3FRK41BZkZU
	IOKsYXBXVfPWfI+orGYUlcTsVbkjkG4t3/NQe/tgWM9A0V/VFj2hqg9wp0uQ0lFej7N2USDfsGG
	HdIuj1eLFry40AiwuRhvqMZVXnoW2pJOjvmWPg4M8DFBtWSaALJ0Y4tf6uHI/DUH90uN4gj7HiI
	W/5MmOEvC4wEAelg4lX27ghMFoNSbrJbfT8Q4UkP2bOgpXiXTGTH9Ktk7AzMzAvSciUFQdjjad2
	Q6ih2QHl/Y
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr200897805ad.54.1795674627242;
        Wed, 25 Nov 2026 22:30:27 -0800 (PST)
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr200897475ad.54.1795674626705;
        Wed, 25 Nov 2026 22:30:26 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:30:26 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:15 +0530
Subject: [PATCH v3 07/21] drm/msm/dcp: Handle asynchronous HFI responses
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-jshekhar-v3-dcp-v3-7-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=13639;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=LBsHeuV6bgv/pBpJy3SD2kKtIvR3zofMrxf2Y7qPd/o=;
 b=UONHsd8o0l7P1cL6iaNhwt6mNDJufolOWKuQNXurN+uwvrMryR0Vz/qYPSoWdiMhFIX/qBIan
 3sZLAA+i305D7OjCgRu+ZB57mq1b/8aSHFxVldQAskZKswiAjZR45Wq
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07d204 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V-hixniTzbwhkIHIihYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DCJyTtujjs7uZg0ADFoUQgwq7yLjgI2z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx6q+RJAYrwVS
 v3Ih77tTheqSgKZyhzKiK9WjMA3e0WwBT7TeDbjIZLX+s14rbj3fkPFx31J6e7wzZ5J6uuIIeDk
 AtDSq4F9YJB6uOIM31G1tdQ54gZaYqM=
X-Proofpoint-GUID: DCJyTtujjs7uZg0ADFoUQgwq7yLjgI2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX2+aAOHTisRjV
 d3h6u8kU2m5wsjal6YKG1GDgwlF2wUameLcuxqxaaWQ97LGWv6qfRzylSmjhGPL0elTg4nd9Mn4
 GGdIEAz3UyzfTjsFcPQACx9A5yzKRxV4V7zyiSisCqpJ177GPmJZTa32EbXEFx8L11ksrOcxVud
 0SWvkmkUt+yVmNsIGc3Vxm1/AVE4DQhqosOVpyOW0hDkQDgiSK78+fNnUQPpr+yTdlBPRZkScXP
 Xj24bugp6+3/n6jPplWgWmpRSyG7kBYlYlYFI0t2LqKfBrkiOG31oWWSctX/3V2llnYErqrIj43
 crBeXIom+3BOlgr8NS5B/fLfFt7N8BX9IWYZDoC95gUlDjjRrP4B+xYacdJgpUMmNnKz+l66qmq
 wv/6DzSJ5NpL64dQrxL5SOeO3RFisaEx9uXMN3B/kfEdarYcrh6hlMFF78k0yxu2Lg8nsxDhNDE
 MGrRXiPMWvUauIbbzVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Handle HFI messages that are not synchronous command
completions. Capability discovery, resource voting, and display power
control produce asynchronous responses that must not be mistaken for
ordinary command replies.

Dispatch display events, cache capability payloads, deliver
power-control notifications, and defer resource-vote processing while
preserving the existing completion path for synchronous commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_hfi.h      |  41 ++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c | 245 +++++++++++++++++++++++++++++++++
 2 files changed, 286 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi.h b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
index 9c80e38aa96f..6ea2969e5d89 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
@@ -19,11 +19,24 @@
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_pack_unpack_common.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
+#include "hfi/hfi_commands_device.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_panel.h"
+#include "hfi/hfi_commands_display_events.h"
 #include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
+#include "hfi/hfi_defs_device.h"
+#include "hfi/hfi_defs_panel.h"
+#include "hfi/hfi_properties_device.h"
+#include "hfi/hfi_properties_display.h"
+#include "hfi/hfi_properties_panel.h"
 
 struct dcp_drv;
 
@@ -35,6 +48,19 @@ struct dcp_drv;
 #define DCP_MAX_DISPLAYS	4
 #define DCP_HFI_CAPS_BUF_SIZE	4096
 
+#define DCP_HFI_RESOURCE_VOTE_BUF_SIZE	256
+
+/* Wire-format resource vote entry. */
+struct dcp_resource_vote_pair {
+	u32 key;
+	u64 value;
+};
+
+struct dcp_resource_vote_wire {
+	__le32 key;
+	__le64 value;
+} __packed;
+
 struct dcp_hfi_caps_cache {
 	struct completion device_done;
 	struct completion display_done;
@@ -135,6 +161,21 @@ struct dcp_hfi {
 	atomic_t packet_id;
 	/* Blocks new work once transport teardown begins. */
 	atomic_t shutdown_in_progress;
+	struct work_struct resource_vote_work;
+	/* Protects resource_vote_buf, resource_vote_len, and callback state. */
+	spinlock_t resource_vote_lock;
+	u8 resource_vote_buf[DCP_HFI_RESOURCE_VOTE_BUF_SIZE];
+	u32 resource_vote_len;
+	u32 resource_vote_generation;
+	void (*resource_vote_cb)(struct dcp_drv *drv,
+				 const struct dcp_resource_vote_pair *pairs,
+				 u32 count);
+	/* Protects capability payload buffers during event delivery. */
+	spinlock_t caps_lock;
+	/* Serializes capability transactions. */
+	struct mutex caps_cache_lock;
+	struct dcp_hfi_caps_cache caps_cache;
+
 };
 
 int dcp_hfi_init(struct dcp_drv *drv, struct virtio_device *vdev,
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
index 9c46a4560a0d..1a1addd33877 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 #include <linux/slab.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -21,9 +22,13 @@
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
+#include "hfi/hfi_commands_device.h"
 #include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_display_events.h"
 #include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
 
+static void dcp_hfi_resource_vote_work(struct work_struct *work);
 static int dcp_hfi_prepost_resp_bufs(struct dcp_hfi *hfi);
 
 u32 dcp_hfi_next_packet_id(struct dcp_hfi *hfi)
@@ -228,6 +233,191 @@ void dcp_hfi_cmd_callback(struct virtqueue *vq)
 	spin_unlock_irqrestore(&hfi->cmd_lock, flags);
 }
 
+static void dcp_hfi_store_caps_payload(struct dcp_hfi *hfi,
+				       struct completion *done,
+				       u8 *dst, u32 *dst_len,
+				       const struct hfi_packet_info *pkt_info,
+				       const char *name)
+{
+	u32 n;
+
+	if (!pkt_info->payload_ptr || !pkt_info->payload_size) {
+		dev_dbg(hfi->dev, "%s: empty payload\n", name);
+		return;
+	}
+
+	if (pkt_info->payload_size > DCP_HFI_CAPS_BUF_SIZE) {
+		dev_warn(hfi->dev, "%s: payload too large: %u\n",
+			 name, pkt_info->payload_size);
+		return;
+	}
+
+	n = pkt_info->payload_size;
+	memcpy(dst, pkt_info->payload_ptr, n);
+	*dst_len = n;
+	if (done)
+		complete(done);
+	dev_dbg(hfi->dev, "%s: stored %u bytes\n", name, n);
+}
+
+/* Route asynchronous events and capability packets before flag handling. */
+static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
+				   const struct hfi_packet_info *pkt_info)
+{
+	switch (pkt_info->cmd) {
+	case HFI_COMMAND_DISPLAY_EVENT_VSYNC: {
+		return true;
+	}
+
+	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_START:
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_COMPLETE:
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS:
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_PANEL_DEAD:
+		dev_err(hfi->dev,
+			"DCP: panel dead display %u\n",
+			pkt_info->id & 0xFFFF);
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_HW_RECOVERY:
+		dev_err(hfi->dev,
+			"DCP: HW recovery display %u\n",
+			pkt_info->id & 0xFFFF);
+		return true;
+
+	case HFI_COMMAND_DEVICE_INIT_DEVICE_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, &hfi->caps_cache.device_done,
+					   hfi->caps_cache.device_buf,
+					   &hfi->caps_cache.device_len,
+					   pkt_info, "DEVICE_INIT_DEVICE_CAPS");
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DISPLAY_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, &hfi->caps_cache.display_done,
+					   hfi->caps_cache.display_buf,
+					   &hfi->caps_cache.display_len,
+					   pkt_info, "DEVICE_INIT_DISPLAY_CAPS");
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_VIG_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.vig_buf,
+					   &hfi->caps_cache.vig_len,
+					   pkt_info, "VIG_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(0);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DMA_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.dma_buf,
+					   &hfi->caps_cache.dma_len,
+					   pkt_info, "DMA_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(1);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_VIG_R1_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.vig_r1_buf,
+					   &hfi->caps_cache.vig_r1_len,
+					   pkt_info, "VIG_R1_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(2);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DMA_R1_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.dma_r1_buf,
+					   &hfi->caps_cache.dma_r1_len,
+					   pkt_info, "DMA_R1_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(3);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_COMMON_LAYER_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		hfi->caps_cache.pipe_caps_received |= BIT(4);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		dev_dbg(hfi->dev,
+			"COMMON_LAYER_CAPS: received (size=%u)\n",
+			pkt_info->payload_size);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DISPLAY_WB_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		hfi->caps_cache.pipe_caps_received |= BIT(5);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		dev_dbg(hfi->dev,
+			"DISPLAY_WB_CAPS: received (size=%u) — all pipe caps received\n",
+			pkt_info->payload_size);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_CALLBACK_RESOURCE_VOTE: {
+		unsigned long vote_flags;
+		u32 payload_size = pkt_info->payload_size;
+		bool valid = pkt_info->payload_ptr && payload_size &&
+			payload_size <= DCP_HFI_RESOURCE_VOTE_BUF_SIZE &&
+			payload_size % sizeof(struct dcp_resource_vote_wire) == 0;
+
+		if (!valid) {
+			dev_warn_ratelimited(hfi->dev,
+					     "dropping malformed RESOURCE_VOTE payload size=%u max=%u\n",
+					     payload_size, DCP_HFI_RESOURCE_VOTE_BUF_SIZE);
+			payload_size = 0;
+		}
+
+		spin_lock_irqsave(&hfi->resource_vote_lock, vote_flags);
+		if (payload_size)
+			memcpy(hfi->resource_vote_buf, pkt_info->payload_ptr,
+			       payload_size);
+		hfi->resource_vote_len = payload_size;
+		hfi->resource_vote_generation++;
+		spin_unlock_irqrestore(&hfi->resource_vote_lock, vote_flags);
+
+		if (payload_size)
+			schedule_work(&hfi->resource_vote_work);
+		return true;
+	}
+
+	default:
+		return false;
+	}
+}
+
 void dcp_hfi_resp_callback(struct virtqueue *vq)
 {
 	struct dcp_drv *drv = vq->vdev->priv;
@@ -298,6 +488,8 @@ void dcp_hfi_resp_callback(struct virtqueue *vq)
 						"HFI error: cmd=0x%x pkt_id=%u\n",
 						pkt_info.cmd, pkt_info.packet_id);
 					dcp_hfi_complete_pending(hfi, &pkt_info, -EIO);
+				} else if (dcp_hfi_dispatch_event(hfi, &pkt_info)) {
+					/* Event dispatch runs before flag handling. */
 				} else if (pkt_info.flags & HFI_RX_FLAGS_SUCCESS) {
 					if (pkt_info.flags & HFI_RX_FLAGS_INFORMATION)
 						dev_dbg(hfi->dev,
@@ -642,6 +834,47 @@ int dcp_hfi_send_no_wait(struct dcp_hfi *hfi,
 			payload_type, payload, payload_size, HFI_TX_FLAGS_NONE);
 }
 
+static void dcp_hfi_resource_vote_work(struct work_struct *work)
+{
+	struct dcp_hfi *hfi = container_of(work, struct dcp_hfi,
+					     resource_vote_work);
+	u8 buf[DCP_HFI_RESOURCE_VOTE_BUF_SIZE];
+	struct dcp_resource_vote_pair pairs[DCP_HFI_RESOURCE_VOTE_BUF_SIZE /
+							 sizeof(struct dcp_resource_vote_wire)];
+	const struct dcp_resource_vote_wire *wire;
+	u32 len, generation, count, i;
+	bool dirty;
+	unsigned long flags;
+
+	do {
+		spin_lock_irqsave(&hfi->resource_vote_lock, flags);
+		len = hfi->resource_vote_len;
+		generation = hfi->resource_vote_generation;
+		if (len)
+			memcpy(buf, hfi->resource_vote_buf, len);
+		spin_unlock_irqrestore(&hfi->resource_vote_lock, flags);
+
+		if (!len || !hfi->resource_vote_cb)
+			return;
+		if (len % sizeof(struct dcp_resource_vote_wire)) {
+			dev_warn_ratelimited(hfi->dev,
+					     "dropping malformed RESOURCE_VOTE size=%u\n", len);
+			return;
+		}
+		count = len / sizeof(struct dcp_resource_vote_wire);
+		wire = (const struct dcp_resource_vote_wire *)buf;
+		for (i = 0; i < count; i++) {
+			pairs[i].key = le32_to_cpu(wire[i].key);
+			pairs[i].value = get_unaligned_le64(&wire[i].value);
+		}
+
+		hfi->resource_vote_cb(hfi->drv, pairs, count);
+		spin_lock_irqsave(&hfi->resource_vote_lock, flags);
+		dirty = generation != hfi->resource_vote_generation;
+		spin_unlock_irqrestore(&hfi->resource_vote_lock, flags);
+	} while (dirty);
+}
+
 static void dcp_hfi_free_pool(struct dcp_hfi *hfi, struct dcp_hfi_buf *pool,
 			      u32 count)
 {
@@ -729,7 +962,10 @@ int dcp_hfi_init(struct dcp_drv *drv,
 
 	spin_lock_init(&hfi->cmd_lock);
 	spin_lock_init(&hfi->pending_lock);
+	spin_lock_init(&hfi->resource_vote_lock);
 	spin_lock_init(&hfi->resp_drain_lock);
+	spin_lock_init(&hfi->caps_lock);
+	mutex_init(&hfi->caps_cache_lock);
 
 	atomic_set(&hfi->packet_id, 0);
 	atomic_set(&hfi->shutdown_in_progress, 0);
@@ -738,8 +974,11 @@ int dcp_hfi_init(struct dcp_drv *drv,
 
 	xa_init(&hfi->pending_xa);
 
+	INIT_WORK(&hfi->resource_vote_work, dcp_hfi_resource_vote_work);
 	INIT_DELAYED_WORK(&hfi->resp_repost_work, dcp_hfi_resp_repost_work);
 	INIT_LIST_HEAD(&hfi->resp_repost_list);
+	hfi->resource_vote_len = 0;
+	hfi->resource_vote_generation = 0;
 
 	hfi->cmd_pool = devm_kcalloc(hfi->dev, DCP_HFI_CMD_POOL_SIZE,
 				     sizeof(*hfi->cmd_pool), GFP_KERNEL);
@@ -787,6 +1026,7 @@ int dcp_hfi_init(struct dcp_drv *drv,
 
 err:
 	atomic_set(&hfi->shutdown_in_progress, 1);
+	cancel_work_sync(&hfi->resource_vote_work);
 	cancel_delayed_work_sync(&hfi->resp_repost_work);
 	while (virtqueue_detach_unused_buf(hfi->cmd_vq))
 		;
@@ -807,6 +1047,7 @@ void dcp_hfi_stop(struct dcp_hfi *hfi)
 	atomic_set(&hfi->shutdown_in_progress, 1);
 	spin_unlock_irqrestore(&hfi->cmd_lock, flags);
 
+	cancel_work_sync(&hfi->resource_vote_work);
 	cancel_delayed_work_sync(&hfi->resp_repost_work);
 	dcp_hfi_cancel_pending(hfi, -ENODEV);
 }
@@ -864,6 +1105,10 @@ int dcp_hfi_restore_queues(struct dcp_hfi *hfi, struct virtqueue *cmd_vq,
 
 void dcp_hfi_deinit(struct dcp_hfi *hfi)
 {
+	mutex_lock(&hfi->caps_cache_lock);
+	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
+	mutex_unlock(&hfi->caps_cache_lock);
+
 	xa_destroy(&hfi->pending_xa);
 
 	dcp_hfi_free_pool(hfi, hfi->cmd_pool, DCP_HFI_CMD_POOL_SIZE);

-- 
2.43.0

