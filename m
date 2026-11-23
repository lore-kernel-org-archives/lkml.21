Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417087;
	b=bwLLUsCwct5/DPjeSgSKIL65oA4Svf3UAZHQkjsnxZDguRFTWa452CjJKGfzTI5lL0Lm
	 DE5e5Q2OrVQfCI4acw6mcRIVnhYkAc8J+So8EzoL7ZvrtWSgq/KASZ6tSXArsd2KOoVmy
	 OYjLn+74kDWW6Gc8HhxNAZLWaeWBXi8RjctSo5rwUA5nW0kZ6rlazzTOfxlXaO3y623qO
	 PuSJOQbWViCYHd/gthXHQdDIdlgr9VuKeOqEXlY2KtosPEZ9VbNKhmMN6DG4ZfE8ao2fU
	 VKYmkspdY8WkPIeiKsfsyN5a0AmJEbPKaQ9CHofReJ38s+I4QMtT1laX4gNrEAiKx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
	b=hbROFJiF9GTehujlHiMF37UQEb2iXUxE1Vo5RNvKh4ErSpomIu9mIrbPxs7Fp/7dO8yM
	 8fG42V4NrmiOd04xxdxySB3w26lhJER0tErqynPnSW1ouZFa+29XtNa7YK0lTME7e6Pic
	 VcDb+e/LHrTcYEprFsikVFwBmAzK9VVk1+ysVzBvtlr2pZPpr3SVIiidOqDHJO9zCNODo
	 2ML9JzH2WgH0XuvmDozECnWhUMBuAUnvJMiddgEd1t/7kYWyCD4GJrKIShIaCR2spEVoX
	 wTY83eyzteejSRSdQc0wfaKLyblVkP8P4HoIVqdCPfM+fy/YRn/Y3tRe+EKweUcHkhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yidilin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fm0QFXPY;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6033A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yidilin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fm0QFXPY
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so2077728eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795417086; x=1796021886; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
        b=Fm0QFXPYAxZC7TyABoXkkqEsMyQ3PrPhimXDckNN7W6SAZI5t+eHFTbIqWXgMjAK7B
         FL+H6O8JJqOZIxN9l2hsBvXXhl6rEoZ21zVJQAl6fMXwR9hOgsc7o/pQIRetkNVSAOTT
         Dgd9FAYSNU8OVorOrOZD2QnGDoqxlP/RdRGUA40L1Ip9eHXVwOWb917uyAHHy4hTOC4X
         FcD5ihtn/EYPxzhh8x934nYayzLZ0EG2323n4RlXezbsv2881w809lYBj0lwBRIxto9v
         n69uEjEBlrmMhuKD2JC/GmpTCsoVP5cdp3pqSb2f0INLJCc1jfUSRgcIK62uaVpFMR/k
         NCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417086; x=1796021886;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
        b=ojg4urfCP4wNKEGRiRK90Les2cJX9UfNKmXX9iJj2eSeyrGQVQk+A4zv3H4+OcuZTs
         qBNkpf3I9IZOWlJgfmQtf9VzVofyQILE3UVBkrlmYoYvGeAkA47TgeKwJKged3FhXEFX
         V03wUpe1v8DYUbObQNFMEoXPvLKcb3wwtgJQ8LHtivbOMiIPCUYL1EYh3NVE6rK87diQ
         yYUlqnnZzf/SfHQXOJAc3U6rJuAdgoFdcGstCSZDs2n8fb6LcOPOB3HpswMqLNMy2kCn
         HhRGFQSROooQHtg/6hNCpeDrensbfxq1YV2DB7rKPm6lCNysyjKZoAbr2BAcIw6BMlpY
         /vkg==
X-Forwarded-Encrypted: i=1; AL+hErHv2SpUDSnbkgr8wVZzScwfTLyirYLubKK2EB6hFhy8d/9sSlGvcWztzOuJ9WlVPsDLngmCw7UqD57GaQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y6MpDPhBSro/hTCTKcCVP1FnCE+NP5X8POGEBMmlFWHBahbQp
	CM0cYLRBqIpfnMgDKJiXj85OYb306FhE9rBbHBq/wvDi16uF3cmHrAfsTmGURgZ6vdNp92tOjVL
	wdB/JEdqSCg==
X-Received: from dybmw18.prod.google.com ([2002:a05:7300:cd92:b0:380:c63f:6b75])
 (user=yidilin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f68e:b0:383:d3d1:f31e
 with SMTP id 5a478bee46e88-3856e94760dmr10863514eec.6.1795417085859; Sun, 22
 Nov 2026 22:58:05 -0800 (PST)
Date: Mon, 23 Nov 2026 14:58:01 +0800
In-Reply-To: <0964123eb95cd4a6516df05003f59f3cdb260d00.camel@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <0964123eb95cd4a6516df05003f59f3cdb260d00.camel@mediatek.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123065802.322838-1-yidilin@google.com>
Subject: Re: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
From: Yidi Lin <yidilin@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi CK,

Please don't apply this patch for now. It breaks AUX reads with one eDP
panel (CSOT MNB601LS1-6, EDID ID CSW 0x1106) on an MT8189 Chromebook:
the wait for AUX_RX_AUX_RECV_COMPLETE times out with the AUX RX PHY not
idle ("AUX Rx Aux hang, need SW reset"), so the EDID can't be read and
the panel falls back to conservative timings. The current code doesn't
hit this because it reads the RX FIFO as soon as the write pointer
moves.

I'm looking into what is different about this panel's replies, and will
either send a v2 that handles it or drop the patch.

Sorry for the noise, and thanks for the review.

Yidi
