Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218315;
	b=IU2DpeZzJDouE0sLwVJAiEpbLeMVk3N5CF8Xg+XWzF9X2+xeF9c1Sw3YNU6QanioLEJs
	 W+gnuinGg/hqTmwu4Z1mZ9iyYMEko6zvyRrsWgCsplA2C+XaYGUKgx3sxrOwDcTuOiASX
	 kPXGlNHN6R2OW3In5NaWiogyIw2kHLtXnEXQC+sa3MxU0soTbLf2lvTh6Jm7MCugmnDzK
	 sdU7PutDfHZ0fFYmjSj0Rm9pEoGezScR2REkLu73OLTZbwqQ0hPVKsWNfOPlV8+Pra75b
	 WaOyIl46IHtjTa+cmjKIRSVkqwIO1+PpaAbPac7dOAcbQCW9WIwD+ywxTB82UzaiQcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
	b=CvLY24+Dzx3WkfNpveoJUk9Dn6tuK6HFT3BltCsfSXSs7vSkFqCe7CUSKd9GVPXVbMsC
	 IYSY8C0WD54tIJWfdbz1TNsjLHwFkr9ruezNUA1hEQsx4QMAXhHjVB7WWbd/B+9ZjR/eN
	 +zUR6eh0x9Js6d/trwN0PyIDyIsmef/lloS3EZW7Ui5yqdfD+vlyldlveyCxB+g5agKQt
	 fq3SmrAWTrrt5sK5XyLqvnOsegNIkyC5QGVvJxUZqDyKsFjouVOjK9MtiEcFxerqcekfK
	 hBCPIa12BjC+uwBoWqNU1CQTM+pbWPjddK2OlyOQ79I7ym+8OLwwReYE6R+QraUJ46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O25vZfSa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToJ1zcvq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B212606A6B1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B212606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O25vZfSa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToJ1zcvq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKJlFQC3619413
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=; b=O25vZfSaUb7aiZDF
	GFY3BPqk56ykBYCj0q3JgtlXszyQjbcELsylZjCqL7OQM27YUEr1qllcjdJyvHQs
	YeOD9ceODeTrYBucdcmEals7dk2FN3BWoc1xVeIuUOxjydO9E3LYeKomyfZAsMW4
	BXxKpr6Pu3fBPam8HctmIpa2YiLebTAvwBoQA06b+x9e6rDGSDf5TpnkIrGsUlJz
	/gOzaj/V9oX2iIcgOmrQQMRIMQFPfqnd8hlQ/B1xbkl6x4jBImX6u22vdQvC5uUr
	3HrI3zGfKRArXn9Ir2JtBlfIpFZNxJs+5bJYZZuvCaiVzNHmgEbNAiJZklR6nFXM
	Dr57ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2vnx0pb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:45:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso177976eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218310; x=1795823110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=ToJ1zcvq/43kYTEzeipivKbHc8PxTsr/bjCX40PfUcgJVu0H4Qev2A831XfyJGwf7n
         UpaD+w9qSqRb+3ICTq+DKcgb8YzfjZ1z/GFLnPPcppmMBA5HCRidXljy4XVo1M3Lpipv
         X0S/PaSpQw2FDeFCmBmIJ/9DmfvEjajtHyTSHsNXwe0NUeuJK5+hK3RNiuDG2eiosEkP
         2WFgWL8dhkBrCS65DrjwzFz0kOzQ7VR74GmoJH0GZPvsBJXhkFIAKI8x55+L9RtgiKZ2
         7hoptAhn/nkle6j6Z89qz060WoXlAlQxmLaUry5Y58Vc+cRIhoi0z1E5eh7WRhdSWO5S
         bBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218310; x=1795823110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=lab8jAnXbDBC8YWZxZKkFn4ShIb1wH8qUqAEFN9t20Z4aB3vm1mo9o26cDvMETrYar
         5R/nbZhUFeV/3O7P6TjyIxyLipx94SKQx4ylMuTkWBZUpzfk5cRvqa/zhkHhIA7uKKTY
         dBsE/b5AXVGvjx8+pO1VOggivV89kJNy2eUjl7WF5fU7aNjsanfT5lL06ydH+QVaCdES
         e4PeOIqjh9dRfxYvg6d9JWDrKgDqWgcLVb41mKTmrw9cytrgN7ncVIBIl6AnQhJyoz2q
         /QwpLYuoiQJUH2HemAainWUumowNa1tqDWB4akFURImkvAt4hAXU2Ep86KGnept0P+AL
         AcXA==
X-Forwarded-Encrypted: i=1; AL+hErGhw8vbCHD1bDTDYwxJQZj95FansGe0vHhaI71UOkofo5HRU7hB39kqFEAGqm6tuJpTCH0K4ppltzB5bTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E7uE1PD+tqrQBO5wIeapxhVRg6rhArxhQ6W1eKiTfgpbJvFx2
	n7KxXzZfqSqHKXpprTIC6bpaZNmGPa90djUJbxWGC0J4nDnUVS81IcCpy0R7+tf6Zqrx3iMshNH
	NDjX3N1n3GxzJKouFVfKRoV7CR679ENUp/bkI3ZGDF3rPGoQaNa+3UWHYhNcdurUNc6f7S/rPp0
	0=
X-Gm-Gg: AZFdTZcMx6bm4vB99oHLP0wLHEayEnmBFSqX4B34qsYurbnPDSMWpcqXWZWlujT04WD
	DKKm4prAMfdhpus2B1wHW43xInjNcu0EZR7grIJkyN5X9ZDhcCHGO+bxOJ0sc9PrSS5FssVDbyY
	aL/M4Z5q8u0jwTptXHSpNF9juuKf1JHZhqACZOIbMiDjmf8FLIvLW+/mW4Xz17LYlZHcc8SAYqC
	YsmmXjrF4GRMRxqKk72cgJFuJVbt04D63/9elkVTqhDJHehpnGpmFlZF0Wdw2iBzJzIHTtTzO31
	isb1eWrR1dYM8SXBl3XUOdSKwxSCYy7rJwKpVGLUcmeoRtK8NW7kQXh8fIMaC8oGuYN3Wt9aJm4
	CvVgqbnwcxczibkQYOb/MKMNX0PAQ0UXLgAjTGlUnQu7ZE96pwLsstbS8Dl9GbPN96iFehN1Y7i
	zrjcpVLWDoiiasabjjwiNFtpgygn9f5n6GIQ==
X-Received: by 2002:a05:7301:d80e:10b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3856925c041mr5776480eec.0.1795218309332;
        Fri, 20 Nov 2026 15:45:09 -0800 (PST)
X-Received: by 2002:a05:7301:d80e:10b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3856925c041mr5776432eec.0.1795218308609;
        Fri, 20 Nov 2026 15:45:08 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:08 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:04 -0800
Subject: [PATCH v11 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
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
Message-Id: <20261120-enc_roi_enable-v11-3-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=7490;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
 b=Q4dbCn8Rp3NpRNWoJ3qop3h9X4h0TDvqWWUvAhRLMX6tS9l4n7tfFUeZIYkm0o+hwZzSDyttZ
 JAWfTwpLSSCBYGkR+JExGP0NzDiuzqPNRhmmVKWudaCmR54FjHtQgnY
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfXyc9qUxfhD8nr
 CkqfaMhI3uuqOC7tuAbpljVNz18b/yio+W6wcCFnacC/JXWkBj4jRt8MZST0/4uiE57jeM2wbx6
 CY8Kdp4YkVHIDXx7Am6qF0KntqUSboNqtVO9FnIJFUl1xNNatYDPylGNu9Iw0akOfDsiCEMF2nx
 iYEgUBw9CrIa3YKEqln5EtU64J8+1a6EzJO2kqToW6IhT/p31Z5EjHJPhqBydEy0i3usi1QNPba
 9K7cd7J5R2kj3IqeNdTwTKRd8m+PEFPlWpdYefrW2GRH1WjXtu2SWTouyIXidd4kppah0/OXcwM
 AHxTkwno10/ySF7MGVdS+k4TXgL/RRDNgOvHI+elAPS0mJOzIDTY/noznkI+0e5W4+yArUHLYtF
 IZFgpqm6+y724Z9QQUBbxvaQqqfIx4UkJKjICLLvzFZmsYEFoh1HDzzcPDnRilAmckZ0hF9iHR4
 rLMbzde63GSWuMbXA+w==
X-Authority-Analysis: v=2.4 cv=SbRi5fRu c=1 sm=1 tr=0 ts=6b00db86 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: WijsIIVqyEy8kX-jaq72n5D4uvD67rsN
X-Proofpoint-GUID: WijsIIVqyEy8kX-jaq72n5D4uvD67rsN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX+nr92vtujn1q
 aCVtqvk452JYbcmInqzNSdWOQ3UAIBlAO+Tx1hMmxE9iTTvN7/p6cDHW1GeC5yPW181hCbkoLQI
 B9+CFtwVj/09V1zbWN+a4IQP2AuSzDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200094

Add ROI support to the Iris encoder driver for HFI Gen2 based targets.

- Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
  platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
  p_array and elems fields to hold a pointer to the per-frame
  delta QP array and its element count, set during s_ctrl.
- Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
  array control (max dims = 139264 entries, supporting resolution of
  8192x4352 at 16x16 MB granularity).
  Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
  control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
- Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f81f080ffbe91569d38e954ad15a1..d97fe50d48860b0f26b71d328a704f3804b1d93d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -340,6 +348,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -348,8 +364,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -374,7 +435,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -392,6 +453,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2be11582a6b81da3104b6273f7250..0f4c6f955f4f408c45c50796332b47c116f52982 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1815,6 +1815,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9bc4d611fc9251c95762316a21062..2394213d8272b53bf6a1cff9574dc93f6830fc8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -135,6 +135,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375abc6f803f98272619ecde8ea7873..72a7bd5a7570f53a73037d49736e95664af180a5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -222,6 +224,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -231,6 +234,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);

-- 
2.34.1

