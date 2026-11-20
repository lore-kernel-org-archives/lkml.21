Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186697;
	b=Z4wTWn6JbhA6u6Jwd790KVFMxZX6gh5/TY+hxnv7aM2gA30TzrGOrYKHPeIXq5qv0UO1
	 9odz0+0JjGqo87FgMAlVlw3cuPvEWSbCJFuJtgiMmeUhPwbKDsB46C3++gNzYHxv0hOqh
	 TOTAyQKnds3ivxnNH0ccPhRQTyhVRW8LlpHzPF8TbdEolbtW913mBwbFd/Rophm5EM9RJ
	 KSLQBXV1qhw6vWhXDwPGGZe0zRWK9CW7WWo4IVOfw2qFd2+/pM0yuJ5D10LmhsMc0+03O
	 HQdui3KzbKddqKzHeRsek/heOzw9BA0o4pvo9fG92vcOl7VUIOgBChsVik2f8/dbzig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186697;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=gAiKnDvlUSeWowcD3gLHGK3bKq8UZqbxkXcowaWUrCE=;
	b=JfhKfzsdFKsaSLu31wda1IEPfB5+vPAmUJE/DsyK3U5f7Lt7/qzxuHxleLBhCB/IjgFR
	 Vii+vE8rxKsYRWtL4nW/7iB/4SftcKG+rb1rtuG/oBcNFZfQG+PZH1rmg3gG6024tQwfA
	 5VUIgfU7nOTTsm9AjvbVfxoIY2gTw3S0rqDTASEvkiTh3qm00sjsUidGlHpK3MVu3yCvo
	 Ml0mAjx+A3LF/oli46sd8qZxlKJ1YbnuO7Q9DSgJ3eC5GqaBfbzHem8sittg6uDLIU6B2
	 +J5APzoKeLJ+QEuycu8HDhyIAIb7O1EKhflIyjZ8I0tE8VYY8uWKa0L4MkUoI1rU+2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHurcA23;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2747606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHurcA23
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BD71F000D3;
	Fri, 20 Nov 2026 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186697;
	bh=gAiKnDvlUSeWowcD3gLHGK3bKq8UZqbxkXcowaWUrCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FHurcA23NqLcVsA6/Psx2hCcOvUfk4o6WsZb/AQYSpWz/NfexwbVRcEnWY1EVqfDF
	 3Sf6i1A3thmcfmhbnBIZm2FF8C4Rdsv6A5o/2TGkK321k6xLys1axLK0IQDq+JAkjl
	 aeHiKJanhUUmjD/ockGhZ6pQfGlhSW+27HlMIVBHNit5UnGomWa5S+XRv50+BbUTGR
	 vdVFVqObqBR2ODACxGNUNVJxRVhwcMGlsW8gKURfbBY8OvcFfvKxO+bcuanFC61xNP
	 nU8cD2umoK+XMRuFjPnQCVwTBibP+z0I4srs2YLUQC631B8Q5HXpkK6AB3AKLswvIp
	 FmfEAVm3byP2A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:32 -0600
Subject: [PATCH v5 08/19] accel: ethosu: Validate all feature map tiles
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
Message-Id: <20261120-ethosu-fixes-v5-8-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator checked only the final feature-map
coordinate. For tiled tensors, this can leave an earlier tile base
address unchecked even though the operation accesses it.

Check the final coordinate of every tile touched by an operation. Also
treat U65 feature maps as 2x2 tiled: its precision rounding bits are not
the U85 storage encoding.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v4:
 - NHCWB16 feature maps may be vertically tiled. Account for tile 0's
   maximum Y coordinate when calculating the feature map bounds.

v3:
 - Fix for storage mode 0 intermediate tile calculations

v2:
 - no changes
---
 drivers/accel/ethosu/ethosu_gem.c | 147 ++++++++++++++++++++++++++++++--------
 1 file changed, 119 insertions(+), 28 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9a66d8439408..11f41382dc5d 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -444,6 +444,96 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int feat_matrix_check_location(struct ethosu_device *edev,
+				      struct ethosu_validated_cmdstream_info *info,
+				      struct cmd_state *st, struct feat_matrix *fm,
+				      enum feat_matrix_type type, u32 x, u32 y,
+				      u32 c, bool ofm, u64 *max_len)
+{
+	u64 len;
+
+	len = feat_matrix_length(edev, info, st, fm, type, x, y, c, ofm);
+	if (len == U64_MAX)
+		return -EINVAL;
+
+	*max_len = max(*max_len, len);
+	return 0;
+}
+
+static int feat_matrix_size(struct ethosu_device *edev,
+			    struct ethosu_validated_cmdstream_info *info,
+			    struct cmd_state *st, struct feat_matrix *fm,
+			    enum feat_matrix_type type,
+			    u32 x, u32 y, u32 c, bool ofm, u64 *max_len)
+{
+	u32 storage = ethosu_is_u65(edev) ? 0 : fm->precision >> 14;
+	int ret;
+
+	*max_len = 0;
+
+	if (storage == 0) {
+		ret = feat_matrix_check_location(edev, info, st, fm, type, 0, 0,
+						 c, ofm, max_len);
+		if (ret)
+			return ret;
+
+		ret = feat_matrix_check_location(edev, info, st, fm, type,
+						 min(x, (u32)fm->width0),
+						 min(y, (u32)fm->height[0]), c, ofm,
+						 max_len);
+		if (ret)
+			return ret;
+
+		if (fm->width0 < x) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+							 min(y, (u32)fm->height[1]), c,
+							 ofm, max_len);
+			if (ret)
+				return ret;
+		}
+
+		if (fm->height[0] < y) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type,
+							 min(x, (u32)fm->width0), y, c,
+							 ofm, max_len);
+			if (ret)
+				return ret;
+		}
+
+		if (fm->width0 < x && fm->height[1] < y)
+			return feat_matrix_check_location(edev, info, st, fm, type,
+							  x, y, c, ofm, max_len);
+
+		return 0;
+	}
+
+	if (storage == 1) {
+		ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+						 min3(y, (u32)fm->height[0],
+						      (u32)fm->height[1]), c, ofm,
+						 max_len);
+		if (ret)
+			return ret;
+		if (fm->height[0] < fm->height[1] && fm->height[1] <= y) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+							 fm->height[1], c, ofm,
+							 max_len);
+			if (ret)
+				return ret;
+		}
+		if (fm->height[1] < y) {
+			ret = feat_matrix_check_location(edev, info, st, fm, type, x,
+							 fm->height[1] + 1, c, ofm,
+							 max_len);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return feat_matrix_check_location(edev, info, st, fm, type, x, y, c, ofm,
+					  max_len);
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
@@ -474,6 +564,7 @@ static int calc_sizes(struct drm_device *ddev,
 {
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
@@ -496,23 +587,22 @@ static int calc_sizes(struct drm_device *ddev,
 		if (ifm_height < 0 || ifm_width < 0)
 			return -EINVAL;
 
-		len = feat_matrix_length(edev, info, st, &st->ifm,
-					 FEAT_MATRIX_IFM, ifm_width, ifm_height,
-					 st->ifm.depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
+				       ifm_width, ifm_height, st->ifm.depth, false,
+				       &len);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
 			op, st->ifm.region, st->ifm.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (ifm2) {
-		len = feat_matrix_length(edev, info, st, &st->ifm2,
-					 FEAT_MATRIX_IFM2, st->ifm.depth, 0,
-					 st->ofm.depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm2, FEAT_MATRIX_IFM2,
+				       st->ifm.depth, 0, st->ofm.depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
 			op, st->ifm2.region, st->ifm2.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (weight) {
@@ -554,13 +644,13 @@ static int calc_sizes(struct drm_device *ddev,
 			return -EINVAL;
 	}
 
-	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
-				 st->ofm.width, st->ofm.height[2], st->ofm.depth,
-				 true);
+	ret = feat_matrix_size(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
+			       st->ofm.width, st->ofm.height[2], st->ofm.depth,
+			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
-	if (len == U64_MAX)
-		return -EINVAL;
+	if (ret)
+		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
 		info->output_region[st->ofm.region] = true;
 
@@ -575,18 +665,19 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u32 height, width, depth;
 	u64 len;
+	int ret;
 
 	if (ifm) {
 		height = st->ifm.broadcast & 0x1 ? 0 : st->ofm.height[2];
 		width = st->ifm.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm.broadcast & 0x4 ? 0 : st->ofm.depth;
 
-		len = feat_matrix_length(edev, info, st, &st->ifm,
-					 FEAT_MATRIX_IFM, width, height, depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IFM,
+				       width, height, depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
 			op, st->ifm.region, st->ifm.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
 	if (ifm2) {
@@ -594,21 +685,21 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 		width = st->ifm2.broadcast & 0x2 ? 0 : st->ofm.width;
 		depth = st->ifm2.broadcast & 0x4 ? 0 : st->ofm.depth;
 
-		len = feat_matrix_length(edev, info, st, &st->ifm2,
-					 FEAT_MATRIX_IFM2, width, height, depth, false);
+		ret = feat_matrix_size(edev, info, st, &st->ifm2, FEAT_MATRIX_IFM2,
+				       width, height, depth, false, &len);
 		dev_dbg(ddev->dev, "op %d: IFM2:%d:0x%llx-0x%llx\n",
 			op, st->ifm2.region, st->ifm2.base[0], len);
-		if (len == U64_MAX)
-			return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
-	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
-				 st->ofm.width, st->ofm.height[2], st->ofm.depth,
-				 true);
+	ret = feat_matrix_size(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,
+			       st->ofm.width, st->ofm.height[2], st->ofm.depth,
+			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
-	if (len == U64_MAX)
-		return -EINVAL;
+	if (ret)
+		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
 		info->output_region[st->ofm.region] = true;
 

-- 
2.53.0

