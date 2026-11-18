Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039337;
	b=Pv7SwhYE+oHBU9FRNqARIASrWngyV+wmLqmY6Fk0s3s4ELJRBFDu2boIDQyAOHby+7vd
	 Qkm/KRZ5SoXoMTkNqiBd717s3D6eO8VstQoH2v/yl6ulYQO55U1pT26+ZKm5a0ncaXszB
	 mi8h7tzYt1U9YVUc0C6wQQl3f91kbxIpe2+M7DQDjzPVRD/OBC777pLxBL+HvLjH/+8N0
	 qz4yiGluRuua6pfQTvf4P3fZ0bZgDIFDSXX/ZD/7zkcGTQDf4PyCl6WTZQWtSyQpjINcF
	 mlBABK8IS7pqg2nfTCeZyrAUhg9K/tIE3yRP/0RECyRcypMW439sNf7hy1YcI9Y0Gnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039337;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yo1xabyV53whMmg+uxEow2PfMUc1Q6vU1aHwVTSuikI=;
	b=dbteG5DhPt49el+h5dpNTrP8Y4w4pw4RfWef66VBqFvGPlpCTvo2Pdf+gWj3G4pA79Kg
	 lwxTo775sQ42skncQCLO9XKKQnDBX4QyDIGtcwdWwPWOda9Spwcj9uv29fULwdhuMnnrP
	 rCe9ANXy2gU8SjkAn3nrMofz8SzpvuAYPYW5+wEauB06/esk8yZLSy1lPSrRZRu1a4dPz
	 lRj8vfgONJQYjUTaXhU/EfXtj38CzASicW9/viRiXaRZ+9D7kRC93VnS4bxv1jhoUWM+H
	 2p0PTJPMpNRZjc2Ad9OiEjLi4Q5e4BLvz5lEdqCNYYO/7Ko2K+GiPBCUpxXsIFyY2VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DKZQsHKv;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EA60A2609
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49EA60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DKZQsHKv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9J/3TDko6vY0D7TedDlj7aNBGBfEkr+tAX65XefiW4Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795039334; v=1; x=1795644134;
 b=DKZQsHKvJrNcmzNjbFo+q0AGD17JeC4sM4S4eHzyo9d1inA50W/Yb8VDs9JIFUGkfZJ8nAFp
 I4K3/RYb8jug7b8Rfvphv/pFnXmUSa1qFv+CBpJTMmPMhJ+a01w0LZCltH3BjJMx2EWWQqrDczy
 QR37j/1/ZiUU5ZHMsLVmM3So=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b9bcccd00ec84c2f;
	Wed, 18 Nov 2026 22:02:14 +0000
X-Mizu-Trace-ID: b9bcccd00ec84c2f
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Ian Kent <raven@themaw.net>,
	"T . J . Mercier" <tjmercier@google.com>,
	Meta kernel team <kernel-team@meta.com>,
	linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] kernfs: don't take kernfs_iattr_rwsem in __kernfs_remove()
Date: Wed, 18 Nov 2026 14:01:53 -0800
Message-ID: <20261118220154.2965621-7-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261118220154.2965621-1-shakeel.butt@linux.dev>
References: <20261118220154.2965621-1-shakeel.butt@linux.dev>
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

__kernfs_remove() takes kernfs_iattr_rwsem for writing around
kernfs_clear_inode_nlink() for every removed node.  A cgroup rmdir
removes the directory and all its files, so it takes the lock once per
file, each time behind the readers.  Our lock monitor saw rmdirs wait
in __kernfs_remove() for several seconds.

Commit eea5d2bb34ba ("kernfs: Send IN_DELETE_SELF and IN_IGNORED")
clears i_nlink inside this section, so a refresh in progress could not
set a removed directory's i_nlink again, the race described in commit
507d8ce13f5b ("kernfs: Don't set_nlink for directories being removed").
The refresh no longer sets i_nlink.  Only inode setup does, under
kernfs_rwsem, which __kernfs_remove() holds for writing.

A racing fstat() of a file can read its i_nlink while it is cleared,
and sees 1 or 0, as on other filesystems.  A directory reports its link
count from the node.

Drop the lock.  rmdir no longer takes kernfs_iattr_rwsem for writing.

kernfs_iattr_rwsem write acquisitions (lock_stat), before -> after:

  5 dummy netdevs created and removed      370 ->    0
  100 cgroup mkdirs and 100 rmdirs        1500 ->    0

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 8686219b826f..c1402a461405 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1625,9 +1625,7 @@ static void __kernfs_remove(struct kernfs_node *kn)
 		 * to decide who's responsible for cleanups.
 		 */
 		if (!parent || kernfs_unlink_sibling(pos)) {
-			down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 			kernfs_clear_inode_nlink(pos);
-			up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 			if (parent)
 				kernfs_dir_update_times(parent);
-- 
2.53.1-Meta

