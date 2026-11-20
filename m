Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216447;
	b=3QDk7GFf3OCauCNuQ3jhCYkMEp4YGmlTuhtkANotX5CFnhxw/V62UWEsEwPLQWQLJDMc
	 LTflQdOcEOYomrsBoJiJ9rZBQ8y6aLzwKGSkVcPp+nn8qjT/oAt0KgEv0Vh9+IdhMa9TJ
	 uDNIz60qvhZWGPvaEIY0o2NGrK7QQquUp6YoIyXq2NYFjlz5YjxIrvl/oGLU04hrtEkOU
	 wERPESSaQyDScr68FMwLhZfAprmwXh9wTAHxUSHtKqio3Ht1meiALUPtd/stJ2UNL8fOV
	 CJDIM4lkpCeLIHC4STZ2lrKFCPLUrGV+f9K4G+k2jDEHWd1V1+I2hycE2Fls9KLo5TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SQiSSUnkgfdQDioXSaElBSsat+w/04YkyQNDvuI8C3M=;
	b=H7TKQ4TQKWaTJ2ZiZBzUvoJg9F3o/AejdjG1gBAC78GPEfYnTCyqSOxuLaEylEtCCQSv
	 J1CbB0hpkUVHKqdkthtdVu8U36SrPvpZw+XhHnx3E3JtVuYUpONGqHCQeouVcKz1YL3Hz
	 QlSzzC74r+4qMkmuHiVQYJDgxF3mFsY3qzVyZQDucMkARoC3CZIooqYx2swAoeOat/2dI
	 PwsITIwFyoUr/xDZgeXdSdrEILfVeT9E1rjI/jZJdwmbDQfbTv31MhT8tPegTnb4s79ji
	 WfcWnGCk94w29fOy8cd72REOlPiGM4/RJyq4IJ9deB2D7uS8aoSQJmTtTt5boaqzj5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MuZh3eT/";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A5606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78A5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuZh3eT/
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1112391f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216443; x=1795821243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQiSSUnkgfdQDioXSaElBSsat+w/04YkyQNDvuI8C3M=;
        b=MuZh3eT/vZxJJ/N89NPDd5NNty+NyzEGy7GKK0yySN6e/qsLHlQsHAJtbF9v7ULWyV
         7yqkHgJzD/+gL3YbrTL0nn1ypGlsmkO162LbIOZDykZyzWGZ70N1A11uRjrnH4l+V8Og
         XXdRSv5nEGEOatS5j5PWmZ+W+bGC7MPRLOt4IaaDdRUIX9kR4KdDYRaCzogDSG+1bihL
         iDhMDU28Ut5bAZBNsqt/0JS1NY+VVDO07++ELiy2qoMuDvTQOrvtnZj69y0aJy5oPIED
         3KcctILSm4VfDr3tPl0uq4adrPLY0GnZNoHkcBN8zrmKhQxc7hDho6jjgpq29oofmf9U
         fY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216443; x=1795821243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQiSSUnkgfdQDioXSaElBSsat+w/04YkyQNDvuI8C3M=;
        b=X0br+3RNyTDKJIGLg+GpNX420kopsk0v71VylHgGTzzZf96X54ElgXOXGx0mUQ9f5z
         fWXrENCwhg68FYbyZhKM2d8HkfxJ33oDy27YYSOBN7ypmdvxWrL5bAS8jm/vvjfKO9W6
         GfmDbRtXCAd/557lK3grDkxEQU696iskbW0Ks8TPO/r+yWaIg4zjAM6FROMLCljwRqw0
         /wTeCfUbMUVBnvHmm6Ph3s98F4F7Zp2MFh0zRjRQDEHGPEo7UUwxbPoKnWcZyOUCvMtL
         94tyYu3S6PmfSY1MP84OHHkcQfzH4Vsm8H9sbR1c/cRUNhsXkF/BItM+t0R9P50+nUE+
         xWjw==
X-Forwarded-Encrypted: i=1; AL+hErHM3E0n1xAEztQ7NPP/a6iFTb05vJTod0/N/Cv9qx6uFzYdM0BLwBnotqt3UxBA74+BheVaNn4F4ImKbs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KijQxX0QBMUK/n29rZ4W0igbk8w3XCnV2FbvrhoxTZ6SGxiPI
	o0fLxfJ3Uustpi3UYdeNev7A2xmYKP1cvWaBiJMjktb5B99SCoD4tfk=
X-Gm-Gg: AZFdTZeNuZagnApjGxTbJ2p9/gBvNxwkynMwqncuGfdzg1abcJttyNdiXvYTTxQmOxh
	9xDRSS0vjsv0VQj2K0jOdyes+ctNU5z/D08zz54zhTy0zBan2EkgDq4BWz4yfxAopRN7ZDE91f8
	o+3pxd54AjEK4j8xWQ0OmvW76w0dpElWaJ1vkTsQgasZbHsr2+4oOtA5t4rbCav6wVUuLTkpd1u
	2PGwk4whlJxpl2j1j5Di7M66Z68BbdFbdAhZw+qJoTPxtNsDiz83NgUFbXCG2eonWDpd9H/lqoz
	VqzMa/XxpgrYSz7al2d+m7CfAbBOtT4q/Ot0qPmeAAAJMXssqXhlAlTKRv5vrGv1chS6Vma1jio
	vi16yloBJ87vD0J56DrIZDkQvJZzsKcHf/QlEtBg0+kUXk/rrzTpLtJbfKV/3iWt4NZ4FolZC5C
	iZg7iBCxrtKPXGiMeXO9r2PpThMAh0+Hl8Owqvk69jiN+N0ygi7X9wu7npZQGSt8IxCOUxq0CXi
	TmGIElVuMU5ENTmUDvYhVt33FK4gB6PhlEsHtItPOb7TMauT1/Il1BrIOCJbIrKqPdT/3+B8DEE
	4h8kq13Or5rXJCTn6E/zFokuuepR
X-Received: by 2002:a05:6000:2c04:b0:4ad:2699:74ec with SMTP id ffacd0b85a97d-4ad269975e8mr6501403f8f.39.1795216443071;
        Fri, 20 Nov 2026 15:14:03 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm8151832f8f.58.2026.11.20.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:14:02 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net] net/sched: cls_flow: pin file with get_file_active before reading f_cred
Date: Fri, 20 Nov 2026 23:13:54 +0000
Message-ID: <20261120231354.1361803-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

flow_get_skuid() and flow_get_skgid() read sk->sk_socket->file->f_cred
without holding a reference to the file. Since the file slab uses
SLAB_TYPESAFE_BY_RCU, a concurrent close() may free and recycle the file
object, causing stale credential data to be read through f_cred.

Pin the file with get_file_active() before accessing its credentials and
release with fput() afterwards.

Found by manual code inspection; not triggered at runtime.

Fixes: 0ede61d8589cc ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Use get_file_active() instead of get_file_rcu() since socket->file is
  not __rcu-annotated, fixing sparse warnings (Jakub Kicinski)
- Include discovery method per sashiko-bot request

 net/sched/cls_flow.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/sched/cls_flow.c b/net/sched/cls_flow.c
index 2ef449706638b..8653e6fdcfa2a 100644
--- a/net/sched/cls_flow.c
+++ b/net/sched/cls_flow.c
@@ -17,6 +17,7 @@
 #include <linux/ipv6.h>
 #include <linux/if_vlan.h>
 #include <linux/slab.h>
+#include <linux/fs.h>
 #include <linux/module.h>
 #include <net/inet_sock.h>
 
@@ -208,10 +209,16 @@ static u32 flow_get_rtclassid(const struct sk_buff *skb)
 static u32 flow_get_skuid(const struct sk_buff *skb)
 {
 	struct sock *sk = skb_to_full_sk(skb);
+	struct file *filp;
 
-	if (sk && sk->sk_socket && sk->sk_socket->file) {
-		kuid_t skuid = sk->sk_socket->file->f_cred->fsuid;
+	if (!sk || !sk->sk_socket)
+		return 0;
+
+	filp = get_file_active(&sk->sk_socket->file);
+	if (filp) {
+		kuid_t skuid = filp->f_cred->fsuid;
 
+		fput(filp);
 		return from_kuid(&init_user_ns, skuid);
 	}
 	return 0;
@@ -220,10 +227,16 @@ static u32 flow_get_skuid(const struct sk_buff *skb)
 static u32 flow_get_skgid(const struct sk_buff *skb)
 {
 	struct sock *sk = skb_to_full_sk(skb);
+	struct file *filp;
+
+	if (!sk || !sk->sk_socket)
+		return 0;
 
-	if (sk && sk->sk_socket && sk->sk_socket->file) {
-		kgid_t skgid = sk->sk_socket->file->f_cred->fsgid;
+	filp = get_file_active(&sk->sk_socket->file);
+	if (filp) {
+		kgid_t skgid = filp->f_cred->fsgid;
 
+		fput(filp);
 		return from_kgid(&init_user_ns, skgid);
 	}
 	return 0;
-- 
2.47.3
