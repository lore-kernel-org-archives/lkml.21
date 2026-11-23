Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427051;
	b=r/ljwLQdS6DrVzSGUCaIFsvGW2yDtu96/B6e+lfl9tkHUaUzQ2wIf4Q/FfYoM1zPr4/U
	 +Fhqm6aylTdS2BhM96VH3DPXUmS+XWgdPZxaGjn0r4butJSo/3Zx0fOfPvSlij/hgtzDX
	 kB75ZwFD2y0OGptekW5Ox65XjJfb//lM/1ZxrYMcrVktOc9kQz2TRRJF6s9nogdXUEMdD
	 gCtUSz+GPseoa6R8RtnfL1s+8Bbo6bli06xX4tVihwL4MhSF+igzp6X8rmTGVR7N8DGDe
	 7siY9aufM8WNolHC1PkToag2r67UDO2VntaXhBdPUM+Quihyy/eTJW0kLwGM0y9lPQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427051;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=cTVrC+Qg3lb/MrM+dmV0P2RIgtr3ynGB3ePDiFOrcxE=;
	b=RUv62UAGTiXE3fj96jYlQ+H3yEIbrhuiMrGTez2ObjP3HxBOC9eOJEMd7gFIRsdzHrs1
	 gTkOD3XKzYM68YziScYiocp695dQDoeE6CvQavW8lKzz9IAvvVQ/mys3EyLGz3ujPfFSN
	 xry19k/tetZ6feVfwWrB6I9JnH4auuxxi0hc65YzwTMzU7Sx1h/UyfqPTntvwqc0iX0Lf
	 M9x54KYZ0wtN84kUuXaf/EKJIHD2tVqwagc2N1zjpsozTsim5jmghXLM9KziJmMrePCEi
	 9Am06b7oqWUtXRhpWSsxDA8GcS4Z+bk22dXNsz134+71oZVsx/m1nxWEfcNo3DXy2ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TCiLYLjw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2Y5ysKof;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8703D606A336;
	Mon, 23 Nov 2026 09:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8703D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TCiLYLjw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2Y5ysKof
Date: Mon, 23 Nov 2026 09:44:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795427049;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTVrC+Qg3lb/MrM+dmV0P2RIgtr3ynGB3ePDiFOrcxE=;
	b=TCiLYLjwkRfy8I4y5d8JAO4nOjavNKMlcFT5PXnpCwYqDEsbnJ1YTrei13ECDmF9UQ4yr2
	vM5iP1SAP/co3Ap2zo3fvadnRsORvz1r2W7P6KLveuwcX/FERAqXHJrc+OPGk/K2eGupml
	t1H7HU9wR3gFxGs+toAwwjzCY4gs/zWSBssYUDYxj98aDuCMf4rDYkCWMGF/7rJycfJqjp
	r0DA1aM3rWHKntrir/YkTF62pDpJF/cwh10XCtsMIEioadE9chZMqZhL9RlhFIS6k9VB6j
	enJOM8B4xXmexg2Kkqsx855yyjTxgPXenxafwC3hHgkL9XAgwIeBWGEDzQj9oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795427049;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTVrC+Qg3lb/MrM+dmV0P2RIgtr3ynGB3ePDiFOrcxE=;
	b=2Y5ysKofGk9sky2/BUhqMg2/f2TDFTe3WbWLr9MH0AppH6pqn8y1qF1p1Ox6D39fCQ7elv
	pqoiSc2WA3A343CA==
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
Message-ID: <179542704729.92412.14402482030043003709.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     da198fa75403535626b91cfddff7c2189b5f894f
Gitweb:        https://git.kernel.org/tip/da198fa75403535626b91cfddff7c2189b5=
f894f
Author:        Bart Van Assche <bvanassche@acm.org>
AuthorDate:    Wed, 18 Nov 2026 15:09:58 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:38:52 +01:00

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
