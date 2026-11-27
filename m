Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776259;
	b=UVshNviRrfltlmZy4XStfT2l2PRJQVsfGjwMJbs6kCQhglAKdKgjsFcd5eRM6auH2CO+
	 UN7b93AKx88ZloKiHUqbDDhaEX7JEhOUYWHe13C5Jdf9+/9OXNt6VRZujKBmLr+NyIGqB
	 SbtAra6PZDAluqOXi77IpozdueZcb0sNnFX/fMw4wDyXKlMzRlhuXVdt/Fq/ZMenQWhFE
	 clQA5UhF4LbUbRpbWPWKCxc8NA5+NsgDLtzoV65iPx6Y5ax9O8kSuDYtf7O17E2LyLi3a
	 FAvvk8OW3TqRP2jg4DzU4h/38ZVHBQVtz8Rb1wgGNeJ6vtFXGyNwpXmf6eqMCPPzn+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776259;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=h9NfHUU7wsvgpOoiC9hCjSiFZvlFNOPc00tKvYYq73A=;
	b=Nu75RCv7ijtMntgpLzP/tJUeCF5FXgfAuBfDObY4+A3UNfwX68Oo/UdkB/5vRFcDXJ2u
	 sXVV5APKpQLHaDaZ3eNYaPeVj5/o5sqxJraz+EMR/WuA8Ddn9F20ewR47lw5w/Xq4jXjn
	 P4XtgTVLvunLZTZw+eF6v2iah2gZ7E82BV2kkv8qA4veepNzL5cs8XhiMTSvmNOmDtxBl
	 mdlbHWrj3LH0pNgf0z+ypxIbPqLII1wiRoT4zadezuDIgSW0iPNm39MLW8HNDRRIMmL/7
	 Rwm3a8h1fbkUqm3BPKrMjELQVKC8EaIK87adLF1wseMck9k6KEnG1xUVdXLyEt0SV2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLbpdJON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLbpdJON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0717B1F00897;
	Fri, 27 Nov 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776259;
	bh=h9NfHUU7wsvgpOoiC9hCjSiFZvlFNOPc00tKvYYq73A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PLbpdJON9IIJ+73e6bhV9peLxbGjx1wpdBK7jo+Cpy6K3qRxWTQpt8hrfMx4nf3nZ
	 vI+oppz7O+eF5bR3VKuoeJTnHNvuL1Yjlnj3Tf/I5AzOP4EzJZVqLiCFycLRZ682dT
	 Q22QjOP0msfYpJY0wA+vNym/qmZ5eILB8dUnubUPAUvulE10QcKvR0xFvubJIJqLAT
	 vDHBIT1blxhOxKV+7um12AVIF7abT4uYStLWIZ3fVpTpIpVCcMBnrOcoeS5BOst3sF
	 Nr80iMucbJ2N7NClMfp9AFxOD5/hmlAdq+P9vv5qb4xJLo3WxO75A1a2QMfJr7RAeM
	 xLklhNur3uCog==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
	stable@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 4/6] misc: fastrpc: drop the DSP-response reference on channel removal
Date: Fri, 27 Nov 2026 10:43:52 +0000
Message-ID: <20261127104354.8452-5-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127104354.8452-1-srini@kernel.org>
References: <20261127104354.8452-1-srini@kernel.org>
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

From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>

fastrpc_invoke_send() takes a second reference on the invoke context
before calling rpmsg_send(), to be dropped later by whichever side
consumes the eventual DSP response: fastrpc_rpmsg_callback() for a
real reply, via schedule_work(&ctx->put_work).

fastrpc_notify_users(), called from fastrpc_rpmsg_remove() when the
rpmsg channel goes away (e.g. on subsystem restart), only completes
each pending context with -EPIPE so its waiter can return - it never
schedules the matching put. Since the channel is gone, no response
will ever arrive to trigger it through the normal callback path
either. Every context that was genuinely in flight (successfully
sent, not yet answered) at the time of an SSR therefore leaks that
second reference, and with it the context, its DMA maps, and the
reference it holds on fl and cctx.

Schedule the same put_work that a real response would have
triggered, exactly as fastrpc_rpmsg_callback() does. rpmsg guarantees
.callback and .remove are mutually exclusive for a given device, so
there is no concurrent real response that could race with this.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 60c9d1d0834b..7820c384cde6 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2544,6 +2544,13 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 	list_for_each_entry(ctx, &user->pending, node) {
 		ctx->retval = -EPIPE;
 		complete(&ctx->work);
+		/*
+		 * fastrpc_invoke_send() took a second reference for the
+		 * DSP response that will now never arrive since the
+		 * channel is gone; schedule the matching put the same
+		 * way a real response would via fastrpc_rpmsg_callback().
+		 */
+		schedule_work(&ctx->put_work);
 	}
 	spin_unlock(&user->lock);
 }
-- 
2.53.0

