Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186703;
	b=Q9/rXDGa/r1AgP+cqVnKdAoQPCMrxW/5hMld/znhH4mT5f+7XNHOFRQKCyQNh78CsLDu
	 FwfQJxrk4EJGQr518ABRTR5gGQi+pfpMD5h14Gr5NO7i/kvMy0XwmvNrGzZhlB8L8fbSG
	 vlF0MI3wtb8Wso02EILX6K4b2i49/ZJRo2drjKoERMUPAmqP7qgNeBK1gRIEiaVY0D0G4
	 s19iK6nHk2E4ZUDeuGmxzbfMm1lT++9aM9g4bQkVehilOlQ7fa0uxvcsfbLSPeqmcVvn0
	 TrcBzQ9COM4cto8hkhQoyzUb5Z4pgwpK2UAKxJQ0A9Qci+F74Gp2BUnXIBQdtJnsLgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186703;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=27dhv0JRMpIH+J1Cqh1wMuU6+F94azi48uC0yRQt0f8=;
	b=Ujpd89dqIjTtUvTPcsG1DKJ2wpY28SHSJlJY3md5c5KhBbpeEzo0vv3ocf1MxNk1WViL
	 h6FwbuANq9o6bk0IaayYrsyZ2055WjjB09ZaM74TNLFZ5k7yuVAH7gbDXUX/qJvXlW3+d
	 yu32t4g7g9QD/NskxMbnWMgPdpYh3afzz8GESLQm9vr6jWl+uTqrwQrF7XsRg3WhwEkta
	 dilBToBPGaYZLTcGBm2WkMKrnRWagABixt6hsPyTm6mMQKLVMEBGbeC9euxJOrbKvwARi
	 +PjiewiCvKUIefMrVerLrW4QcEla97dhSWfBQjhv55QhJ2CbI8w+51Tf+H6QqA5CA6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oybaZU5l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12660A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oybaZU5l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114C61F000D1;
	Fri, 20 Nov 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186703;
	bh=27dhv0JRMpIH+J1Cqh1wMuU6+F94azi48uC0yRQt0f8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oybaZU5lC6WCIs0yU0MG60HsV4kZom4RkPcD+HyAU52nH4WbvFQxTGxPX1OY+DddQ
	 0YbKUMidttcuG+rF4Ok2iuyI5VCvQbKV3FBKJtQp5oVvf3ONc24wWKj4eAc/vpS1c7
	 sKRbK7y/ABs72xsu8N2ti1VGwnPbgs307N6aleS+BYr4miEq3TXPOQRGU+9B/rMiyU
	 UV9K4u9ImNj11Y/pzG/RHsostNAPnB2jrHE26UtG+WFnjfMji2RwdbAggXHVufIwhI
	 1s8BFz1j9PrvxIoR1v4npIUQKiAr0DAA4tuCyFOwKA5S8s04nAt3VfSg+j6Ub29gza
	 l14sBj1IwPNUw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:35 -0600
Subject: [PATCH v5 11/19] accel: ethosu: Validate accumulator input
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
Message-Id: <20261120-ethosu-fixes-v5-11-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The U85 ACC_FORMAT command can select IFM2 as the accumulator
input. This is used by null-pool operations and can also be used
by convolution. Track this selection and validate the IFM2 feature
map against the OFM extent before submitting the operation.

U85 accumulator restore reads 32 or 64 bits according to ACC_FORMAT,
regardless of the programmed IFM2 precision. Require IFM2 precision to
match that width before using it to calculate the input bounds.
Otherwise a stream can advertise a smaller element size and pass
validation with a buffer smaller than the hardware reads. Also reject
reserved accumulator formats whose read width is not modeled.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - Ensure ACC_FORMAT has been set when accumulator input is used
 - Handle accumulator size mismatch with IFM2 size

v4:
 - Accumulator input should not be checked for elementwise ops

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h |  4 ++++
 drivers/accel/ethosu/ethosu_gem.c    | 45 ++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index c1cae47ab0e2..716c648c2dfd 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -123,6 +123,7 @@ enum ethosu_cmds {
 	NPU_SET_KERNEL_WIDTH_M1 = 0x120,
 	NPU_SET_KERNEL_HEIGHT_M1 = 0x121,
 	NPU_SET_KERNEL_STRIDE = 0x122,
+	NPU_SET_ACC_FORMAT = 0x124,
 	NPU_SET_WEIGHT_REGION = 0x128,
 	NPU_SET_SCALE_REGION = 0x129,
 	NPU_SET_DMA0_SRC_REGION = 0x130,
@@ -177,6 +178,9 @@ enum ethosu_cmds {
 	NPU_SET_WEIGHT3_LENGTH = 0x4095,
 };
 
+#define NPU_ACC_FORMAT_INPUT_MASK	GENMASK(5, 4)
+#define NPU_ACC_INPUT_IFM2		2
+
 #define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
 
 struct ethosu_perfmon;
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 512a853fd942..e3cd28c02e81 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -155,6 +155,7 @@ struct feat_matrix {
 struct cmd_state {
 	DECLARE_BITMAP(cmd0, NPU_CMD0_REGS);
 	DECLARE_BITMAP(cmd1, NPU_CMD1_REGS);
+	u8 acc_input_precision;
 	struct dma_state dma;
 	struct buffer scale[2];
 	struct buffer weight[4];
@@ -534,6 +535,36 @@ static int feat_matrix_size(struct ethosu_device *edev,
 					  max_len);
 }
 
+static int
+calc_acc_input_size(struct drm_device *ddev,
+		    struct ethosu_validated_cmdstream_info *info,
+		    struct cmd_state *st)
+{
+	struct ethosu_device *edev = to_ethosu_device(ddev);
+	u64 len;
+	int ret;
+
+	if (!ethosu_is_u65(edev) &&
+	    !cmd_state_reg_is_set(st, NPU_SET_ACC_FORMAT))
+		return -EINVAL;
+
+	if (!st->acc_input_precision)
+		return 0;
+
+	/* ACC_FORMAT selects the read width, not IFM2_PRECISION. */
+	if (((st->ifm2.precision >> 2) & 0x3) != st->acc_input_precision)
+		return -EINVAL;
+
+	/* The accumulator has one input value for each OFM element. */
+	ret = feat_matrix_size(edev, info, st, &st->ifm2,
+			       FEAT_MATRIX_IFM2, st->ofm.width,
+			       st->ofm.height[2], st->ofm.depth, false, &len);
+	dev_dbg(ddev->dev, "ACC IFM2:%d:0x%llx-0x%llx\n",
+		st->ifm2.region, st->ifm2.base[0], len);
+
+	return ret;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
@@ -649,6 +680,9 @@ static int calc_sizes(struct drm_device *ddev,
 			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
+	if (ret)
+		return ret;
+	ret = calc_acc_input_size(ddev, info, st);
 	if (ret)
 		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
@@ -851,6 +885,17 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_KERNEL_STRIDE:
 			st.ifm.stride_kernel = param;
 			break;
+		case NPU_SET_ACC_FORMAT:
+			if (!ethosu_is_u65(edev)) {
+				u32 acc_input = FIELD_GET(NPU_ACC_FORMAT_INPUT_MASK, param);
+
+				if (acc_input > NPU_ACC_INPUT_IFM2 || (param & 0x3) > 1)
+					return -EINVAL;
+				/* i32 and i48 require b32 and b64 IFM2, respectively. */
+				st.acc_input_precision = acc_input == NPU_ACC_INPUT_IFM2 ?
+					(param & 0x3) + 2 : 0;
+			}
+			break;
 		case NPU_SET_IFM_PAD_TOP:
 			st.ifm.pad_top = param & 0x7f;
 			break;

-- 
2.53.0

