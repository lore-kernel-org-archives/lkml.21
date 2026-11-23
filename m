Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443576;
	b=sDa3MCR9/oxtT3r5v/+Ce711Qq4wdVOqIn55oazPKM/9SVy/8cFfi0RqnkqD/6xAo5B/
	 W7c9WBSDc/3nDd/JqCzf3AQYm6v2046VE8Zcx1MK4KVIm3HaCdJC8xhtn0v7qo4kMeMaY
	 65pjdPt1PS79W5MefOSDYNVDeMhVnd9H/l1V8l5qi2R6iA9Ow5zAlFMJlCoeMtkz3GsCh
	 5iF8C3LxomwptVSQ3n1QelGvEmitQ9kJc0gw9MrJ8NnWOQc1O3zFSMRz5RgohD51d4SuC
	 Uszw8yqn8N5Q98rwc169XvCso2SvFYxZONk4RthH6Knd28IErHMhG5p7R4eARALGrdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ftZ9KCAoOVfHj2aG9QGbjRXPabmKfwf/abxcx+jklUw=;
	b=I9BSsK0nqtiL0eLoulnCIi5XTdakPXVptVrhIzum7rfc+DRDOcpMz/JreTdemRUlVVwp
	 +Rxd5wSgRgysTggxZ8PWIu2gzbL2MWiA2iA6bD7THXrqVY5jGfOJevcizTUFIIh2RQtjB
	 BXznQ5SpbxTuhoplRtA4IMcxvulHjYB0/PeIEv84vBinz1YyN29N8lKO99fN4gWlMcdcz
	 /UPDdYU2MZGkznJiH3Hyx19osJPVLCxOMn/YSVG74V1DUCWCytrkkhaMhuTrDiPS4PS2q
	 KKwyZf4bKidUQnjbLWLuBQ+cGzO8Kyj+8/hDjasVIA71D24AIn2ruiq/FD2XnUnAfXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7zoOqzV;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97700606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97700606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7zoOqzV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3863db981d4so4467500eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443575; x=1796048375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftZ9KCAoOVfHj2aG9QGbjRXPabmKfwf/abxcx+jklUw=;
        b=S7zoOqzViDn+yU9dg2xSqiVB1z6BVKr5t/5aI3YySLnbWrAQAimJNsiRJtOwZw8A9X
         un6RP6LT6HCkrArcaTiPEMtJvHhfRpB8etWrOl0byiDSF8DvVMHQHiAi8p18di0wzpNZ
         MSP++IXHXjljw/irrPKHoaHWdYg9va8QD1sc3+SyJ0noPQ5jzc84PYOzcPB9G/T6wnAq
         lEDMzVtWc30/s87xk+cWQVXR9yqxCh2xNSaTqHmFBrSK8d35zDt7QUk6HakdYQBgeNoz
         LAw+gAXAAeuW+69PmvUxUqYdt70kmsIdP3FoxMhv/+xIRlkJMyPvy9ODSwf+vSYHhAKw
         48wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443575; x=1796048375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftZ9KCAoOVfHj2aG9QGbjRXPabmKfwf/abxcx+jklUw=;
        b=aSf5ozngImfS0rw2YjXmj/VqL8hdR9rbWjD5yXg7rh9FuFofHc6/czOA04W6qd96bG
         n4pQ4P9LTgx9aaIeQqiBfoDVENc3TZJLlT+92YXkB9Q4kBC8E2CWGFUx6MGubWT4IKei
         Q7L9GdI2OX22DX2ISK/qkmBhjQ1GFjgDQGSpqscFlpBYSUYBlaNeS1baVDf/5uqbNpMx
         k0BYKT4JLfvQDuefj2k/Et3OSSO1MOED8CIY23V+qj+/+QfLCXuuIdvxqIVWDADg+y+w
         3cIeHxkeC3EeNHCWLgtPdhdMJH7WgMc0Txf6/J2DfxvZfr9mAPAOM/xKl/LcgKw913fQ
         OtyA==
X-Gm-Message-State: APuU4Z89lP6yGuvR8Thm7B+HtVthlBbu6zjHENhWfzBzgdW7vPugjBXE
	jmxnhrpRKTZizR538WOVbKHd0cp0W7YOCaTHxmZs458TBHwfIJHZ439x
X-Gm-Gg: AZFdTZfLwLoLxr14VrSTOm67oO36q2e/o9T12vvmn71Kp6wxW0pPJldXhSCA4cQXdP4
	R+AIqPXP9JBmuiWVRv2zYvRCL7E/SbcYlj0tY93N6YKdBXfSbiBuQ1KUSpvjmfnRwBbhIZfpmg7
	cN2wboGwqcSZhbBMz3Qa7lffy603TeZ0+9rqWs//W5h+dOS9FNkjvdybrW5Vrk+YiKQ3FGz4O6q
	G7d8MUE/0MVdlB77PG83rv6Rq6y+G5gtQHvNPkNyCq7z+4gzZU7Xzy1WbAynrOjir8m5+W1O/Bz
	b1o4ip6gZ8IWOkd7vyfCpwW6HJ5WbKqnYpVxHFPM6ApaD/Vd5Yx42wldd9eZE08+/0Rbs6+tEPo
	ec7CCu7JWnikpS3a/3phre9OUMwGJGUdkBHWSKhpbgzqycNqiJyE603ZKmi1yVp/554IcHEt/ta
	jptTgpEPEnBl53DoFpH2R1+vpHOwIauGgUC3jzxVmdxCWL1WoG+vF3EN+niSp9LY4YVIqeGr3ic
	GoiWJBuim3hNJIie34zsmcIJfKJrJs53dX6csL5OH2zopI9QwkfASMKTytv+avTsQHCOk6dmyqn
	T7roSaXZ0WpTGU9L6uduudDZmEe44NgdC2+vuPMLZ/+Hztt1Y1qu6sHJdmrXuQjo2XU4
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr17567764eec.38.1795443574544;
        Mon, 23 Nov 2026 06:19:34 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm30652112eec.25.2026.11.23.06.19.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:19:34 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 15/19] lib/plist.c: remove requeue function
Date: Mon, 23 Nov 2026 22:19:23 +0800
Message-ID: <939710bc5e908b4e30d86aecacfca0524ef11d6e.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Now the last user of plist requeue is gone, this function can be
removed.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/plist.h |  2 --
 lib/plist.c           | 71 -------------------------------------------
 2 files changed, 73 deletions(-)

diff --git a/include/linux/plist.h b/include/linux/plist.h
index 16cf4355b5c1..73d359c1a053 100644
--- a/include/linux/plist.h
+++ b/include/linux/plist.h
@@ -132,8 +132,6 @@ static inline void plist_node_init(struct plist_node *node, int prio)
 extern void plist_add(struct plist_node *node, struct plist_head *head);
 extern void plist_del(struct plist_node *node, struct plist_head *head);
 
-extern void plist_requeue(struct plist_node *node, struct plist_head *head);
-
 /**
  * plist_for_each - iterate over the plist
  * @pos:	the type * to use as a loop counter
diff --git a/lib/plist.c b/lib/plist.c
index b0273533c04d..b05ae7ffea87 100644
--- a/lib/plist.c
+++ b/lib/plist.c
@@ -142,65 +142,6 @@ void plist_del(struct plist_node *node, struct plist_head *head)
 	plist_check_head(head);
 }
 
-/**
- * plist_requeue - Requeue @node at end of same-prio entries.
- *
- * This is essentially an optimized plist_del() followed by
- * plist_add().  It moves an entry already in the plist to
- * after any other same-priority entries.
- *
- * @node:	&struct plist_node pointer - entry to be moved
- * @head:	&struct plist_head pointer - list head
- */
-void plist_requeue(struct plist_node *node, struct plist_head *head)
-{
-	struct plist_node *iter;
-	struct list_head *node_next = &head->node_list;
-
-	plist_check_head(head);
-	BUG_ON(plist_head_empty(head));
-	BUG_ON(plist_node_empty(node));
-
-	if (node == plist_last(head))
-		return;
-
-	iter = plist_next(node);
-
-	if (node->prio != iter->prio)
-		return;
-
-	plist_del(node, head);
-
-	/*
-	 * After plist_del(), iter is the replacement of the node.  If the node
-	 * was on prio_list, take shortcut to find node_next instead of looping.
-	 *
-	 * prio_list is a headless ring, so from the LAST bucket ->next wraps
-	 * round to the first one; in that case node_next is the list head.
-	 */
-	if (!list_empty(&iter->prio_list)) {
-		struct plist_node *first = plist_first(head);
-
-		if (iter->prio_list.next == &first->prio_list)
-			goto queue;
-		iter = list_entry(iter->prio_list.next, struct plist_node,
-				  prio_list);
-		node_next = &iter->node_list;
-		goto queue;
-	}
-
-	plist_for_each_continue(iter, head) {
-		if (node->prio != iter->prio) {
-			node_next = &iter->node_list;
-			break;
-		}
-	}
-queue:
-	list_add_tail(&node->node_list, node_next);
-
-	plist_check_head(head);
-}
-
 #ifdef CONFIG_DEBUG_PLIST
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
@@ -238,14 +179,6 @@ static void __init plist_test_check(int nr_expect)
 	BUG_ON(prio_pos->prio_list.next != &first->prio_list);
 }
 
-static void __init plist_test_requeue(struct plist_node *node)
-{
-	plist_requeue(node, &test_head);
-
-	if (node != plist_last(&test_head))
-		BUG_ON(node->prio == plist_next(node)->prio);
-}
-
 static int  __init plist_test(void)
 {
 	int nr_expect = 0, i, loop;
@@ -269,10 +202,6 @@ static int  __init plist_test(void)
 			nr_expect--;
 		}
 		plist_test_check(nr_expect);
-		if (!plist_node_empty(test_node + i)) {
-			plist_test_requeue(test_node + i);
-			plist_test_check(nr_expect);
-		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(test_node); i++) {
