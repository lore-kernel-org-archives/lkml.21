Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632031;
	b=04rSTxvpZNwAhO2aj2Zl3AOS+cih2VbIsZ2mF4PdzfqY5oWnQNX9AiwAHp/cBpqd+8g0
	 m9QpklAXN2DN4BPyjJJpeJ1vcpTBFiGmFSGDytodXFq/K7vJRcAgA+aR4QNNnIt9TPHtt
	 aPsVat/64aIZv9QYqGrKs2d4xEE94GMDGGNO2lEmGhSWIV4CC99+4f9HNZ7fk84bqqfsW
	 PeZdpDA1voExqRkqb3w2tGzX79ehJcG4TubW5okAg9OzR5iKZPc0G9HRfhGU6Zp1a4s/m
	 B8y/wblD/7QJ9T9lfOieTdjDRRCPBPKV25AXf09pXgMXqvGblcfMRVtc8qfxKsZkD3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eFpNfukvpRxA9ZSwbqvjegicm52kayQGu2t0jHfEpps=;
	b=Eob6RBSrb0XZW7loyaCxRNArzLUNGe+qQjtoUXaPva3Wcb4x0sUFKo5ChAI8aQc9xeCA
	 yqVLndMLfa+JQVl1WmRX7+OmsRTaeC4a7gvV0ZSvUe4nzdytJ7ZAKfmPByJtd14b+wofx
	 ykUoFu4hbq1vXFE1FspthB45sGFHZcWyBHRUropCGVmuFs6bAnTJ0FT/NTDOS3niC8y7C
	 SZWk5fnE9CLl/4o7gbhBS5wFrtsdQSu/W4jcWN48p8pOQvYYru2ze7NdiElpRhUEH37ky
	 fsjyaPbeXYK13HTxKVL4iSuqGNge19Adxk/vlXdqzG8gTXV/ecdre/NJkX5fmCNG/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niXPV2SW;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78038606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78038606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niXPV2SW
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3863db981d4so8611500eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632030; x=1796236830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFpNfukvpRxA9ZSwbqvjegicm52kayQGu2t0jHfEpps=;
        b=niXPV2SWbN2ZyIEZcaIIsSMrAHiorSnrf6Z5bc3szs6AMgtrgkbV7KJCEZ6f94aTZv
         Lc/6MuQYcGd/AJTcWz/VdgmgZtDV8CFOwHG11V1GKfZIhHN4DQVhUPK9BBRxPLI6RVuA
         Z5pOUzWP2cuXVTel+8qnjc7lqDybkBDX7h0TyrcImOM7zlYc6HCtrWm1eP5dS3Tr9pRJ
         X+jnLGw/847yhr6m4QBCB3fB7RUtKpQ+SuqYomB8jAW717jL5LE7sjpOMhjkslbJZA6I
         OpvYmKEwuDyPa2g6uc1MVedVTGiggdkGkmg4xKQEx7XUeoe2oJz6psClyyHx1aJipCOE
         /4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632030; x=1796236830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFpNfukvpRxA9ZSwbqvjegicm52kayQGu2t0jHfEpps=;
        b=11KLRRe+vSR95osF11lRxhG3Ql8fWPDEx35CdZSq+9wTKv0LYG5O9m9H37RHt+q3fT
         YE1kiT9235Sa2xC4OJjY0wSi5q5zqef25OE3LEHFsWeSJa0qIjq1ecEQL1UTlU+37G5k
         JJJK1k0erRSTiKT1S0n5VFpzh8sbB5KcMl/b8So/QipUAw695lLOAvqPB5y3yUyKj+ZJ
         oX6vYP6+OmO/I6Em4Pj97POeIfgeyd70gWDDMr7/zpwwzJdnN1lg9kMDw1Znk9aU+m9H
         TnM51SWLmyhMgTNeNzYMzyA/9vjxVE9hUEwK1cVFqwkgriMSe1LPEWDKwwHnXD0CLJey
         oCww==
X-Forwarded-Encrypted: i=1; AL+hErFYrlYADX8/GXmMEXmKMNg7n8Qu1dQw92GC7s6DPAa5ROeJNFmrhCiszj4o+81+u7rMFnzVPemGpciFShI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gR73H4c51g2HOiqDcRreIw9cGONUwTCMxSX5NUnsPmnFhJkTG
	DDKOx7qbsLQhiOTyEWOKQPuOQtuOPay2TGse1Vwru598OAAuns9swGuk
X-Gm-Gg: AZFdTZeiHpx5yBYR4zVHCITFhlpEZhpkcnQPcWbTx72XamM8otOEo+sm8G7DdbIYDyO
	pQjd57HAv0bn8MjFK/zuy9OrLwF1whTgjsWvrA5o4jp8RRyRVMyMwMnBrGYi1sixNCWzZoCzSGU
	sLexfEsEmcb1JFwaUZ2QhC2Z5GEvYbiqMCtv10UHWdr2UTqjE5qWWh3laMR6ELEV1R8jQnGWRbt
	GIXEE4qRe5Sn32tovTIv3/4A10giiIFBIVOYnpUYOnusiNWUb7glL3H7gfi7bMsL40C21q0Lv3o
	hl4iwPou4vgoCmjfGevqbMNPnwELMQsBzsoIh9B+fH5ZCgp7h2yQbgtF5eUEV1c395RcnnAKgVP
	+wOC2139USCaE4DVPqydcqkVjFuTrB9xLdaw62B5L9IwEUgKH7YcdcxoLChSp8puxiap0vmRHcz
	GqBAvtF5mlMv+U0KYH4dUwJoEtGH39aS/vs4Czt/RYxOhnmNTamZG7mbuerBNkx6cLQMzIilgFF
	aljaf07qHytymG9A/1lkBIXpkZANzVDT5YrH/MbELPWU/yfw44LY5GmMUOy+7hefl+NKNaA9Z/s
	GZiMeNCmuIjQOiWKJ474GQ==
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr1376516eec.2.1795632030315;
        Wed, 25 Nov 2026 10:40:30 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm57393496eec.6.2026.11.25.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:40:29 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Jan Kara <jack@suse.cz>
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] jbd2: Document the h_invalid flag of a handle
Date: Wed, 25 Nov 2026 18:40:27 +0000
Message-ID: <20261125184027.2402549-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

struct jbd2_journal_handle has an h_invalid bit: ext4 sets it when it
has given up on the handle, and __ext4_journal_stop() BUG_ONs when the
bit is clear.  The kernel-doc comment lists the other three flags and
not this one, so kernel-doc reports the member twice:

  Warning: include/linux/jbd2.h:523 struct member 'h_invalid' not
  described in 'jbd2_journal_handle'

Add the line next to h_aborted.

Verification: kernel-doc -none include/linux/jbd2.h prints that warning
twice before the change and nothing after it.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/linux/jbd2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index e3886963ba00..361aa5dbe395 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -482,6 +482,7 @@ struct jbd2_revoke_table_s;
  * @h_sync: Flag for sync-on-close.
  * @h_reserved: Flag for handle for reserved credits.
  * @h_aborted: Flag indicating fatal error on handle.
+ * @h_invalid: Flag indicating the handle must not be used any more.
  * @h_type: For handle statistics.
  * @h_line_no: For handle statistics.
  * @h_start_jiffies: Handle Start time.

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

