Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599862;
	b=Fp/Fk/yxi9uDuz/tSUld3VDbrhOi408CkXJk57vYbEEqUIo/ofduaJ0VbRy/nJnXU4E2
	 7EEsHw/cESjCSqPPLLVwo1CZEdVJUff3IrbdZzm6q5+ONtKqCudc+3wfFCtx30tgAMCle
	 nkdQgxibEWuIJ1LIC2Kg8BBvCSqFzcI0H8/OtfyeO5RixAPkucFAfiiVtJvg279X4R1Uo
	 Cr0qDxHe8bkfM1jxO8ywnt6ruJr5L6K4+SKTcRfb9uIl3AeQ40gWho2NUazgMNmzj+cZu
	 dtiKHC7+adUGFrToBQNCVIBpppOnFoXPIyIbwPf3zEAIaMnttzShviiI1G6nqA2Y3iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599862;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IukLKeNV9Pq7kX+Stc13rKGMOQ7okYokDgkUrVjgubQ=;
	b=mfD4gee6GSjcXaZyp5kpurlGIcf8s2H1Yh2IGjv8fLt9hi8/6+GPeL3Y/zyFq0WSxLNi
	 FxCuNNUVCH89S+hDB0LTfL9GDZP1QCzpG4KnPQFaqCg+keoK7AZP8Nso8hnl94cyhr/7u
	 PqV7+fccv67xpZ2zZdJTS3LhRtywifvyIMBi8vWkRN97NdOGJYX9EPEI0GllDlHrFduVO
	 D06gIsDFZaUugTg7gfKoiWb40kG+2iSp+gTdtdvGrkRfEjoRh/imnv51iXiDVd1g+uIpX
	 VRWCKGacyC5KexHSxqd+9mF+egLbJlo3AIBNQkcKqTleK0Nw6ghu9VM/W8LaMp96Hhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=BQUyDZwa;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135BC606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 135BC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=BQUyDZwa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1795599853;
	bh=8wwK4Rz+WJSJP3FKHIGHEF9udaoXFbPf/ast83cKPys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BQUyDZwaQLsLSMPos25q9fPRR766ouf94MKfsnyXpfn3hzLYvVAPUt/SnzTxcPWP2
	 x7rDMWqIZ1XI7Isj09sI+sX+bQPOKvuDkB/U+2fRY34PutOGSwaLzwonpwBRfT8qkS
	 bCEe1frsSCb4pCSbToK/qtKxDuU3iaTGQ9KbHEvQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 25 Nov 2026 10:43:42 +0100
Subject: [PATCH 1/3] selftests/nolibc: split out the structure member
 compatibility checks
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-nolibc-fcntl-v1-1-503d81db293f@weissschuh.net>
References: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
In-Reply-To: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Danish Khateeb <danishkhateeb03@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599851; l=2184;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8wwK4Rz+WJSJP3FKHIGHEF9udaoXFbPf/ast83cKPys=;
 b=MByEb+GSLTO338XCP5z/XNzcqHuAcNedHlu8M+8E3Bl+CXAVTjiGvlubmNLYLfnzFKKYht1v1
 O5H+7vYiDrMCcjzP5dRoPyl9zwys6KAvnFt9xUMxMfjcmJT3OchQa4j
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

A future test will add more similar tests.

Factor out a helper to validate that two structures have compatible
members.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 30 +++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 1157b521e65b..0eebd534bdb7 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -58,6 +58,18 @@
 #define SINT_MAX_OF_TYPE(type) (((type)1 << (sizeof(type) * 8 - 2)) - (type)1 + ((type)1 << (sizeof(type) * 8 - 2)))
 #define SINT_MIN_OF_TYPE(type) (-SINT_MAX_OF_TYPE(type) - 1)
 
+#define struct_members_identical(_member, _left, _right) ({				\
+	bool different = false;								\
+											\
+	different |= sizeof((_left)._member) != sizeof((_right)._member);		\
+	different |= offsetof(__typeof__(_left), _member) !=				\
+		     offsetof(__typeof__(_right), _member);				\
+	different |= !__builtin_types_compatible_p(__typeof__((_left)._member),		\
+						   __typeof__((_right)._member));	\
+											\
+	!different;									\
+})
+
 /* will be used to test initialization of environ */
 static char **test_envp;
 
@@ -1903,22 +1915,16 @@ int test_time_types(void)
 	struct timespec ts;
 
 	if (!__builtin_types_compatible_p(time_t, __kernel_time64_t))
-		return 1;
+		return __LINE__;
 
 	if (sizeof(ts) != sizeof(kts))
-		return 1;
-
-	if (!__builtin_types_compatible_p(__typeof__(ts.tv_sec), __typeof__(kts.tv_sec)))
-		return 1;
-
-	if (!__builtin_types_compatible_p(__typeof__(ts.tv_nsec), __typeof__(kts.tv_nsec)))
-		return 1;
+		return __LINE__;
 
-	if (offsetof(__typeof__(ts), tv_sec) != offsetof(__typeof__(kts), tv_sec))
-		return 1;
+	if (!struct_members_identical(tv_sec, ts, kts))
+		return __LINE__;
 
-	if (offsetof(__typeof__(ts), tv_nsec) != offsetof(__typeof__(kts), tv_nsec))
-		return 1;
+	if (!struct_members_identical(tv_nsec, ts, kts))
+		return __LINE__;
 #endif /* NOLIBC */
 
 	return 0;

-- 
2.56.1

