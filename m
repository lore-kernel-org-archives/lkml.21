Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441927;
	b=OOACoE97TEWjjz6C9q9M79o7+DDUT0XeYFkyNb4OzeLtuv9exBrEvUZbnCVchOD0XmEP
	 Gn/dGjZAiYcuQk2P1XJPXbpbm4ITF1ma4dvQM7+OlUOcIq5zTZ8Y6s8cf2jyIVdUG95Mf
	 i99lk3ftKqNiAuuFXRcK+y7vPdZEnu3fONHzEFVco8SBG9xpt8Ty3GAzi55jZmgfReJko
	 Kg5lk9w+P1511l9+0do6q8BITS8j2MqjOT0HIFQNU0U3VepbOhxtNNKK7dx1TtQHeNXme
	 3ftYiYALBdbFg1JdisHoGwd1VT5vcEXYM6vdpMrw0bwQpzY2rB3aBcd8SpxxeoJyZdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RrTUeuiSWYSLVvE8ZZ1kOMd1tWwePjn1AWC0+hhhsyU=;
	b=p1cFGKqkpWj4r0dB19im9F3cVd8z7tY9bQoHpDyZoedbiPgjFHG6JLFatI8zEa3OBwfY
	 q8IbMmUZ4m2agvjvKGdRfOvWT6B464Oaw1Oh0CDYsc9dUw5jhTogmh6gjHoRKDQiKtuPH
	 0OXGLdTjOrHLoAA9tZCDan06OePBGNGgcd3X36nfC0K0xjBNlsRqRiTT2Jum7iafXY0do
	 n1vKxu63mHeywN3lx9hGSJ3ZZslSmanZ7lUjtG5HoOb9sh4bmkKi+IJ0iCFZ/MfmRb/EG
	 6+x0O+Cia0rVWH+SrSdYLfHUn3102HoC941MVco020vF9Im+vtXe7VavIPpNfunZGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=gurPkCLo;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FA606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65FA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=gurPkCLo
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb61185057so21447555e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795441925; x=1796046725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrTUeuiSWYSLVvE8ZZ1kOMd1tWwePjn1AWC0+hhhsyU=;
        b=gurPkCLoehZH7iUCBFNkG3P9wnxD+3Nxe6Gpzqr4JBQO3c+182MWLQN/fQcIllPgna
         l1hj57p0dSsXgnWklkJr68BcPvPU6HWqDnhdVx22301PoReThkYWpGPhsqHr7PRWKX3C
         kNtTk9k+49fEQ63IZCsRXLQPv2RzUt8LaBc2Ag3NYiBP+rscOFPVHi807kkn5f25Ty8h
         VzJk+rPIHcxm1TXdgsdXsFLcahWRd60LJWBg8gkrpDhxcgW0/kmo2WX8FFEEO/aI3O2c
         b4Usc22Y8JUnOjcbuwnHkZBqPKo2EEt3+juMPvZQHhYzyjlerXYtwWH07D7Xzh++WyAQ
         0jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441925; x=1796046725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrTUeuiSWYSLVvE8ZZ1kOMd1tWwePjn1AWC0+hhhsyU=;
        b=MbAXNo8FSd4tqNA7pIjS/PQ3XbrEOAR4i/n3GXdQgS3gXCTKTF2xKCZw3NZwCAjTEL
         ED2e0IX9t9SNd1tbZK916ObjJ6wsngroJSNwbFksVtKm1Ol4R2zw7rj7okZc/08wx7Bd
         tqBrcSBjofQxGc+A4ibi+Jf+GJpAdHpzyCfCxmLBx2aX9cpHY6XfDXJYy8z1vtZD+nqL
         piu5rgL5iIRRllMDCwYvNUWrIMBawE1oNJv7Hk+sjXDuBgdt2Bm/cDxUP3QJUVRS3iMe
         XBCHKdP/FL4k2WL9eCCn1ztQCaGt7s9sUJyoY9Zm2A/fQuiuLzzy7pADpWpfbL666DqC
         aRgg==
X-Forwarded-Encrypted: i=1; AL+hErFZMAxmGjLi99uR89cOvPG/rz6XZTmcEn42JNQWOeOcsGxuKt287iheg2w5gUPELb1onmVmX7X3dQGjn5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BT5Mu1DPFYJNrL0U5fHO5sFvqXqSDp+EWHXEYMhFP0zjEd3mo
	osS8dy9+zKGc/ldLR3sam1Qru+NyywPoyMf2sP5qW8uV1HLmBQ0EwY9F6Yr0fkbjl1U=
X-Gm-Gg: AZFdTZfY4vDI9L/KxOKA4do8/LdVOp0sKiATvrUx1G0MNIQXAmLDIGk7eVE0qtKeUoo
	+rxmir/I3EWYH3xXB689304WM/hOKL3nMPk9ySnBBjus9bBzBRp3rHhckOC7jPk+VcATuPoL2t9
	5kWWxRntVraEh35yj1m1qdlX2XFzUEEki68aiAm15kE95KEN+/smI6hsqDEFzWz8jlyje6ml8Uf
	NlnHysfPXo6caGWol/41Y75mMbMvNaLxbGuOy8MFySkt7Tpf5XZI3i40ee4FBjhqn3U5FqKPFQI
	rjdAkhAs6TCdK3Pt/coBJRMgKqfpWov85mmrjEzi92Yxy81JQPMCEpWYX+PywajuOFgUl06w2iD
	izZeXxBJdIFLXaIQJSR4fuozs1wkQviNfZGOYylF0J8pwkiplDpbRBfx/XfjJSZvZao69HIDamP
	4qVi7nx5mrhpAexASI63iv9t6S0bzk+4YrK7gsrf/3ywNkoazanspq3CS1deNx9TvRx/XrreOh5
	6KD0YxCV7exDEc2YMpu+J6GkEL7fgEcXcFQtVGAYxKrhddNfrUXc6viHG0VdKa7L+AeSDe1R7Wg
	vFSyA37jWorQiBy7G24MH8Gh3s03dUkLeeY70SgUwaNevRAMaeFn7zO4WTM+IR6b97Or9DNeyTb
	EfDdggx8JfIqx0HhCOiLzIM8UX6N5FA==
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr214460955e9.32.1795441924994;
        Mon, 23 Nov 2026 05:52:04 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f1b7800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1b:7800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm169279215e9.5.2026.11.23.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:04 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v4 1/5] include/linux/rculist_nulls: add hlist_nulls_add_behind_last_rcu()
Date: Mon, 23 Nov 2026 14:51:56 +0100
Message-ID: <20261123135200.4086519-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135200.4086519-1-max.kellermann@ionos.com>
References: <20261123135200.4086519-1-max.kellermann@ionos.com>
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

Move some code from hlist_nulls_add_tail_rcu() to the new function
hlist_nulls_add_behind_last_rcu() for callers that already know the last
node of an `hlist_nulls` list, to allow constant-time appends.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 include/linux/rculist_nulls.h | 36 +++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
index a97c3bcb1656..ffbf5ed4ff19 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -115,6 +115,33 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
 		WRITE_ONCE(first->pprev, &n->next);
 }
 
+/**
+ * hlist_nulls_add_behind_last_rcu - append after the last list entry
+ * @n: the new element to add to the hash list.
+ * @last: the last element in the list.
+ *
+ * Adds the specified element after @last while permitting racing RCU
+ * traversals.  @last must be the last list entry, with its next
+ * pointer holding the terminating nulls marker.
+ *
+ * The caller must take whatever precautions are necessary
+ * (such as holding appropriate locks) to avoid racing
+ * with another list-mutation primitive, such as hlist_nulls_add_head_rcu()
+ * or hlist_nulls_del_rcu(), running on this same list.
+ * However, it is perfectly legal to run concurrently with
+ * the _rcu list-traversal primitives, such as
+ * hlist_nulls_for_each_entry_rcu(), used to prevent memory-consistency
+ * problems on Alpha CPUs.  Regardless of the type of CPU, the
+ * list-traversal primitive must be guarded by rcu_read_lock().
+ */
+static inline void hlist_nulls_add_behind_last_rcu(struct hlist_nulls_node *n,
+						   struct hlist_nulls_node *last)
+{
+	WRITE_ONCE(n->next, last->next);
+	WRITE_ONCE(n->pprev, &last->next);
+	rcu_assign_pointer(hlist_nulls_next_rcu(last), n);
+}
+
 /**
  * hlist_nulls_add_tail_rcu
  * @n: the element to add to the hash list.
@@ -143,13 +170,10 @@ static inline void hlist_nulls_add_tail_rcu(struct hlist_nulls_node *n,
 	for (i = h->first; !is_a_nulls(i); i = i->next)
 		last = i;
 
-	if (last) {
-		WRITE_ONCE(n->next, last->next);
-		WRITE_ONCE(n->pprev, &last->next);
-		rcu_assign_pointer(hlist_nulls_next_rcu(last), n);
-	} else {
+	if (last)
+		hlist_nulls_add_behind_last_rcu(n, last);
+	else
 		hlist_nulls_add_head_rcu(n, h);
-	}
 }
 
 /* after that hlist_nulls_del will work */
-- 
2.53.0

