Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454073;
	b=tMqQgWm2reMVwnfde9wiMHHNh/WtZ2DFOn7XcA78b8KtSv8/cdm/bHo2Qjf7Aw/n/jCc
	 3n6/d0qJ2aDWKZ1EQi2tpGauZtay0Y/dN68IpTdwrhgRrmI3IcwvXhCIw4S5Oa8D9Ylm7
	 YuRM4sSgPCJmWVFW7ZK7WRfslBvprHV3Ziy0L9mn0LT3xxjKpVLQQJ/uCALsJH5o2OncA
	 AtL3qoAoXS7WpOr0EbVnJm0Htyjwm0CM/itocC0oHVRIWOJk6FYcsOGYH9isor0Ejw+d+
	 PTGvMtOxmC+f0OqqhD/dbxm9oNHpS1o1awOQMkGtJqR5cwcQ9V7BJ7cwLXxWgBSqrYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
	b=ZQReUuMdnAMZhSARR1rw7ecJdmqbXc1XgVA7VNi6xxTF9bgSutw6g6t4IuIgnD+8pkGZ
	 +71kQ8l71OmQ9L0Ypjg7YLZRzJfjk5/DtR6J+6bqrpirUBwuEr0ycfikEWrDfX5oitMjl
	 Yu78Eiqq6BjszaRrP+5OXYRN7YvUMEyPObjvy5db9h0wb1eNq0iLoVmlQ1aEV8BjhHVjR
	 CoSVFl+QtWBREKbsXHq3brdiciXcpe8khWXtBfzVOb0cRCve0n0VS3Xfm3nWhIGMv+/S6
	 xFby8X2oh5nLI7X610rwtOtOD5GlZ8bIaWySPCD+HClovbE1IuWPHpmrQ50JoRk1kbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="juNq/kq3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chFZAVTh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107A1606A690
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107A1606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juNq/kq3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chFZAVTh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH4eM1093889
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BFs5eXxfxc5
	hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=; b=juNq/kq3v3/m83E684FI0cXBlc9
	EYxHFjBLjBIWDAg3NBHb+VClOhVOyb/+7WiBpF28scbJFskh3IrcOGQat/M6J7kk
	b3F6FtR18X0CE27YPOML+LYEpzERnzrXiMUG6PNOrqnloTUjLBgDn8Kn3/S+m57R
	QOTY2NMbbZiTphTmH2vPJWnM3076xdzxrI/E3FlLngSzbgKKh4uzUkXSyF/irpNj
	u4V/4+Tj2JXhdonk5D5M5hvH9hX/h4LAuABJvh09LokGdjb8SXP8oq1HfK99hdYd
	X8yGxPED8QdFhCgXZyHKIlfr0DQGNWAS0M0vxCb4xmsl8cusXFFjlqggqag==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0sfnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4d1e90b9eso28966667b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454071; x=1796058871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=chFZAVThSw5EUwjx7dUF0uRBOOpaWFbZNv8WqMIJlqnijT1nzTqCDiwA5F+D3u9t1R
         u+JTQDXAgMKQmjrr3rbxMHVD2fBI8WU6G3ME9ErWoMScEExMH/7xItzLQzsWF52Ht2yx
         JUWjmzZ/tA8TBzRHXZ+lxFaa4pucTOo1AtAzUOFA10fduuA7mn9bJjYnw6hoLcw/CP2M
         4KB0DNR+MBHC3qrArREfUpuTG2/IZEDXJu1PTXBpyqDa3g7xW2/Rx03nE7soOfee4Rdt
         jUf3VbXYza9QwR60ks0aJ3Uj8HVnRjHONWluk4jD4FGvopTMHPxy2IWMGTkLivdG09Ai
         mNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454071; x=1796058871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=cQFXhvytGmwCigQ1ZnfmLxczLfu/UDqC/M/WJKye74kh/uALtNU7t8msT6pbjd90Sy
         9TaUZTRi/SCcSKsGSGGELefsm2Gk6VUuYgOZM7+pUqeadfQabUrEohyn9XNGLGOaXsY1
         eHpB7LMYnmeVtBVE7YMJmTU+G6dhbC3hbi8S+sRk05KYoxBn6WrF96VlwjuSNT770414
         2LCGIe/k64EC6OuEG2vGuSxIsKLoKY61yC9sF0m2MI7uPeQUBygcW97GuBMF0W+zJnD4
         l6S27bevU+wi+M+yq1ehNiQRW8cJrhFX1WaDC6idIEncFf2cY3w9k9cVLtCoScy7KvwN
         bPlg==
X-Forwarded-Encrypted: i=1; AL+hErHoMJk55Yac+rMlilSmYClHCP8s504mOL+tlwbMDdfpHKLuOrXaupQ85J6lkc8SvcmDtvtSxRqjD4tnDuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8blri4iHgurIi736gl14gN1aKKWxuuw4NdkZB+g6vPE6bQlPx
	QLTbBQyKshiDz4BDIxNmzsCt698LseXqA7VIru00tr6HWvnlVNaIUsuGvt6nOx4xdkWNT31TNZo
	XUJ6RLC7gdMYdAr+YT36tOabGpPd0kqUX+nIIW2IBF39UdRH/RyzO67yXZwuW/Ih7r28=
X-Gm-Gg: AZFdTZflq0Q44VnWyNL24VurSOmbDRCrJ9L5wnR4E1aoEcylaK2wyv7QLu+Pzvyv4ru
	XGGirSEup0lx7t1V0gi9Mqhq2ZnDB3VlxDLu9CLqqnJiQeDzjFYCvs+4S5wes0R54d0xqgVMrfh
	R0sa9aCrNjoKNWuCgwKWVdypEO9FXyC1X9pMNTED6oyvnB6cS3eA/CDgmYAcd7NvumdpNExw3wE
	WPCG1rtZ3d+3bUpng7DcsiUWk3t0XzGAKsLdWDYX5e7+1Syf2z9xqPjdCPvHimMekJvFJLqUNfi
	OauIH7Y0VKeMX0UVfH8N6YOLHODTSebJLRDcSPlBSUml9ddgL/I5VGDYiSlAAdmHCKQPcEbQjwv
	vFZ5Lq4iLOjmDld4K+98PuuILxjuD5f1eGRoe+q3qg45KwfY7Ctrq6oPy0PCEAosM
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273317b3.52.1795454071562;
        Mon, 23 Nov 2026 09:14:31 -0800 (PST)
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273187b3.52.1795454070951;
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soundwire: qcom: program MM_SYNC for multi-master
Date: Mon, 23 Nov 2026 17:14:11 +0000
Message-ID: <20261123171411.444381-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -ureE0LCD9kG6xk8tr_9GrAl9Bwj84pF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX0bxnq4bW8frG
 gFjItZyrC/GrpD8olamCKQGW15anJQTC/mN7qX7iBKp/HtEBwpoEaTvOuEd9YSZz0iYqd2YJv4F
 Xrx1j3aPyRAiuparPvuAa8eGRcyL8vs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXy2nBENgJwGhd
 /0Lv7uL4cX8vTz6WIwQ6vCoYNvj0Rm4lyfGogEU6+2rx0u+5+yqyOGHWZntLaqQ8gYsPt/fFjTv
 cNP57PcHLVV6wJUYYa3j8nlZQVIwFxOixWPqvyXULllGmMP8XczCu1SITcHtJjCfGrCCKbZkiGE
 An4a4LPLxeGsZGw2qkz6cIItPm+ZnF7vpH+RLyzhSkd/aNwXywAkHBH8GUr7db4f87vNQbe8AUY
 9lCrGqeQ+FeysDsiuVHkrGCj6NsDBD4AXvYAqs/BboVLK7L6H3Qk09r6gOBj8EkJadh+ZIZy/Yc
 3kO7KHE42GOzYWGRrMEShgPDlGA/ecCzNtCgYdCnU0SFlYkW4JMzFcoXNV3/xyiXJg7cT8TDkBk
 AMjA7PKuxXZJlU+MQ8VMc4Yv1K2M30XZeTfflNoSdljoAtT9aB9ClmE4zdqN3r3Ox1/4zBO48zb
 KJK16B6utYsQ4hVRV0A==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b047478 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=c7LmfZLfTtV-q45nPo4A:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: -ureE0LCD9kG6xk8tr_9GrAl9Bwj84pF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

The primary and dependent frame generators must lock to a single
SWR_CLK for the shared bus to run. Program SWRM_V3_MM_SYNC_CONFIG
on both sides at init, and re-apply on resume as the register does
not survive a clock stop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 396b57d8eb0e..20c805204de5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -48,6 +48,18 @@
 #define SWRM_V3_COMP_PARAMS_RD_FIFO_DEPTH			GENMASK(23, 18)
 
 #define SWRM_COMP_MASTER_ID					0x104
+
+#define SWRM_V3_MM_SYNC_CONFIG					0x108
+#define SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK			GENMASK(15, 0)
+#define SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER			BIT(16)
+#define SWRM_V3_MM_SYNC_MASK_CONTROL_BITS			BIT(17)
+
+#define SWRM_V3_COMP_FEATURE_CFG				0x10
+#define  SWRM_V3_COMP_FEATURE_CFG_BASE				0x00E
+#define  SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN			BIT(9)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL			BIT(10)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE	BIT(12)
+
 #define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_V2_0_INTERRUPT_STATUS				0x5000
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
@@ -949,6 +961,43 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
 	return false;
 }
 
+static void qcom_swrm_program_mm_sync(struct qcom_swrm_ctrl *ctrl)
+{
+	struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+	u32 conn_mask;
+
+	if (!peer)
+		return;
+
+	if (peer->bus.controller_id < 1) {
+		dev_warn_once(ctrl->dev,
+			      "multi-master peer has no qcom,controller-id; MM_SYNC skipped\n");
+		return;
+	}
+
+	conn_mask = BIT(peer->bus.controller_id - 1) &
+		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;
+
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY) {
+		ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG, conn_mask);
+		ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+				SWRM_V3_COMP_FEATURE_CFG_BASE |
+				SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+		return;
+	}
+
+	ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG,
+			SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER |
+			SWRM_V3_MM_SYNC_MASK_CONTROL_BITS | conn_mask);
+
+	ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+			SWRM_V3_COMP_FEATURE_CFG_BASE |
+			SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+			SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+}
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -977,6 +1026,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	qcom_swrm_program_mm_sync(ctrl);
+
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
@@ -2059,6 +2110,11 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
+		qcom_swrm_program_mm_sync(ctrl);
+		/* dependent was resumed first via the device link */
+		if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl)
+			qcom_swrm_program_mm_sync(ctrl->peer_ctrl);
+
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-- 
2.53.0

