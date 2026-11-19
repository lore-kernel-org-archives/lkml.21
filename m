Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131681;
	b=efyuEhkpH82i5cNQaiGe6tZsC4rBStRdj/m0ydoRGHU+mVILsHgILHuJZfM4y9rKQpW+
	 UgDf/MG5zl1P2u9QgFh3aWYQFRCW46t5J5DPRNSMYxtjbajfZeZjvAui1hNArOvD+nF23
	 QNIdYnyKTi9E7wYu4P4O6oHXJKgoEM2kQBCyhRLu1SExi3BH/nLSJUg1OCSo2VImiQx9j
	 xRdnZyw3cQqNED4p40ArV1QGobhdbNjUOEdlHyg4HAcq+s6eA3ihV3v7Knxhoo7Vhp+Rn
	 kNq9Be0YxGaFWEMWbiuPt/OnIi4QN9AyBhej79r0BJaZRH9j/oS0n0aNU3Rl833UGWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dGAIBXcxAo4ug92wkzcGwRrGYDjRYNfW8cF+/h8C8jE=;
	b=rD8taqgwPRhqfbVj6sruYovoQQpQvl8xoSZr0OEkh3PpLh4C1Z62fUAYUcBY4mCJenov
	 LL3w90lGG3jsRW6+h72duZu7+MfNGJJMLoZQVBzdend+E7pu9NtE7VZQHLgp9EGz0fEbw
	 31D9Z3cQ6fdHcucyn5uNykkL3irjIK5shmSZJpE+bhyVlflALfgGtUsdCvQAH6dctsN+p
	 3KzZx4tbw2MNRK+xGs9H3RrZVDnc6rmBx3j5W96qZJG2WuBOVmRnoiydmDxSYgTIu89s6
	 UGrTtD7sg3dxu5cAWqWB+uOkNTeq6+BcXkmpGobNn6Vn+Oir9lGL5ve/0qHqaQvpsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fApaNGWO;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B260A2624
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034B260A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fApaNGWO
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67990a45e02so456164d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795131680; x=1795736480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGAIBXcxAo4ug92wkzcGwRrGYDjRYNfW8cF+/h8C8jE=;
        b=fApaNGWOhpxJ2op+1hGNQU70pZs+MrfP2MuEJJhAw/f0HEWcXhVxhwmx3U9sRBSfv8
         J2JIgAsgWJDrx16CHNvF+mkfqaPJIZvnOstF8pSBz4WcPZ0rJPNElSstxdmyMD2XDEa2
         eX1rJfiNGca+aTnwcJFOQy9Ro+HZqJHFUwe/SqUeD3gppVfPLZK0Rl/jWnIkqH1R3um8
         puT902k8pifZ1H9H5EZPt2uF+mAFb3QqUgIDbVRjdlGxKITmRc2wtlO3NAcz0I9m0uW2
         WiwIDYc9UO17R3y6+v5nZO+TAsdEKYL6GNM39OjcHuj3PQJty61y44vTu+DdXRQlKBAy
         enlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131680; x=1795736480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGAIBXcxAo4ug92wkzcGwRrGYDjRYNfW8cF+/h8C8jE=;
        b=vdE48tOHoDzGOiUsjyCuV1xUrGRrm3rew3+/X/PBMhWPF+Nn5cLgvU1Il7IJIatOV3
         OopMxbk33FDDzA0bWo+8O4lUEwPNR96BvAYOYGjBT28f/VBKyWyO2ioVBzlofGC8JxVP
         xJNXnNIC38tiuTKtf8dX8mScqdaPhNZtvfNdFJaAwIPmqfk8H/hgqpgJCpLR8edY8jhQ
         jF4bkkW1O+By3PhWuDdfMaDVHP0IfjQCyZLCGiMIX4sigDYLfhzourD2yUGxKQSudBvN
         hAG9Tv+gmqUVWD2UlRPHA/FkR/URC6chiIVleCNKk7jXsHW82czDYwLJTeJG0HTruCnE
         vwCw==
X-Forwarded-Encrypted: i=1; AL+hErGp1pkR4baVeaJj8UPVFv2xX2TG5466J6wrcUo4zP3E6Yn/mo9/SWRrcvi5lXxgHyqRB9onmAm0+s+XcCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MEZA5g2aTVsTtt2GwuvttCxVfnLjhiJquJZ+blOwieTqwAqot
	6o6zn9SgSIpDJbpnaIf/BancoGbH/poeLYDQ0KeogUEXDrYNY49irprpJEF69R/RBdQ=
X-Gm-Gg: AZFdTZc2rMM9f4gNGK+uozbvecH+rY/vAhyBMCzlkZUIAO7mZA5e+kN+ejcu34azMCf
	g4/pTEq06POih5tkUAMwaVGo/JtRnUrms2UWkNCmBpLyHGz34o7kSDHnnt4KSPelaT3M/I8zIbE
	LGevrSNHNr/a0pjtgFAjwKG1HjBDtB328163e/fR5khpdSqnRiO+W4zJlxoVoTzxyX0hSTQx6xT
	7Ek+zpq2GYc5qi7EGkX+5tWp9/INOmsjZkTEdDxDn/y41QkkrrQ2JwNGZAMJFeo7P114+luHAxa
	wBv0deB6z9ppHk6tsWTwsb4yXGvIuR30kChosX5VExWqpDggWOl/DL+wkkjO3Avhm2rj41L9gny
	1oWQd1T4Wb3r4rLrx6YL9MwtIcStyhfFV35/fqopeQb8hzfNxRyhxAQE3rl9ztftp56s1N17dO3
	Ii7KuW501fRqPHaAsdcbYMQrLaseaNVtHf9qgrRavaj5URnlQp1OI6PxIDR2cXZBnk5E2C94kB2
	uxkyT/tPFeJZgXikmSP0q20LHJpj4Uyv8DPpj066LowFofhUftPRxW37PVPI/4bE830WP9RHlP2
	sJco6qT/ibsirhZUyKljvzFUHWdIYIxkccAH+wgxaPM+euKL/Lo79oLArTt3WJhDXyRbJn8d3Jc
	YxOYx77YI2mXYql32ereM1MIYS+90JotG77St6IXGpYHXnGGjzavyVA6mtBn86RFBRhlywK4=
X-Received: by 2002:a05:690e:1907:b0:66d:1877:121b with SMTP id 956f58d0204a3-67df43f32d1mr715869d50.32.1795131680127;
        Thu, 19 Nov 2026 15:41:20 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1932:ad09:1827:11fb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df338e8fesm796893d50.16.2026.11.19.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:41:19 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 3/5] hfsplus: give the special files their own extents_lock lockdep class
Date: Thu, 19 Nov 2026 15:41:10 -0800
Message-ID: <20261119234112.720963-4-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119234112.720963-1-slava@dubeyko.com>
References: <20261119234112.720963-1-slava@dubeyko.com>
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

Writing a new extent record of a file can grow the extents B-tree. The
B-tree file is then extended with the file's extents_lock and the
B-tree's tree_lock held, and takes its own extents_lock:

  hfsplus_file_extend()                    file's extents_lock
    hfsplus_ext_read_extent()
      __hfsplus_ext_write_extent()         extents B-tree's tree_lock
        hfs_bmap_reserve()
          hfsplus_file_extend(ext_tree->inode)
                                           B-tree file's extents_lock

All inodes read by hfsplus_iget() share one lockdep class for
extents_lock, so lockdep sees the file's extents_lock -> tree_lock ->
extents_lock chain as a cycle:

  WARNING: possible circular locking dependency detected
  dd/1553 is trying to acquire lock:
  (&tree->tree_lock/1){+.+.}-{4:4}, at: hfsplus_find_init
  but task is already holding lock:
  (&HFSPLUS_I(inode)->extents_lock){+.+.}-{4:4}, at: hfsplus_file_extend

This is a false positive: the B-tree file's extents_lock always nests
inside the other file's, never the other way around. But lockdep turns
itself off after the first report, which hides any later real problem.

Give the extents_lock of each special file its own named lockdep class
when its inode is read from the volume header.

The report is reproduced on a valid volume created with "mkfs.hfsplus
-c e=1,d=1", whose extents B-tree has no free node, by interleaving
appends to two files that were created before a remount until a file
needs an extent record in the extents B-tree. The remount matters,
because hfsplus_new_inode() initializes extents_lock in a different
lockdep class than hfsplus_iget().

Tested on a KASAN and lockdep kernel: the report is gone and generic/001,
002, 013, 075 and 112 pass.

cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/super.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index e568a5508b5e..d23594d12064 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -50,30 +50,48 @@ static int hfsplus_system_read_fork(struct inode *inode,
 	return 0;
 }
 
+static struct lock_class_key hfsplus_ext_extents_lock_key;
+static struct lock_class_key hfsplus_cat_extents_lock_key;
+static struct lock_class_key hfsplus_alloc_extents_lock_key;
+static struct lock_class_key hfsplus_start_extents_lock_key;
+static struct lock_class_key hfsplus_attr_extents_lock_key;
+
 static int hfsplus_system_read_inode(struct inode *inode)
 {
 	struct hfsplus_vh *vhdr = HFSPLUS_SB(inode->i_sb)->s_vhdr;
+	struct lock_class_key *key;
+	const char *name;
 	int err;
 
 	switch (inode->i_ino) {
 	case HFSPLUS_EXT_CNID:
 		err = hfsplus_system_read_fork(inode, &vhdr->ext_file);
 		inode->i_mapping->a_ops = &hfsplus_btree_aops;
+		key = &hfsplus_ext_extents_lock_key;
+		name = "ext_file_extents_lock";
 		break;
 	case HFSPLUS_CAT_CNID:
 		err = hfsplus_system_read_fork(inode, &vhdr->cat_file);
 		inode->i_mapping->a_ops = &hfsplus_btree_aops;
+		key = &hfsplus_cat_extents_lock_key;
+		name = "cat_file_extents_lock";
 		break;
 	case HFSPLUS_ALLOC_CNID:
 		err = hfsplus_system_read_fork(inode, &vhdr->alloc_file);
 		inode->i_mapping->a_ops = &hfsplus_aops;
+		key = &hfsplus_alloc_extents_lock_key;
+		name = "alloc_file_extents_lock";
 		break;
 	case HFSPLUS_START_CNID:
 		err = hfsplus_system_read_fork(inode, &vhdr->start_file);
+		key = &hfsplus_start_extents_lock_key;
+		name = "start_file_extents_lock";
 		break;
 	case HFSPLUS_ATTR_CNID:
 		err = hfsplus_system_read_fork(inode, &vhdr->attr_file);
 		inode->i_mapping->a_ops = &hfsplus_btree_aops;
+		key = &hfsplus_attr_extents_lock_key;
+		name = "attr_file_extents_lock";
 		break;
 	default:
 		return -EIO;
@@ -82,6 +100,8 @@ static int hfsplus_system_read_inode(struct inode *inode)
 	if (err)
 		return err;
 
+	lockdep_set_class_and_name(&HFSPLUS_I(inode)->extents_lock, key, name);
+
 	/*
 	 * Assign a dummy file type, for may_open() requires that
 	 * an inode has a valid file type.
-- 
2.53.0

