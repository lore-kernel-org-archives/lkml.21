Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003855;
	b=sFkpYBUTZm8KQ352R9hfXMCDuW8dh4M1W0Xf25c9zJwm5KXsTlqIwUOf9G9QfEi48wEJ
	 FL28kGFyuEzEhcmQtMhiC/tlsK8jpjExs18xlqwTJdbebXlgYPot9TMal/8ZdnVUjCWw/
	 Ry4PTSPPuD9ravBso900vGg7fiCUGjSRCKAS8V0Y6XiXyqAem/gDNALnFNPDGgxZXSeum
	 yHY5d+WkekfNndc1q9RJri2tWQj1ZOGkYqM9k0ssXLUgqcbaULc8x5tZ4MOJCJdXx71V0
	 ZY3f/b7IBCp7fFGubnsbDk7MBAV+mfwzZ9vZHmkxRIzhDLQUCIiojKjpJ+BUsyLreDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003855;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LZzgzzaHQ8VpP9EIkNbz5F4GKJmJYu2uBy96I/8F2vA=;
	b=asS9ayDmIsK2gcJHiMcsDGjMtlfVFP2F690Dj9W5X2wiUjuFnC48ZpytwH8DOhDyV0AT
	 5KOUg2WI5P24aL/fcWTCIKhWkwv0jaa7g0VlbS0jGj+q9axWx9J+aCP+7UeAcaGspV+KJ
	 JN3aTcfe0MPhDZQOUYa40edqNdOv+eliIumtNeESOovs3aP4K2n80LS66QtawtfqJuqy3
	 539BItmyNDTJyA+/cp+KzTlOP15vgQTw9a2/hTilbIRfNzD3C9G15qeEi4rWcmJGfN8AF
	 2P+VO0DrUIBkT7KhxTyH8eCdHyA5QKnYSvXp3n/HAz6vqhzI9fK4YBGwPVBcnIEfplA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWZGifkD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1F606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWZGifkD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795003855;
	b=OBuYx+XfEWXzbrRjx15E3VtLw3rHb2Qr27SN9hJYsa/80FQlkEnyH+N9muTiRGQL7O1C
	 Z5n2mOt6XmGPl2ac/WGGwWc/Au98bkb4AoJm45+ghkd1i3g1uJKnvCE7umfTGsfa5wggL
	 Xir2gANhqxk67iHd5mEOXhoy853dUtGRb7Og/1q0FKkgKKPfsrm9wdKKjLQ8++iPHZN7+
	 vtEIdiGua1ckf3xMoeUMycPXQrpKR+dkpaleWvA5wb8ocv4Huh1GUWSUsuEfNh4oKjNaR
	 uarDUjcAOnJr2T8LFO96CNjDOUku0/oJG9rBBFEOr+Df+QWywilL+VKgWnZKMKpnmgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795003855;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LZzgzzaHQ8VpP9EIkNbz5F4GKJmJYu2uBy96I/8F2vA=;
	b=Vj0yf5Tq0IHLtBVaPChhAMTkRpA7gsDOnjq9t96DFrhIE5wJoW6S1G+jmUWUuTnlLL3p
	 VzhOG/R59csuPT5NOTNEpDYgNhsudZPR2XbDzLuXc5g8oS/FP0Qtj0Hr/+fOo9poaVqa7
	 vSN22npmN7ob6ekLUnWuR7IESsgAmEaK6GC//G9RGlAS7dts9ToBv0dEzhpwft4r6EMIQ
	 ib+4zZ1bUhrAKTUAx2wToyLp+qumcF6WyaWOSBRVAclPYLFqNbVAgmwarKcK6GYG6BfOq
	 DSOZnbriMmY3AcD/5nlZbbPnJsMc+R0mYpf5/J/RlNcN//HH8IvKb5ZD+6/9xqO0sIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F4811F000C6;
	Wed, 18 Nov 2026 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003855;
	bh=LZzgzzaHQ8VpP9EIkNbz5F4GKJmJYu2uBy96I/8F2vA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DWZGifkDX1zIznYlWWS0gWJ2tq/hwwR5UuZNACjSl6CFmUxKspDgHt4oV26vUgfRW
	 TQ6af15H/3fH8oTw44ynp630nh1zwaaLWmnpMameII4x4QqpwOnXdMb4SeK0bxVBdK
	 A1DN8wjNT+nfJ3Bzgm+RVTacU2xlvG+7yW9IsR+f4G3/EAZlnki6233HF+gvIYdbPy
	 Tzj4KSmd9H+gx6DUiw3y8asQOWuurh1RJmowAh/zea2XN7+eaHphvZcNvb8sxSJqhR
	 BucMdbePc/envq4QN6+Yb9YCoDpcA7DYuk82Pp/pP4zqVTCZnjNPxvOem9HfQqY7aq
	 AgcaDJpJQepQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B8D0F4AD43;
	Wed, 18 Nov 2026 12:10:53 +0000 (UTC)
From: =?utf-8?q?Eren_=C3=96zen_via_B4_Relay?= <devnull+erenozen.protonmail.com@kernel.org>
Date: Wed, 18 Nov 2026 15:10:52 +0300
Subject: [PATCH v2 1/3] drm/amd/display: Initialize FRL status polling work
 once at DM init
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
Message-Id: <20261118-frl-polling-wq-teardown-v2-1-957e61c0b698@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003852; l=3225;
 i=erenozen@protonmail.com; s=20261110; h=from:subject:message-id;
 bh=acr9azNHV4DrR5AOD/x83axcCIQ8+yKBRupLY4OPr38=;
 b=QwOf7v5a8WSFCoej3uB8MXnl8fZP6UenjHa4qtEEAeDHvZhKMP1RuR3QmToxu6G90Zt8q9Izz
 9QyqH/JsQjwCJN+uTziUFTTrykKCkSiLBgO+O6hED1ZXYXqjkmOZ/DV
X-Developer-Key: i=erenozen@protonmail.com; a=ed25519;
 pk=tPAwfVmIbYF3QziJ3LcoTIZDU12BsjVK+EkAB9nN1gA=
X-Endpoint-Received: by B4 Relay for erenozen@protonmail.com/20261110 with
 auth_id=1479
X-Original-From: =?utf-8?q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Reply-To: erenozen@protonmail.com
Content-Transfer-Encoding: 8bit

From: Eren Özen <erenozen@protonmail.com>

hdmi_frl_status_polling_work is a single delayed work item shared by the
whole display manager, but it is initialized from
amdgpu_dm_connector_init_helper(), which runs once for every connector.
That helper is also called at runtime from dm_dp_add_mst_connector()
when a DisplayPort MST branch device is plugged in. If an HDMI FRL
stream is active at that moment, the polling work is queued and
re-arming itself every 200ms, and INIT_DELAYED_WORK() on it
reinitializes the timer and work entry of a pending item, which can
corrupt the timer and workqueue state.

The work item belongs to the display manager, not to a connector, so
initialize it, along with its polling delay, once in amdgpu_dm_init()
next to the workqueue it runs on.

This also keeps the work valid on the amdgpu_dm_init() error path.
Commit 8bcad6d7acbb ("drm/amd/display: Stop HDMI FRL status polling on
fini") cancels the work in amdgpu_dm_fini() whenever the workqueue
exists. The workqueue is created before amdgpu_dm_initialize_drm_device(),
but the work was only initialized when the first connector was set up.
If amdgpu_dm_init() failed in between, for example when allocating
dmub_notify or delayed_hpd_wq, the cancel ran on a work item that was
never initialized and hit WARN_ON(!work->func) in __flush_work(). With
the work initialized first, it is valid whenever the workqueue exists.

Fixes: 0e967e086e75 ("drm/amd/display: Extract connector and encoder code to amdgpu_dm_connector")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Eren Özen <erenozen@protonmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 4 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3d2201285888..af7acfbbf9e0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -773,6 +773,10 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 		dc_init_callbacks(adev->dm.dc, &init_params);
 	}
+
+	adev->dm.hdmi_frl_status_polling_delay_ms = 200;
+	INIT_DELAYED_WORK(&adev->dm.hdmi_frl_status_polling_work,
+			  hdmi_frl_status_polling_work);
 	if (adev->dm.dc->caps.max_links > 0) {
 		adev->dm.hdmi_frl_status_polling_wq =
 			create_singlethread_workqueue("hdmi_frl_status_polling_wq");
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 1bc8547d5777..35d975262114 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -3331,8 +3331,6 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		aconnector->hdmi_hpd_debounce_delay_ms = 0;
 	}
 
-	dm->hdmi_frl_status_polling_delay_ms = 200;
-	INIT_DELAYED_WORK(&dm->hdmi_frl_status_polling_work, hdmi_frl_status_polling_work);
 	/*
 	 * configure support HPD hot plug connector_>polled default value is 0
 	 * which means HPD hot plug not supported

-- 
2.56.0


