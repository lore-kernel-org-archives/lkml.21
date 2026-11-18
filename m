Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795003855;
	b=z3IYTbmMXAX0lQ7ipcQFp+5GbyT5zrGuWYtoA+SUR3HPFMLlByowN3j4jJuEbAEp1oTs
	 6QEq8Nez2s988/8D38JpnlLNsvKOPRC1O+qN9NXGhZQwc/+wOUwIcTZlLwxWAHxbwTLFn
	 zFCpNwExLb1lY0YNDM8zU0gGbznRnWovJEbjDsz1x3qA4s0k7+qrMiA63sNZ0SZ5313Eu
	 FdlSLAjF9m1iwOLp0RlEojZryObRXUrNfSlUM2y1IjIfzyshwll6pUHwdQ05akzSPXjL3
	 vyFR9UZhIX952Q1QVg6rNzdQxIc1KLgr1QWapJDMUJejDRMO2ArXgg9KHUIYd5eEYkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003855;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8n08Dx4tselChpRvrIzHYzudLYuM+5FoAE7kxqyU2XI=;
	b=CAgo1nexCkxotEbuVD9ScYjz6aHl9BdjxzBG8zjwwV9avYzrNixm09d9hl2EFhJvwTNs
	 7LoRJMIgdoyHNUJNDmq442TqJhzxlZzaBAIN83gl9a+FA+aQngocm0/BGWWsA6u5iZejP
	 kICl7CkfSjrWTnll4iioK9XhO5XlZv1xPm1GvHNiG2kbsGJ1oNyxaNYMbVqh82iY97TVw
	 rgdWGeHhYmbRLw2dEzGPkZq7LSSrc/jp+GmzwRNslrPLOAmBB4y4XtBpRuz/Zv7mXdezs
	 A3pyFfKffmTX//Mv3tAMm81C0nKSz0Z1J6aJIe7RmU4ozOwDwtTctSzHdn3JKyxLSqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRdQKmcg;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24309606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRdQKmcg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795003854;
	b=Ltf9D7wMX0GmXwGwQJzm0lEkvrsKveAm0PyHBtkb0lRsBlXwebodJ8qAUiVuSOj9i2Cv
	 nIQ0r/tixnXLs4ntf29kSzgxTpovNOqNwsPZY9oyTQQdqX3G45le2hD624BEL9vEq2fGo
	 nb/YD72kLEpRPel+J0Rm0iQA6dYpwGCK13PmEhuv0B+TgajJmUIQBbkPBNMyJP934G5Ki
	 P1lekPUc8LZdPSWjau8bvg86vRu50mClMzvRZvHDfM1nczBmxDegWM8dXaCZjx7nk5sOW
	 nPXsBD8PjPseFzYFnsAII28te+QMzBaaH9qMwdElqPPqfDfb8pSRbCRaQRGdBCqPtYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795003854;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8n08Dx4tselChpRvrIzHYzudLYuM+5FoAE7kxqyU2XI=;
	b=Hlfc5NmyX/W9/LDQYWBa6gsmBcIGlpjaUg2xUq4+wPPSFgEP5t4+iDaJktIlZba0cs2U
	 pKyUsZopCeJkyIQPL865pJowujDC6rpgqSCuDtRfAqg86J+80WKxgC0CjxHnKnj5DtRkM
	 pbyJCsv+J4pxxQKOwB/YGRE2Bu1xW0VywaMVlhAnH6ML3cIHvA99HuL+9+0h45sDM7qph
	 bLzKXMVCFYy7nRbEGYEjV4kiM6Q2XpilbxLNtHQ7ze39MoEdQ0+uP8DoEnmRovdx7KrI4
	 tyy0iLQce8DGV0uFBEsi3PntWOaNYkxQL0/2EWMvdrLPMuFOvll65+zFjuXYNE8Yu1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 461FA1F000C5;
	Wed, 18 Nov 2026 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003854;
	bh=8n08Dx4tselChpRvrIzHYzudLYuM+5FoAE7kxqyU2XI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kRdQKmcgQOcLFYXqTvr6hDWWTeNc9mHxvfqaOf2wf1kwllkPIGy0ez16W7yTFZMfu
	 UOpHPjQ8R8vegqMX9p1O8ieFSjBWc/RUtIvJwmhmfWDN2zJKtT3snCPxa2ggn+XbLy
	 W+0onYCHSbr9n9yl2Dgea4xjUT3PDpaQAt5CRaXdJaswDjuPdcT7UEoAN0r8lRr3AW
	 7t+yJSl61LPeCI9n/aCohSMAiaMmKIUB0Ov3eXwsJ6meNFdLet2UGbGgQAweV1FIvW
	 vJoZhSgsxCGq+QxxeOFEMyFCTlbRmEIKWl1xd7BiYNV1gpAT5zVqDE4OPnYjGrhHIv
	 wf2Z+BwcvzENA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D0B394AD5F;
	Wed, 18 Nov 2026 12:10:53 +0000 (UTC)
From: =?utf-8?q?Eren_=C3=96zen_via_B4_Relay?= <devnull+erenozen.protonmail.com@kernel.org>
Date: Wed, 18 Nov 2026 15:10:53 +0300
Subject: [PATCH v2 2/3] drm/amd/display: Don't queue FRL status polling on
 a NULL workqueue
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
Message-Id: <20261118-frl-polling-wq-teardown-v2-2-957e61c0b698@protonmail.com>
References: <20261118-frl-polling-wq-teardown-v2-0-957e61c0b698@protonmail.com>
In-Reply-To: <20261118-frl-polling-wq-teardown-v2-0-957e61c0b698@protonmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>, 
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, 
 Alex Hung <alex.hung@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>, 
 =?utf-8?q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Eren_=C3=96zen?= <erenozen@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003852; l=1573;
 i=erenozen@protonmail.com; s=20261110; h=from:subject:message-id;
 bh=L6rmCXG8rWbzkEb2UeE14jkkgdwDWWDYe5UpCq0jUx8=;
 b=MHC0w+W4PsQGM/SRCe5A+mV5DkXSpx9/eRclAWzq890I57i8dhx0ONdq+MZhHmbj4sDBGVo+t
 ZaDyR51rlVCAsZDK4e4uoWlOQo2Joehbl2Wg1AE0BQanQ4xfepPqlxk
X-Developer-Key: i=erenozen@protonmail.com; a=ed25519;
 pk=tPAwfVmIbYF3QziJ3LcoTIZDU12BsjVK+EkAB9nN1gA=
X-Endpoint-Received: by B4 Relay for erenozen@protonmail.com/20261110 with
 auth_id=1479
X-Original-From: =?utf-8?q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Reply-To: erenozen@protonmail.com
Content-Transfer-Encoding: 8bit

From: Eren Özen <erenozen@protonmail.com>

If create_singlethread_workqueue() fails in amdgpu_dm_init(), the
driver only logs an error and continues with
hdmi_frl_status_polling_wq set to NULL. The next atomic commit whose
state contains an HDMI FRL stream then passes that NULL pointer to
queue_delayed_work(). When the 200ms timer fires,
delayed_work_timer_fn() dereferences it in __queue_work() and the
kernel oopses in softirq context.

Skip the polling when the workqueue is missing, the same way
amdgpu_dm_crtc_set_vblank() only queues vblank control work when
vblank_control_workqueue exists. FRL link status is then not polled,
but the display keeps working.

Fixes: 5c9b8b27a883 ("drm/amd/display: Tie FRL support into amdgpu_dm")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Eren Özen <erenozen@protonmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index af7acfbbf9e0..201aba79e43b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4891,7 +4891,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 		}
 	}
 
-	if (frl_stream_found) {
+	if (frl_stream_found && dm->hdmi_frl_status_polling_wq) {
 		if (queue_delayed_work(dm->hdmi_frl_status_polling_wq,
 				       &dm->hdmi_frl_status_polling_work,
 				       msecs_to_jiffies(dm->hdmi_frl_status_polling_delay_ms)))

-- 
2.56.0


