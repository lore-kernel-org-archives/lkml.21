Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631035;
	b=Tx4EiwTj1ujWw6maNZtX3i85z5F5kPMFmfPPBfKTJodMKcYUnW1rpsBSviQkcNkfvJwn
	 fNYZ2mqS9iWUjsFpjhQUzMwP4EYrx+vfXqsx8TCk7PiFrMSA46eeBy0TV+kh+WBTP/VRR
	 YWNgWKEisO3hDdA2Lxe3cIa8RPMryLRhuDUkOjjCovL1YSq+USglp6eL7CchDRT22zr8o
	 WLXaEwxQo1DRcEP9bC0FbgAdYs/PiXPxwzuIl8hxgRKCUk1UHaSqcbLFXlV43UFUOi/8v
	 +1XaGzhsE4zs73HAo4IchSb0p/cmjxmE31PhDa79ep5aZ0kE6NM1+3VAu4lQBGYisjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FSIe11hSyoXB1+nhTSFM3l4wJHg/CQn47ZxMfkhh/Hk=;
	b=HXeu8ykDgsTv/u19t2IHvNO46vtKBhvIpg/PiLsJx2ZV9tkPZr3LxHe0sizYnL7JDABd
	 SyLXH8uRdBmOf/QJFeP524zW437ffRvx7vO3nBwMSLSY7HJX5giyXcdgPiE2IisohLPcC
	 1eM0cr17H9an6Jv8oLI7g4BvWXPWtbHCRKVrXLa8p8lnPcceBQ80rr99gHyZUgHemtu7M
	 xT+09nsl0vgGWsx81rQ9Twrm9KN+yW0hSIePNFQ3rHR+ApC8BEo5Pl04e58N4TEiCO826
	 LTKSPy1uC63uMYm9J0KrBo+H+1znaKzN4Ds39jZajSYkQhiDwPN6mSjDKjMXDmtZmwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5cE4MHM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4axgHvy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEF2606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEF2606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5cE4MHM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4axgHvy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ6g0291169
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSIe11hSyoX
	B1+nhTSFM3l4wJHg/CQn47ZxMfkhh/Hk=; b=C5cE4MHMRlwy/52XN+a21opf0KN
	tJVQRlVfgq3Yim2ndea9EQm0QXadX2NyGOcUneX3mwErzzUmo9So7xjXdCOCmCdn
	L2mcQF6CLUy5iiKE45OKIw2KJTCvCokMt8aXuUddvcMhOjyre6L/W07CnyWkT4rw
	yVHROzf1yls4TWLnuEFSBPp59iaqM7jDyMD9eWRI0FUxlVzdMMqwt7k1+hZEcDDS
	PpFHLZzbH6zXVU7jCiT7jGrSU3D5EKG8Q/mR+XS/S4nfHvehUF5nZbCZ0chPrrOY
	wgemrGvqKKjrRqLY0jwxq3+Xcyx9pKZVMd/mKW7y4IV7MnzsZGywjRIvoHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahs0an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so881868285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631033; x=1796235833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSIe11hSyoXB1+nhTSFM3l4wJHg/CQn47ZxMfkhh/Hk=;
        b=c4axgHvyvMCnrIzCvvaamS7kDT+eD/Q2Nz5tjfe0yAMf6JYIBYVsliMwbadeUon3Ky
         OeD+9preZXKQQLG/xe8CowVbCpEL+zhSvfUPIMxeKDFiycvkTcl61BiAOJt7Kt5/j+zP
         nJiMbeGWST9kGqgJLPvH1mMk3e/M8Twcl4dEffkk4yQtH3trldecy1RZ734mcv8xeKid
         V8gd/RPfMjm4rNzz2j+gu52+QI3xUtpbOt5Emfevxj+P6KY+sO+737dshAqTC9e9aDJ8
         v271JVNR3nlThdhvPJgqBnvglFah914zGSE8IyxG/NhigUlOS//XDLeXN0HbE5QsShty
         COtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631033; x=1796235833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSIe11hSyoXB1+nhTSFM3l4wJHg/CQn47ZxMfkhh/Hk=;
        b=l5HE3mfaiA8cYVyZZ6JB2nKjw+uYnVyrmSgKC0U98mwrOCeN/spBZnFQkjKCqL0QBZ
         PVIa+67e9LMg4gbSk7oUTSEkHHa6j5Kx88x2Mg+SE2NOSnfWKuXoUV35omYOyOguqgns
         qT3tJ21g05qXHn+JsMt38YY3bEvk5ID43S9nZqgLUtlrDcBoTm2FejxwTsGWN1pbnCfR
         i8E/ydbia3Zervf6LZSU/qvaOJY3nzXjfBO4moOrsqCSyU/zYdWHPQLDYAKq9JX7EfaD
         3jen2nRkhGZxBJmvw0z62X3SS5O7e2kf16LidsZBp7sKvMe1QcBv0/g9XjmwfQVz0t9K
         spow==
X-Forwarded-Encrypted: i=1; AL+hErHUopxQjTnP9fhSf7sYCtQ7jRiiEt20j4tM9UA8aDguMNfjE4FdLAyCzAEXuGMephtJPFL/J3aS4p85xJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W/B25eUDaw84sOkHYAx3DS5uF3lM3K3B+PlRbahL/Mz4lbFCV
	goFYPzcYdCYFbbk+D1+nW3LJ5xG0DxqjY1vJp7glYqUnKNeY5QNsSAr4Xsm32N6+hXDSmmi3ZRe
	LjKVAL2EbZPJvYB+4yUNJiKsPQJPFwHKOGis9cIrTWcWIXXoxbtsfKCpmQsMav4NvhqE=
X-Gm-Gg: AZFdTZcK9Ld2yrrKzjjhGGGnygMTV8A+KuUK3/yB0yBF5ErfgKuvKFliDBnlr4mg3fk
	BC+CiZyfOGP1dJtlvX3CRz2NxrokP8YRHATEFJ9lEd3QzeePZpGUmshIzkGK+Nyy1BsRVbm7rKG
	TP4eBAE6JOgVUuKnv+08uiBUogEy4mBCcvrDpW5UFKz6dMsYpAQF0OPaqw/SPhlC2oc32GXu42I
	6PZ8VcIuUdsgH5b4NnRT94Pxr3bkYjoXUBCj+JFc/rwkqaH1IGK18jCqP/IZcVt+jsu3HgX6zDB
	Mg4xqYes73ZQkRhgGw2eJ3kaA+kjwhhcHu2F5pLJZWlKRCA58yScw+JrivbhkTf/+vXT5hXeMDQ
	wsY0b5WptKmoIfOje2gu/cM5IRljozrnnCSvRq6E2umNdyI/MJLv8iLfeEsPm8qk9k4uYK6xwHm
	U4u81G
X-Received: by 2002:a05:620a:199b:b0:949:7502:69c with SMTP id af79cd13be357-949bab7ee59mr3410031485a.73.1795631032467;
        Wed, 25 Nov 2026 10:23:52 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:949:7502:69c with SMTP id af79cd13be357-949bab7ee59mr3410024585a.73.1795631031802;
        Wed, 25 Nov 2026 10:23:51 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:51 -0800 (PST)
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
Subject: [PATCH RESEND v2 06/12] media: qcom: camss: Add streams API support in CSID subdevice
Date: Wed, 25 Nov 2026 20:23:20 +0200
Message-Id: <20261125182326.2767771-7-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1Jm1jRxlQrCo9RncC31ULyqpe1erwiZk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX0RN3sfMwiu/S
 5b5mKjFQj7AU4V025E/djWzW2CrPr+IgR4VkOF710lDDY03D+mC9ylvsnL/nOuOzu9osTxiD1nG
 VSi8qXj/5n+u36s1/oxll9BPD1bhfUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX/HWJw3mbCUGa
 TtKDtvp36D9M5PkXpmd1XkSG4dezTmc9GFW7egyBhrmeYP2iys3zgm5YZcD/8valiEwXRjNIVtV
 8TPXNqdUx9GEUE7fcB3H3+1rjRBtxSwNvQx6QY/nYSPe0CUozV+jyRZITu9gvErxDmuqcEbkGS5
 dWMC0TNNt8DVk8/Bi2epLeuFqJcd8JwbHnS+QyPh9qtmqDtT++n/DIcdUEzZ91Wnd4G5WNM7id2
 3AytFzNQcEYf7wSi4x838CYjadUQgcIdrDXnSfGKoWZ1bmVo9c83AWZZnbo/8T7xYsAjy+nux5P
 +XE2B2ZFU/yrL9WuE8+BDXehDAK67hYWEKRLOa7VSpqZ0FJ93lYs8EYeJB6xXSCDDSK5SL90juc
 eyaOz0fp5CrKhWvybR3SL4FnIoHqMXGL0Y9iyfAPZCF2EhMtPRwIIe7owviGhJDuu/1ptGpPBri
 i6wRq3qoiw7rw01t3tQ==
X-Proofpoint-ORIG-GUID: 1Jm1jRxlQrCo9RncC31ULyqpe1erwiZk
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0727b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=Apnq_Eyu-EHfnSaQfaYA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Implement the V4L2 subdev streams API (enable_streams/disable_streams,
set_routing, get/set_fmt) on the CSID subdevice, selected per SoC via
camss->res->streams_enable.

Each CSID source pad carries a single stream fanned out from the sink
pad by default; a multi-VC sensor is supported by remapping a route's
sink_stream via .set_routing, leaving source_pad/source_stream
untouched. The virtual channel and data type programmed into the
hardware are discovered from the remote subdev's CSI-2 frame
descriptor when available, falling back to the format's data type
otherwise.

The Rx front-end and, where present, the test-pattern generator's
v4l2 controls are synced once, on the transition from no active sink
streams to at least one; propagation to the sensor and teardown are
likewise only done when no other source pad still references a given
sink stream.

The full IFE's pix pad/route is still excluded on non-lite CSIDs
pending a correctness fix for the non-functional pix path; this is a
known limitation carried over from the non-streams driver, not
specific to the streams API.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid.c    | 490 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 2 files changed, 486 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 2efaeef83606..652c4dd31093 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1432,10 +1432,469 @@ static const struct v4l2_subdev_ops csid_v4l2_ops = {
 	.pad = &csid_pad_ops,
 };
 
+/*
+ * csid_fill_port_configs - Discover and populate the virtual channel/data
+ *			    type to program for every actively routed port
+ * @csid: CSID device
+ * @state: V4L2 subdevice state
+ * @remote_pad: Remote pad linked on the CSID sink pad, or NULL if unlinked
+ *
+ * Fetches the frame descriptor from the remote subdev linked on the sink pad
+ * once, then walks every active route to populate csid->port_cfg[] for each
+ * routed source pad, falling back to {0, format_dt} when no frame descriptor
+ * is available.
+
+ * Return 0 on success, error otherwise.
+ */
+static int csid_fill_port_configs(struct csid_device *csid, struct v4l2_subdev_state *state,
+				  struct media_pad *remote_pad)
+{
+	struct v4l2_mbus_frame_desc frame_desc = { };
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	if (remote_pad) {
+		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+		ret = v4l2_subdev_call(sd, pad, get_frame_desc,
+				       remote_pad->index, &frame_desc);
+		if (ret)
+			return ret;
+		/* Only csi2 frame descriptors are supported for now */
+		if (frame_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+			return -EINVAL;
+		/* Frame descriptor of type csi2 should contain entries! */
+		if (!frame_desc.num_entries)
+			return -EINVAL;
+	}
+
+	for_each_active_route(&state->routing, route) {
+		int src_port = csid_pad_to_port(route->source_pad);
+		struct csid_port_config *port_cfg = &csid->port_cfg[src_port];
+		const struct csid_format_info *pad_fmt;
+		u32 sink_stream;
+		unsigned int i;
+
+		pad_fmt = csid_get_fmt_entry(csid->res->formats->formats,
+					     csid->res->formats->nformats,
+					     csid->fmt[route->source_pad].code);
+		/* If there are no entries fill dt from the format */
+		if (!frame_desc.num_entries) {
+			port_cfg->vc = 0;
+			port_cfg->dt = pad_fmt->data_type;
+			continue;
+		}
+
+		ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+							    route->source_pad, 0, NULL,
+							    &sink_stream);
+		/* This should never fail, anyways handle error cases */
+		if (ret)
+			return ret;
+
+		for (i = 0; i < frame_desc.num_entries; i++) {
+			if (frame_desc.entry[i].stream != sink_stream)
+				continue;
+
+			port_cfg->vc = frame_desc.entry[i].bus.csi2.vc;
+			port_cfg->dt = frame_desc.entry[i].bus.csi2.dt;
+
+			if (port_cfg->dt != pad_fmt->data_type) {
+				dev_warn(csid->camss->dev,
+					 "Sink stream %u dt mismatch %u, %u\n",
+					 sink_stream, port_cfg->dt,
+					 pad_fmt->data_type);
+				return -EINVAL;
+			}
+			break;
+		}
+		if (i == frame_desc.num_entries) {
+			dev_warn(csid->camss->dev,
+				 "Cannot find CSI2 desc for sink stream %u\n",
+				 sink_stream);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * csid_pad_enable_streams - Enable one or more streams on a source pad
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of v4l2 streams to enable
+ *
+ * The v4l2 core only calls this on a source pad (v4l2_subdev_enable_streams()
+ * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
+ * not checked here. Each source pad only ever carries stream 0.
+ *
+ * The shared sink stream(s) are propagated upstream only once, on the
+ * transition from no active sink streams to at least one, so that a second
+ * consumer of the same shared sink stream never triggers a second, redundant
+ * propagation to the sensor.
+ *
+ * Return 0 on success, -ENOLINK if there is no remote sink link and the test
+ * generator is disabled, or another negative error code otherwise
+ */
+static int csid_pad_enable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+	struct media_pad *remote_pad = media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
+	unsigned int hw_port = csid_pad_to_port(pad);
+	u64 sink_streams, propagate_mask;
+	int ret;
+
+	if (!csid->testgen.enabled && !remote_pad)
+		return -ENOLINK;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
+						       &streams_mask);
+	if (!csid->enabled_sink_streams) {
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
+			/*
+			 * sd->state_lock is aliased to csid->ctrls.lock, and is
+			 * already held here by the v4l2_subdev_enable_streams()
+			 * caller, so use the lock-free variant to avoid
+			 * self-deadlocking on the same mutex.
+			 */
+			ret = __v4l2_ctrl_handler_setup(&csid->ctrls);
+			if (ret < 0) {
+				dev_err(csid->camss->dev,
+					"could not sync v4l2 controls: %d\n", ret);
+				return ret;
+			}
+		}
+
+		/* Routing cannot change while any sink stream is enabled */
+		ret = csid_fill_port_configs(csid, state, remote_pad);
+		if (ret)
+			return ret;
+	}
+
+	/* If sink streams are already active elsewhere don't need to re-propagate */
+	propagate_mask = sink_streams & ~csid->enabled_sink_streams;
+	csid->enabled_sink_streams |= sink_streams;
+
+	hw_ops->configure_stream(csid, BIT(hw_port), csid->port_cfg, 1);
+	csid->enabled_ports |= BIT(hw_port);
+	if (propagate_mask && remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, propagate_mask);
+		if (ret) {
+			csid->enabled_sink_streams &= ~propagate_mask;
+
+			hw_ops->configure_stream(csid, BIT(hw_port), NULL, 0);
+			csid->enabled_ports &= ~BIT(hw_port);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * csid_sink_streams_in_use - Compute the subset of sink streams still
+ *			      referenced by a source pad other than @pad
+ * @csid: CSID device
+ * @state: V4L2 subdevice state
+ * @pad: Source pad to exclude from the check
+ * @sink_streams: Candidate sink streams to check
+ *
+ * Return the subset of @sink_streams still referenced by some other source
+ * pad
+ */
+static u64 csid_sink_streams_in_use(struct csid_device *csid, struct v4l2_subdev_state *state,
+				    u32 pad, u64 sink_streams)
+{
+	u64 in_use = 0;
+	unsigned int i;
+
+	for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; i++) {
+		u64 other_streams;
+		u64 other_sink_streams;
+
+		if (i == pad)
+			continue;
+
+		other_streams = !!(csid->enabled_ports & BIT(csid_pad_to_port(i)));
+
+		other_sink_streams = v4l2_subdev_state_xlate_streams(state, i, MSM_CSID_PAD_SINK,
+								     &other_streams);
+		in_use |= sink_streams & other_sink_streams;
+	}
+
+	return in_use;
+}
+
+/*
+ * csid_pad_disable_streams - Disable one or more streams on a source pad
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of v4l2 streams to disable
+ *
+ * The v4l2 core only calls this on a source pad (v4l2_subdev_disable_streams()
+ * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
+ * not checked here. Each source pad only ever carries stream 0.
+ *
+ * A sink stream is only disabled, and propagated upstream to disable it there
+ * too, once no source pad references it any more.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_pad_disable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    u32 pad, u64 streams_mask)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+	unsigned int hw_port = csid_pad_to_port(pad);
+	u64 sink_streams, disable_sink_streams, streams_in_use;
+	struct media_pad *remote_pad;
+	int ret = 0;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
+						       &streams_mask);
+
+	/* Keep a sink stream active as long as any other source pad still uses it. */
+	streams_in_use = csid_sink_streams_in_use(csid, state, pad, sink_streams);
+	disable_sink_streams = sink_streams & ~streams_in_use;
+
+	hw_ops->configure_stream(csid, BIT(hw_port), NULL, 0);
+
+	remote_pad = media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
+	if (disable_sink_streams && remote_pad) {
+		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						  remote_pad->index, disable_sink_streams);
+		if (ret)
+			dev_err(csid->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", ret);
+	}
+
+	csid->enabled_ports &= ~BIT(hw_port);
+	csid->enabled_sink_streams &= ~disable_sink_streams;
+
+	return ret;
+}
+
+static const struct v4l2_mbus_framefmt csid_default_format = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920,
+	.height = 1080,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+};
+
+/*
+ * csid_set_routing - Handle setting of routing table
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @which: TRY or ACTIVE routing
+ * @routing: Routing table to set
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	unsigned int i;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_sink_streams)
+		return -EBUSY;
+
+	for (i = 0; i < routing->num_routes; i++)
+		if (routing->routes[i].source_stream != 0)
+			return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING |
+					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &csid_default_format);
+}
+
+/*
+ * __csid_get_stream_format - Get pointer to per-stream format structure
+ * @csid: CSID device
+ * @sd_state: V4L2 subdev state
+ * @pad: pad from which format is requested
+ * @stream: stream from which format is requested
+ * @which: TRY or ACTIVE format
+ *
+ * Same as __csid_get_format(), but honors @stream for TRY-state lookups.
+ * For ACTIVE state, csid->fmt[] is indexed by pad + stream. @stream is
+ * always 0 and @pad selects the RDI channel (0-3).
+ *
+ * Return pointer to TRY or ACTIVE format structure
+ */
+static struct v4l2_mbus_framefmt *
+__csid_get_stream_format(struct csid_device *csid,
+			 struct v4l2_subdev_state *sd_state,
+			 unsigned int pad, u32 stream,
+			 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_format(sd_state, pad, stream);
+
+	if (pad == MSM_CSID_PAD_SINK)
+		return &csid->fmt[MSM_CSID_PAD_SINK];
+
+	return &csid->fmt[pad + stream];
+}
+
+/*
+ * csid_streams_get_format - Handle get format by pads subdev method
+ * @sd: CSID V4L2 subdevice
+ * @sd_state: V4L2 subdev state
+ * @fmt: pointer to v4l2 subdev format structure
+ *
+ * Return -EINVAL or zero on success
+ */
+static int csid_streams_get_format(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = __csid_get_stream_format(csid, sd_state, fmt->pad, fmt->stream, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	fmt->format = *format;
+
+	return 0;
+}
+
+/*
+ * csid_streams_set_format - Handle set format by pads subdev method
+ * @sd: CSID V4L2 subdevice
+ * @sd_state: V4L2 subdev state
+ * @fmt: pointer to v4l2 subdev format structure
+ *
+ * Return -EINVAL or zero on success
+ */
+static int csid_streams_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_route *route;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_sink_streams)
+		return -EBUSY;
+
+	format = __csid_get_stream_format(csid, sd_state, fmt->pad, fmt->stream, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
+	*format = fmt->format;
+
+	/* Propagate the format from the sink stream to every source stream it feeds */
+	for_each_active_route(&sd_state->routing, route) {
+		struct v4l2_mbus_framefmt *src_format;
+
+		if (route->sink_pad != fmt->pad || route->sink_stream != fmt->stream)
+			continue;
+
+		src_format = __csid_get_stream_format(csid, sd_state, route->source_pad,
+						      route->source_stream, fmt->which);
+		if (!src_format)
+			continue;
+
+		*src_format = fmt->format;
+		csid_try_format(csid, sd_state, route->source_pad, src_format, fmt->which);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops csid_streams_pad_ops = {
+	.enum_mbus_code = csid_enum_mbus_code,
+	.enum_frame_size = csid_enum_frame_size,
+	.get_fmt = csid_streams_get_format,
+	.set_fmt = csid_streams_set_format,
+	.set_routing = csid_set_routing,
+	.enable_streams = csid_pad_enable_streams,
+	.disable_streams = csid_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops csid_streams_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops csid_streams_v4l2_ops = {
+	.core = &csid_core_ops,
+	.pad = &csid_streams_pad_ops,
+	.video = &csid_streams_video_ops,
+};
+
+/*
+ * csid_init_state - Initialize the routing table for the streams API subdev
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdev state
+ *
+ * source_stream is always 0: each source pad MSM_CSID_PAD_FIRST_SRC + i
+ * links to its own independent downstream subdev, and a link's sink side is
+ * validated against the implicit stream 0 exposed by any subdev without
+ * V4L2_SUBDEV_FL_STREAMS (see v4l2_link_validate_get_streams()) -- every
+ * downstream VFE line is such a subdev.
+ *
+ * All source pads route from sink_stream 0 by default, fanning the single
+ * incoming stream out to every port; a multi-VC source is supported by
+ * remapping each route's sink_stream via .set_routing, leaving
+ * source_pad/source_stream untouched.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_route routes[MSM_CSID_MAX_SRC_STREAMS];
+	struct v4l2_subdev_krouting routing = { };
+	unsigned int num_routes = MSM_CSID_MAX_SRC_STREAMS;
+	int i, ret;
+
+	for (i = 0; i < num_routes; i++) {
+		routes[i].sink_pad = MSM_CSID_PAD_SINK;
+		routes[i].sink_stream = 0;
+		routes[i].source_pad = MSM_CSID_PAD_FIRST_SRC + i;
+		routes[i].source_stream = 0;
+		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	}
+
+	routing.num_routes = num_routes;
+	routing.routes = routes;
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &csid_default_format);
+	if (ret)
+		dev_err(csid->camss->dev, "Failed to set routing: %d\n", ret);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_internal_ops csid_v4l2_internal_ops = {
 	.open = csid_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops csid_streams_internal_ops = {
+	.init_state = csid_init_state,
+};
+
 static const struct media_entity_operations csid_media_ops = {
 	.link_setup = csid_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -1454,13 +1913,18 @@ int msm_csid_register_entity(struct csid_device *csid,
 	struct v4l2_subdev *sd = &csid->subdev;
 	struct media_pad *pads = csid->pads;
 	struct device *dev = csid->camss->dev;
+	bool streams_api = csid->camss->res->streams_enable;
+	unsigned int num_pads = MSM_CSID_PADS_NUM;
 	int i;
 	int ret;
 
-	v4l2_subdev_init(sd, &csid_v4l2_ops);
-	sd->internal_ops = &csid_v4l2_internal_ops;
+	v4l2_subdev_init(sd, streams_api ? &csid_streams_v4l2_ops : &csid_v4l2_ops);
+	sd->internal_ops = streams_api ? &csid_streams_internal_ops
+					: &csid_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSID_NAME, csid->id);
 	v4l2_set_subdevdata(sd, csid);
@@ -1494,25 +1958,39 @@ int msm_csid_register_entity(struct csid_device *csid,
 	}
 
 	pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; ++i)
+	for (i = MSM_CSID_PAD_FIRST_SRC; i < num_pads; ++i)
 		pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->entity.ops = &csid_media_ops;
-	ret = media_entity_pads_init(&sd->entity, MSM_CSID_PADS_NUM, pads);
+	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
 	if (ret < 0) {
 		dev_err(dev, "Failed to init media entity: %d\n", ret);
 		goto free_ctrl;
 	}
 
+	if (streams_api) {
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
+			sd->state_lock = csid->ctrls.lock;
+
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_cleanup;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		goto media_cleanup;
+		goto subdev_cleanup;
 	}
 
 	return 0;
 
+subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
 media_cleanup:
 	media_entity_cleanup(&sd->entity);
 free_ctrl:
@@ -1529,6 +2007,8 @@ int msm_csid_register_entity(struct csid_device *csid,
 void msm_csid_unregister_entity(struct csid_device *csid)
 {
 	v4l2_device_unregister_subdev(&csid->subdev);
+	if (csid->camss->res->streams_enable)
+		v4l2_subdev_cleanup(&csid->subdev);
 	media_entity_cleanup(&csid->subdev.entity);
 	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
 		v4l2_ctrl_handler_free(&csid->ctrls);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5f09beffa5f5..70bb4e34cad8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -187,6 +187,7 @@ struct csid_device {
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
 	struct csid_port_config port_cfg[MSM_CSID_MAX_SRC_STREAMS];
 	u32 enabled_ports;
+	u64 enabled_sink_streams;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

