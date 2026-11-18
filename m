Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043433;
	b=WI6sgSb/6437Bp2xf5dfpd53jn82h1EgddpTxtaZWZrAf6haT8eFl1ixNQMjoca4eyWQ
	 sFWBWZUuqr36sD3l4rdXHo4wYV/vR+eWIBYaQMPS2hH/ivUdD162LtbwBuovigXxzY3M5
	 0cn293V+AgepZpY46UGftEeCi4VOr0Iyyhxkr+Usxh9PuCOQlA4iiJR3pvPgY9PYJq8Es
	 zli6tv5juECz3A0mJ+7vvDf99BoTYaJ5ebLbeXVKqSs0b6bWEES7GIsAoxb9vu18+DEOx
	 EQpg2U71AfJeqRLf6imuegxqu7zQFFJav0Ei2/J4s2RsgyllY5cY34MgoA5F9DOarow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=OwgzAaq9oQg3aBAhmVu4pRUF3d6m1k8L4dHJfpgBNQY=;
	b=fR/hBKAnGWnlcU5goM/A/oPLDlP6dhI4kmvCPTm41nhO2p9E79AddjwK0WslwQBdOiAT
	 4X2Q2qQ6jbwb6mcnArTJ5Im1w4ujgRRTtvc8BP7lI5dNs6lPdfUBH3lz1pyUl17Xu9ILW
	 9k9mbKtlrm3SbLFb/0udobdKvHHotB0fVL0n9hLsVFfepEmQq5LPO/ycA0ahmqMJa5Zpt
	 7Db3Tcmrw3Pz6hG+1h0VjAXjH3oyK1bYHGEJlFhcmALf3Q5JcqIzYehzGvLMjAQAxjX5t
	 qv6VOkjrn/H0JiCGmqSDp5aBN5XNGw1irFKLrglV3Z1r2s8vgdcP1bZApVagk8k9f5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MMuJI0DL;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12982606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12982606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MMuJI0DL
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jVHQ0508rz1XMlX8;
	Wed, 18 Nov 2026 23:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1795043428; x=1797635429; bh=OwgzA
	aq9oQg3aBAhmVu4pRUF3d6m1k8L4dHJfpgBNQY=; b=MMuJI0DLUV31n4Ku1QTgv
	AP0LWbCwnka6mIwxxZ+sFBw3YxP9LM5pfqJIM8a3o1984sg+7x0xpH3ATZohUrsy
	cOsC9WdCiqnM+AdGDsjXRxaehJ5LUQ8+qv8oyLqUaAmB3Hy12xkhZLtBZt9Rw+kH
	L4mI6k00IIc+0odMewkU/QPUd3PXUCJdKbyfXpIugHXTNjx64Eo8Kz8Sah1BQWsz
	y9kr6sbsw3g2uzoBVY5XuwSTbBinKEW7jgvlO2QIVpnScIBhNDVJgHspsXD+ZRBy
	eDPhwMCDF9+TAbvczqHktHYO+kIYC0PJkWMNJNtw75Psm4XYHTd10dCHamfvY1TZ
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iAfYrQ2ZL2DV; Wed, 18 Nov 2026 23:10:28 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jVHPv5tmhz1XLQ9s;
	Wed, 18 Nov 2026 23:10:27 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Christian Brauner <brauner@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 2/3] cleanup: Disable context analysis for __free() helpers
Date: Wed, 18 Nov 2026 15:09:58 -0800
Message-ID: <d87cfee3aa630885cbdb95f0f918e86a1263c2ec.1795043161.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <cover.1795043161.git.bvanassche@acm.org>
References: <cover.1795043161.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The __free_##_name() helper functions defined by DEFINE_FREE() call the
free expression that has been passed to DEFINE_FREE(). If that
expression releases a lock, e.g. because it is a call to an unlock
function, the Clang thread-safety analyzer complains because it cannot
know that the variable that is passed to the helper function holds a
lock. This is needed by:
- __drm_for_each_bridge_in_chain_cleanup (include/drm/drm_bridge.h),
  used by drm_for_each_bridge_in_chain_scoped() and
  drm_for_each_bridge_in_chain_from_scoped().
- netdev_unlock (net/core/dev.h), used by for_each_netdev_lock_scoped().
- netdev_unlock_ops_compat (net/core/dev.h), used by
  for_each_netdev_lock_ops_compat_scoped().

Disable context analysis for the __free() helper functions.

Acked-by: Marco Elver <elver@google.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/cleanup.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 1fb8058b897d..f6afe80781a4 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -207,8 +207,10 @@
  * Without the NULL test it turns into a mess and the compiler can't hel=
p us.
  */
=20
-#define DEFINE_FREE(_name, _type, _free) \
-	static __always_inline void __free_##_name(void *p) { _type _T =3D *(_t=
ype *)p; _free; }
+#define DEFINE_FREE(_name, _type, _free)				\
+	static __always_inline void __free_##_name(void *p)		\
+		__context_unsafe(/* _free may release a lock */)		\
+	{ _type _T =3D *(_type *)p; _free; }
=20
 #define __free(_name)	__cleanup(__free_##_name)
=20
