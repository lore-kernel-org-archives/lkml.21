Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297290;
	b=Z83ORQtyMc3knGX+xzzEC7inLipbP7Mxq2RBU/FK1hFIvtGULfcYM14alSbm3ShMGo1O
	 WTzmU9Yj/9mkXVwTTdaT/3fkfwWce1tRRnD2yeaYla5Cadqseg2gt80IWwCy6cdsWBQpM
	 C4GwFnrxPuqV7+XCEP8nJb0YVbRmNHPrY7zwZQOupyTGOO459YMpvF1uCVz4hmudju2eF
	 o682PtwHNy/wk6gBNoVxaCI+nYAUzrmoZspNfU2RBY1aEW+qqVal3+e3dbyIh1IelSPta
	 hqFA0APGE67eP+kaiaRnq/Aezl5yMtu5SrYEuF72i26qSYPYuTfth4CfJxt9IStczGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nqAE9KZVqGmI34o9aLpAZb7QLNNzEAOkrz2b8adTiHA=;
	b=zd7vq3kOQgj2uBenIJzgJ4Pk0oWaKSKBiohvSnFFc5DptsrHuwOgwCAYhUwqPLK27kUh
	 ANplyqnWpnRXWbPTQ7vDDOJSA73zLgS2i3EYGbNvMsuDh263LYNdZu0o+4rJA4yswvC9A
	 ezRo/brTR58rBgggipL28AUcYlufb668TKPoB6/8cbAFCeDgh9Fq9aZoSA3aEQ9iJtZnz
	 KgOJ5/vDD4lnj9YgZFVa0ijWIGLia95/3Wpk6x6axFotxmtITr0k3PEQg24LGMlqTXsae
	 gu92kn9nh56n8kKHeyrB8m2/NJciztxqtkrjtnzcAiNiNoo+3pJ+14v8skhQ8DETy7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IewuJuFG;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0DA606A688
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC0DA606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IewuJuFG
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1280434f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297288; x=1795902088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqAE9KZVqGmI34o9aLpAZb7QLNNzEAOkrz2b8adTiHA=;
        b=IewuJuFGIB1X0E0CXUO4s4h82dTjoc5m550vygeevXElgFSZrch3CywofO9u8cKZiL
         LAdrnhFf9y3RdO1t/Zmv3i4G89I3idhivczjSFS8Dguuq+cPubf7LDD5zuKMKSwKOcDx
         NNZ13x1AVBorh+09VI/mFfrMEKbF+32AiHroVCWnqGmmu5DkK6hNOfg2BHMngX7sbjXp
         m5REfPUptbBmJB1gSTABkXxe9sy4neET6IPzYDHT3K7bir/YREpH6PUDd2LtAJJ81pbp
         La2ijPMAuA5TbaDy+To89rCBIoKbxGoYN/QvEEscmU7ByJZRziREFDroE67ZhiOzLbiT
         XvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297288; x=1795902088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqAE9KZVqGmI34o9aLpAZb7QLNNzEAOkrz2b8adTiHA=;
        b=tWZ0vDOa52k9p8zkq+0IISC+Iopli8zHz1m9p/10Mbk2klxM9bQTgOnrX9Ri0Puujn
         dxBwWQyMzOL+iIA+RXGDsP1g0AIRF4EPofp3L7fgxdXifp25ZnRHy1KhVTgsVk8LcLyN
         KyQewNAd+DwW7NVGsxkUGE2os7pKkkT8o4N07NdaUphkgcb5YMxdl4VAI8BlES1FQMcI
         insKgeLVazPE+iYjAKIkJlCuhoIiHEZal6bRf/cFhSlTM/61vY24jIDzQPv7KlHIzTV0
         3kSmUfbr7fYBwWk6mSmmXRaLSq30M9pkM2fcUTFWXLNZq5mNY0ivHD5EFYOk38IPqtWI
         Vtog==
X-Forwarded-Encrypted: i=1; AL+hErEb3fxVmyNrdJshiwyIOphDRUX+dqsGpWTimndHHo+hnYya8dw4ijpG4LWViVbhO4NqKJ6wJzCgPI3ZHnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T2UGvG8YX52gTo/FDYDh4l6hw0Q+NmVtXMGeCIE2TQyJ6/1bn
	LbjWhydRiVw9uf+G0v2xPwGqT3+/PVEmBzwvulhoze40DuDkJYz4w5E=
X-Gm-Gg: AZFdTZf92Q/zFLTpt59ell/Ky5MKwQnBtR9kFdH+GD5b8GrMvgQE8iQLBfhw/zHxd+i
	ZIfPZGOtTmtEz+xvYbcjvExKEJcqs2LlHVCUF4fizCtv6+2i9Y6zHgRjCHCkHWreT1MhohwoJ4D
	H20WEXPuJDbLNR3OOGpjeXipFVcQzugBdU+Q8EJyHxaETzY4RD/3iYU5Qc1Zbfg6UoZ7Yq69VJT
	CJtwShRILkvozcWlx/L8DnWONpty53S8ZAAVMC6VowzrF8pabtTjfB/LfKnCkdEZM7C/d+VeXKL
	liWJHp6sHXgvG3ar6prQbWVoParqewIr2YuT+15d6uOg+e49zK1+uBQAFIIM/hy5763vucckK2N
	g/Xkq9CqRMe/rhKRQo4t8liYJ16TQG6pSkJOd6Y/AvxMkcyo3JExHu7OoaVQ4EgBQPOkpCmV5zk
	vsbnqU4FvsTwEWFUmn9mS+gcJS6jE6muJ58hROXPokKdzKBFbyMmQSPbqJEXOqD7e5TLulBoKY7
	Hc7xeKaaVZSXSl1yalzmBx7qK99jA3J8O2L2piVHngg4cRu2zakOKpuaX608Hr9w/0Wdtnx0yQr
	f76yeWupKGjuo2qM8PeQV3K1++6lk4QquWyHbLoSjg7VNqi8mJFrSoS110f4
X-Received: by 2002:a05:600c:4fc1:b0:4bb:53e4:a7cc with SMTP id 5b1f17b1804b1-4bb88820741mr170496205e9.30.1795297288186;
        Sat, 21 Nov 2026 13:41:28 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:27 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 5/7] drm/msm/dp: dispatch native IRQ_HPD directly to msm_dp_irq_hpd_handle()
Date: Sat, 21 Nov 2026 22:41:03 +0100
Message-Id: <20261121214105.32596-6-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_dp_display_irq_thread() forwards DP_DP_IRQ_HPD_INT_MASK via
drm_bridge_hpd_notify(..., connector_status_connected), relying on
msm_dp_bridge_hpd_notify() to observe ISR_IRQ_HPD_PULSE_COUNT in
REG_DP_DP_HPD_INT_STATUS[STATE_STATUS].

Because an IRQ_HPD short pulse lasts 0.5-1.0 ms, STATE_STATUS has
already returned to DP_DP_HPD_STATE_STATUS_CONNECTED by the time the
threaded IRQ handler runs, misrouting the short pulse to
msm_dp_hpd_plug_handle() instead of msm_dp_irq_hpd_handle().

Dispatch DP_DP_IRQ_HPD_INT_MASK directly to msm_dp_irq_hpd_handle().

Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
Note: Kept separate from the msm_dp_ctrl_link_maintenance() fix so this
patch can be dropped once Dmitry Baryshkov's and Yongxing Mou's
in-flight DRM_CONNECTOR_DP_IRQ_HPD series land.

 drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8373740275b..3a3123dbe417 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1015,10 +1015,8 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		msm_dp_irq_hpd_handle(dp);
 
 	ret = IRQ_HANDLED;
 
-- 
2.25.1

