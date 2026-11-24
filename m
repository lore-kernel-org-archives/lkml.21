Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538867;
	b=ctViK6TT+yqw5g84NSFRUm5HHPcSIyizAj3pZOxLFtcXGkHNPW1sFItgB7V4IUIpimPa
	 CHTF+pBoYwGlPDNoNutZJ7guA8hejPC62ClGXB7hPfp26UnlaHIXpdpcMEHstBQzhsuZS
	 cC/FYttLsfsL0YVrJX823e3Uk5oL1dF73SH291xMTfDVyF0Bf2Uk/tc5zuIjaD1G8exPu
	 gNC7oM+JgUMOpLiXhRTNLC08GInk9MGNjCXLkMdkXp+/TpsgoDMiZodkySc+RiK7Wyjd1
	 XULChuXW1vIZkH3vBd5LI9EVqyqlcD4MHedn8tCIrwFnakzqtuGeBp5TQVpt1O13baQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
	b=Sw9xEBAR3Rpei1W3ta8cf9768f1INT8VK4Gqf94g5cJc+aIHwuLKma1y+sAvYNmGqMlu
	 yVWufJq9miZz490AKXBVHQknjg0bBoNdtcWoULsliYsTzhYhg9dKWbuxnJ35RpNtYmkpm
	 UduhlOOWwlsw1+g3Rc06MRUwyDOwU7PYWC8yLJdvdBIJzSlkBTadds9JXb4JZKgiHMJRs
	 8h8xFWKm0Wrpe/Dd3Wuel1Zjg3Y33+8Ge+HambFjeT/8HqQMiaIvEtHeVcu+6NcYHCl/8
	 GcVtroSmyBVgJhcQRIba9IdF0LH9nCgu0B0G09TxOom51OCPPXheQUvQ0X4F9e5wZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D/wehGwS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu+RTcrm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA82606A6A7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA82606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D/wehGwS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu+RTcrm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLITK3878762
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=; b=D/wehGwSYdfacokR
	vMRQuw7sbuVVO4g7TxKw7T9jNTrcpseIidz1veGPlzdKE3SpsS+670tW5usDqOYN
	xGHVhB7lBsd+Nclznm+xYhvfmE/BEfHU5Ef4dVQSFG23foboGNY+mkC2tFaSQH2Q
	pPEyFc4PvkhqqA1H+shE7kyjyQFMsamus+UpyIk49tqZZXo9iCtFaoja5DNhG7Cr
	ykjAiU6r1AUWrcQpWpBySBJz4mbN4JVb9XkrzomWmvSPjUzmWRD1dqQYJ7/zVd3K
	9L4ft5yq5c6j0nvoRa8WKwIvPZRKpUKxAiseMGLLOrkKT8W//dMnjm1LTnjGk9+4
	0GyUXw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy13wxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0f1c06332so71999617b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538865; x=1796143665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
        b=Gu+RTcrmQFfiAKpjD75dlfKRCtjvJZV4hCbf2/kirFYtZHErpOwZD+/ZWf94QDs9tl
         k2gGe4pb+riYYevVNNZjlgNqHq6k75mLfjk2ojUFL23Z9SreFfXCYgQvHdaQuiwfOIVJ
         n2WvpIIsjF+4bQRagnvr9zL4AGuejqeTmtgxxueS0IH8GzRw4xcHqeD0eg+nami4ftcE
         +HO/lbQ4ASE07WUdiv3fSGjBh9TKkBBOu0A4mWO+eEWLTSEbBDygfSJ6msmn1vkFAa1g
         eA0FMUOo/9ZwoS7zGYJKKrggsI2hk3BppYQHL/x03Fwr+eBIbetwTeYKOFxEM7/pU2dI
         0HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538865; x=1796143665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
        b=KupD1ptWPjcRphZwpp8G8W4fKVfGrZvMKVvPCn3o7Htlc7KIYo5DhG3+PoQnpN7sit
         sP2VcVGvzx0zp1pI0kUcuB9JjSnMIHlJ/2ebNWxVyCBang5wdrbXkdaxn3iwdIrwbij0
         wlf2ofyUkuFd1WO+/7TMGuQtGzFMktXITq8VGwEyARZm3LrSbit1xRqWNEinV3HmRYdq
         ZVp25Pwa3WAYhk8sq8wo98jbQJAPOlDg42iREXeQbGpL0UaQ4t3Ltb4dkzSRLsdqqkWx
         9S+qCrNfYuxw08Na1B9X4YMnQOKGjJpP8xQZlAxgKijIu0VOO/XCs066/APQRk2RR6vw
         LStA==
X-Forwarded-Encrypted: i=1; AL+hErFaxKVT+rOWBaou4tcX/7n9eqveBCX7hLbX4RI5H6BckrvBgnHRhLtBe3kVvxwVD1tAozk0rK1PluTJ3iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z83aEdPSuVdmJ6MlibE657kW3zM/F8qmy3Nwu9Jnm+y0rlvpGpy
	/mDofPv41AHhpKMNSWC8DEfJG7JlcrOe+PYwRS6v9umh9LIWM5zZHz94foPZ/ZtomtmcZ2wPRSP
	iAyUieWrNJBWA9h08S0FCEP6IWEmJVhR2AeQEEyTp+b7Oz9r/SmRXIInBqxZbmQ4hlsk=
X-Gm-Gg: AZFdTZdIWVgmSfwpNsL2Ft/o5YGTbUdKTjrH3joGZW296L+AEma4z0bHYmn+0XV60kg
	RnaBJbJYidbc8/egxArdzemWwaamyCZ2s9FFsAKA7oWEpySw9Xfm3qMIlLp2cpXT5s+isWJ740a
	X7OGSp6no2epPqQyrVc235Ed064i0tWU4oQkBc1VGdhj7sMfcR8+RknE+Yq45HEtT/9YShgvQ6f
	2Ilw9zPQc8sW+FBqQEtiMIrA9I2/jl1N0JTGZvZGPk/9XKs3ZXRgAGwkEvu/bOAhChepWiYgXJ8
	YxAB2TQ3TIXbPTeroByHONI7wfzE/si0XqH+c/lHkT4Gw4Sn6KACmV1jhh9+FAymPkXJb3F5RaD
	5eUYK/an5hcl/Af8gmB0OVugEwOmdMdb6aIFWMfpYE2MVegxZRELOWuEB/luIk77sLSIYAeoT8q
	VxThr+aC6lIdU+5mVtta/JxN2B+jm4r310JQwYgzdLruyumedN3LfKhzUnHm9A7B4Rdy1Il8Top
	utCLHSmF2Ng32xKKBVkW9g+1PnQ
X-Received: by 2002:a05:690c:e0c:b0:8b4:e258:408 with SMTP id 00721157ae682-8b52051832fmr70265007b3.58.1795538864491;
        Tue, 24 Nov 2026 08:47:44 -0800 (PST)
X-Received: by 2002:a05:690c:e0c:b0:8b4:e258:408 with SMTP id 00721157ae682-8b52051832fmr70264837b3.58.1795538863804;
        Tue, 24 Nov 2026 08:47:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:47:38 +0100
Subject: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
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
Message-Id: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: EjFDyiwWURHGpImMzQnqzD2c4sv-rudr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX/AgNzxj+u2ml
 r94dc7ATSi6cdIpEId+ba+HdRTk7TOcAIcSajRAUE57ssielayhShPXmNjHZQHVShINxEf1NBWv
 VxlsqHpV2OOJ5RNxC4mhsZG3SeCu7II=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05bfb1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=q_A1cxkaZBfKfFhyi8QA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX4Vt4vsdLwhKv
 RxFox9jxhxFRAK9ybWpvgSgAR3gi/pp3M+VmqZXMQT46mgRWVNE1QZ+y9Htm5WFqkXgu3zrmWa+
 azxq7FHY+5iJCgbkQhzWq850RqfCkmTeP7fWpCDK24g22/m2n4F7oScjiK94crzqLD5iTITlzkm
 tZTrIj9fFXNzhkk+GAxYXwHgQ3hSyrvMBzJbgQEqA6pxhpyLFHkJjIBfzK0saKTQAMjRPFrD0f6
 Vg0d51CEBBvx5xrR7BUSfRkWGAtc87+Q1jMaPwuNmeWhcM1gxlvCsnUN+WWMOUOFuKWSI1v17+T
 fi8HQdOgPAMF4ML3Y1Z/QQtu05BjygBoi/S+sztlJJOsJzC+9rA+uyEw/aQ7o0iOr9dLptH2KO8
 wyQCGpCzUIqmB32fIzDj5BqXy2nRdxLBtYsMcOov2JOXTUQQWn5T5vr5BIMcr58Nvi0Kjko5Klx
 ihUo3lj/VPfDuB/d3MQ==
X-Proofpoint-GUID: EjFDyiwWURHGpImMzQnqzD2c4sv-rudr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

The buffer address written by vfe_wm_update() has to be made visible to
the hardware, and the way to do that depends on the generation, the older
ones only expose a register update, some relies on a FIFO, while the newer
ones expose a dedicated address update that triggers the latch on its own.

Both sequences are open-coded at every call site today, with the address
update being additive and always followed by a register update. This
leaves no way for a generation to tell that an address update alone is
enough, or that no latching is needed at all.

Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
it provides one and falls back to reg_update() otherwise.

The write master configuration programmed by vfe_wm_start() still needs
committing, so vfe_enable_output_v2() now latches each initial buffer
address inside the loop and issues a single register update afterwards.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+/*
+ * vfe_buf_addr_latch - Latch a newly programmed buffer address
+ * @vfe: VFE Device
+ * @line: VFE line
+ *
+ * Make the address just written by vfe_wm_update() visible to the hardware,
+ * through a dedicated address update when the generation provides one, or
+ * through a register update otherwise.
+ */
+static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+
+	if (ops->addr_update)
+		ops->addr_update(vfe, line->id);
+	else
+		ops->reg_update(vfe, line->id);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		if (!ops->addr_update)
-			ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	}
 
+	/* Commit the write master configuration programmed above */
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}

-- 
2.34.1

