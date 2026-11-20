Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186713;
	b=wf6bf4wXXjd8AuQDXDweAV9L9/ggF9dfsUReE6CQQvO7QSnUVl6w1sgGkZx+FsW64GiA
	 bhb1r8PB5XoZE4l1qDT+mNgccSnMjPBZa9mCpeD2/miYSKv7cvfHkTiurx6SqH7zTUfFb
	 V+W2QgnIA8FB9PYokK1rT2cXH9pEkykHrBF64+fCOl07TkSD7BiX/WaXO2WWQPu0AQ8eB
	 AO60be+0yJk+25k7JAy9ZPZAsqAGoUIAvXqFBIPTycZVwPz5TcxXPahpp1h453ojfSjDP
	 0cAW3MAwaIHyOKnU/j5FEUNVz87xdUPQMGSqyThBJ1UVhZae9ZXMj+Q3dfoJhV2pfoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186713;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=PIYUae3kiWtZZXWSAxOku0Yo/racyG8mSFj2ZTDlLPs=;
	b=Z/SsKyUWcVzfzDEKoznSsyFziicTOMwyGJJKNHSkai4vDQTMUcLCelgkt+cEr4ceoAAc
	 mZE15V3hCEdpN9PZyAoQaUKevMlOftvavDIdusp2JzLkVUtltx1ZfCE+fZX5I7Lr0Z5hu
	 27V+KoSw5VB5gQAlp9B3EyYWkzpvNVvpvvxoZ1tpfMXZ9IKSsUSREilmbOG/lGcN2ZNOj
	 3KVst1ehpfC0pzJg4v2YseV1GO8E38olMSmKJ7teFUa7pDf3gaiCjU/r+p4bDkqirAH1l
	 I2fzRLsQosVKwLsiHxbzy/sKwBW6R+fF+g0tEZXMHdPi/2TDvyJdmXojCZlo+jTja5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSd25doY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F14D606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSd25doY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075971F000D3;
	Fri, 20 Nov 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186713;
	bh=PIYUae3kiWtZZXWSAxOku0Yo/racyG8mSFj2ZTDlLPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LSd25doY2ot3YdpS203g8oBWUErEcv16cp/TdKVbvnQKDXbZVfDFeHUPJZKb3cBho
	 eDHtJxqxRLf2yfobBNOcJ4xCROkUq1KkaxdQh6N6cOr6vaBw2VnTqat8F3ayOb+qOR
	 g/rvcJh8xqhye/nYOKII3lOdga9bfcXfaJGB2chFrqUa4jwa1+qbQOs21z8svPnkMt
	 MsqOh6NSkEnHW3BDsjXRM4sjN98dGWJW6qrKHmZslb/iVQbIgXpXfg9Wc9IvF3iJ1T
	 /pHkek6bQxd9XtNItw3pUjWItqJYWRPz71zrUYLCfveNJaXiSRBulCU7F3yUkqBOZy
	 5FhAdTXHPeGIg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:38 -0600
Subject: [PATCH v5 14/19] accel: ethosu: Validate OFM transpose
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
Message-Id: <20261120-ethosu-fixes-v5-14-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

U85 OFM dimensions are specified before transposition, while
tile bases and strides address the transposed feature map. Permute
the output endpoint before validating its tile and stride accesses.

Allow the defined U85 transpose encodings and reject the two
reserved encodings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v4:
 - Allow only HWC, HCW, and CHW output layouts for elementwise ops
 - Don't allow 64-bit output precision and chained output storage

v2:
 - no change
---
 drivers/accel/ethosu/ethosu_device.h |  1 +
 drivers/accel/ethosu/ethosu_gem.c    | 69 ++++++++++++++++++++++++++++++++++--
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 716c648c2dfd..368daac25acc 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -88,6 +88,7 @@ struct gen_pool;
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
 #define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
+#define NPU_OFM_TRANSPOSE_MASK		GENMASK(13, 11)
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 0ab73b99c458..b8f840ab1cee 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -432,6 +432,52 @@ static int feat_matrix_validate(struct ethosu_device *edev,
 
 	return 0;
 }
+
+static int feat_matrix_permute(struct ethosu_device *edev,
+			       struct feat_matrix *fm, u32 *x, u32 *y,
+			       u32 *c, bool ofm)
+{
+	u32 width = *x;
+	u32 height = *y;
+	u32 depth = *c;
+	u32 transpose;
+
+	if (ethosu_is_u65(edev) || !ofm)
+		return 0;
+
+	transpose = FIELD_GET(NPU_OFM_TRANSPOSE_MASK, fm->precision);
+
+	switch (transpose) {
+	case 0: /* HWC */
+		break;
+	case 1: /* WHC */
+		*x = height;
+		*y = width;
+		break;
+	case 2: /* HCW */
+		*x = depth;
+		*c = width;
+		break;
+	case 3: /* WCH */
+		*x = depth;
+		*y = width;
+		*c = height;
+		break;
+	case 6: /* CHW */
+		*x = height;
+		*y = depth;
+		*c = width;
+		break;
+	case 7: /* CWH */
+		*y = depth;
+		*c = height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
 static u64 feat_matrix_length(struct ethosu_device *edev,
 			      struct ethosu_validated_cmdstream_info *info,
 			      struct cmd_state *st, struct feat_matrix *fm,
@@ -538,6 +584,9 @@ static int feat_matrix_size(struct ethosu_device *edev,
 	int ret;
 
 	*max_len = 0;
+	ret = feat_matrix_permute(edev, fm, &x, &y, &c, ofm);
+	if (ret)
+		return ret;
 
 	if (storage == 0) {
 		ret = feat_matrix_check_location(edev, info, st, fm, type, 0, 0,
@@ -927,6 +976,11 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			default:
 				return -EINVAL;
 			}
+			if (!ethosu_is_u65(edev) &&
+			    FIELD_GET(NPU_OFM_TRANSPOSE_MASK, st.ofm.precision) != 0 &&
+			    FIELD_GET(NPU_OFM_TRANSPOSE_MASK, st.ofm.precision) != 2 &&
+			    FIELD_GET(NPU_OFM_TRANSPOSE_MASK, st.ofm.precision) != 6)
+				return -EINVAL;
 			if (!ethosu_is_u65(edev) &&
 			    !cmd_state_reg_is_set(&st, NPU_SET_IFM_BROADCAST))
 				return -EINVAL;
@@ -1029,8 +1083,19 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_OFM_PRECISION:
 			if (((param >> 6) & 0x3) > 1)
 				return -EINVAL;
-			if (!ethosu_is_u65(edev) && (param & GENMASK(13, 11)))
-				return -EINVAL;
+			if (!ethosu_is_u65(edev)) {
+				u32 transpose = FIELD_GET(NPU_OFM_TRANSPOSE_MASK, param);
+
+				switch (transpose) {
+				case 4:
+				case 5:
+					return -EINVAL;
+				}
+				if (transpose && ((param >> 1) & 0x3) == 3)
+					return -EINVAL;
+				if ((param >> 14) == 2 && transpose)
+					return -EINVAL;
+			}
 			st.ofm.precision = param;
 			break;
 		case NPU_SET_OFM_REGION:

-- 
2.53.0

