Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186719;
	b=vW+cxpRN8MdQBTsBIeCpO3uWM0KWzm6QV9FS7ao/jQaMXlsVKMVL/fg6V7YreY7ZMhZ7
	 C1uhWsDcNdNsen0aUSMeSmujAGVH2AezuUBbrtFO8DqrOczKu274cTj0eqTq0/JE+I0uh
	 Z+h32GpQm5AU1hV+46a31arq5jGu6dqoG3DNq4plKMLoCUS/PfMHpluon1nkO5qFaIRcT
	 WeWaVD85yFZeVt8z5afvJp0iQIZ3qjmeC7dTBIX9zuzvhg9wqARENovZ5ZvXlzb/PwwYU
	 f1HpJ7XstUchYQpocZrdEWTH0Gk6gwqd4/l5eKs2A3sdYKb8xIU+ga8Wjyu5NoTD7qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186719;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=MX0k4hmj78q0vpeCFe58J36mKz7toADk7615xtngE3o=;
	b=TqZV4Vis7pXlMjKVkk4QTRjKRKrXFfL8z5UDPLghjRJK+oAkOqpk31LM62nWtABasmS1
	 sZmbYK6kSfjZH8WqaidCv6bxGHRDh67hQID+Gd38jTFRL6o0psBK+G9QrcbNN+qHW56F6
	 +uY0ckFUUQqojNPdTKr8l4lc1ieKPQeCvgfDrrkoiREthH6juLjeimlmY59Hme3Am46mM
	 T6q/QjWpBc/6h55ijBJjKn1KGR4JQp2UaRuGPjlOPpwBzo5Yxai/uQa2rT6rwe7qVAaw+
	 8cuUSz9JTkhoPC6Sdfy1j5Mw+2idQXEQZI056RM4scah3qDLoipQcnKYGn04W3yOaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFRcy9Yr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B0460A3822
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFRcy9Yr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765821F01570;
	Fri, 20 Nov 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186718;
	bh=MX0k4hmj78q0vpeCFe58J36mKz7toADk7615xtngE3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FFRcy9Yr2D/WEeKaohNMtGCDNoboOgfiSQXFEEyVsJEzE9F/CNvv34cWB/AWqrm1c
	 r7wusQAZlupUF2z1IZkAlSR1cBCCUUO8yMiyiikvMLL1w7DMGRWH4EqamIIx49I4wQ
	 LUxE/UvXo7ERTgQR608N1oP49+WnRLTr1wII1V/v1QIKJUuuhepc5i+3V9WKScZLlk
	 dwxrq5AbzPkdFRUPkvXP6cDqQvqML7jklea8NGt6ceM+WaZBYCAF1HXnQDQViIQcxT
	 JC+jTTGcPeguVP41x3VYtQyOhbI6QK0OlvVhCTSMYPWFnceHUB4MQjXrbmfdACDNn3
	 5b9gf+aZeA51A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:41 -0600
Subject: [PATCH v5 17/19] accel: ethosu: Require active weight streams
 setup
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
Message-Id: <20261120-ethosu-fixes-v5-17-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

An active weight or scale stream must be explicitly disabled or configured.
Otherwise retained stream state can bypass buffer bounds validation.

Derive the active stream count from the NPU configuration on U85 and
from PARALLEL_MODE on U65. Require each active stream's length command,
while allowing a zero length to disable it.

Require U85 weight operations to set WEIGHT_FORMAT explicitly so stream
validation does not depend on format state retained from another job.

An inactive secondary stream can retain its length and base after a mode
change. Skip it regardless of that retained setup: checking stale bounds
against a newly selected region can reject a valid job even though the
operation never accesses that stream.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - Require explicit U85 weight format setup before weight operations.
 - Skip inactive streams even when they retain old base/length setup.
 - Handle U85 fast weights mode

v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_device.h |  5 +++
 drivers/accel/ethosu/ethosu_gem.c    | 72 ++++++++++++++++++++++++++++++++----
 2 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 6aa7f035f32c..f8066a9cf610 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -61,6 +61,7 @@ struct gen_pool;
 
 #define CONFIG_MACS_PER_CC_MASK	GENMASK(3, 0)
 #define CONFIG_CMD_STREAM_VER_MASK	GENMASK(7, 4)
+#define CONFIG_NUM_WD_MASK		GENMASK(13, 12)
 
 #define STATUS_STATE_RUNNING	BIT(0)
 #define STATUS_IRQ_RAISED	BIT(1)
@@ -126,6 +127,7 @@ enum ethosu_cmds {
 	NPU_SET_KERNEL_WIDTH_M1 = 0x120,
 	NPU_SET_KERNEL_HEIGHT_M1 = 0x121,
 	NPU_SET_KERNEL_STRIDE = 0x122,
+	NPU_SET_PARALLEL_MODE = 0x123,	// U65 only
 	NPU_SET_ACC_FORMAT = 0x124,
 	NPU_SET_WEIGHT_REGION = 0x128,
 	NPU_SET_SCALE_REGION = 0x129,
@@ -133,6 +135,7 @@ enum ethosu_cmds {
 	NPU_SET_RESIZE_Y_SCALE_N_M1 = 0x12b,
 	NPU_SET_RESIZE_X_OFFSET = 0x12c,
 	NPU_SET_RESIZE_Y_OFFSET = 0x12d,
+	NPU_SET_WEIGHT_FORMAT = 0x12e,	// U85 only
 	NPU_SET_DMA0_SRC_REGION = 0x130,
 	NPU_SET_DMA0_DST_REGION = 0x131,
 	NPU_SET_DMA0_SIZE0 = 0x132,
@@ -189,6 +192,8 @@ enum ethosu_cmds {
 
 #define NPU_ACC_FORMAT_INPUT_MASK	GENMASK(5, 4)
 #define NPU_ACC_INPUT_IFM2		2
+#define NPU_MACS_PER_CC_256		8
+#define NPU_PARALLEL_MODE_DUAL_CORE_DEPTH	1
 
 #define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
 
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index fc31372a2c08..d2884d9922ae 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -165,6 +165,8 @@ struct cmd_state {
 	DECLARE_BITMAP(cmd0, NPU_CMD0_REGS);
 	DECLARE_BITMAP(cmd1, NPU_CMD1_REGS);
 	u8 acc_input_precision;
+	bool fast_weights;
+	u8 parallel_mode;
 	struct dma_state dma;
 	struct buffer scale[2];
 	struct buffer weight[4];
@@ -785,19 +787,47 @@ static int calc_sizes_resize(struct drm_device *ddev,
 	return 0;
 }
 
+static int weight_streams(struct ethosu_device *edev, struct cmd_state *st,
+			  u8 *streams)
+{
+	if (ethosu_is_u65(edev)) {
+		if (FIELD_GET(CONFIG_MACS_PER_CC_MASK, edev->npu_info.config) ==
+		    NPU_MACS_PER_CC_256) {
+			*streams = 1;
+			return 0;
+		}
+
+		if (!cmd_state_reg_is_set(st, NPU_SET_PARALLEL_MODE))
+			return -EINVAL;
+
+		*streams = st->parallel_mode + 1;
+	} else if (st->fast_weights) {
+		*streams = 1;
+	} else {
+		*streams = 1 << FIELD_GET(CONFIG_NUM_WD_MASK,
+					   edev->npu_info.config);
+	}
+
+	return 0;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
-		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool inactive)
 {
 	u64 end;
 	bool base_set = cmd_state_reg_is_set(st, base_cmd);
 	bool length_set = cmd_state_reg_is_set(st, length_cmd);
 
-	if (optional && !base_set && !length_set)
+	if (inactive)
 		return 0;
 
 	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
-	    !base_set || !length_set)
+	    !length_set)
+		return -EINVAL;
+	if (!buf->length)
+		return 0;
+	if (!base_set)
 		return -EINVAL;
 
 	if (check_add_overflow(buf->base, (u64)buf->length, &end))
@@ -815,6 +845,7 @@ static int calc_sizes(struct drm_device *ddev,
 {
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u64 len;
+	u8 streams;
 	int ret;
 
 	if (ifm) {
@@ -860,6 +891,15 @@ static int calc_sizes(struct drm_device *ddev,
 	}
 
 	if (weight) {
+		/* The weight format can persist from a previous job. */
+		if (!ethosu_is_u65(edev) &&
+		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_FORMAT))
+			return -EINVAL;
+
+		ret = weight_streams(edev, st, &streams);
+		if (ret)
+			return ret;
+
 		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
 			op, st->weight[0].region, st->weight[0].base,
 			st->weight[0].base + st->weight[0].length - 1);
@@ -870,19 +910,23 @@ static int calc_sizes(struct drm_device *ddev,
 
 		if (buffer_size(info, st, &st->weight[1], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT1_BASE,
-				NPU_SET_WEIGHT1_LENGTH, true) ||
+				NPU_SET_WEIGHT1_LENGTH, streams < 2) ||
 		    buffer_size(info, st, &st->weight[3], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT3_BASE,
-				NPU_SET_WEIGHT3_LENGTH, true))
+				NPU_SET_WEIGHT3_LENGTH, streams < 4))
 			return -EINVAL;
 		if (!ethosu_is_u65(edev) &&
 		    buffer_size(info, st, &st->weight[2], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT2_BASE,
-				NPU_SET_WEIGHT2_LENGTH, true))
+				NPU_SET_WEIGHT2_LENGTH, streams < 3))
 			return -EINVAL;
 	}
 
 	if (scale) {
+		ret = weight_streams(edev, st, &streams);
+		if (ret)
+			return ret;
+
 		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
 			op, st->scale[0].region, st->scale[0].base,
 			st->scale[0].base + st->scale[0].length - 1);
@@ -894,7 +938,7 @@ static int calc_sizes(struct drm_device *ddev,
 		if (ethosu_is_u65(edev) &&
 		    buffer_size(info, st, &st->scale[1], st->scale[0].region,
 				NPU_SET_SCALE_REGION, NPU_SET_SCALE1_BASE,
-				NPU_SET_SCALE1_LENGTH, true))
+				NPU_SET_SCALE1_LENGTH, streams < 2))
 			return -EINVAL;
 	}
 
@@ -1119,6 +1163,16 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_KERNEL_STRIDE:
 			st.ifm.stride_kernel = param;
 			break;
+		case NPU_SET_PARALLEL_MODE:
+			if (!ethosu_is_u65(edev) ||
+			    param > NPU_PARALLEL_MODE_DUAL_CORE_DEPTH)
+				return -EINVAL;
+			if (FIELD_GET(CONFIG_MACS_PER_CC_MASK, edev->npu_info.config) ==
+			    NPU_MACS_PER_CC_256 &&
+			    param)
+				return -EINVAL;
+			st.parallel_mode = param;
+			break;
 		case NPU_SET_ACC_FORMAT:
 			if (!ethosu_is_u65(edev)) {
 				u32 acc_input = FIELD_GET(NPU_ACC_FORMAT_INPUT_MASK, param);
@@ -1130,6 +1184,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 					(param & 0x3) + 2 : 0;
 			}
 			break;
+		case NPU_SET_WEIGHT_FORMAT:
+			if (!ethosu_is_u65(edev))
+				st.fast_weights = param & BIT(0);
+			break;
 		case NPU_SET_IFM_PAD_TOP:
 			st.ifm.pad_top = param & 0x7f;
 			break;

-- 
2.53.0

