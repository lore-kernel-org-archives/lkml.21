Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195143;
	b=BKUs3AsDr6VcMccKqnmeh+YuCYRn1dHzsM6KxgBIU6jZvTzzB0l2SYxSu2xpLOdOLOPk
	 sw7/SDCNJVmfCvb2lWKjgku1gj7NpqGLB/Z67njHigRGLtivWXN5coSBeboI9aBnTTPa1
	 nqnYnRaPmxVp8la37d7aS+DVZ6J7AbnhNHAApsTm8OdWqM4Cb2uL5RkPyp0XLgVNAE0TG
	 LNYtsZpTFRSk83cpAS0rdFGXVyHpBowj0h/kYL55zdAWmjIO+xe6cublN2d/oFV3lj8eA
	 N6GmN3G4Cfb7kt4cwQNvg8yN6/4/AmSSoPOjAO0IiCx7Z6AyeT9IL26eBVGmJxuCD1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195143;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yh5n9jWo/3W77LwmiI39asuVgN3yT8N8hYH+AL2o/iw=;
	b=mhb1+unv2MVih5B6KAXh2Sr6H0Ft0ahng49/oDRg0hXA+I0FkF9ZOMy5ZArB+IB2tPkd
	 /jDhLvB22jB2IsY8aTB6Ry30ad8FrARGxKAGPKMjHR6hXH8ZPr/25p0dMo6qHkCRYCdOv
	 BT8tXIeqTyskxJq2X13WdJf3P5EWSinanx2bgv3xSSQYAS3bowNXhsKWIYabXRV1ripVB
	 XrD0MagiMT4P2KntR8wJh5i93QzQrvHSSSteS71S9rFvQVRTX4XYk9PcROi1vdBV6VgUq
	 B6a6ty2yYzhxFEkoF48wkPnkuxSzf+zvpMZ1ZmYq63h74ellFh26vot6Ob9px+9G0fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEcS1+yh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB260A2622
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEcS1+yh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195142;
	b=QFho46/Wr0seqVeF+t2UTATyOGt5IEHRLvO1mHeEPP/rDwDd8kZNC+R+rChJ7FHUZ2ko
	 oK08qEujA5pEHEF28E2Ysnv3MLovUoiVWJdGAW23AD1JfIVC8xWH0tOmrHPd4R8ycO5YW
	 zMRdA/R73+LjLkjX/3TMin47BBwuk+pkEzdKi9P/j+/Su/UlxX59wZ9Lv+OCOw9Ayf5XK
	 bjubIVvzjob4iLLd0Hmq/Y7kaz/2DqbiWmRQRbc1J0rjteQQ4AqadPCi/0R6CtuIUttK2
	 EHF9TVifS0Z5Zgx9BaYPzm4bHBxP3V06KC9nHrPA8MgrFYvg4tTYC52XHBfBOPNRBHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195142;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yh5n9jWo/3W77LwmiI39asuVgN3yT8N8hYH+AL2o/iw=;
	b=CxDq72xJVN2sTznpR5Ad2/eGBlcwihwyvcSr9uLgK/UVAO74v/fzSgmm6kQkNFyIuhR3
	 sUjvE+mVbc1i5gOER0b1MiQxRMzW7z230RQ5DzFBis9MgvJN1V0jsWVi8lMchP3rpscKC
	 MnxhKgoohu+6aTFVSkLPNsbhruZ5pyod+zEyGeKvCKGcH/b1ls7AJpO+Qdoz1Rf0o6GDf
	 xoo89vraywklFmbWUxLcMjIZqxRzT/nAHLEKugQRJjPc8cxiPQbKmDNqjmEZSOEwqWDPD
	 yI0vXet96XIijENR76t/trryVj6TmsNHRzxfGZtwyreIgWx8NKZvAcTP4k2er4gP88w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCD411F000CF;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195142;
	bh=yh5n9jWo/3W77LwmiI39asuVgN3yT8N8hYH+AL2o/iw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hEcS1+yhhiO6duCO1O93xW/CRD01YuvtqfVr5AH7mhBZ7XvGcj0VGpHaX3r128iIZ
	 KmC46roAC4PRs/aCASjDz7hvvIKKuTj36D2mRb44JvNTMxzJjA/GbEOYvDB83foEeF
	 tOnqsL2Kae2se9JHzyy7hsu10Lwi7Tuo1on2gkcjiRXHeNNS0r6VATpYX/00nCx850
	 B+K5XK8almyeTJCOy5Rg29NMKnv4sZcs98f/DK4Lm/ldHYjpdq6mrzUbg3RWZ62XQs
	 iOWIax1itvlk5j6z8CskL9jhgV9iYkybly32/PFZ4WQGYseHe6zmsxC1OH0KP51rDo
	 /vA8jmuiwMBZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 592A04B87D;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:18:30 -0700
Subject: [PATCH v2 3/5] drm: fix config dependent unused variable warning.
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
Message-Id: <20261120-rd-mostly-v2-3-88056ede02a8@gmail.com>
References: <20261120-rd-mostly-v2-0-88056ede02a8@gmail.com>
In-Reply-To: <20261120-rd-mostly-v2-0-88056ede02a8@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195125; l=1090;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=FWl5eybJevr+52Kq5KRfTj77HDYm3mQVIttIFHf1YBM=;
 b=NOIutQD7kqK1VDi5lWhr/3MbHVkNy3BWiKygm/5FUyz8vqm+NhKzWvQHtDpOo/JTpswB2rCf6
 ArCsKbgc6SBB7oIAgpHM1xZDuD/c6LoxyRdqST7f4JZguv4n1e4CRNW
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

__drm_printfn_dbg() does:
      enum drm_debug_category category = p->category;
then:
      if (!__drm_debug_enabled(category))

When CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_debug_enabled(category)
expands to `true` without referencing `category`, causing an
unused-variable warning/error. Silence it by passing p->category
directly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 50cdeb1b15e2..12b95901eb70 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -218,9 +218,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);

-- 
2.56.1


