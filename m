Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186693;
	b=CNU5pOiNTlspUQfyXLr0z0VFsv7rE9CYKX4tNWBSopmh/Mw25yEAZhd+5iQ5l6MjdazM
	 PwCf3PbpiIjvSNsG+EjNA3JhSLaoW3NYX0edzJUWRWs5mpaXvteakNwQR6vg6UIIcWqpb
	 cGB+AWKMETQHny5BqCOslsIJ/QF8GjW5jUzSBBotiLOUcSU4yaAlJe7dCCnIu0DlQlaKO
	 Eylqy8Jq2VAGtlg1fqcANhh7LxUFf6fzzKOeWsIeuhjygZJ9udYNT7foVOcBXkk2Ot/qW
	 MWlojWInAtexBJMlPYf3Psi8UBWRsiAYqjWxFiroV3pNVqMl1EpXUN5A2uTofv9TFBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186693;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=uZtGli3CkGrAhqKNwEKSISDtx01ePT5PWZSPVbc9OdE=;
	b=c2T6iya6jJhRy4E0RNBrH5NdOd5eWFPTVRDztvOdeaf0bmPGQAoSOBfCSrJpF7nau3xm
	 swJmEtyuJ3NlqSCanwdDHYFxKSkTYoaeC74bFTd2NaHI3KIfawp/Jhu4RQw3TJLhN2nCD
	 falI0deiWrOyytvKVcxviUbjxCOBayc2iTnOXfbOOeoSOGgZOkahGdXBsMDwe/K4UIXmk
	 9jdnxjfA3mEdB0rvhvVL49Lbn7LYVpnAOgACqdnmBvUlnkY4oP3Fm+UG0SEZEDzOj7Ch1
	 6B3Qnr5cFiPCHj47SB9sFaJxzOcSY2XfHlvNC0YOZh3Yirnu9vc6+vuV/K2DZe5NkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+CeVaOz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD47C606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+CeVaOz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC151F000C0;
	Fri, 20 Nov 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186693;
	bh=uZtGli3CkGrAhqKNwEKSISDtx01ePT5PWZSPVbc9OdE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C+CeVaOz2nF9ABdQXaAIonS/gu8qKbpk0EUC2Wk21vaBYlBpQIf7mKhD2JkMHlMRb
	 73dOG8OjXtRrVOjjxXWgWzDL00MUJhqnKI6XJ5wgOzHZ0wvwc/0UI6OgRQsdn/etrT
	 PKb3xi2sOND62rvYkIjjjl6Akh6Wp/2DIOVVfudZdeVOm0UgJYvvWeRt5dWgm0WTlE
	 uKcp3NwSYuDDT8BFroVyefhWXZktcvgNM/ODfrmQkWV/JSiqQq5YoeaLszjPoHV9MM
	 oiTshH2UGd9l9q6zfBqplGccLJgNCPLS2V5qfcbCWj7T7Hc9H8HcFbbhssSIChmyMj
	 wGDuug223WddA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:30 -0600
Subject: [PATCH v5 06/19] accel: ethosu: Validate secondary streams
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
Message-Id: <20261120-ethosu-fixes-v5-6-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator records the additional U65 scale and
weight stream addresses and the U85 weight decoder addresses, but only
checked stream 0 against its region buffer.

Check every configured secondary stream against the matching weight or
scale region before accepting a kernel operation.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v2:
 - Adjust for register state tracking
---
 drivers/accel/ethosu/ethosu_gem.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 67c7cbbd39b8..af8a0c45039b 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -436,13 +436,17 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
-		       u16 region_cmd, u16 base_cmd, u16 length_cmd)
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
 {
 	u64 end;
+	bool base_set = cmd_state_reg_is_set(st, base_cmd);
+	bool length_set = cmd_state_reg_is_set(st, length_cmd);
+
+	if (optional && !base_set && !length_set)
+		return 0;
 
 	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
-	    !cmd_state_reg_is_set(st, base_cmd) ||
-	    !cmd_state_reg_is_set(st, length_cmd))
+	    !base_set || !length_set)
 		return -EINVAL;
 
 	if (check_add_overflow(buf->base, (u64)buf->length, &end))
@@ -507,7 +511,20 @@ static int calc_sizes(struct drm_device *ddev,
 			st->weight[0].base + st->weight[0].length - 1);
 		if (buffer_size(info, st, &st->weight[0], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT_BASE,
-				NPU_SET_WEIGHT_LENGTH))
+				NPU_SET_WEIGHT_LENGTH, false))
+			return -EINVAL;
+
+		if (buffer_size(info, st, &st->weight[1], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT1_BASE,
+				NPU_SET_WEIGHT1_LENGTH, true) ||
+		    buffer_size(info, st, &st->weight[3], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT3_BASE,
+				NPU_SET_WEIGHT3_LENGTH, true))
+			return -EINVAL;
+		if (!ethosu_is_u65(edev) &&
+		    buffer_size(info, st, &st->weight[2], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT2_BASE,
+				NPU_SET_WEIGHT2_LENGTH, true))
 			return -EINVAL;
 	}
 
@@ -517,7 +534,13 @@ static int calc_sizes(struct drm_device *ddev,
 			st->scale[0].base + st->scale[0].length - 1);
 		if (buffer_size(info, st, &st->scale[0], st->scale[0].region,
 				NPU_SET_SCALE_REGION, NPU_SET_SCALE_BASE,
-				NPU_SET_SCALE_LENGTH))
+				NPU_SET_SCALE_LENGTH, false))
+			return -EINVAL;
+
+		if (ethosu_is_u65(edev) &&
+		    buffer_size(info, st, &st->scale[1], st->scale[0].region,
+				NPU_SET_SCALE_REGION, NPU_SET_SCALE1_BASE,
+				NPU_SET_SCALE1_LENGTH, true))
 			return -EINVAL;
 	}
 

-- 
2.53.0

