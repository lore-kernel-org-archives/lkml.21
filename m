Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477184;
	b=yC7RCW/ehm4yhP0gsaaiHznmlAt8+FFBJb6cQw4zDhuW30m4IgbW+Nf0L9Tl1DdgMVur
	 vY17XkXp4Zmdq/5L00l+zZiR76zg0Pj0RwYmOT1yKYFN8e3v5c2HSvo4lRDc6sjhAZPi3
	 BDEE4kKZQ2qNbPlV4kEOjH2Pa5L888SabXxOnQArwHWAkvyKTIV/AowTfRhgKvdjSAg9w
	 WTX/u9NNVoWZ3lqC+nUGquUa+/1uWrmeGQNZNt1YAgxF88xM+1NAvMzbGZEfYIULbvAvU
	 l7StnqEm5vWukI4HVp36v/pS3kdN0fKsjYla9uRdetcf3UsNXrju50b8rDXzXxtXpYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aggP6JcaAjhqbHGLe6VQCft8I9oupyLjhzJry8SU42I=;
	b=FtyOD2RCdhLJ2SJLShbREjVlt4XTyR2/JPazpvKQPqQxQTnqey0Urxcj/PsDRYGvo1oP
	 MZn279B5stAOHDqItIO4XD/SHngNogPbnH2R2F3uR2erbece04kd0vJsg2QEXU8KSlC65
	 3ZFXTwDTbhC7njGSB5NGTuC1wQmhEaJ5JFIvJR1qvaPJu+FM5A6Tzy+2vJhDqC1GzOxE9
	 Dwao9lYbrnCqB2XqxxZvxU8zaV0/fwkcSLf47YO08jLk/hj7iNJfMUuui4dy5tdwOmHNb
	 Bp148/y63c5CSYTd7i/f0vvrGhcNzrNMlCkizq133IbnCarhSfRVZZsjr+sjF+yFRiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XXPPaFpk;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C559606A6A2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C559606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XXPPaFpk
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-851f720d7afso2357026a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477183; x=1796081983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aggP6JcaAjhqbHGLe6VQCft8I9oupyLjhzJry8SU42I=;
        b=XXPPaFpkwiBQxOihkp1CifSYdtMfHjwfc0dsRGH4xITwSTt/fFBvCGgeS33Clxc7Hs
         9qEm1ey14XH2hiLiXwMv2T4AbxzDfntskVc58rYeHxk6N0AxYAqD6MPgruM4WT4hdpRd
         EhzoCoe9ReDSfb2JvvlPmDRRMOnO/Fi498Uidt20n9FbwYbsYg49dry5HrRKAm5BR0Bk
         qfXJUT/jLPEr8FCYTV9YmQM08VJlDriDUrYbs9jwCsDCpw6KMnx/iNX10zPYFkwC5WjX
         PsQNpt+yYus7SE9QwUpyD/UGkI+eLkFBVrQnF8N/1xMRFpV/9zi11+9WonIxyqhwGVFj
         C3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477183; x=1796081983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aggP6JcaAjhqbHGLe6VQCft8I9oupyLjhzJry8SU42I=;
        b=YcNKdUbMRyl4p14SinpHX3dAByH2FtVU4VebQL/wojjDJbWIoWdyxp6cja9RwIs673
         aZmi/U+rpjBjiXC8gqS/ORgsUt1wQZueTyF/sdkP5dleCK7jW/7TUFKh61Ri0cbiVw00
         856wCKjUq22LWTk9cgM9mbfvs/6UwLqlwwPtfv4KcMIB8ue8lfcyHJMF8ldBrxv8FIWI
         ksi1x8myBHSzKpmNFaV2XWQkA40np/Ppwhll82A682XY0rrJFJsRRBr3NWAs97RhQ+Rg
         4T9xvaaDgDYOQE4+oEzSUwK7dFBzM67mLsAxzjY+TXM2V9D4M1ouZdH1enMMpcbrSPV4
         5Bfw==
X-Forwarded-Encrypted: i=1; AL+hErGD2ESflxVtKbzNCtlaLwyhnRzuo8+RRCDl3vJUpB9lzSOY1VQPJLZohfu+IyTWdKAs36CWrgbn7oX0Jrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P4PyIGoA7z1QXQsHTyt0xjwRaFIE2dQnhPA7bwmWQ0aLaXm8Q
	NPcobGphGoo5+BUTVeHHMANk5eXuLEtjeVUQkgOdPXtSfPkYlJsdmUfolWvjsTDEiGh7AAQX+m1
	U/970TZ5LetKYGA==
X-Received: from japq5.prod.google.com ([2002:a05:6638:405:b0:620:5afe:8b1b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a10:b0:564:48f3:dfa8 with SMTP id 5614622812f47-57a0a111c93mr14525917b6e.11.1795477182891;
 Mon, 23 Nov 2026 15:39:42 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:15 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-11-dmatlack@google.com>
Subject: [PATCH v5 10/18] mm/shmem_luo: Require permission to preserve a file
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Require the file to be opened for reading and the caller to have
permission to write to it in order to preserve it. As an exception, let
the owner preserve a file that is immutable or on a read-only superblock
without write permission, and reject append-only files.

While a file is preserved, its size is frozen for all of its users:
truncating it, fallocate() and writes past its end fail with -EPERM.
Today any process with an fd for a memfd can do that, even one that was
only given a read-only fd. Requiring write permission limits this to
callers that could truncate the file themselves. A file descriptor
opened for writing isn't required, since that would rule out preserving
a running binary, which can't be opened for writing. Only the permission
of the inode is checked, so the mount doesn't need to be writable
either. The size of an immutable file or of a file on a read-only
superblock can't change anyway, so its owner may also preserve it.
Append-only files are rejected, since their writers can only append to
them, and freezing the size would stop all writes.

The retrieved file can be read, so also require the file to be opened
for reading. Otherwise a caller with a write-only fd could preserve the
file to read its contents.

Document the frozen size and the permission requirements.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 mm/shmem_luo.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index 46b33a00c2a2..854a49cd0aaa 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -27,6 +27,15 @@
  * the file are preserved. All others are reset to default. The preserved
  * properties are described below.
  *
+ * Preserving a file requires it to be opened for reading and the caller to have
+ * permission to write to it, but it doesn't need to be opened for writing. The
+ * owner of a file that is immutable or on a read-only superblock may also
+ * preserve it. Append-only files can't be preserved.
+ *
+ * While a file is preserved, its size can't change and no holes can be punched
+ * into it: Truncating the file, ``fallocate()`` and writes past the end of the
+ * file fail with ``-EPERM``. This applies to all users of the file.
+ *
  * .. note::
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
  *    are also not stable and are subject to backwards incompatible changes.
@@ -255,6 +264,30 @@ static void shmem_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
 	vfree(folios_ser);
 }
 
+/*
+ * Preserving a file freezes its size for all of its users, and the retrieved
+ * file can be read. So require a file opened for reading, and permission to
+ * write to the file or ownership of a file whose size can't change anyway.
+ * Reject append-only files, since freezing their size would stop all writes.
+ */
+static int shmem_luo_may_preserve(struct file *file)
+{
+	const struct mnt_idmap *idmap = file_mnt_idmap(file);
+	struct inode *inode = file_inode(file);
+
+	if (!(file->f_mode & FMODE_READ))
+		return -EBADF;
+
+	if (IS_APPEND(inode))
+		return -EPERM;
+
+	if ((sb_rdonly(inode->i_sb) || IS_IMMUTABLE(inode)) &&
+	    inode_owner_or_capable(idmap, inode))
+		return 0;
+
+	return inode_permission(idmap, inode, MAY_WRITE);
+}
+
 static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 {
 	struct inode *inode = file_inode(args->file);
@@ -264,6 +297,11 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	int err = 0, seals;
 
 	inode_lock(inode);
+
+	err = shmem_luo_may_preserve(args->file);
+	if (err)
+		goto err_unlock_inode;
+
 	shmem_freeze(inode, true);
 
 	/* Allocate the main serialization structure in preserved memory */
@@ -317,6 +355,7 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	kho_unpreserve_free(ser);
 err_unlock:
 	shmem_freeze(inode, false);
+err_unlock_inode:
 	inode_unlock(inode);
 	return err;
 }
-- 
2.56.1.809.ga0b61035b5-goog

