Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186688;
	b=TrL2h1E9LdLHFI/PWwhMWdGAy+nxI97PnnNgioobEIB/sdc26OsWBvNvGo5RCQoCFD6+
	 ykQC3nAjqstmZvzIsYVAuwj/dix5gKN2EZIld5Xs8bZpdahB9SIl+SW0ZdYxC9DykW91T
	 zOYRb3HlWW05ki3MLTAxB0+WSkj7Z/toZHPC0ivvjLnntd5RwK8ixAOc/Hg1xKxGdxvhV
	 YS3t8Dwtk8NyzGvZpn3jrtAefgwvjGYZnX0PhSTvpstMebu5S6RPUJNnIGPzYY4wZb8pd
	 wWEZyZOTye+1PTIQYj7/ae6D0v+hpb3LnFTdABGOJZmaphJzioVJeYb6WCRzktVeP1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186688;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=OsDmDSuXIeI4Gt+DPJ5jUIsjpvJ19K8lSFk9Nw4dHLE=;
	b=muy9dwbP/L2AhLTZVFNajkXOnSK3r6JniKEZX4S2jcRyOUOSnwlj1XCsztOcyyJ8CVxE
	 2CfFa6ToSS3loEqTiIF9Lw9oOF/WNVMaQ8fuKcCk5uejLzmMeHxg+8DncmZVPqGeLF9pA
	 nZB0CT/nrrUoXjILljUIychfYwflELnTouCPsvhCx9LUVzVTp2ipb5tu5+E/3GZx3ovHI
	 EyCrrr/2STMP+EDLjJXdlwN1GSdmOLwZeyKgufsriwONSV/0+Higkvk/nwLH6doE876BE
	 QoSxcwwFujYCu+cLkZDAj/TLGgYhGm6ftNPfrsJPk8gA2sSZkv1yoqd+hG6TsvNXepQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8RTJFx9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90130606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8RTJFx9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5321F000CA;
	Fri, 20 Nov 2026 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186688;
	bh=OsDmDSuXIeI4Gt+DPJ5jUIsjpvJ19K8lSFk9Nw4dHLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L8RTJFx9SGYtOGuk/ZJOY1uvPzmlh/mAs66N6bYOyuCC1uyNnzMz2z4cBouCsgZZ2
	 W9SPtUaddXqYPV7l1ytP2nxVAypCrzbGG51h6aO0io1Q6n3BqAMkfKicZrv82x1bMG
	 GpBapWPylTU4wVx2XpOoscm7nedWJTdqKdjwthutJdYX80bvT0wCJq7870Zdy6hdFv
	 0rm7/c3BkDu/aZAdDEtOT4uFvJSg2f1XL/+m+Z1q2Eg/LA+R+iF/ut0ozE7iArXtqw
	 FwLnUG64se7yBQXoQLQs7Oyl3HBn/rgtJhkJdKtTXa5WsMf8ofEoO3uSMXXDGseM8b
	 cQ1WPUkeaNUUw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:28 -0600
Subject: [PATCH v5 04/19] accel: ethosu: Factor buffer bounds checks
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
Message-Id: <20261120-ethosu-fixes-v5-4-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Move the repeated command-stream buffer range validation into a
helper in preparation for validating all weight and scale streams.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v2:
 - Adjust due to previous patch
---
 drivers/accel/ethosu/ethosu_gem.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 75f6901d19e5..24f88696c18b 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -433,6 +433,25 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int buffer_size(struct ethosu_validated_cmdstream_info *info,
+		       struct cmd_state *st, struct buffer *buf, s8 region,
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd)
+{
+	u64 end;
+
+	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
+	    !cmd_state_reg_is_set(st, base_cmd) ||
+	    !cmd_state_reg_is_set(st, length_cmd))
+		return -EINVAL;
+
+	if (check_add_overflow(buf->base, (u64)buf->length, &end))
+		return -EINVAL;
+
+	info->region_size[region] = max(info->region_size[region], end);
+
+	return 0;
+}
+
 static int calc_sizes(struct drm_device *ddev,
 		      struct ethosu_validated_cmdstream_info *info,
 		      u16 op, struct cmd_state *st,
@@ -485,26 +504,20 @@ static int calc_sizes(struct drm_device *ddev,
 		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
 			op, st->weight[0].region, st->weight[0].base,
 			st->weight[0].base + st->weight[0].length - 1);
-		if (!cmd_state_reg_is_set(st, NPU_SET_WEIGHT_REGION) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_BASE) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_LENGTH))
+		if (buffer_size(info, st, &st->weight[0], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT_BASE,
+				NPU_SET_WEIGHT_LENGTH))
 			return -EINVAL;
-		info->region_size[st->weight[0].region] =
-			max(info->region_size[st->weight[0].region],
-			    st->weight[0].base + st->weight[0].length);
 	}
 
 	if (scale) {
 		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
 			op, st->scale[0].region, st->scale[0].base,
 			st->scale[0].base + st->scale[0].length - 1);
-		if (!cmd_state_reg_is_set(st, NPU_SET_SCALE_REGION) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_SCALE_BASE) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_SCALE_LENGTH))
+		if (buffer_size(info, st, &st->scale[0], st->scale[0].region,
+				NPU_SET_SCALE_REGION, NPU_SET_SCALE_BASE,
+				NPU_SET_SCALE_LENGTH))
 			return -EINVAL;
-		info->region_size[st->scale[0].region] =
-			max(info->region_size[st->scale[0].region],
-			    st->scale[0].base + st->scale[0].length);
 	}
 
 	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,

-- 
2.53.0

