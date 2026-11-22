Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387755;
	b=WYbLwpe6F+CEdad6m8LkCGe3kQBOmdpvDnnNcOBxiauTvVMf0ACgTTGzbquGLtUV/fZB
	 WMJ+4IMA/Pc2jVVKxL6k1dMlGim2l4nb1WbOu3DQYoetFHmB01LVouqaEoq+YnNNfb22u
	 3YwsvZXvz6X1PeNSVgtaF/mOzJj2GmpugUX5IpRWv+YKm1qc9I126DgCg57ATwUHB0tv7
	 VldBkC4QpoU+3x7io+KOp1z4iLwPL/F20KBt0kkIyavq6ywnBGPaxtTLRXqyJ3PQwZOe2
	 6btiHbGvu9TOHHiXUyIN42LYFCNvUpPTCVywZ1cqsonIN2SpiMQnvmRLONZhwvQoVUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387755;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=h2kNcZ0V/qziF37iiNL3hB+1Q8chsd8wSjq96wED5/M=;
	b=QjuzgxE8ZgeyiNO5ZLFjc887YDVZMlUcdFPzBvzMrPNaBW3kHvw86a0PgHX8m2qgm1bP
	 olP+cac5zHFmtNe5CrkcLGLUVnGfouVi99wgxcGUJ+835F28Y/e//5dS1eNJuJiQRHXyJ
	 5o7tC5VMm7PBE413wTXgusaxDidF2DSJyNH/BJtXrcCcMpFRXmEo/BeOePC/9fkGN+nFo
	 7sQJ8l8zL8LygtN6s5E2ckRQIHjte//4mS3ZsS9fMV2bEHgoeFHzXxpMKf3WcI1HGHPrO
	 gpR6elJFsr9i72uTjWBSV285BbCEOlPfCCnK77cj3EyiuYP3jRMFbUiiIpDiIvT1xyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fknvmUup;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PVoWbPtq;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C51606A31E;
	Sun, 22 Nov 2026 22:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fknvmUup;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PVoWbPtq
Date: Sun, 22 Nov 2026 22:49:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795387747;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2kNcZ0V/qziF37iiNL3hB+1Q8chsd8wSjq96wED5/M=;
	b=fknvmUup/OSe0M/zy1E87pcOxywvkxBG0fCKZqJq8wqBlUWASbU5z+7J85dXlfCwRoLPRn
	viIwd1ZUhTFS23DbzGaeZlhP5/2qENdxO8E5Jrtfwj4873sRThngLN5W0SNqlqcMthZqzM
	UGOTJR7X4qVGRdRjFJcvi68sZU60/24vytgMiM+Fo2P7HM12Jiq8eiFq71h5IzzjKxDaxL
	KOEQAUUqc4eu9axK+X2fnM0kEAxJlgZsyPUGiKHNPSt3pvj5vDpv6GtVzw24/8LH7QyPTF
	9rmMAlryCqfvtqUf3ows11XT/oPfUbUv9pkIIVPbGfGpE/vkCaEM1qWz21FGmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795387747;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2kNcZ0V/qziF37iiNL3hB+1Q8chsd8wSjq96wED5/M=;
	b=PVoWbPtqU5EcTiuckDtsRhrq3WpVw3DBqU1Uwj7PksvS5qHIWAk92/2qJBvrTIG8EUoqfa
	GdKYkBiBURHdLfDg==
From: "tip-bot2 for Bart Van Assche" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/urgent] cleanup: Disable context analysis for __free() helpers
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Marco Elver <elver@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <d87cfee3aa630885cbdb95f0f918e86a1263c2ec.1795043161.git.bvanassche@acm.org>
References:
 <d87cfee3aa630885cbdb95f0f918e86a1263c2ec.1795043161.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179538774544.92412.4661614888336037056.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     f7c70c05bba097d99dd06346b037f01c5ab44fbf
Gitweb:        https://git.kernel.org/tip/f7c70c05bba097d99dd06346b037f01c5ab=
44fbf
Author:        Bart Van Assche <bvanassche@acm.org>
AuthorDate:    Wed, 18 Nov 2026 15:09:58 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 22 Nov 2026 16:03:03 +01:00

cleanup: Disable context analysis for __free() helpers

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

Disable context analysis for the __free() helper functions via
__context_unsafe().

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Marco Elver <elver@google.com>
Link: https://patch.msgid.link/d87cfee3aa630885cbdb95f0f918e86a1263c2ec.17950=
43161.git.bvanassche@acm.org
---
 include/linux/cleanup.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 1fb8058..1e09aea 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -207,8 +207,10 @@
  * Without the NULL test it turns into a mess and the compiler can't help us.
  */
=20
-#define DEFINE_FREE(_name, _type, _free) \
-	static __always_inline void __free_##_name(void *p) { _type _T =3D *(_type =
*)p; _free; }
+#define DEFINE_FREE(_name, _type, _free)				\
+	static __always_inline void __free_##_name(void *p)		\
+		__context_unsafe(/* _free may release a lock */)	\
+	{ _type _T =3D *(_type *)p; _free; }
=20
 #define __free(_name)	__cleanup(__free_##_name)
=20
