Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202433;
	b=QL82DQWDAsJ8w6xX1E3ddD+377fCc43T+CcySU/gWgeEMEjl1wAUb2qXaIYlhmbwOoTP
	 C0WWlj+oLIzYLJXgObKhb3mh97obJY4RSa5zGXK2JPii34mNQpZ0QWXY5Z34jgeaTyD7o
	 FxG25TmkpSo3X4YoVTAv9MEvOO9UuaNxlAg7YBJKNJa70duAZh/f+iyRLcPW7lHFIWdjs
	 Qiy97H/Myvc6NYAg8Ym0Yas1VpY6FQhEbn/mAKXz3XvpWar/kdnRMfV0XTGeCtdpFWrlI
	 AG0hr5S/T9slwWXo9O6Gtm5GSIXkoEZqNPLfvhXFOjTMCqUM/dAhob5GJZ81FPVej0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
	b=5EH6pTzTGHe6oECnHTtnFcjS4i3UOBhNijwXcjImjhJ+KX0QzDwiPJvxD93wk664hSiQ
	 nMtbig/5BQKgtxqESEQtX4ouNxPt6V6D7iF0UHaX26y+EdRHAdkDiGH4kgW07f1GCPiQj
	 LVBoc1QNwSyJoVmbQSe2Rq4kUPIpFewcTvY/RQK3MBguBj4vZB3wTmIbvWIGR2eIBinOg
	 /nSXAzzP7XoIXU2YMQqoPdBNcD0XvtkqQ7ogt8qyfifvIfUk3HlunhYobANX1+DNTNa7W
	 /cqnvQkPyRKQ5A6MCjE83gKjzA1/vqlJYRanRu02ltPGqQrIDUMHZBQzuvGhDiwat7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GhYmLajU;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD8606A6DB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECD8606A6DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GhYmLajU
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso2819058c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202431; x=1795807231; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
        b=GhYmLajUPIBX1Rtd//b/n3FiwsdFI62rV79WX564/Po8r3CU4inMrykk53oWyVonrO
         +TWvu1/6rXDl6pjHjuzKhk34Jy0wnzhIT4AO9jb91WrcUP97shsl3GGSiPcnUaa915v1
         Cw8emc3QXdiu797632+YjMzKShRC8loOMWVYBCuTk0xSmfZapVjEIYqZwNemnaft6Jow
         ySS5focl63RWYEBrzP/pW5F077z/3OVJ3S/vw8m+HuMskxCatzknL+vpA9np250DfR3n
         60RdRIRvZsFsn7jswTYkUg+Y0fR9yW2NlG0+AZJcxjlMbTYfDtoZksyfdNvRBTozCFWy
         7AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202431; x=1795807231;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
        b=uGV8jEFeSc3DLvztyHNYZfP5l8YOrzxgN0COESM9khQuOrTJtTnxnG3za5uomojBji
         9BUc1SAB/0ZXqSyBPcJoymsADktEvahpNenaPRbM+xj8qIhupddzcatyH6/VmB5TUnyl
         CmyNc2fP+IKjsVXHMPCfZnSUH/YPCYskJgUK6awyK1ERfoJlMQoIwBMl0LwVXbvJ+zG9
         0wo2rcj8IqtbCdSqr0dZ/VSgdn/SqK1s0UbiLae29YN3Qo6YkIa6DCJINb+sgnaNS5QF
         ETKUq6ont5L0oWcolt/IgNSXdOkb5SfxnPrb4URBpBAhgu9nh5HZQVJTaEKZbSKdfoCE
         iNWw==
X-Forwarded-Encrypted: i=1; AL+hErHb6MNZ7Uv7+6b50PoG/9+bX80DhEZgm2wNk8+AS+TRznihQg7YnTQxkFfMyOk066st6c0jIGXFMdxHMzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d+XSURteNFKW1osioprcmNC9tm7Dx94vs0T+kJ4oA1DFHpiLJ
	hIYMpccoAl60XnfloYGecj/8NvhImy6oLc4ci2JUUgnrpDBtCAANCxBN2LZIOkohhBpARpu8mVV
	wZw==
X-Received: from dlbvv25.prod.google.com ([2002:a05:7022:5f19:b0:1a4:c892:b166])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:907:b0:193:9aa3:474c
 with SMTP id a92af1059eb24-1b5568a9271mr3806499c88.21.1795202429856; Fri, 20
 Nov 2026 11:20:29 -0800 (PST)
Date: Fri, 20 Nov 2026 19:18:31 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120191831.2865901-1-elkin@google.com>
Subject: [PATCH] drm/rockchip: dw_hdmi: check IS_ERR() on drm_atomic_get_bridge_state()
From: Elkin Cruz <elkin@google.com>
To: Sandy Huang <hjc@rock-chips.com>, "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Damon Ding <damon.ding@rock-chips.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

drm_atomic_get_bridge_state() returns an ERR_PTR() on failure rather
than NULL. dw_hdmi_rockchip_get_bus_format() checks !bridge_state and
then dereferences bridge_state->input_bus_cfg.format, which faults if an
error pointer is returned.

Use IS_ERR(bridge_state) instead of !bridge_state.

Fixes: dc70272cc184 ("drm/rockchip: dw_hdmi: Propagate bus format to display driver")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index b6e154c35e7c..30191927593b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -286,7 +286,7 @@ static u32 dw_hdmi_rockchip_get_bus_format(struct drm_encoder *encoder,
 		return 0;
 
 	bridge_state = drm_atomic_get_bridge_state(conn_state->state, bridge);
-	if (!bridge_state)
+	if (IS_ERR(bridge_state))
 		return 0;
 
 	if (bridge_state->input_bus_cfg.format != MEDIA_BUS_FMT_FIXED)
-- 
2.56.1.750.gf70dc682cf-goog

