Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160371;
	b=hBYi7U8anztpUQ2i8ys+5JIDQBRH2nGbMP6xGSC+3+uF2RU/S8INIFIU/9itI28PZ3zV
	 2eK2PtVU1R6X9EHIccqESH0G47cWZQGOccQ9+Pcld4P/59Rrki3rRZ3/cQocUr7KT9kb7
	 jcqp/Ue5uZTbNfdOjI9MFry1S1RZFqThROnh4A/1W9hA8Ab8CEdvCGwwG4k7HpZzLzVQS
	 TIO28LmYYf/PI7hF4mKWaLshlW/VTpqUpayEkQ/W8PwFy+9o/UaRJUFG8XHOHsNjYqx06
	 hKfyC5DmHHoee0exQVRo/DeJcaNYTxpku/VxBOBAaPyiAZDnnsEHJ8BbjGakbs9wy2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
	b=uPzdHgLfGsMyVkBwIdIb0WKpwrwFewFwc6KYP9xoLtAko9PCaTeoa5RVZ4d/wn4Wc09w
	 9wOpvRaxHoXPBRYZw4kSs8TvEGcriXF9+zIbUaGfnmg2esv1SD9494Zk6PLvyFi/9ubyf
	 sFv1kPhbMkx5nqT/aN6J92cY+yI7MxuqH2o7KUdXK/vE2Yt83JIrmsns2QPK5MXmcB6OF
	 k7bip9CiEvOijhCiBL2qeeqH/eOFUk5KGPrPNmoIwz6mVC26P5MfBIqLdFxKrjN6qA1Z4
	 C2FjxXKX77xGKsFRi9e8brq7XzYROQy7GMIax4Xt72s/nUWkv752shnIAK0ufDDfI4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byfCmCpI;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D200606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D200606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byfCmCpI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so3829535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160370; x=1795765170; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
        b=byfCmCpI/cmI5c+y64ZtL1+KUF6sEj7OSPVJojS+LEn8w+VjZgo5HxhHvXhYmqS8I2
         UTKe/8CYXEZ+bj0Twkco5Aq0KkODzZ7hJkrMwy8mwcvT/bn1GXhhJoYPLkwnUBuR3jYM
         vO5PRxrpd7DeUKM2tT/R5sB6TKroiF/NxYvyoiJsqk8tOU3iqRv4WhEsMSc54UDju3Fw
         lEP9YkdlcjRzkLycLt66IZCHpJ7xu502psDQv7QWjZTN9AMoZ2N0e9RLjGL2GMO2vM6l
         u6sxpQtFY/be7A2kgLLMn0DFIRWO54UkovzI2/gsU7Dqg2tr/8w/S2uwlJlh+ApfMwy+
         JxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160370; x=1795765170;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
        b=sgTFfi7lzgWXJ2M6KmN+NI7odJtDerwk5ksBRLB1OBEqGuBYNFFxRx4Jf6fAckI0jU
         AgPsQ2QyMVwkRFwMjlg4Arhjc6ZlySV2Ezlvg6a03jwv2cUM+yOXwc0qC0gP9Wi6HBZJ
         CIkWTyom4WPjEHft60W54mUZENJkrwrBHATQ8sGMyVlI6VhgnHH5Ps9J9p6YVVB1REMt
         cD2YVgU9C7ynEmvfssv6kEiIPlIzPmO3DQMgL1WHfYdVU5Luwk75YdHvMLgU8wLHiYQi
         trhF52Gr5Q7VkJD7N2wrBb8qw/tagRTJF5ESOrFwUM3ZxTIO7K0JyKObzu8B3tuBAQyD
         gWeA==
X-Gm-Message-State: APuU4Z+78HOUtqseA7G+mxCJMmKIMzcCHJKTnaMFSz15AfljyA62y7qw
	5ve7aw9Y89hyQv3TMtB8XiFa1Z3LLL0khphCFgFeXrRyYVi0LalVLMgmhm43BSsQM38=
X-Gm-Gg: AYBFou31wYSNZQUYi3/YkHZZBIfrf4urc1pj3krIbGORHGGoGJT97yPThqKyJdu5sqe
	ccMhdhJSKOzWW7nUXVB6UmXefEFjB/+0kNWVpvz1VWmjJru7C271foKQEmgLon7cN6PviLKPF/I
	w0mddYYi542xb9ZeBr7J32HActvUQzqsLeb5akSO2DM2fkHEt2l99UMsPuxCH7wCKYM4xrXyVar
	fqHCs/D5eYBNKVF3NDFLGLXYw/Du+PM/pmR2sBEz7wMugZbaB2NVmamS2UT/20JdHH+e0wBc45q
	+ynYgCj9sq6WlA0uET0TlZG2200qVpb6rrcXuuWve6jXMS1HJuv+mQyVoO5pnTkt2sJZfR0uWKD
	L68ZsGsj6lwnxxcZNpEP+Onb/goI1h+5zGCiVFO2hDeH+8E+UmUnbnOlBquz794++f+fUwEknwJ
	rRJn8LDvRXmN6FP9co4lmbgi8o0zlwWqYSta5nwJnJtpKF0nrHvwifIDr5rIspDbjU/7NpO9ydp
	7Plcv1y9MK2SI4kHf2Rq6j/OKfawbcP+/eZzQdZBuRFPbYncLsrFaLKpN9hWmGqAuMhWwwAgqxV
	g10Cvp3yTutJwytkbF/S3usnEldwgzNa4ZquVO2+uwzWA0+l2lP1dR3QlSSZeYE=
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr47439815e9.2.1795160369880;
        Thu, 19 Nov 2026 23:39:29 -0800 (PST)
Received: from [100.64.0.149] ([2a11:fb80:10d:2500:b9c0:ca33:edf1:6b97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm4393117f8f.21.2026.11.19.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:39:29 -0800 (PST)
From: Stefan Raufhake <raufhakestefan@gmail.com>
Date: Fri, 20 Nov 2026 08:38:58 +0100
Subject: [PATCH] soc: mediatek: mt8188-mmsys: use the full mask for the
 RDMA0 output select
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
Message-Id: <20261120-mask-rdma0-v1-1-170f6f51901d@beckhoff.com>
X-B4-Tracking: v=1; b=H4sIABH5/2oC/x3MQQqAIBBA0avErBO0IKqrRAvJMYewYiaiCO+et
 XyL/x8QZEKBvniA8SShbc0wZQFTsOuMilw2VLpqjDGtilYWxS5arbyvJ1d3LVqvIQc7o6frnw1
 jdiA5Nr6/d0rpBZuO/t9rAAAA
X-Change-ID: 20261118-mask-rdma0-ff3cd398eaf0
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Stefan Raufhake <s.raufhake@beckhoff.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160369; l=2771;
 i=s.raufhake@beckhoff.com; h=from:subject:message-id;
 bh=917zLlA++Sanueh0GAPM2hRLA0nHVXsoglSLue1xr/k=;
 b=KWWDeFTtUeDg/koXMiq8KfXRjG+nZnKIs9HHVv1JZS7XoEper97Kvd9dK/0zM2uBAJqNHfAj3
 dFYQBMjhfPWAK1R8W0jFBT7GP2+VugOSIyODKe6IOmX/0wPvl66eeUA
X-Developer-Key: i=s.raufhake@beckhoff.com; a=ed25519;
 pk=e21SBDwGlYjlZrk3u52tzwoMvH7vIYNoigghcul0uzw=

From: Stefan Raufhake <s.raufhake@beckhoff.com>

The output select of DISP_RDMA0 in VDO0_DISP_RDMA_SEL is three bits wide
(MT8188_SOUT_DISP_RDMA0_TO_MASK, e.g. 5 selects DP_INTF0), but since the
migration to MMSYS_ROUTE() the RDMA0 -> COLOR0 route only uses
GENMASK(1, 0). Bit 2 is then not cleared: when the boot loader left
DISP_RDMA0 routed to DP_INTF0 (value 5), setting the COLOR0 route leaves
the field at 4 instead of 0, COLOR0 gets no pixels and the eDP output
stays dark with "vblank wait timed out".

Use MT8188_SOUT_DISP_RDMA0_TO_MASK again, as before the migration.

Fixes: 8a7b1efb2ae8 ("soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro")
Signed-off-by: Stefan Raufhake <s.raufhake@beckhoff.com>
---
Hello,

While developing the Embedded DisplayPort (eDP) driver for the MediaTek
MT8370 SoC in U-Boot, I encountered an issue where Linux fails to display
an image if U-Boot has already initialized and used the eDP interface to
show a splash screen. Conversely, if U-Boot leaves the eDP uninitialized,
Linux displays the image as expected.

This patch resolves the issue, allowing Linux to properly take over and
display an image even after U-Boot has already used the eDP.

I used an LLM coding assistant (OpenCode with claude-opus-5.5) while
investigating this; it helped identify that the MMSYS_ROUTE() migration
had narrowed the RDMA0 output select mask. I reviewed the change myself
and verified it on the hardware listed below.

This patch has been tested on our internal MediaTek MT8370 development
board as well as on the CP6600-0001-0030 [1] device.

Best regards,

Stefan

[1] https://www.beckhoff.com/de-de/produkte/ipc/panel-pcs/cp6xxx-cp7xxx-singletouch-panel-pcs/cp6600-0001-0030.html
---

---
 drivers/soc/mediatek/mt8188-mmsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index c70c4b462381240d06a85144b4494a4d9e58850e..ecf0fffef20ad7a042dc02e510a7d266fb979c0e 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -233,7 +233,7 @@ static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 		    MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
 		    MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT),
 	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
-		    MT8188_VDO0_DISP_RDMA_SEL, GENMASK(1, 0),
+		    MT8188_VDO0_DISP_RDMA_SEL, MT8188_SOUT_DISP_RDMA0_TO_MASK,
 		    MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0),
 	MMSYS_ROUTE(DITHER, 0, DSC, 0,
 		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-mask-rdma0-ff3cd398eaf0

Best regards,
-- 
Stefan Raufhake <s.raufhake@beckhoff.com>

