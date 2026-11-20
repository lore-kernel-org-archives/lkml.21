Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186681;
	b=XhyFzm/KsmT5HSHfa5C+qQpF0kYYLM6PS9hZTYnKYNhXIMxrhJhwWfQ92L0K0VSo5MdZ
	 qAmC4PVpP2MrJijvjU47cFlRrCN4VNytagxBX+I3lb9r271VhBoDY5R++FyqCH07ih+VW
	 U4f9kVtLZPswQOT3vP3LY30UPhzJXGiF19Cldr94/Ema+0NBYYwlyvOy9N8kXNBF/K/58
	 fqLBGfHpgVeZebwy/QLtmqQskwRnzsshABN8GkATotG9XrU6N0zGt9dvkt89OkiqBocZv
	 /9tdXhVi3vpY3LDH87JcE4JBfGKyH4l/16eBuhhEJRhE4WTePp7zZ7gy8s0b13xs/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186681;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Pr1WtMPYbJva/hZrRXheA1lv8FlhIQFRrXoqaipeTwk=;
	b=plUjQmUDfCYYgwu2GILwefmFYopfzK+aJE/qAbildcp2vVFuuqrtcAwo3X6jY+sQbzEC
	 /Fh+PdUK2/EZo+TQjxdwiNq6LYYZdV8SY0jgmqV50olyFOJZatNV3RTrQ5lGGiv5ZFv59
	 CKHRcZsueWyKyfEsSZ+B+EutvLxbBJILJknutL2seB67JoXgatuIiYYfVfs6yJ3iXlHSr
	 qE8nRfJHZacbEqsH+LeSUu0Sm7b/JGG7qPukRy+LTaS0PClF/TAb7HEhcuiBhEtYLEDuO
	 oVsFWr3KhArDBEFP42BfmJxuNdOwE3anRGriJCFzLFBoEZ6C3vHrOV+9cib8J5nxorw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muborP40;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079D160A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muborP40
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF0D1F000D4;
	Fri, 20 Nov 2026 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186680;
	bh=Pr1WtMPYbJva/hZrRXheA1lv8FlhIQFRrXoqaipeTwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=muborP40xrQgnF5gihm30obnx3K+znDS6WQDl2BgKz/6LWU5UIEuv/j1wDqKJB5eS
	 xWCyyG/MRmE7kPx3v6YuR5+gurLB6EQPc1H6CBUYS5EZ9oLXAKlHl+4YtlR8JF/HZE
	 ANE2yCRruiHGKw81r9kjU1rcXMpP7Me6xR7dCMIxUCUDz0vpUMAlV3vDtQa8yWg1jr
	 LWWm2yw8G5W9D9S8kilPqzcgKVUnPw7gub0h+twMlk1fXNl1dcryKXRt5Db/NGU9v+
	 kALeIG1wTMZuzKg9ee93tsjoN/p7OApg5uKOpSwjxxafWfxhZFFbmbBRWFyncsA+Us
	 2hycP+SqiyvSg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:26 -0600
Subject: [PATCH v5 02/19] accel: ethosu: Move DMA mode to src/dst struct
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
Message-Id: <20261120-ethosu-fixes-v5-2-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

U65 DMA mode is programmed independently for source and destination.
Keep it in each endpoint rather than the global DMA state, in preparation
for separating U65 and U85 transfer-length calculations.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - Clarify that independent source/destination mode is specific to U65;
   no code changes.

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index c046aee42687..2b9c98251c94 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -110,6 +110,7 @@ int ethosu_gem_create_with_handle(struct drm_file *file,
 
 struct dma {
 	s8 region;
+	s8 mode;
 	u64 len;
 	u64 offset;
 	s64 stride[2];
@@ -118,7 +119,6 @@ struct dma {
 struct dma_state {
 	u16 size0;
 	u16 size1;
-	s8 mode;
 	struct dma src;
 	struct dma dst;
 };
@@ -171,7 +171,7 @@ static u64 cmd_to_addr(u32 *cmd)
 static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
 		      struct dma_state *dma_st, struct dma *dma)
 {
-	s8 mode = dma_st->mode;
+	s8 mode = dma->mode;
 	u64 len = dma->len;
 
 	if (len == U64_MAX)
@@ -664,13 +664,14 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				st.dma.src.region = -1;
 			else
 				st.dma.src.region = param & 0x7;
-			st.dma.mode = (param >> 9) & 0x3;
+			st.dma.src.mode = (param >> 9) & 0x3;
 			break;
 		case NPU_SET_DMA0_DST_REGION:
 			if (param & 0x100)
 				st.dma.dst.region = -1;
 			else
 				st.dma.dst.region = param & 0x7;
+			st.dma.dst.mode = (param >> 9) & 0x3;
 			break;
 		case NPU_SET_DMA0_SIZE0:
 			st.dma.size0 = param;

-- 
2.53.0

