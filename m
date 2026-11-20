Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186700;
	b=TMEjqKHAI9U5VGv5lqxU9i8gf0w+SBdTbKxSre0ySbvv+uJh1BQv/MNgkN3pfl7fv3o7
	 NlssbsjPyr6DXSuSkR0LBqIW5jrAp+dkHXljFjC87FnxbT7TgonPzp6ur7W9bilA+ebFH
	 wTg23M87nr3lfQL7KEFSXsIl6kNjTAhOBNjvyZ+3mDjWA4d42iAkOGpvmJxQygg1/GII6
	 rZ9svVOrktdc9rBwgGDBiM0deLlJZg4+/Aw2XEt6k0bntSLAHoHPYPQPfJ4+pvmPX45sl
	 +NbPsOkIqxfzgKnDUKBTY6f48mxtWPxdnTnr2O5NeQiTFr/LClfRcXmhTDUfsZ9bPng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186700;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Wo+hq524wgPYTckPrJ3+UD4ToFmN6+wQhxKoPrJSYDw=;
	b=1ESgqK0mkx07BaI//M0S1W+WyXQUMLx/1ocoXcDUAfRW6gkDoajCPrlormfJDvHNy9/r
	 99qQjtHXvopXdm0r6RSsK50MNO8IK8IUJf1VbwhwmzLa8+yfXcrrcQqprfiTuJ6sc0nDu
	 RKwupNGNjHCu1nY8DqcdlBRi1QJTLmj+HVD2PevyMAZ9ZPfjm3OZ9NrVVSOH+Pt7Jgtlc
	 yyeAHKfG1TVgFF+A6UnvI0H102gfF9IPC7MIS2s5/KP8JjeudFxQ1J8Le/NzYMEUEW9PN
	 wnVOenKejEGTDO1WQg0aV8MATt9lCrE3Xm3Zc3zP2KBHCWuRQkuZmPeGNdRt16UnQmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVqHCYpB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0260A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVqHCYpB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E991F00ADF;
	Fri, 20 Nov 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186700;
	bh=Wo+hq524wgPYTckPrJ3+UD4ToFmN6+wQhxKoPrJSYDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kVqHCYpBJ9mWsqqKXJfE0Xkz8xUdIhnWqySR+bFnCjLcqKptJn0SBSY07N1b7y4m0
	 xr7xBFYK5h19Gf3mJunxNqADWX3+G28mj3FsM0Xjpriz5ABbBO0nnYBJ87VhK8NLlb
	 U+vpfHX4tXUlf3GJtlhwo9X6TTk6O8z8WZjLD9EOOeucH7WzxUnaFqwpgFoT+bNxUJ
	 UFUmUL6XURSLdhQJnNqmJjAmR4j13IANtsEMHxnn5fPya/6Jn290gOG3+/A/6VRO/b
	 UV01VJYhMx+GD8Ib5/FL/bQCswGa9GGPuEZCFzbA4mVCfsyaJAN9dVIpB1m6Tt8QLg
	 toek2uFu/SjzA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:34 -0600
Subject: [PATCH v5 10/19] accel: ethosu: Validate convolution parameter
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
Message-Id: <20261120-ethosu-fixes-v5-10-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The U65 NPU_OP_CONV command has no parameter fields, but the
validator interpreted bit zero as the U85 weights_ifm2 field. A crafted
U65 stream could consequently make validation skip the weight buffer
that hardware accesses.

Require a zero parameter on U65 and reject the reserved U85 parameter
bits.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h | 1 +
 drivers/accel/ethosu/ethosu_gem.c    | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 1ea7638287f0..c1cae47ab0e2 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -87,6 +87,7 @@ struct gen_pool;
 #define PMU_EV_TYPE_IDLE	0x20
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
+#define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index b5df8e61c1b1..512a853fd942 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -776,7 +776,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				st.dma.dst.region, st.dma.dst.offset, dstlen);
 			break;
 		case NPU_OP_CONV:
-			use_ifm2 = param & 0x1;  // weights_ifm2
+			if ((ethosu_is_u65(edev) && param) || (param & ~NPU_OP_CONV_WEIGHTS_IFM2))
+				return -EINVAL;
+
+			use_ifm2 = param & NPU_OP_CONV_WEIGHTS_IFM2;
 			if (!cmd_state_reg_is_set(&st, NPU_SET_OFM_PRECISION))
 				return -EINVAL;
 			use_scale = !(st.ofm.precision & 0x100);

-- 
2.53.0

