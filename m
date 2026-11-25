Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587331;
	b=grW2YNbjh+7bdvF3c7eVMWg5kfA9px4YsvdSQbntsOGXZZkOgQo6YSLsPbKiBEJTwBbc
	 223eE6ogdepvTpz0oTM9PLfeD77TRaBoqpRiOrOQSlHO2IB8tIXD0NeONjt7JCdEbcDJw
	 hr+WyxdzemFplmxnr61Vng+ALj4QF18Q/DWoniWcWa59y10e4boC26bXlWenjCYn8SIvz
	 K18OJOSdZJ9cu+CH7geChhl2OwziOwHpf9G4RuQOWSc78moZPYqSP7RToeQvrirU3MXl3
	 hjCf17hT8xTTHpu+XCDcM0wywlAxXew7f7NI2R7NX0HCEvgcuoQqQq+GkjZoQ8Ud+pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GJn83fHmEkvzSXvNUuSjTxCL7XacZsUzXMIbSueFZFs=;
	b=aZP3xAd7Y58s6cp5Qq9fm6AQrOrOaYSb0FPl+G9K8XRoD1oVwfi8dUoRKdjBTfQNI98Y
	 /3LGejOLblOTJnqjS064VsLwzvDaFjVDkT1qAyevTVnqYCrGKKh0XGxsaWayn2vcMPK2l
	 irXUJCZhGF5TdaLBcW7s+Nwj9p1c5QDnMdVaA4NKExs4LhZPB499li1Msn0e0CGOFgM0h
	 obwC/IXBSfbTfWGPKmAmz/T+3v7obE7uH1ZwVuSfb58N9GYlsFsKkB0rnR59FJposAUAK
	 OuVSJLSO3cs/Wj12yNRenO8N0qnYI0+d+UGNlQfLF+13ZWevp/CBvVI+P2SDCLNHC3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJix26Z6;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDA606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DDA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJix26Z6
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11569224eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795587330; x=1796192130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJn83fHmEkvzSXvNUuSjTxCL7XacZsUzXMIbSueFZFs=;
        b=sJix26Z6RdKbXj8A8vRWfBLIuMXUz83gkb/NHg92h6mmK2S4sZOXchu81GCTz2Hd9+
         fP7yRdSwASlMK9LywOWVzSwjkYIvG7Wk7BuQLpGsAWUg9ZsdknWLJ1B67hlsmRMa+Ty9
         7W5NLf6E+bmz2EREgEi8hz49F0QdQMuSvscE+I8tQyPA2YRzu/A5SbOKd4Mme2pnHEhS
         H3IiKG6GSGmkVC//zMEx1HUZ2rAPHArp4oPuwsiwgOU9HN1hHszLUlutv3fAzQO13VqH
         yl+Jr/imMU4CjPXi3Zu5qrRB6aV6VMGmgs5zHCweiYt7GKf/dOftSsAC6TDQYxLfLdLn
         s+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587330; x=1796192130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJn83fHmEkvzSXvNUuSjTxCL7XacZsUzXMIbSueFZFs=;
        b=nzsyaESOiLTGyjyyWw4iXg+fqo+hWIXQFAjzoVscD+au28/K6NRp2D33x7yFdI4ovU
         Y9axij1UrGYKcDITZ1iQeRaFJqS3nw1YCerN4+5GWdr2AYH/ZMf6Jh6uecpn129kefcL
         LK0P1gve4pnHJzUpPDy0O0BEN+o03TINBgqrCimKW17DNP7+Ctm1CaghxpvBx3GXcGbY
         80l2VVegbzM73xrnuevAi8MsGejp71qwnSvr94FC5EzE2DOyjG9buFLkUIun/esfNLfp
         0RhynCWr1h8jP9nFlZY5ICE1oEZE+Xp1BEtwjM8CfTC4WoqbndTKPMfXDZWJ2Zf/CbFo
         HSUA==
X-Forwarded-Encrypted: i=1; AL+hErF977sVKzLlXX3fbgfsjOdDd/6PlJFKeYjeweAxPw8RQlmqKjSYY2vALChVW6QV0iAMp5YiUO1BO2Z2DhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z92fmTOVyxQ8uc+L9ypbk2eg8avPCC7yg/XPu9SzEUtP+cgusXP
	DAn2jms0yiCmwrNr7Cvn2iyJ+recqqBM3Lt9D4R7m37IXoP8W2xRCFJ5
X-Gm-Gg: AZFdTZczENlw3jL3AuJCZ4UItMK3PRclQM4URf+ZtMp9+7qZFgjziDaWkTkw2RCu6w7
	OTbHYTvE380jYPjOQE/hlN5IyzZd6sPmE5r6izSsdp1lcoIalQa8O6IcSCie0JeElLoBVPtqBFP
	3dOjlhOFQzrWzo4QcGflj3+lEDWc73NPJHqLZLaN0e8lGKcKMgHCe2yvW+Y6L+oy8nVhrNMyxcs
	K92FNwWa6fcEyYEnYtIy9xTUQwe6gUX3WHJlYmr44dzWTIivJ7hiQ1hq9Jb0ZLBx8ADtPeznKzM
	o+RfcHBCI3/UDyBb3VI3/ggCZ3ykih3Hcbd4+hqgl786xa9X581iYqfLVMA+BTGcc0oOnxNGuTO
	iG2wolInsWbcgRNGY9EWUQDZyI6yiyMA8l52D7aw3egc9RHFEfWH7wrX1zpHipxKWFwESmbfzoe
	g1kaQrWYh/1PcqUDZ1fN0M9JeBWlfALGTyq8ke1WTGPaswzkPV0+6mEIV/dF/eJrG1RoIr/p87t
	JV2VQW6NND1XG550rmD7RbYAAOE2pqhRVOAreVUnwsWoEFxXqteYh0+sy6WhygEcamS4Krs4QsV
	71OtBW8r1dlZJlQeKWGzrJyLA/yUeo3cjZ0+OegXf0ZhKqtLKwDdIXJo0AUx
X-Received: by 2002:a05:7301:4710:b0:378:314:4042 with SMTP id 5a478bee46e88-385702587c5mr16061924eec.14.1795587330274;
        Tue, 24 Nov 2026 22:15:30 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm62468634eec.5.2026.11.24.22.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:15:30 -0800 (PST)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <davidlohr@hp.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH] mm/hugetlb: stop hashing address_space pointers for fault mutexes
Date: Tue, 24 Nov 2026 22:15:21 -0800
Message-Id: <9a97a64f7e7aabc668499c426a2417a77d13a2f4.1795587203.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
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

hugetlb_fault_mutex_hash() uses the address_space pointer and page index
to select an entry in a global mutex table. An unprivileged user can
create a no-reserve HugeTLB memfd with an empty huge page pool, build
contention on one index, and time SIGBUS faults at chosen indices.
Pointer-dependent mutex collisions expose equations that recover the
exact address_space address.

Give each hugetlbfs inode a dedicated random hash seed instead, and hash
the page index with that value. Operations on the same mapping continue
to select the same mutex, while separate mappings retain independent
bucket distributions without encoding an address. The seed is not
relied upon as a secret and is not reused by another hash table.

Fixes: 8382d914ebf7 ("mm, hugetlb: improve page-fault scalability")
Cc: stable@vger.kernel.org
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
 fs/hugetlbfs/inode.c    | 2 ++
 include/linux/hugetlb.h | 1 +
 mm/hugetlb.c            | 9 ++-------
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 558007fa5e88..72a406b97f9e 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -35,6 +35,7 @@
 #include <linux/security.h>
 #include <linux/magic.h>
 #include <linux/migrate.h>
+#include <linux/random.h>
 #include <linux/uio.h>
 
 #include <linux/uaccess.h>
@@ -1182,6 +1183,7 @@ static struct inode *hugetlbfs_alloc_inode(struct super_block *sb)
 		hugetlbfs_inc_free_inodes(sbinfo);
 		return NULL;
 	}
+	p->fault_mutex_hash_seed = get_random_u32();
 	return &p->vfs_inode;
 }
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 58f755e70e96..61d833b7a76c 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -504,6 +504,7 @@ static inline struct hugetlbfs_sb_info *HUGETLBFS_SB(struct super_block *sb)
 struct hugetlbfs_inode_info {
 	struct inode vfs_inode;
 	struct resv_map *resv_map;
+	u32 fault_mutex_hash_seed;
 	unsigned int seals;
 #ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
 	atomic64_t pmd_sharing_count;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ce9c8e57b8e5..6865ff468343 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6091,13 +6091,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 #ifdef CONFIG_SMP
 u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx)
 {
-	unsigned long key[2];
-	u32 hash;
-
-	key[0] = (unsigned long) mapping;
-	key[1] = idx;
-
-	hash = jhash2((u32 *)&key, sizeof(key)/(sizeof(u32)), 0);
+	u32 seed = HUGETLBFS_I(mapping->host)->fault_mutex_hash_seed;
+	u32 hash = jhash2((u32 *)&idx, sizeof(idx) / sizeof(u32), seed);
 
 	return hash & (num_fault_mutexes - 1);
 }
-- 
2.34.1

