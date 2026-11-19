Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108258;
	b=qqWc3y9AumPPQjgDIHSOfL+uWRFuPhZLJ7Hjd11Nfobb4po6y0DmnFzMzqDzuWOFqYPJ
	 XaO+Pq91IFxNzacVZVrayQVNnhGI1l6YcqWdF4vsMY+CYCeHxX/YArU50Jls+AZH3vQnl
	 ACMLJDAP8a1ofy4z8bONffKMIx+350Abe1dAx1F5bMYwros/Llf+PldZj8Ur0WtaF79CD
	 RZ2oe9M5KUkrGxJBZ/R/8zQb3LJ8soyzl4eTF9q8Rm6fAXmj7b9C33xb+YLawCTKmXpNy
	 /9eUeqmd1SCJ4DZAmIXvoVhYfBRO52woOeT3SlM9/N7r5lhmIIavzL62h5+wY0RMW7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
	b=SNuh7ZYMpf/FhLEHnDkZb7ozX+sepbLX+TlraNB2gEFUiABxSdOC90NcQ9qVrJ/Kx5qo
	 NkcFR1cBrM1to/VPsZigOcECbAi0u+dYyWG7HUbQoL0P6P7e3f6simFsPO4ztQpkalxV6
	 4UX2Je9w5soIVsGOLoc7iOKGM/C3CbWNrllueKqby2BVVTc9461FMsfu4LsGCVdSB2tst
	 t4MI73ynNDkVwsqYUYVs8S7uwpO3r/2hhnZq0Y9KcaH9TVpMwwvSUB9XDjPrbS2ygP7H5
	 aIpeQiBBjX1k5rbbbqScDgI1VMJpxSrSmY3c6qJyGeifq5eldJ+0yHYWDPpHHQInc1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oH36Mtfd;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4160A6F60
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC4160A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oH36Mtfd
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b29df78132so2593676c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108257; x=1795713057; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
        b=oH36MtfdigM9wf2SWuysYDE7LNnjdyyjbYVXzSp7KsW5JSoyUqPqANpFfEiZJ4fJmT
         vKK2/j6E+kmN6FLp8h6xgAplp73RwpVqUVmsq7q+6LQnnnec7Tv5oTrGejg8tEaL7K1R
         Bd3xYg4WsiKJKH3XdigluqjLH8W0rWZDAgRTeW7ckeP9oxQ6F1bsjJiW3xMDWcaTJ9N5
         Uj1LlmW2cpgZA/wJ1jWQJv+Qrb12ColgFeDG7wxzR3VJ5a4pvTmR9OWTIxWc7NWwaiyu
         EsWFbowl1uTVronQS5NXBK/iWqUcQGjbB2KuAh/pvKeG8N9TwlQmP7mEyX4FYfI7l+Jx
         Xp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108257; x=1795713057;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
        b=aWw9B9RdFqiVUXzdjXVF619fIhsd6KE7PZt+I9Z5yZPXoPUdMvHPVylFDDlQOui/sZ
         uIvu/eqM+/ulr+G0bWnT2hYTmkRiunIdPvIuxDelJX6C9w6KLQrEqnOriz40LpKhq4yX
         oTvyA/C33mftijcHesh4N3bZY9ppxbacXwLL4TFBeAkKBT3UsBrh1JqHVp+bLu339jFD
         l6C4xp35sZB0bdpd4SGFZzBJuHG0YXBp9qHgDT7diiZZhjWLtxvb9Rp1CazCSz7inDIy
         erasbFnaBLANeyea/L66Uwgxj56w7oJDB3elJiB8ddaoLGfY3ZoMzaAlelEej1/u2fOE
         HAOA==
X-Forwarded-Encrypted: i=1; AL+hErHc7MIVS0YJJxzgs19QrF1+Y6VMjFdBbX0pjiU6hG8IcJTZpqC8oT77f8UCye+U3WL3vvTo3gRlmGseKa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5FEX3SMDPuVWiBnXNSFp6GvY6Zk2xp9gYhb1SKdAeIDWGUJLN
	K+FrZ2JVV9p4ImWGp4CoQtlvRAu+m66AIk6Rd9fpBq2Yc/rsQNkTBBDUz/7nXyczJodGDl/hWQX
	gDhQkqmJcTQ==
X-Received: from dlev8.prod.google.com ([2002:a05:701b:4648:b0:1a7:450c:8b47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8d:b0:163:c5eb:d42f
 with SMTP id a92af1059eb24-1b5567c02b5mr259999c88.5.1795108256626; Thu, 19
 Nov 2026 09:10:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:53 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171053.1537233-1-irogers@google.com>
Subject: [PATCH] drm/mediatek: Initialize ret in mtk_drm_of_ddp_path_build()
From: Ian Rogers <irogers@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

of_graph_is_present() returns true when a port or ports node exists in
Device Tree even if it has zero enabled endpoint children. In that
case, for_each_endpoint_of_node() in mtk_drm_of_ddp_path_build()
executes zero iterations and 'if (ret)' evaluates an uninitialized
stack variable, aborting probe with stack garbage.

Initialize ret to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/mediatek/mtk_drm_drv.o
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on MediaTek SoC hardware.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..4b15b90b11d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1006,7 +1006,7 @@ static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *nod
 	struct device_node *ep_node;
 	struct of_endpoint of_ep;
 	bool output_present[MAX_CRTC] = { false };
-	int ret;
+	int ret = 0;
 
 	for_each_endpoint_of_node(node, ep_node) {
 		ret = of_graph_parse_endpoint(ep_node, &of_ep);
-- 
2.56.1.708.g77570a6a1d-goog

