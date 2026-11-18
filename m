Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961535;
	b=LLnK1AjngCGdgay31H9/4zLkNfsAuGGJEjtnaTuTskFEm6fFrIsalnhhXaoNF/YxnI8X
	 u0lhqLNdj9XJjJnDgTJCBKQrw5GMnnzROvbmaOr8NZ5Cbrky/+0ylUgoM4mXNWVGp0Sgw
	 uaaUxMwxyhfZ09kUaLQKDRLZkvaGwn/Ab5LncGrhR6qgBZed8lEvbG2PrchkxSmK7JhmF
	 BusT7m9icbA4zyKKzyJVHVD+zsL+A5jf5+KhdDGApLRRtRbjv+7KzR+snrCWvWhaD9Bmf
	 ZtCxaJ7quWoT0jjK69K87UOfFiddACf3pAcJYyCdGWdDSXIAzwnBSbMMvBSPuKk2vGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B58E4pSFjKm7IGrehgXSmXdGo6N43CbyBCh2MCpRtOs=;
	b=t0oMl0p+5VooOmGNWnZZ9U9gng3jH5Z378cT9dnA8OfcACGqSHQpHk4kt34EyuIg86a4
	 9SAx8Nv4GZI185yrTFtXGgLF4sJk8daTGObVYTbfvWozhJZYf4wNJOZdkgzk5BFAQ8C9K
	 Qk6+3YKCVD/WVT9YHk71NDHa2kTXkwblFTuShbew/e2EygyUXkAuWPbxFEGEoSyK1q473
	 5mndTBpZY4Otq/pnYdsnQuHXyHoJCO0Kg6G5ygKUXONvs9vyhIFsPy4474mfIUmeRHrgf
	 BTz78jBaGB3gj4PDZe4v6ZN27Wagui6Q1R5GTQ9Gp85L38KLaDcb6/uviJlcbgYroPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXAZEX1l;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0774606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0774606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXAZEX1l
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so218348a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961534; x=1795566334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B58E4pSFjKm7IGrehgXSmXdGo6N43CbyBCh2MCpRtOs=;
        b=hXAZEX1lqtJXHIuAZhdFXkin5h5+Sw7FQSqcvxwn9+jnxeRHLTJAKd6A5NcCvRZYts
         Co4NdG+FFxfpC+RN9fQ/1R3Txrr18pXmUEL64YHSA1iMM3eHo5xE+8kmIYBK39GJy0JX
         L32QqnPQtNZgP6Lf2sz+aaMUBajeB2U514Cgnka4WU2FajW7hO6INFsK44sxMgvjFWKh
         I8tVCfa4rj8cLvZN8gdylEsyGL75LFl6229UQMk738495jg5gRNf0KncDE+j0/A/xCWQ
         DaP7fFlzl1sC4N39vOVG4MIacfCMxNVVLfVJG4Xjk6dvBxnZGgucL+jEg2tk+6JBQj2k
         sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961534; x=1795566334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B58E4pSFjKm7IGrehgXSmXdGo6N43CbyBCh2MCpRtOs=;
        b=Su/RzdAxoMY1Cb5RNvtVIscKuzcclz+M6kowrEFCHgj4FCmZrhxZ6D9IeZLqjdYpyH
         bMSmk07kzuGsAODa3rzWltuFybB+pm0q6GallqItUZUMi2dOzBKz8UX8HYvGF8og7Sm/
         k5tQvoxAlwa8uewjTO5tXZnDi4G5uFFZKOy5e0W/nkUgdL9NOFwwWLfi3PlDJXUh48/O
         VJd4kj1awSeApKIQMkBAehu3eQ/iUJ1ZJH2lS9QdNOqp9LZtNkFywbBSQnNXnlVfvIJw
         Bt1AyNiRLkctkrhhfKYUsBEE18i4F/f5kcldCRrromKdGNqS4hixQ1NZ7rHNrcTVA+nR
         aSbA==
X-Forwarded-Encrypted: i=1; AL+hErEHUvVlKa5oDq+CqCzssLn1X54QMXr6awflmOm/gxz4jtnrV2UzDJs+JORjfjN8UwdsztnOcqeEaDOWFVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1CNzS/PNx6I0wgykoYHF4WA84uKqgftfd/yQ/xDMSitNkqi8a
	nK3sErxUiXWSguDbFyYsF1tM+WhqRoh5gF8z+nGb4IvoxE5QMbI+v6W3
X-Gm-Gg: AZFdTZeOlXUlotW4j2BoB1ygQcEsvUOGG4+c48QkId9A6iS46u1WIkAECOI8yuzgs8/
	gFNg7UeR+HBedbFfVQ8hx7fITCugbxr7OsVmH0zyC61/jc50cEwW9jpN8OSVM7c9pJrEtym5H5Z
	K5Qfw1pohVDKqSnYxzxABbB4hHQVGBu8EjmZ3usn1W/p79LkYUbBCjfUKQAGZQy/mRquUHBB17T
	FgQvhDrbilNJZptN4/b+6oKT+o0hMMUyqp6y44AzxLFdZSx4+BkMH7qOaprJ0tqTXam+k2CGqdt
	AZA1SyTnLty6hHdgfrdgHrr10ZQOkWJykdgE/ooS0lgOVzqsHRe6kbRd0ch5t1aeXnSe/0bbsm4
	L3lk919e7PeX3oxd+Rx+Z6k9CY+9UPMhaN2KPLZTY+z1Irdy4QgbflS16rc7E9ihVFX6lQYIIRl
	7w4c0q0CX6XwL8FfqmjKXUyHBQ/2mH6QWIdNa+ZT2c6dusOY4Ovhz+pe0uJAQqqiosKaWDmGJIi
	t1CgyP+7RcmP+xLy75FSLI7abov9MV0r2r/ZSSqXtwK+Boxf3Yt3Ts6nJOVb/TgEhWHJMVXliK2
	Gg2CvrOXxE3OI5jKRVqYMRW6h9iEz/erN6n8uOXscslKBocxJHqp6YILqnLhKVf+4rAVsgZC2kp
	HK83oFNYHJr8Iw01VbbwHtU4TBbsdfWMQRmOuM2Q6SHlf4xhyDNpP3prR5vB/kLdr9jm0yqWTbA
	X5VO0li8qV55yo82eHazgaOt2UoPg/n2Sefwgp3OJLvC1PhjJzJWb31Yd+T56GjQ==
X-Received: by 2002:a17:90a:d44b:b0:3b0:d808:a991 with SMTP id 98e67ed59e1d1-3b3d07c3e85mr1057779a91.55.1794961533975;
        Tue, 17 Nov 2026 16:25:33 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c04020sm1212211a91.17.2026.11.17.16.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:25:33 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Allen Pais <apais@microsoft.com>,
	Rachel Menge <rachelmenge@linux.microsoft.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Gillian Laming <glaming@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] smb: client: drop dentries for dying cached dirs during unmount
Date: Wed, 18 Nov 2026 00:25:28 +0000
Message-ID: <20261118002529.250616-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118002529.250616-1-sidchintamaneni@gmail.com>
References: <20261118002529.250616-1-sidchintamaneni@gmail.com>
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

During unmount, cifs_kill_sb() calls close_all_cached_dirs() to release
all cached directory dentries and flush cfid_put_wq before calling
kill_anon_super(). Two races allow a cached_fid's dentry reference to
outlive close_all_cached_dirs() and trigger a busy-dentry panic in
generic_shutdown_super():

1. When invalidate_all_cached_dirs() or
   cifs_mark_open_handles_for_deleted_file() runs concurrently, it moves
   cached_fid entries from cfids->entries onto cfids->dying under
   cfids->cfid_list_lock, then drops cfid_list_lock before laundromat_work
   runs on cfid_put_wq. If close_all_cached_dirs() runs in that window, it
   only walks cfids->entries (missing cfids->dying) and flushes cfid_put_wq
   before laundromat_work is queued, leaving cfid->dentry held:

  Thread 1 (umount)               Thread 2 (reconnect / open_dirs)
  -----------------               --------------------------------
                                  invalidate_all_cached_dirs()
                                    spin_lock(&cfid_list_lock)
                                    list_move(&cfid->entry, &cfids->dying)
                                    spin_unlock(&cfid_list_lock)
  cifs_kill_sb()
    close_all_cached_dirs()
      spin_lock(&cfid_list_lock)
      walks cfids->entries (empty)
      spin_unlock(&cfid_list_lock)
      flush_workqueue(cfid_put_wq)
    kill_anon_super(sb)
      -> generic_shutdown_super()
         BUG: Dentry still in use (1)
         VFS: Busy inodes after unmount!
                                    mod_delayed_work(cfid_put_wq,
                                                     &cfids->laundromat_work, 0)
                                    dput(cfid->dentry) [too late]

2. When two mounts share a cifs_tcon and drop_cached_dir_by_name() (for
   example via rmdir on the sibling mount) drops the final reference in
   close_cached_dir() -> smb2_close_cached_fid(), it deletes cfid from
   cfids->entries under cfids->cfid_list_lock, unlocks cfid_list_lock, and
   calls dput(cfid->dentry) synchronously outside cfid_put_wq. A
   concurrent unmount of the superblock owning cfid->dentry can finish
   close_all_cached_dirs() and reach kill_anon_super() before that dput()
   completes.

Fix the first race by also walking cfids->dying under
cfids->cfid_list_lock in close_all_cached_dirs() and clearing cfid->dentry
under the lock. Fix the second race by detaching cfid->dentry under
cfids->cfid_list_lock in smb2_close_cached_fid() and holding
cifs_sb->outstanding_rreq across dput(dentry) so cifs_kill_sb() waits for
the in-flight dput() before calling kill_anon_super().

Fixes: 3fa640d035e5 ("smb: During unmount, ensure all cached dir instances drop their dentry")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 fs/smb/client/cached_dir.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/cached_dir.c b/fs/smb/client/cached_dir.c
index 50217f47a0ed1..e5c924409078c 100644
--- a/fs/smb/client/cached_dir.c
+++ b/fs/smb/client/cached_dir.c
@@ -467,6 +467,8 @@ __releases(&cfid->cfids->cfid_list_lock)
 {
 	struct cached_fid *cfid = container_of(ref, struct cached_fid,
 					       refcount);
+	struct cifs_sb_info *cifs_sb = NULL;
+	struct dentry *dentry;
 	int rc;
 
 	lockdep_assert_held(&cfid->cfids->cfid_list_lock);
@@ -476,10 +478,19 @@ __releases(&cfid->cfids->cfid_list_lock)
 		cfid->on_list = false;
 		cfid->cfids->num_entries--;
 	}
+	dentry = cfid->dentry;
+	cfid->dentry = NULL;
+	if (dentry) {
+		cifs_sb = CIFS_SB(dentry->d_sb);
+		atomic_inc(&cifs_sb->outstanding_rreq);
+	}
 	spin_unlock(&cfid->cfids->cfid_list_lock);
 
-	dput(cfid->dentry);
-	cfid->dentry = NULL;
+	if (dentry) {
+		dput(dentry);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
+	}
 
 	if (cfid->is_open) {
 		rc = SMB2_close(0, cfid->tcon, cfid->fid.persistent_fid,
@@ -594,6 +605,22 @@ void close_all_cached_dirs(struct cifs_sb_info *cifs_sb)
 
 			list_add_tail(&tmp_list->entry, &entry);
 		}
+		list_for_each_entry(cfid, &cfids->dying, entry) {
+			if (!cfid->dentry)
+				continue;
+			tmp_list = kmalloc_obj(*tmp_list, GFP_ATOMIC);
+			if (!tmp_list) {
+				cifs_tcon_dbg(VFS, "Out of memory while dropping dentries\n");
+				spin_unlock(&cfids->cfid_list_lock);
+				spin_unlock(&cifs_sb->tlink_tree_lock);
+				goto done;
+			}
+
+			tmp_list->dentry = cfid->dentry;
+			cfid->dentry = NULL;
+
+			list_add_tail(&tmp_list->entry, &entry);
+		}
 		spin_unlock(&cfids->cfid_list_lock);
 	}
 	spin_unlock(&cifs_sb->tlink_tree_lock);
-- 
2.43.0

