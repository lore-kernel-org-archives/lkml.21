Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450011;
	b=3HxVypGFcTfx1sODnID4qAYObARac7lWy1t7cfsvfadZVTWE7eXsbRa0+DoOL0i2n1RD
	 LVOhXIdAwuKXxTE+4uEHXHnIZNxVxRjhX0AakLlmWZjAiIUFPEOqrTPH3voEXJEULOsTX
	 8NwaRd3JWC1BrUtQxOJkY0vAUWX5++dUkmMAEURpYB9zt78Y1aVda36CNLG6XqQn99PwL
	 RC7XicaZYmeAaWEt1CmTKMyBJ0IFFXJXfvhVCuZ+mm/5ng0wDzVLlnAhOYZazJhlgnri5
	 qI4YOA7Cuja/qew4rKFu7pqBN4dufjuclK87rVHoqu4CiQeYSearYBQSmqKmesfaz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GzTD9WH9/UERM7DubWsp4AE37bmITVN0W6tIx9FHUTE=;
	b=mjcuxjJDPBAFgRttA5JofBRtrFcDpNmKQSLGq8hIlpMjRQKQYpzxzKpBqJoxWr8JI5fQ
	 clGg5ksF1Gc9udoyYnytAjxVKVLxRY4pma1JGt4EqN+5Jr3TIBL2u066bup+IQWWeQcGq
	 TRnyxgIA19XG8YjbRs7B0VwBD6LpJacfSQtyyPYW995wjlia/bwDc7YeEvZmsVPzgubC+
	 TuOuU+RsbMkcgIGFoWlTFYzebwBuRlLyuPXAdmNJIbgCKjZT4MU/rt/dasr6Q2V+/hz67
	 y3eo3GMaKcuT3yQQ+gXcI5tmLWVlRNPG7FkMIhA7T7bW4GgS2D+kB+94n2GKMk+AAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gu/9OOJc";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42485606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42485606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu/9OOJc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so1996546f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450010; x=1796054810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzTD9WH9/UERM7DubWsp4AE37bmITVN0W6tIx9FHUTE=;
        b=gu/9OOJchsNnRNlV3NFQ8M+VWDynXxt0MDE3ACvNV105QrCtPT1CbLfssYATpGWWlW
         5of0Ha43hC51xyJsCv5Fq11olSn1zuYmUOK3gua5Q3yA7mahJOFLZl9NePUp/vH2Y3Xd
         CO62CDZY1HinDeGPm4B303xP0f1QOxIQDfuz41SqPfvcPx6zcds4m/7XvhSKXf/aQZkV
         3XHsKyjLGoU4IL+VX5z5GDdvtkL/ckhSK1CagEetXUYtQVvFOXYlDT1+g/OA1fzTADRi
         hIwhh5GqRjIfWqPKwjJ6HFM5+yLT52IpqwNzoa6TuYeXVguo+ROdv8N1YANli8E/Ucdj
         QE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450010; x=1796054810;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GzTD9WH9/UERM7DubWsp4AE37bmITVN0W6tIx9FHUTE=;
        b=wtCRZtNmWRlX4n/TBuhGluu4BeG59rG5KWK0q6cFb50LO2pMKpN5ktykHNqio9Pi22
         5gVczHxkaSz6GJXRLW6jf3JE6R/rlWV77wR5x0UXB5rePkGXJjdehROpvSawnf49PvVc
         WzwT6GA8Dg/C7Q9Guo0m9JX8IiQNTqgG+qTUguHHTCfD9GukDxsBK1EnT7WeJ9t9nLmd
         ZDvZwc/9eY7oV/yfUK6P1BVHoX90wkhE0SRema6InjAQHdQwSaaMKntuZtWGJEVdG12R
         yRrox3nfycHzEgoSvRiK0mSlXLe0N961qlGoIPTyjEKdruXzDXdigNeYStmA4wxttMXB
         ih9A==
X-Forwarded-Encrypted: i=1; AL+hErFOKiYnKPOqWoGG1ZbdqiIeNwhsAmcNlnivN9Jb+3Esqk3dqTO2ZYssT2AjbYmU2T3dugV8ucEcggTxNAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kp3Xdx4O5rUhMRyQRgk1R1F7ALAyFh7TgQGv4ZAFeGpVJXK6T
	gCssGHyAoFB7yHWKSoNU0jFiVc9BOLsKnKeabnZak++H4b4qz9ztfHm8
X-Gm-Gg: AZFdTZfVakp3tLF7Y/bF8LFa6wEKYSpaLJgGJB4xMtOOmQ0CDhOGdJgqfksdxd68toB
	eJc7j9jWsCcTaWnF8fZoewoDaWl7tMSOE0BK9XEYTSjIXB2vsbpWapSXDEyJoH6P4/8vDojo2tS
	b4k0HlnJz9II/5z3WjZonYQtAyK+ksuhzxzUctg5S+UsG6GUimzoHAeNR9FMpVcILdCKDGTlxYu
	Cnj7+BExjm9qf05YUYYsT+ZOLMJtSvQH4onIuULQxHqRIjLyJFVjIqGbBu9+By+2RgiSOdkxlkB
	fcmtMuAwdE+Hezl/P3UKnyeKxy6izjRezsPrcs376dJ218CnEhiAm/z4FJrcCWJ+Bm8HjsCKBvG
	8h+couP5x/Hx2AXKoVqRWbL62pl3pZOvrtSEh4G+ACptRTJ6rPh9+xP0sNJuVXy5CFAFGzCNlBD
	k+4eqgq1kHFYxYAPoQqQlk7siDmiOHXoDdWnTCDZ0R/K3/rFVxOk8YkTJO1I2RpP/aOVgr1v9Xi
	MpqDrKr2oq4bWM/ncW+zv9XShjY1BiLLXDfTTkOHfegtjRK+z8j4xnA2ybBcP5y2eSqwx048nsM
	JmxEQyoDUtlKzWMicHCsfWVmsA==
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr23817893f8f.22.1795450009406;
        Mon, 23 Nov 2026 08:06:49 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm24580960f8f.1.2026.11.23.08.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:06:48 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	edumazet@google.com,
	brauner@kernel.org,
	stable@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH v3] kobject: fix use-after-free in tagged uevent broadcast
Date: Mon, 23 Nov 2026 19:03:16 +0300
Message-ID: <20261123160615.1074229-1-omermetekaya0@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kobject_uevent_net_broadcast() accesses net->uevent_sock->sk without
protection in the tagged (namespace-aware) path. During network namespace
teardown, uevent_net_exit() frees the uevent_sock while a concurrent
kobject_uevent_env() call can still reference it, causing a
use-after-free.

Extend uevent_sock_mutex to cover the tagged broadcast path and the
netlink receive path, serializing them with teardown: in
uevent_net_exit(), set net->uevent_sock to NULL under the mutex before
releasing the socket. In the tagged broadcast path and in
uevent_net_rcv_skb(), check for NULL under the same mutex before
accessing the socket.

Closes: https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0
Fixes: 5c0941c55e5f ("kobject: reduce uevent_sock_mutex scope")
Cc: stable@vger.kernel.org
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v3: Switch from explicit mutex_lock/unlock to guard(mutex) and
    scoped_guard(mutex, ...)

 lib/kobject_uevent.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..768540433c7f 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/spinlock.h>
+#include <linux/cleanup.h>
 #include <linux/string.h>
 #include <linux/kobject.h>
 #include <linux/export.h>
@@ -411,9 +412,14 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
-
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		struct uevent_sock *ue_sk;
+
+		guard(mutex)(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							     action_string,
+							     devpath);
 	}
 #endif
 
@@ -743,6 +749,7 @@ static int uevent_net_broadcast(struct sock *usk, struct sk_buff *skb,
 static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 			      struct netlink_ext_ack *extack)
 {
+	struct uevent_sock *ue_sk;
 	struct net *net;
 	int ret;
 
@@ -760,7 +767,12 @@ static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 		return -EPERM;
 	}
 
-	ret = uevent_net_broadcast(net->uevent_sock->sk, skb, extack);
+	guard(mutex)(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	if (ue_sk)
+		ret = uevent_net_broadcast(ue_sk->sk, skb, extack);
+	else
+		ret = -ENODEV;
 
 	return ret;
 }
@@ -794,9 +806,8 @@ static int uevent_net_init(struct net *net)
 
 	/* Restrict uevents to initial user namespace. */
 	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+		guard(mutex)(&uevent_sock_mutex);
 		list_add_tail(&ue_sk->list, &uevent_sock_list);
-		mutex_unlock(&uevent_sock_mutex);
 	}
 
 	return 0;
@@ -804,12 +815,13 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
-		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
+	scoped_guard(mutex, &uevent_sock_mutex) {
+		ue_sk = net->uevent_sock;
+		net->uevent_sock = NULL;
+		if (sock_net(ue_sk->sk)->user_ns == &init_user_ns)
+			list_del(&ue_sk->list);
 	}
 
 	netlink_kernel_release(ue_sk->sk);
-- 
2.56.0

