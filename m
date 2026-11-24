Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490992;
	b=GrllqU28UBClupbhwygjgQGDvs1TQdfQXq+IfOazma4GQwdS02umWUoYKhrhByirtIR0
	 POouUA7TBweNkkjl3zPtt2f5oBCpNaQLJGLXNIWxuuamitiPfof+pjFpa4LdOX6gIg4Dj
	 69eml56TiSMLRdnHQHhPzWjWSrbryhGvU8OJrQcHsiNuowgNsmbxwpqVivxMrC9WINWXn
	 G9qDQn3QMQ7vPRkIyFTb6Ojy8YZqELUjQCIZF7RT5OuFXAfKCC66UINy1RwRZjaLyKR+H
	 1Kph5k8/UJkKXCtTMxsgkdhHzZuSnV/5uVMNiYJmIJ9LLgDqm2k123E35QNErf6tF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
	b=Axhgu56gF6wnRXblanXcEQ4Ww16stCoZoytWOq9IRFKWkAPIvGcLuqWsm54KLtPTau7k
	 GOqHBOkjdfdcUfc8G3avKTjYZbvu7IzL/fmpWxQo5MKNyaLo9iF9nm0e9IoY4HiwLM/m0
	 JGJjNiMdASrVHI9JNEnV1fijDFFYlR92z43+Lb8rb9a3Yjli6WmPfiWzYiLOzoZzKO+lx
	 9HbnmTlXAzHOgOvx4+oywTJlbtP2MNNkBj5O7Sso+j3dCXoeMDUkpBRCjCAR+biQF6dTy
	 F4+6rp9HsktD5dnLVDUyuRKH/UU2MQ+Ghm0ER90eUlEDK+PJAGo2u+JEUCTCkvpt5jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=cyVEFZrL;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D690F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D690F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=cyVEFZrL
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so791180a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795490991; x=1796095791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
        b=cyVEFZrLqgJ70eSeLwYbJxeW1eLKC/b8ZFkHJAdgnDtJFTVOyziG9CfUFViuDFd1K5
         K19BbuIDmf+DQepi6NYJgahfL15NBziUZL/2Wm8WcNshMG2e3Eoio93BPosykeph6NMF
         1Q8CQn3L13ByWVExtc/46sEKeasUK1GHeZsfTPHGUTWWpKYcbL0t//rQurEsCv6Jvzfz
         A20Rvygg/F0n7QIF2c/CLIlnLpg7sePiLWdqqF96lTzJdxcTizbQgEuml9W2FRC5weuR
         KfXQ61n0Y5TT4rjCz3IiifOxSQF70MdBL1r3Hw2R8oVUZnY0roqF30ZO3mQtIPhd87o+
         c0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490991; x=1796095791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
        b=fnrXdIwwIRsYHI5e6HcBaDr8gYKw45Ks2dhqxHSf2wvsHxtBNIXkpyUbh4AC3JeqVQ
         CI+O2W4e82EnzBe1W5s/UWE3Cb+R+lH2SLDyyLEWvXzCne6YkdgEFPibtUGhNdFZvHOF
         bxDWqZ6rXvOmChOu4brPDzWTlJlmgXnxZ25kayH9u/bu4CF9vCtJa+E77YBN3sEjBhye
         yQeBLaimkBUyvqDtwpdAPnlRhm8MEg5PYqPBk1SCX5C4/rpjNGbf78dWz3r93RLGQh1u
         VI40PSooe9cBsEJWEnLTBgEHKJ6Wi5eAqSF9b5G4lR4eRgqkiYYr28zgkr6E7+Fjuw1E
         pflA==
X-Forwarded-Encrypted: i=1; AL+hErGxJ4e8EKjKMs0gcryp6m2F0ZWou/bTDT8B24yY2g/6aUshJdvxHZpx0Gm2IHrGfrSmKLz0Gfzptz9Gk2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CeNKQjb5Giq/F1IM8AziurazM617dDuYTMRsae22g/MEe5mq+
	MhHDt1JHcILQY/rPqSEoTcR6CMqxSV2wKUB6pE/GvCgSh/PBNGNVzq0gIzVNpGluB4KKWB4Lzio
	dwtD2ihu7qJ23Z4TRJjrRdIe0lBkXFkhGAGPOnZmO3mgl1n18NeHf
X-Gm-Gg: AZFdTZdg4AFPq4vXX8K3UZ00qOEUNDLTG2dqzH1xC2xNZx2xQUdefLl2o+bl1SeXI9w
	hOc7bWGiTA25Q3ZIxL7/idCzg4T7O3pQUivqiOlWLbIVRK+NJrxm0c5/IAASq6fkwi6lmvpnq0m
	b3wFjen15Kx9FPR9GvaPIWxZGuYJyU+a2E2f1yvLXOZzBDe2WjyM+Y0nrKG19sI26NaA5OoRPBf
	48qS+uyt+k42XdiBgCJjS9wHO2y0V9cCq5uSugM0fItYie7+0PDFO3mndDwvssqnjjPMrISckAX
	+NVjw23E51F+4Ktes1XGksWZiS5F49ZYz13yQlWyM7/SSae/TCcS0XgTufpGOFUa7Kbr9tzKbSF
	lQcVcctiFwidg1IJRAJEKEMcl2jY=
X-Received: by 2002:a17:90b:17d1:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b41c8e1735mr11583721a91.13.1795490991106;
        Mon, 23 Nov 2026 19:29:51 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc74bcsm4445939a91.0.2026.11.23.19.29.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 19:29:51 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm/compat: pass on the translated length of a socket policy
Date: Mon, 23 Nov 2026 19:29:46 -0800
Message-ID: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

xfrm_user_policy() compiles a 32-bit task's translated socket policy
with the untranslated length, 4 bytes short, so the policy loses its
last template: an ESP-required socket policy then sends in clear
text. Have the translator return the translated length.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 96392ee5a13b ("xfrm/compat: Translate 32-bit user_policy from sockptr")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
The 64-bit struct xfrm_userpolicy_info has 4 bytes of tail padding
that the 32-bit one lacks (168 and 164 bytes on x86-64), and
xfrm_compile_policy() counts the templates as (len - sizeof(*p)) /
sizeof(*ut). With the 32-bit length one template counts as none, so a
32-bit program's ESP-required socket policy requires nothing: its
datagrams leave in clear text, with no SA and no acquire. For the same
reason a policy without templates, which IKE daemons set on their own
sockets, is refused.

The BUILD_BUG_ON()s check what the translator's memcpy()s rely on:
4 = sizeof(struct xfrm_userpolicy_info) -
sizeof(struct compat_xfrm_userpolicy_info), the fields before the
padding at the same offsets in both layouts, and templates that need
no 8-byte alignment.

Found with an AI coding assistant. It reproduces on an unmodified
kernel (ipsec master), without kernel changes or fault injection, and
no longer with this change. Tested with the reproducer, a selftest,
two boots each way, and with the xfrm_policy and xfrm_state
selftests. The reproducer is available on request; the selftest
follows once stable has the fix.

 include/net/xfrm.h     |  2 +-
 net/xfrm/xfrm_compat.c | 18 ++++++++++++++----
 net/xfrm/xfrm_state.c  |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8dc6f1..455b9f986ea5b 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -2331,7 +2331,7 @@ struct xfrm_translator {
 			struct netlink_ext_ack *extack);
 
 	/* Translate 32-bit user_policy from sockptr */
-	int (*xlate_user_policy_sockptr)(u8 **pdata32, int optlen);
+	int (*xlate_user_policy_sockptr)(u8 **pdata32, int *optlen);
 
 	struct module *owner;
 };
diff --git a/net/xfrm/xfrm_compat.c b/net/xfrm/xfrm_compat.c
index 670e3512fc090..af5cb36d691ea 100644
--- a/net/xfrm/xfrm_compat.c
+++ b/net/xfrm/xfrm_compat.c
@@ -642,16 +642,25 @@ static struct nlmsghdr *xfrm_user_rcv_msg_compat(const struct nlmsghdr *h32,
 	return h64;
 }
 
-static int xfrm_user_policy_compat(u8 **pdata32, int optlen)
+static int xfrm_user_policy_compat(u8 **pdata32, int *optlen)
 {
 	struct compat_xfrm_userpolicy_info *p = (void *)*pdata32;
 	u8 *src_templates, *dst_templates;
 	u8 *data64;
 
-	if (optlen < sizeof(*p))
+	/* The 64-bit layout only adds tail padding, and the templates
+	 * after it are the same in both layouts.
+	 */
+	BUILD_BUG_ON(sizeof(struct xfrm_userpolicy_info) -
+		     sizeof(struct compat_xfrm_userpolicy_info) != 4);
+	BUILD_BUG_ON(offsetof(struct xfrm_userpolicy_info, share) !=
+		     offsetof(struct compat_xfrm_userpolicy_info, share));
+	BUILD_BUG_ON(__alignof__(struct xfrm_user_tmpl) > 4);
+
+	if (*optlen < sizeof(*p))
 		return -EINVAL;
 
-	data64 = kmalloc_track_caller(optlen + 4, GFP_USER | __GFP_NOWARN);
+	data64 = kmalloc_track_caller(*optlen + 4, GFP_USER | __GFP_NOWARN);
 	if (!data64)
 		return -ENOMEM;
 
@@ -660,10 +669,11 @@ static int xfrm_user_policy_compat(u8 **pdata32, int optlen)
 
 	src_templates = *pdata32 + sizeof(*p);
 	dst_templates = data64 + sizeof(*p) + 4;
-	memcpy(dst_templates, src_templates, optlen - sizeof(*p));
+	memcpy(dst_templates, src_templates, *optlen - sizeof(*p));
 
 	kfree(*pdata32);
 	*pdata32 = data64;
+	*optlen += 4;
 	return 0;
 }
 
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index f4a4ddaeb9b37..eb984ed118884 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -3115,7 +3115,7 @@ int xfrm_user_policy(struct sock *sk, int optname, sockptr_t optval, int optlen)
 			return -EOPNOTSUPP;
 		}
 
-		err = xtr->xlate_user_policy_sockptr(&data, optlen);
+		err = xtr->xlate_user_policy_sockptr(&data, &optlen);
 		xfrm_put_translator(xtr);
 		if (err) {
 			kfree(data);

base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.53.0

