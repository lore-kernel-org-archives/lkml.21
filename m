Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143380;
	b=QOuQrwmvMwrMoZeIprOFg4Nd/xCiMfruHSpCd+TkK9JQ1HeMKFhHY3g41iMsL5f6Sru5
	 kHOmxhsLMPe1iwB+Z73NPue0qZH5RqZslwwEY2qR0FPEeqQpIYlkc5T1qXzS8nsdOEo1J
	 8FeDBf8vrbwLlbRBsuur4ZjuEhGo8HUN7fWiPCq+al7Xlb4xkO2P2PKcMHAN5/PabD6Op
	 2kYbn5lyxb/JVX9LLh5B/JV03LYYMDXI1hyXdRh/s/WwblVcYkklD/sgfQm3ObxxIgalW
	 GWwFsl39HGFZLe3fct5T2OqIPbfRVWsRmiCFMh0exvrTYOgigwVu6ieLxEW9aZCjN7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m0665dM5wdxWb5+F+h/RK/x+cnUT7B3ca11RjcWX5hs=;
	b=SHRFaPGDw2bDZUD+IJtnfL+G8WwwdhpPIMGInRfMl8nlXezuUfalEhJzzCVNQA8qUE6v
	 uskQYC+7jQpSDESyAPEKMOpD0Hti5TkW0LhpdmJ7e4p7/ZEm/f4xU0HIevVtiQyJJwimf
	 IcY2NVtgGnfEl9M9lKnIbsqzMC71ew3AvPe9I98c/gCV8UwsUOJmGqJA15kyCgZNMaWZJ
	 YWsT/XHBdPKQp3lSYwjXin7fSAB3BfL5U+Ak5f3Ad9HSA2968QZBNF0s/8RHRERB+8EuQ
	 WfS40H3W6rQWfNZM9ZsyZFQkEHr+4vp+OpvpsPgVS02xxDQWekpP7dGdox9dCzMQFMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mXsc1Ips;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFBB60A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFBB60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mXsc1Ips
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso852482a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143379; x=1795748179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0665dM5wdxWb5+F+h/RK/x+cnUT7B3ca11RjcWX5hs=;
        b=mXsc1Ipsc271cFgv+5H5jLsxt+xovQR8Orl9yL7q4tGbpMf8yDTxNrwFz8NTy8TSw5
         31mrr+nMNhpJoO5vCm+/duya12pFsX7rfk7F2uT+hiR1XfagyBEZkT6GlUXco7iplWtz
         CXFazb/8AbwJwWj/zmwQUPpWswMkxH1R9b3hwNvsnTd6aGwePoSYEZvkOCyA7Jaa1+3u
         ygDf7kzpv0iFxwnTHGaO37/Ha6HdZ0UDgVkiQAzsDhRl+1dTL4O1wwVh/0DdZHW686DN
         /s718p8Zxv2WCT3ojqVSk/gOjsTEVlNs79CeQn4oCqj+c9J6EMz/r7SnWmnuDszEFsc/
         TOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143379; x=1795748179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0665dM5wdxWb5+F+h/RK/x+cnUT7B3ca11RjcWX5hs=;
        b=Gbg2oW69agfcKpn8Wk/JgiJ0NO/KDe2JNrSYog0CsI0UEKdbOWENdq1y4zY2f/MLS+
         hcUdR+gl7D9o5mqnQUGWdF7sCBk5BOFGYRUQ8c5LwH58RYUGehSPIZuJ3EMeZdarse7h
         q5gFkRYPjD1ZKT5WxITpmcKJ0dyPWXWLg5TwibwqE606SluZrtl03qRolUB0nb6nx/pn
         c5TUj5ixdOn7lvly+MY4ocEMOKwe1Nj/xntCS2rbUbrf08AynP4RVTXoRCkVS/rc0cFn
         AoYF0W9JWKF/UgBJ7rk25RimkWGZxFFqD0ods/5a0Hx92/iuZV7cP5j5Pw2NqLDvW1pO
         w4aw==
X-Forwarded-Encrypted: i=1; AL+hErE7lMwjRmA00GfFWMP2Jdx3mPE4gLfpNsvooRX3Uw4gCaV9YM2Fb6DDkHr5KtLLy29f3Ro5u2Cnse7BxpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sua7m42aFq5mtmi2PZ9M2vs9FnJ0oMwPVYkmN1i0lIPRWd6Mu
	/SbmexqVoEQSSfYHebfHGRqQ0AzkJlQ+ujEfOfzWUvBcZx7+CYVaPF0c/jsDhwxFXrlcx7tdeJD
	LWkWBw7Z8tADwuI0oU0Yr605x0Jcz2bdo6NZKp71FiSUL53UJUjgITcn2OJ0=
X-Gm-Gg: AZFdTZcDSb/oO5Okqw9L04ixU0zCgszs7+K+meOZSr8EIWe8ZO+ZHATyvjScthNSLUg
	+JKig5nzn4XwuJe/psV6mWzlkBWd/1sIG6ej53/42NLLUXi2X7/zFPN/st/5yKlU4HpGj8Ug79q
	p48xzB/m9VmULnAlYxMK1o0qojqbij+BL/7GTS9ndV9/BNW8715hGJ7pYZWdKMtmWKGZgna4Fxg
	++9oMeSmSoB09I9uA+6wNICkey6EZAD65xNmRq4le4/rRB5HOO8LaIOS3CM11hkr2irOoNFf+Ds
	72XBiGR08OyJNlMnodlqnQyfTeojpB6OT14J1vYOMecL3bz8dCqBK5jqVQ98FxCozUmmnnHuyDw
	ZVbGhCEIXN/yz9UwnsHjy8AKBCpyHhxpW4eiMGuwDeJ1T87YqryFrn/i6/i905cc1fzRfhBK+PA
	hFvEu8cDA7dosfKCoIIJqdj0UreJxERdNpHVqHGWNlOH72Yr5O5fAoAiowyAp6u5ZybPPgAYdoJ
	ZlHS+geN6vqGbkREQzBZ7vvlXLwQTWcKEUgLbx682fLxnCzmvmJF+OHpW+mtGnMnvy9HsxZTE/w
	71OnLw2xgdrLYZPx/qeUoeJkI4Ea+EBthTgw+UuTh6NmH/JlfMyPC9Q692w=
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr876896a91.1.1795143379124;
        Thu, 19 Nov 2026 18:56:19 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5546461a91.8.2026.11.19.18.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:56:18 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v2 3/5] block: add helpers to link tag set debugfs to controllers
Date: Fri, 20 Nov 2026 10:56:02 +0800
Message-ID: <d943e20493c4fd50fee90575645a1f18a81450f4.1795143228.git.lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795143228.git.lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com> <cover.1795143228.git.lei.chen@smartx.com>
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

A tag set's debugfs directory identifies its attached request queues,
but does not identify the controller that owns it. Drivers with an
existing controller debugfs directory can expose this relationship
without duplicating the controller's debug information.

Add blk_mq_tagset_debugfs_link_controller() and
blk_mq_tagset_debugfs_unlink_controller() for drivers to manage a
controller symlink in the tag set directory. Build a relative target
from the controller dentry so the link stays within debugfs and does
not depend on the mount point.

Serialize link updates with tag set debugfs registration and removal,
and use the existing NOIO scope for allocations. Callers must keep both
objects alive and remove the link before deleting the controller
directory. Provide stubs when CONFIG_BLK_DEBUG_FS is disabled.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 block/blk-mq-debugfs.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/blk-mq.h | 16 +++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 72634277e088..1a1364a34c0a 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -7,6 +7,7 @@
 #include <linux/blkdev.h>
 #include <linux/build_bug.h>
 #include <linux/debugfs.h>
+#include <linux/dcache.h>
 #include <linux/idr.h>
 
 #include "blk.h"
@@ -860,6 +861,59 @@ static void blk_mq_tagset_debugfs_unlock(unsigned int memflags)
 	memalloc_noio_restore(memflags);
 }
 
+/**
+ * blk_mq_tagset_debugfs_link_controller - link a tag set to its controller
+ * @set: allocated tag set
+ * @controller: controller debugfs directory
+ *
+ * The caller must keep both objects alive during this call and remove the
+ * link before deleting the controller directory. No dentry reference is kept.
+ */
+void blk_mq_tagset_debugfs_link_controller(struct blk_mq_tag_set *set,
+						struct dentry *controller)
+{
+	unsigned int memflags;
+	char *buf, *path, *target;
+
+	if (IS_ERR(controller))
+		return;
+
+	memflags = blk_mq_tagset_debugfs_lock();
+	if (IS_ERR_OR_NULL(set->debugfs_dir))
+		goto out_unlock;
+
+	buf = kmalloc(PATH_MAX, GFP_KERNEL);
+	if (!buf)
+		goto out_unlock;
+	path = dentry_path_raw(controller, buf, PATH_MAX);
+	if (IS_ERR(path))
+		goto out_free;
+
+	/* The tag set lives two levels below the debugfs root. */
+	target = kasprintf(GFP_KERNEL, "../..%s", path);
+	if (!target)
+		goto out_free;
+	debugfs_lookup_and_remove("controller", set->debugfs_dir);
+	debugfs_create_symlink("controller", set->debugfs_dir, target);
+	kfree(target);
+out_free:
+	kfree(buf);
+out_unlock:
+	blk_mq_tagset_debugfs_unlock(memflags);
+}
+EXPORT_SYMBOL_GPL(blk_mq_tagset_debugfs_link_controller);
+
+void blk_mq_tagset_debugfs_unlink_controller(struct blk_mq_tag_set *set)
+{
+	unsigned int memflags;
+
+	memflags = blk_mq_tagset_debugfs_lock();
+	if (!IS_ERR_OR_NULL(set->debugfs_dir))
+		debugfs_lookup_and_remove("controller", set->debugfs_dir);
+	blk_mq_tagset_debugfs_unlock(memflags);
+}
+EXPORT_SYMBOL_GPL(blk_mq_tagset_debugfs_unlink_controller);
+
 #define BLK_MQ_F_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
 static const char *const tagset_flag_name[] = {
 	BLK_MQ_F_NAME(TAG_QUEUE_SHARED),
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 882ed11e7c2b..d98ec1dc1130 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -564,6 +564,22 @@ struct blk_mq_tag_set {
 #endif
 };
 
+#ifdef CONFIG_BLK_DEBUG_FS
+void blk_mq_tagset_debugfs_link_controller(struct blk_mq_tag_set *set,
+						struct dentry *controller);
+void blk_mq_tagset_debugfs_unlink_controller(struct blk_mq_tag_set *set);
+#else
+static inline void blk_mq_tagset_debugfs_link_controller(
+		struct blk_mq_tag_set *set, struct dentry *controller)
+{
+}
+
+static inline void
+blk_mq_tagset_debugfs_unlink_controller(struct blk_mq_tag_set *set)
+{
+}
+#endif
+
 /**
  * struct blk_mq_queue_data - Data about a request inserted in a queue
  *
-- 
2.43.0

