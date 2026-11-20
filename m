Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186722;
	b=2t8yG8uEPxRwCTx0thkPpY6sCRFyiUDkUqpCJT2T5+grZr/8CIEixvkkLwSPZkKkiKAS
	 ppON2PhuUE0aE6Wptogq6/JDG3uG9SpUaopyNZW+8RJJ4z70Z/srYqf82dCmhPOFEB367
	 4jaGuuq4rScGqBCyOT6rQib9F7d27dWsw+8uXgMobOJYFjMdDYHjZgXSGSfYDG2QgPdYG
	 GLWTfBq1r9fgNQAZHZrwCLrPTyLE6g8CO4WaY8+bWLzxQDewDYX7a/MGa2luN4VZowUxz
	 R56+VJsNgiJQe49NOt8B4XFgKEVnwzM95WmhimZdJNZhJTvXutLUpO1ZI1HueM/OEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186722;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=X8kjfOaquqsCuw1INjfug/3xaJAguhVUHjw7uk0as/M=;
	b=ePCdBS/mA53TXa/8p9WAuvmNJt4YG4IY/cr0roT1+I4X8KzbaHBfDIbJqmlYH1sgun5N
	 x48TbVm/DKsAK8Tn5WoH2AnkTMsrBTRpGMoIXeY167vbtqz3n8EEkdZlwpHMB4m/Y8YRl
	 pucfHPO+yQUEhXh+uW+tybU46LebPJrJ8+wEBIs+Tecm4xR9DBxF6Lt1bcQlezqJcL9SY
	 MJFfNhT20+76RaOjV3ffjB/sfw4E1XOVPMygnlO9U0Exbjfd0As/SibtMd01LMzA9mfAg
	 lCSD+2p27/B3h9n2M3I4amB5k99wbVdXArL/7Z1t5sf8tdwnXd++ER8N/BEEKCZJJDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJlXgYm4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2D060A3837
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJlXgYm4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D7F1F00A36;
	Fri, 20 Nov 2026 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186721;
	bh=X8kjfOaquqsCuw1INjfug/3xaJAguhVUHjw7uk0as/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TJlXgYm4ykF7EehzJFw5Rrg4sXQpm9f2Hr/3qB8yNcj0hVdddJggFV7PKEBFblib1
	 +4FkA4ZkiNRm0skGgjb0mvnwK6Q26hoYDsHf0wd67hqQFZFnbveHMJpKUFcbJpcW8K
	 8+BHxfNz7PV7K3UCVweIbqjcM8Yu1hMOMhZKqKBNZ+kPuCxb7vIMVky6uNQ8hUyTOj
	 2ScIEq+iTHsb+dAc8ywT3DCkj6x01A1w/hqkdOtCGEqPMrWpoBR/+KppNOMe4DfH9s
	 Ory7f/g40Y3gD8k5JSGRA64zLiOMNW7Vtwl8t3guK107gjWazC9jeF9vUA19aytnm6
	 SWKmOnwvr6c3A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:42 -0600
Subject: [PATCH v5 18/19] accel: ethosu: Support IFM upscaling
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
Message-Id: <20261120-ethosu-fixes-v5-18-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Track the IFM upscaling mode while validating command streams and
adjust feature-map bounds for its 2x resampling modes.

Resize operations require no IFM upscaling, so reject a non-default
mode there. Ethos-U only defines upscaled IFM reads with unit kernel
strides and non-chained storage. Reject incompatible state when the
operation actually reads IFM, including elementwise operations, rather
than checking when registers are programmed.

Also enforce the pooling-mode restrictions: max/min cannot insert zeros,
and reduce_sum and argmax do not support IFM upscaling. The coordinate
reduction used for bounds checking must not be applied to these
undefined hardware configurations.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - Reject various invalid modes
 - IFM upscaling is not U85 specific, but supported on U65 too

v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_device.h |  7 ++++++
 drivers/accel/ethosu/ethosu_gem.c    | 46 ++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index f8066a9cf610..40b7f28ae61d 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -93,6 +93,12 @@ struct gen_pool;
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
+enum ethosu_ifm_upscale_mode {
+	NPU_IFM_UPSCALE_NONE,
+	NPU_IFM_UPSCALE_NEAREST,
+	NPU_IFM_UPSCALE_ZEROS,
+};
+
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
 	NPU_OP_CONV = 0x2,
@@ -109,6 +115,7 @@ enum ethosu_cmds {
 	NPU_SET_IFM_PAD_BOTTOM = 0x103,
 	NPU_SET_IFM_DEPTH_M1 = 0x104,
 	NPU_SET_IFM_PRECISION = 0x105,
+	NPU_SET_IFM_UPSCALE = 0x107,
 	NPU_SET_IFM_BROADCAST = 0x108,
 	NPU_SET_IFM_WIDTH0_M1 = 0x10a,
 	NPU_SET_IFM_HEIGHT0_M1 = 0x10b,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index d2884d9922ae..b4544298742f 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -167,6 +167,7 @@ struct cmd_state {
 	u8 acc_input_precision;
 	bool fast_weights;
 	u8 parallel_mode;
+	u8 ifm_upscale;
 	struct dma_state dma;
 	struct buffer scale[2];
 	struct buffer weight[4];
@@ -402,6 +403,11 @@ static int feat_matrix_validate(struct ethosu_device *edev,
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PRECISION) ||
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_DEPTH_M1))
 			return -EINVAL;
+		if (st->ifm_upscale &&
+		    (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_STRIDE) ||
+		     feat_matrix_chained(edev, fm) ||
+		     (st->ifm.stride_kernel & (BIT(0) | BIT(1) | BIT(6) | BIT(9)))))
+			return -EINVAL;
 		if (feat_matrix_chained(edev, fm))
 			return 0;
 		if (!cmd_state_reg_is_set(st, NPU_SET_IFM_WIDTH0_M1) ||
@@ -745,6 +751,11 @@ static int calc_sizes_resize(struct drm_device *ddev,
 	u64 len;
 	int ret;
 
+	if (st->ifm_upscale != NPU_IFM_UPSCALE_NONE ||
+	    feat_matrix_chained(edev, &st->ofm) ||
+	    FIELD_GET(NPU_OFM_TRANSPOSE_MASK, st->ofm.precision))
+		return -EINVAL;
+
 	if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
 	    !cmd_state_reg_is_set(st, NPU_SET_KERNEL_HEIGHT_M1) ||
 	    !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_WIDTH_M1) ||
@@ -811,6 +822,19 @@ static int weight_streams(struct ethosu_device *edev, struct cmd_state *st,
 	return 0;
 }
 
+static u32 ifm_upscale_coord(u32 coord, u8 mode)
+{
+	switch (mode) {
+	case NPU_IFM_UPSCALE_NONE:
+		return coord;
+	case NPU_IFM_UPSCALE_NEAREST:
+	case NPU_IFM_UPSCALE_ZEROS:
+		return coord / 2;
+	}
+
+	return 0;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool inactive)
@@ -871,6 +895,8 @@ static int calc_sizes(struct drm_device *ddev,
 
 		if (ifm_height < 0 || ifm_width < 0)
 			return -EINVAL;
+		ifm_height = ifm_upscale_coord(ifm_height, st->ifm_upscale);
+		ifm_width = ifm_upscale_coord(ifm_width, st->ifm_upscale);
 
 		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
 				       ifm_width, ifm_height, st->ifm.depth, false,
@@ -972,6 +998,8 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 		height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
 		width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
+		height = ifm_upscale_coord(height, st->ifm_upscale);
+		width = ifm_upscale_coord(width, st->ifm_upscale);
 
 		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
 				       width, height, depth, false, &len);
@@ -1102,6 +1130,19 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_OP_POOL:
 			if (param > (ethosu_is_u65(edev) ? 2 : 7))
 				return -EINVAL;
+			if (st.ifm_upscale) {
+				switch (param) {
+				case 0: /* max */
+				case 5: /* min */
+					if (st.ifm_upscale == NPU_IFM_UPSCALE_ZEROS)
+						return -EINVAL;
+					break;
+				case 2: /* reduce_sum */
+				case 6: /* argmax_x */
+				case 7: /* argmax_y */
+					return -EINVAL;
+				}
+			}
 			use_ifm = param != 0x4;  // pooling mode
 			if (!cmd_state_reg_is_set(&st, NPU_SET_OFM_PRECISION))
 				return -EINVAL;
@@ -1208,6 +1249,11 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				return -EINVAL;
 			st.ifm.precision = param;
 			break;
+		case NPU_SET_IFM_UPSCALE:
+			if (param > NPU_IFM_UPSCALE_ZEROS)
+				return -EINVAL;
+			st.ifm_upscale = param;
+			break;
 		case NPU_SET_IFM_BROADCAST:
 			st.ifm.broadcast = param;
 			break;

-- 
2.53.0

