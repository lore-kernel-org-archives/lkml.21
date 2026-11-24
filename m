Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554341;
	b=2K4uglJ0yuGn87RT9Iyq6jZMWi/bkccUDlMxiJ8ghpAV+CayeUBT3d2FFWL/U6HuVhbA
	 7QlKEAlO8hDQB9pyLbbECfKMvYBA0mRJCkuSIKe5Sf8xpFSv4+Kwwcl3n+dQOQKjRNI8r
	 bn40YIlxng+jouzdIdA1Xla9X9KDbywPzXgmNjRSmhmMVh4q0d6tmJxEsTk0o9bKP0jfQ
	 vEErIHXClTPP0r/CU4ZNYH7cT/O8ndhsjUoGg5EtC4fbTuAjd0aRYpcu94ThM4galx4Rs
	 xhMLByxPu3yYB/mN/kYtOHfSRkTPfvH13bXwpYCmgc2gDK8kMtsAxjab3lxrhZpLLXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554341;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qS7bqmifw1teR25L7ZiqvJVHInoEWL72FwYCtMYVwEM=;
	b=jcH/Mf/GIbyf6GerhxgkPBy4ub6LZ6xo+eqOLE1R0OdY8jtkwvMQHISdimq7F3nQYe5A
	 IALNQSd0oHahVlyQSLwfJuD2rMaP06MpIeRkTBPJqInmp3ep2GyeHII/FdVCG5yuahyFI
	 3lS7em4iPvkSB8yPhMzj6GW+DVHBYyEc2EeAN2lRC6P+/P/aDGLU0WSTuF5oFI57XrXS7
	 Nc4NfAeE/mSNJfL6qBB90cHOKP/SLUqW91ZequaAO/1dSR/W9XmtIkdOjXfX9k6Kh5HSJ
	 /OuiRNvvvj6xwCW5rb9UhdJ1HJoBfoinMWtYWx1/UaMvv2s8GmpfJzYTx5c02LM9rnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zcvNq4fz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3018A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zcvNq4fz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A8A1F000CF;
	Tue, 24 Nov 2026 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795554340;
	bh=qS7bqmifw1teR25L7ZiqvJVHInoEWL72FwYCtMYVwEM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zcvNq4fzYxrLAug7X7LmbV9+2du134L+A8DlNo5Fex3iFC/ONKYUikc7PRj+7KN/w
	 /2ZYRXi3VUZ6qmwNjoPPKefLmlcPKIp8KuVpbcI7BdOjSR96emndbkNECejvcNV5wz
	 p9jcDLgacE/8Hl2sHWtlmnVPSXJLmL0pg62NWbi8=
Date: Tue, 24 Nov 2026 13:05:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, phillip@squashfs.org.uk,
 squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [squashfs?] BUG: unable to handle kernel paging
 request in squashfs_lookup
Message-Id: <20261124130539.fb8f15d4ad25c01e72c18167@linux-foundation.org>
In-Reply-To: <6b05f73d.3f72aad1.34e135.0012.GAE@google.com>
References: <6b05f73d.3f72aad1.34e135.0012.GAE@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 12:44:45 -0800 syzbot <syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com> wrote:

> syzbot found the following issue on:
> 
> HEAD commit:    3191063649db Add linux-next specific files for 20261123
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=11c11b09580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fb153e9351b2d9fb
> dashboard link: https://syzkaller.appspot.com/bug?extid=f1290205423d04eee4cb
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/74a1a5a80d1f/disk-31910636.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/ad0d2b167151/vmlinux-31910636.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/256a3285e2fa/bzImage-31910636.xz
> 
> The issue was bisected by AI to:
> 
> commit 5b515c0ec855811ab62985033c44dde99c15f326
> Author: Phillip Lougher <phillip@squashfs.org.uk>
> Date:   Mon Nov 23 03:42:49 2026 +0000
> 
>     Squashfs: don't compute start or alloc memory on empty directory or index

Thanks.  mm.git already contains a fix for this.  

From: Andrew Morton <akpm@linux-foundation.org>
Subject: squashfs-dont-compute-start-or-alloc-memory-on-empty-directory-or-index-fix
Date: Sun Nov 22 11:49:59 PM PST 2026

s/inode/dir/ in TRACE statement

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Loehle <christian.loehle@arm.com>
Cc: Dan Carpenter <error27@gmail.com>
Cc: Phillip Lougher <phillip.lougher@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Cc: syzbot ci <syzbot+ci04e7314748e3f6be@syzkaller.appspotmail.com>

 fs/squashfs/namei.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/fs/squashfs/namei.c~squashfs-dont-compute-start-or-alloc-memory-on-empty-directory-or-index-fix
+++ a/fs/squashfs/namei.c
@@ -134,8 +134,8 @@ static struct dentry *squashfs_lookup(st
 	int offset, err, length;
 	unsigned int dir_count, size;
 
-	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(inode)->start,
-			squashfs_i(inode)->offset);
+	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start,
+			squashfs_i(dir)->offset);
 
 	if (len > SQUASHFS_NAME_LEN)
 		return ERR_PTR(-ENAMETOOLONG);
_

