Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728622;
	b=bAfe6qlt5RB8LuOpuFtdyDxJ11Q1Kpmh8h+1+U+431oANgY+HYZoHvuudUQeBY+2dGzh
	 LCfwtRrlZs6CRQqUclDeCR8gpfPtObc/uSmWneuF7efoyUXSqwpa6SzjhM2Sm+fcEbRBA
	 5FxIqHKpmsTQzP8hykt/BEDrOhlj+zCLDfi3+CC7cWKvG1bXcN2BlXpaE+y6Mabt2u9sX
	 MnULAD12CEe4SjYh/7lGKjvNpQj+w/ZSw4LxSIbd7XuvDRHwq9oODR92MbV+C4DF5hCOo
	 +uBh/As8AjmMgCv1hq6vXK3HWr61bjRZ57KEGKOJlEAg6kE4kNMgfFDVpweIoptS/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
	b=niudolawG+XaPPWwlYrvaYUx9alWQWoibRmCUReMGxmd7xZW+eePMnG5CqgUMBlTHZdV
	 Zlv8vr08syPDOQUB60ISL9pFPfGQSqX5qVD5eV2Ebh+unN/ETm//FZUt6zvV6irpObtv4
	 +k3gHLQt54gRMTEBKLibRzTAITiO4NjKbGDoeZn70ucWLhMNOjHNHhcvERgyJi8GCMi4T
	 fhfo8XZNTI3KFAAaw7iUjvbu5D4uySz/KJeS270wo4XAcvu3Q/Hv8uhJBnIHSyFTYDPyu
	 FbZKFiC16Ki5F6BLiFqAPIAEZKVEN0eayJe9Ge92fpNmIFQBPClWL0c6KnN+sNtuM2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URqkVqlt;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D476606A689
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D476606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URqkVqlt
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso5034443eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728620; x=1796333420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=URqkVqltcCp6tYYsAnW+MQMrKHnDknW44h9foigyBf0TJ4Vsan3Gf0UJirvtTJrt+J
         WujgepDn5L1petCEPYiFNlMT5fuB0SvwDJGXp162y31T8Bs8yaYmrUEFvwwN6FzIi5EN
         pGMomnXg+xik5H1LgAFV11e9EMNllvX5OJLO6+gB5tNg27ZsYKiLPsePkNnFKysZM0pG
         BHtAKYopBgeT3gFvf5NVSIvDG+UV4nFQxyme2MGRNK1JdDXrpEL/hdv3TfES9+VLZECc
         3LMskwwIkyHJeGjW48E5I7suk/OqXvBwrvhiVTlFL8yi9cPrAW26dltLsE6mE48AT0O4
         4p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728620; x=1796333420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=HnFm56GyW3pfemb4SYC86nkhQvARemEx9fkSZeokyUuFvQyd+Gc3bZK9TGvIIJ7H/C
         E5wt9mhGJSjzvN1xThaFV168vjHZRn3o+6rns7u2VR8GgRL7X9fJlVgB33JEDIDl4paO
         ctbYfb2V41TUVW+RfP5vJbmf7FAYkod/WthmUBMxdmnh0wQV8PJsK3agC7gYH4GuE8wp
         9YoCmyxiy01UJzWy0hryVIzEsySIuqc+s3Grlw2gu8Hv/GAeDXOX/zMcr/8V1VyffhIc
         iTR4ASUHEXqEqesd56lOdn5TqRnxUaVMSIMukoNazDcOP24xFqDD6Bi1scKjw2GM5rB8
         PIYw==
X-Forwarded-Encrypted: i=1; AL+hErGZ1qdQXpQe2XT/atINQZ7j8Lgzfh/rT2D/EaFRrbdMWba7es2+O5Fi53LEZhMjSxwy4us93qAhXHJhgxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cNg2O7cYc8BgLoFA9IRyapO7Bv6gZdIInntY9EIXdpLkkvkME
	AwmSeQyIl1UDGf4J03ujC9MKlwey884+QH6x0C0Jyhr1lhFyoWHttGvd
X-Gm-Gg: AZFdTZcHMo7S93Xn86pHsPDbitJsM2HGiQGtCVjV4eE+EPwcjroxK0ngy7MhyJOaVkB
	XYowLcbceLfITpvw/VzRMo8BDz4Y+bGmKkkaVjsdCiBvd5EoXxQoNcXcopzEMCTtBubqHb0QTSP
	XZOUgZvpC0FsFJYyY9L/pz9mwpUI4xnlSB1jgV6vqYMGL2s7d/dJYa2nFQE62vRyLMAABToQnEF
	kmAlnFxoL3/7Gy/Ys/VUvP2BOlFxkm76KbgZnlYrhJwaTBOt3XBb9jAkfwv1wwVFpeRcDtNG7vB
	spTbkiMOodsfCtN3h9/g6b4sOLEgVYNYkRddaI85LncDYev19fn4C3L03/FiGFn4CkfrlsbWO1I
	e09doJ1nOD6dUMYG/CfHT070FUYVH3EMupcbqqEvhtruDUEwlnJEzpK2EX85q6FFdTayCxrUxYE
	epfNbIlR7eecwARu/Q0dN4t5NhAJtSQq9Qy4TV6Nj5FNvo5+yLCaCC6rsUtf5qPDKZA5dzAQndG
	dKmyDR1aMHfpT7OT8rTxDsn35NvYexhfiesp2QEcirn3eF2d70OO/nPLgf94MsEdU26pqyEXvRD
	/KRsa3pnLOZxSXSgtgNrIHXX2LuarsXUc9Nv2jzqRl1nsPW6euAhdr02egQuOFL0XiQloJInfZ5
	CVazaGUxXH5YlhA8ec0jWiKJmtKkcJdnW/RTndYFg
X-Received: by 2002:a05:7300:c38f:b0:386:e4ce:7524 with SMTP id 5a478bee46e88-386e4ce7546mr2012754eec.36.1795728620238;
        Thu, 26 Nov 2026 13:30:20 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:19 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 3/3] media: iris: fix out-of-bounds read in gen1 sequence change event
Date: Thu, 26 Nov 2026 21:29:04 +0000
Message-ID: <20261126212904.27207-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126212904.27207-1-dennylin0707@gmail.com>
References: <20261126212904.27207-1-dennylin0707@gmail.com>
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

iris_hfi_gen1_read_changed_params() walks the properties of a
HFI_EVENT_SESSION_SEQUENCE_CHANGED event. The number of properties comes
from the firmware in event_data2 and the payload is never checked against
the size of the packet. A count that is larger than what the packet holds
makes the loop read past the end of the packet and, if it is large enough,
past the end of the response buffer. The values that are read end up in
the formats and in the crop rectangle that user space can query.

The same code in venus was fixed by commit 06d6770ff0d8 ("media: venus:
Fix OOB read due to missing payload bound check"). Do the same here: keep
track of the bytes that are left in the packet and put the instance into
the error state when a property does not fit.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ffa98139f0eb..a5b43a408e55 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -34,72 +34,102 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	struct hfi_framesize *frame_sz;
 	struct vb2_queue *dst_q;
 	struct v4l2_ctrl *ctrl;
-	u32 full_range, ptype;
+	u32 full_range, ptype, rem_bytes;
+	u32 size_read = 0;
+
+	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
 
 	do {
+		if (rem_bytes < sizeof(u32))
+			goto error;
 		ptype = *((u32 *)data_ptr);
+
+		data_ptr += sizeof(u32);
+		rem_bytes -= sizeof(u32);
+
 		switch (ptype) {
 		case HFI_PROPERTY_PARAM_FRAME_SIZE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_framesize))
+				goto error;
+
 			frame_sz = (struct hfi_framesize *)data_ptr;
 			event.width = frame_sz->width;
 			event.height = frame_sz->height;
-			data_ptr += sizeof(*frame_sz);
+			size_read = sizeof(struct hfi_framesize);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_profile_level))
+				goto error;
+
 			profile_level = (struct hfi_profile_level *)data_ptr;
 			event.profile = profile_level->profile;
 			event.level = profile_level->level;
-			data_ptr += sizeof(*profile_level);
+			size_read = sizeof(struct hfi_profile_level);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_bit_depth))
+				goto error;
+
 			pixel_depth = (struct hfi_bit_depth *)data_ptr;
 			event.bit_depth = pixel_depth->bit_depth;
-			data_ptr += sizeof(*pixel_depth);
+			size_read = sizeof(struct hfi_bit_depth);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_pic_struct))
+				goto error;
+
 			pic_struct = (struct hfi_pic_struct *)data_ptr;
 			event.pic_struct = pic_struct->progressive_only;
-			data_ptr += sizeof(*pic_struct);
+			size_read = sizeof(struct hfi_pic_struct);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_colour_space))
+				goto error;
+
 			colour_info = (struct hfi_colour_space *)data_ptr;
 			event.colour_space = colour_info->colour_space;
-			data_ptr += sizeof(*colour_info);
+			size_read = sizeof(struct hfi_colour_space);
 			break;
 		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(u32))
+				goto error;
+
 			event.entropy_mode = *(u32 *)data_ptr;
-			data_ptr += sizeof(u32);
+			size_read = sizeof(u32);
 			break;
 		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
+				goto error;
+
 			bufreq = (struct hfi_buffer_requirements *)data_ptr;
 			event.buf_count = bufreq->count_min;
-			data_ptr += sizeof(*bufreq);
+			size_read = sizeof(struct hfi_buffer_requirements);
 			break;
 		case HFI_INDEX_EXTRADATA_INPUT_CROP:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_extradata_input_crop))
+				goto error;
+
 			crop = (struct hfi_extradata_input_crop *)data_ptr;
 			event.input_crop.left = crop->left;
 			event.input_crop.top = crop->top;
 			event.input_crop.width = crop->width;
 			event.input_crop.height = crop->height;
-			data_ptr += sizeof(*crop);
+			size_read = sizeof(struct hfi_extradata_input_crop);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_dpb_counts))
+				goto error;
+
 			iris_vpu_dpb_count = (struct hfi_dpb_counts *)data_ptr;
 			event.buf_count = iris_vpu_dpb_count->fw_min_count;
-			data_ptr += sizeof(*iris_vpu_dpb_count);
+			size_read = sizeof(struct hfi_dpb_counts);
 			break;
 		default:
+			size_read = 0;
 			break;
 		}
+		data_ptr += size_read;
+		rem_bytes -= size_read;
 		num_properties_changed--;
 	} while (num_properties_changed > 0);
 
@@ -170,6 +200,11 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 			event.bit_depth, event.pic_struct);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 	}
+
+	return;
+
+error:
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
 }
 
 static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
-- 
2.43.0

