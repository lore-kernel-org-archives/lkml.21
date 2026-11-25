Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631038;
	b=fvZv8WovCMPfKXc7T0mLjOd74RTU2zENS+/XZaKim9/8MTnZYacYRjkXogN1LlAMqd0U
	 eP96jyXFTWkcKPyVNzJFyDq/qtckk0b32XDaJM96Y6+ehWi45Vx3Ad8PAQa8H9NQJXtjq
	 yoryO+buA+9gDM5BAvUp/yxwVgNwgsiDeobZpoG9QZ7dwqUi8FlOwn0DpI1mMA7x8cwC6
	 GmVjD2deDUm/uGPtc3wef/zW3iNB6XnXcutdoclrBjWcOuenbyu3RTyXn6GDanaeRlPRq
	 W6cRJYAvU1fLvciZokNgYTx+UM5FjoGpe2PcNrj2QT5zxsKfrilSiM7Bx+3i7/2OQmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z1XeamohrIedhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=;
	b=PBi0i5NpCiNd1AHia+9+n+3VyrhUcAecGGEbL5uADVzgHDJuT3jmcopLau0G3XnOz6Cr
	 xi8KumhG5uKRusj51GDU6WWv9nEh+vkEjTaiCLsjD6JrQuUOeFSKaUU0vLHQ5GrF/vPXe
	 bPQUpnE4ss+lWXzH/zRfLB0GXpBV0BR+rts6vCklU8H/OY5K3/teziQ1X8nirKcFXlFxo
	 Mf7hWthdj1b6GLCFFfYaTVUneGtJfYqHAgX4s8wmWKeKQYRRWqPICi8+O0XgrGR+Fa/kA
	 VuApN/SrfhSzxWjtSamZ5lIBG/5tdDwc23IoJsv0/ZzUB72E7pWvn7CrYNysWHbnk4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4C4b9Yt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwT3XJ22;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB29C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4C4b9Yt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwT3XJ22
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQPV22375611
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z1XeamohrIe
	dhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=; b=p4C4b9YtZLiMszAJOqJfAz7m8Sa
	qIQNrznzZnGVQTg2CVo/t54ikZFaF+toxVq8a1Sw5RtSXv762PhhNuWRBSIirBEU
	1ePL7h5qzzoN8Q23/tV3oJPjXwuC24+8UfjvOOv+PTZ9Eu8xDRXbIg3jndSeeOlZ
	mcKw9wMfTQFSLZUBL6W2c1n0JMmMlKG6yFhkXqnDXKUa0PnQIhBsKfzetN/++Iib
	UvTFWJcBs6QQAjftFtm/qlOwY2uB3YaavR+94il9iKEj3rJ8EL36saXXfwEOZHid
	EBdyvLVyooRoVQhMboClGw84AazeF2518BYcpui8WtzrhUJdPj6QzsMQoXQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arh136-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:56 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67c041acd09so9064856d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631036; x=1796235836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1XeamohrIedhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=;
        b=WwT3XJ22LNMFhG2g14/ft3r5qQHGJ6gs0D5a0S/44E+n/R7yNMkxVJnUM4e+lU5mmg
         OwYBd93A0Zvp7b4/Lc8LRo9OJMqhHq6qbjzxdCRUDj57Gwl7IHMQev2Yffg2I/fivYd0
         kZ9YoWODWSgNm0X8hwsYEeKvuxGeKvQ8zksycBM8A1H5z4SaQEvDoY8o+IuqsPE+KryF
         PKTgHOMtFq1IOJUsAP6eo3aTcdtl7AL85YY0GLdoFHQsbl4+pjB0c0pKRIt2JSPDJ52j
         v+tSqHNg5JNT154TdNzGLiAqllFtFSUlpWx7P+VpmRgVDIS1ChTkI79lHwKhD63n1C2D
         rLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631036; x=1796235836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1XeamohrIedhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=;
        b=0LxwyzZ3v8mMG6gDfgVxAtJlEgZPJwx+8Ky6XmJ/NHRd+ZLhq7Uok4KxddspRQ9dKe
         A2JemqmxpssHI05EDTVpbNzRACABbdFcL4NEi5jdz7favAPm9nXbeI/Q45hc4Y9ufwos
         9bxcaDMSJNDx4+5f9xI7LdRpzD648NRGZG1AA/a4X6ZfSpImfqwHJFWWC38qaYhsIu2k
         fFnBrYQ47p5i9W0QOds6SHBCpFVjnKcryeGhJF0g7I8aXjR8Sr8wt1vZmeOKKN25AcCq
         6vFtOi4G7q5dehp+A8v1/8AuFx/PjHkx7Sa8UixDXyfFMisEK/ENerpGiLIgsoSecXVL
         fbmA==
X-Forwarded-Encrypted: i=1; AL+hErHvGvv0B/3MkQ1LGNoO9vzrhtORBwtmR9gdj8C+n+Ys2pvKt3pft2roYN6VpSUHopzo1yYumVUu+P/Aq0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gTxwGDlOWJRwkx4tSFfRnizTyAcWb1vIjGEPGmYtzoX0FFmYh
	YaIhIhptc7cb6YsNv4HvRssXgcbjMrzgvGJw+ovUMNgO4ACnVfHe7O9jIyrx4/mKp8J1OrrSJcQ
	mIcYuml30COSIVsti7SF7FUmhq9mWdWb5cnTvNbL5fYlTLbyR3FPoMlqFrFzKBJPkTa0=
X-Gm-Gg: AZFdTZe+kU3edAYFRtjjpG+VyLUt5zlC1TybefRuZcyBYNC4ecjJCRr4G5RJnCbWqr3
	yUl05a9Us0Dp0amoVrboGTVSPo9AApi+0jXWOlyxS76j2l3hQGjloI2BogUXRseBYNKpQC084b1
	PnBy8rhu2nO0hwu9taLi43mF90FuZoce7TRh5QjeaaXgEcjDjeuBLD9oo2QWkZeTP8eHFDXubRC
	ib1rTljQ1tIGJYxULBZhFJpEkGy43IotY0oA7p9VKiM4ILMKbJeKNczkp26WAPExvoNo04QyXck
	Bt0cP+QoZ4mo9JPu1W4LoclRHi+AQTtiOmlP94aGXHoZnxfmL9RkeCbwYP6evGNYH+rsBSQoXgE
	y0XdrEk0FAM6gpUCmAvf0aKxgk7tpTwCRCjCFB94FSV9+sTUeB20rnrXGzdMym/Nk3yo/tzCN1x
	ozscRn
X-Received: by 2002:a05:690e:191d:b0:67d:e4c3:d85e with SMTP id 956f58d0204a3-67df43f3412mr6388662d50.46.1795631035831;
        Wed, 25 Nov 2026 10:23:55 -0800 (PST)
X-Received: by 2002:a05:690e:191d:b0:67d:e4c3:d85e with SMTP id 956f58d0204a3-67df43f3412mr6388655d50.46.1795631035276;
        Wed, 25 Nov 2026 10:23:55 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:54 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 08/12] media: qcom: camss: Add streams API support for VFE
Date: Wed, 25 Nov 2026 20:23:22 +0200
Message-Id: <20261125182326.2767771-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6IxNCX0_L-0Hkf1O8hk400Oz-u_qqz4P
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b0727bc cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=pvsxG-_YmC7UNMcg_GoA:9 a=nd2WpGr1bMy9NW-iytEl:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: 6IxNCX0_L-0Hkf1O8hk400Oz-u_qqz4P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX/Cq8n0VmKn9+
 D+i6h3hQDVZIhjI6rP+OCMr7nO+P/pDFOwUWoG13aYfOPeKqoG8XNALImiZ79mSxfHlmEjSbSmV
 ZqdfkidnKMDvM8Bn9ciIfii1qP1VL9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX6N3O7Gor0IeY
 v/aN+Y0mCw7hO/3Nrpz4hWbGLcDlHwJwAqlre9NgkQMa6i/TRw8/JL1V9F1+FBUOs8Q4LXuKLEw
 W/JxyTvzUsVBw4EJv/IWcRh9LJXlQnTxK52cXCxd9adKG5pjaSVVS3qKtXgvIkOmdugwccIK57R
 Xp5SS3uNjgwfzPFwCPF+MdlzpABB3zBhCIsJfHCxMiemQTKunjFDVPF+pxZjmWN91uH1VZQLnBN
 6pzyt/qy6G3R/puYjKYsAYYpsFf/X5kEbywFxPuF/g+BH3zo5fnOZUkkFfgkFTkGdqFnojAUQQ7
 ZmNYVqkc1V9Mz7bqZn1rW0SEbhdteMEq+EPvnbFQBrsDUnGajBQfk6v+wBrpMDfeLFFt+fH8tpo
 Z9RJANHp2ZJVnhZeixmdNWhft4ifk97hmIdhkVUj1Xu1SSfUmoq2hrbYc2XA69IQi7RS9Gjx510
 N364QlwHMbq6BAQPz7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Implement the V4L2 subdev streams API (enable_streams/disable_streams)
on VFE lines, selected per SoC via camss->res->streams_enable.

VFE lines are inherently single-consumer (vfe_link_setup() enforces
one link per pad, and each line exposes only the implicit stream 0 of
a non-streams subdev), so no local refcount is needed. Local and
remote teardown are both attempted unconditionally on disable, on a
best-effort basis: a failure on either side is logged and does not
skip the other side's teardown, since there is no way to roll back a
partially disabled pipeline.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 119 +++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index da373024c847..31ee3a0d3717 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,6 +1996,104 @@ static const struct v4l2_subdev_ops vfe_v4l2_ops = {
 	.pad = &vfe_pad_ops,
 };
 
+/*
+ * vfe_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * VFE lines are inherently single-consumer (vfe_link_setup() enforces one
+ * link per pad, and each line exposes only the implicit stream 0 of a
+ * non-streams subdev), so no local refcount is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_enable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	line->output.state = VFE_OUTPUT_RESERVED;
+	ret = vfe->res->hw_ops->vfe_enable(line);
+	if (ret)
+		return ret;
+
+	if (remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, BIT_ULL(0));
+		if (ret) {
+			vfe->res->hw_ops->vfe_disable(line);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * vfe_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * Local and remote teardown are both attempted unconditionally on a
+ * best-effort basis, matching the convention used by other streams-API
+ * drivers (e.g. dw-mipi-csi2rx, ds90ub960, cdns-csi2rx): a failure on
+ * either side is logged and does not skip the other side's teardown, since
+ * there is no way to roll back a partially disabled pipeline. If the local
+ * disable also failed, its error takes precedence in the return value.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_disable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	ret = vfe->res->hw_ops->vfe_disable(line);
+
+	if (remote_pad) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		int remote_ret;
+
+		remote_ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT_ULL(0));
+		if (remote_ret) {
+			dev_err(vfe->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", remote_ret);
+			if (!ret)
+				ret = remote_ret;
+		}
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops vfe_streams_pad_ops = {
+	.enum_mbus_code = vfe_enum_mbus_code,
+	.enum_frame_size = vfe_enum_frame_size,
+	.get_fmt = vfe_get_format,
+	.set_fmt = vfe_set_format,
+	.get_selection = vfe_get_selection,
+	.set_selection = vfe_set_selection,
+	.enable_streams = vfe_pad_enable_streams,
+	.disable_streams = vfe_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_ops vfe_streams_v4l2_ops = {
+	.core = &vfe_core_ops,
+	.pad = &vfe_streams_pad_ops,
+};
+
 static const struct v4l2_subdev_internal_ops vfe_v4l2_internal_ops = {
 	.open = vfe_init_formats,
 };
@@ -2067,6 +2165,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 	struct v4l2_subdev *sd;
 	struct media_pad *pads;
 	struct camss_video *video_out;
+	bool streams_api = vfe->camss->res->streams_enable;
 	int ret;
 	int i;
 
@@ -2077,7 +2176,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		pads = vfe->line[i].pads;
 		video_out = &vfe->line[i].video_out;
 
-		v4l2_subdev_init(sd, &vfe_v4l2_ops);
+		v4l2_subdev_init(sd, streams_api ? &vfe_streams_v4l2_ops : &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
@@ -2107,10 +2206,18 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_init;
 		}
 
+		if (streams_api) {
+			ret = v4l2_subdev_init_finalize(sd);
+			if (ret) {
+				dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+				goto error_reg_subdev;
+			}
+		}
+
 		ret = v4l2_device_register_subdev(v4l2_dev, sd);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register subdev: %d\n", ret);
-			goto error_reg_subdev;
+			goto error_subdev_cleanup;
 		}
 
 		video_out->ops = &vfe->video_ops;
@@ -2154,6 +2261,10 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 error_reg_video:
 	v4l2_device_unregister_subdev(sd);
 
+error_subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
+
 error_reg_subdev:
 	media_entity_cleanup(&sd->entity);
 
@@ -2164,6 +2275,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (streams_api)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 
@@ -2187,6 +2300,8 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (vfe->camss->res->streams_enable)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 }
-- 
2.34.1

