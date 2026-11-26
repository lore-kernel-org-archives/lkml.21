Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710708;
	b=hfYMvadceDd2e4mnIKC414mJYjk75gIuA5fdEtzIrnI17/5pXzpsVf1cDtwZ1veJd0mu
	 G2PbQtvmycNsyloedZmdVbnZxBhoshWgcD7MRBn07nljGHdtPmbiGY1rCIcWjkoGn1YmU
	 6YmltU0XIMZWQB+iS6oLvDMOv9ipQEwrav1m6nwQOqWWe/GgDyZoNyT8B+ciFZjGrcfSb
	 wRG6DfTQK7qTT63M5t3g51r47Sn2hy9dvf+o1rbSdTYQzIEbHVRpSXw9wU/9sVZwtN6YP
	 MiZHpw3VtYdyiVCOus3txCuphdToLiFuETNr82GO0sOL3T9OdHKryOVaqSVv0jVVzZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OPwcu3THbOq+3XWyQQ+nL5e2PeyQBnz7B0EEXV1jfaY=;
	b=c/9hMbdmT4BYNhH1H4Oxxm/jwT/dEb5HvZ7A24dys8widc6y2nX6tOHey1ipu8xYB4Ue
	 pltaUFT4LQg1RfyFGQK3sqwRJk1cKmFd38x08Jecqz5oiWjFaJW+KuaUnJqbsdG64dZds
	 EeuTOdlYz7mIZwyAscSb2R5lgO4JqP+5mnPwErAB3wC/XzDnnfTYkQYCefaf7uaexaGOC
	 Ga5dXQdmkSIU0S+LZAPW5tDU/Xsg7hvAi7utViwvTpcHoNiQ/wEg1oCajj3cn19h/Saew
	 zyJDOS9jzSZnVQot0V6EyTqkq16P/Xp0PJx+ILDbL66iMlIU8jw0nl496wPLx7uLflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhVaPyMJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BF606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918BF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhVaPyMJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so73940405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710705; x=1796315505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPwcu3THbOq+3XWyQQ+nL5e2PeyQBnz7B0EEXV1jfaY=;
        b=fhVaPyMJ7OSZKu+EfBR8QJPG6D2mMYRvOGv38yu4nUA1P3yn1DsfxVBQ0+khtEVapy
         2rKHvWryXzuJCGetU24K/q5+tTgl94BktvfxWS7UUR9ERY0H5ej9eALqz0Z7fm5Siyzf
         drLCOM2QaTY7MOaVp63tDZ5jzY++BxDTn5lvjce9YocznzQfBG8TrunqO8kaO6QQnsUc
         4ekYKo9SBTD5k4eki8wffLdGPthgAHLz/xhj9Mo8JcNXzyg9DLuv9xKijzMCOMwJpGo0
         QYNd650J94JGcDVe1VKHNp4Vf/D/0OF5wYOa7E0Wy73fqCr6hk8/4dQ+XovV2YKaVfFb
         60pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710705; x=1796315505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPwcu3THbOq+3XWyQQ+nL5e2PeyQBnz7B0EEXV1jfaY=;
        b=D10MUzfKIoVTYsoRuMNoWG4kzT2um5T30XxTKfIwmdxBUnz12D9gi+hAJL3hwN6l36
         ENRGeLrT2mbAarSEOdP7Efp9Zs+JmVuUND/bn6U6Fl0ZZagiRskNEZwrcH07XBjEJMlJ
         7ks3d7x1E8+n52k3nno3GL2do91ePbLDCiKGoNqX0Lkt+yhPAVEZveVMVm8Y5eRdlohs
         8Y7v6RyOUiHl2ScaEn4Z/csCW0AJ2FfAaBueYiRC54InWBE2JNhYXC/zfe/HYpMMfBEa
         T0K2Y2/lEgJQn9mbA8CpP5uPrDpBTthHqGeTApHGzvxmdFSqq+3N/7l5zUEeZS2MDhDv
         z4DA==
X-Forwarded-Encrypted: i=1; AL+hErFkNjR4CEtPiv2cXtUIFYOT5ETj1lCSq3r3Y7oFtWdXbP2RRFF1wayLIrzUnGXAUV+50GZXvzqoJca7nr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n6YyJVDSSO0aFl6e/VxkV8g3oyg8AKs4gMK9ouN04Vjnf+LB/
	uz92WqJvQ/T7VHl/mJKbKv2Xssx8JcxrRon8EupsItRDesTJDAUfZwi4
X-Gm-Gg: AZFdTZf/Z6qb2vxbm5XEVBWJKOTMPHUwLVP2M5MLrwdjTIFj3iAHGiWYKYeZ6o8N7S5
	58+qgZZGL/DqvSHPLbqPRMxcFNvEbvdjlmbsaJkf2DeXeoyQi0YikltC995VxNkXr7I9FTp6nmZ
	QbJoi+YEANpAe8QpjtfN9OsPltNHo1eVRJIgHAPe1tvHXUoHhUjcPSasS4qKu/AHjdVgMmuSjfQ
	yoG4QKJL61BavXMoQFXSfaSuX11JwzjIYFH82znwOe2qlduzGc0NQfkkqMVhOw6Txabe84wcP17
	zJUWwtXaAu9ki4YCgdD9922c5VZnvYu7pzWSdU8IIM+t3sA69tw+gD4RasJfanUku7SkieuC7zT
	GRcIcLQxmYdT5lPHfnDY4wsoc1tHNrYP7qox7nzV/Z/uiph5m487nZONK4G92uy7Bne1nsEvahB
	0NeG+JDyckcyG4mhYPR1UEza9wF+6+a0LnAU2ZeZGgzqijReukNkAI4ZBQyKKNT7Ks7XtV3EQ27
	82iARwuFb2o//Fu54kgmG2Dls8bRVwegecOX5lwAlKoGnybq4J8BHygySFbS1iOMqpihfFGQJBp
	CVejOmBein/YjrNyE6rexp/U
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr436997625e9.1.1795710704643;
        Thu, 26 Nov 2026 08:31:44 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:44 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Aring <alex.aring@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lauri Gates <lauri.gates@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Dave Chinner <dgc@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH v2 0/4] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
Date: Thu, 26 Nov 2026 17:31:10 +0100
Message-ID: <20261126163114.403846-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This is a follow up patch series stemmed from [1] and [2], splitting the
_mask change for the fileattr API into its own separate patch.

The first patch is a preparatory cleanup so that the code in the later
patches can be formatted better.

The second patch updates fscrypt_prepare_setflags() to take FS_XFLAG_*
xflags instead of legacy FS_*_FL flags.

The third patch is the actual implementation, which introduces:
- fa_xflags_{rw,ro}_mask fields to struct file_attr
- fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_kattr
- AT_FILE_ATTR_MASKS at_flag for file_[gs]etattr()

These masks have the following semantics:
- rw_mask:
  * for filesystems: advertise which xflags they support changing
  * for userspace: specify which xflags it wants to modify
- ro_mask:
  * for filesystems: advertise which xflags they support only reading
  * for userspace: ignored

This allows userspace to not have to do a RMW cycle when using the
file_[gs]etattr() syscalls, avoiding possible race conditions and
simplifying their usage.

Patch 3/4 also introduces the missing FS_XFLAG_PROJID flag so that
programs like chattr can leverage the new mask API.
FS_XFLAG_PROJID is kept out of the legacy FS_XFLAGS_MASK and so it's
defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
will be used moving forward for any new xflag (like the one proposed in [2]).

Patch 4/4 converts fs/ntfs to this new API, to show how it can benefit
filesystem drivers too, and for this purpose adds FS_XFLAG_COMPR and
FS_XFLAG_ENCRYPT from their FS_COMPR_FL and FS_ENCRYPT_FL counterparts.

The series has been tested with custom xfstests [3] (generic/816-835,
xfs/611, xfs/673) across NTFS, ext4 (project quotas), XFS (project
quotas and extent size hints), Btrfs, and F2FS.
Note: these tests were written by gemini and not manually checked,
before sending them upstream (if needed) I'll have to review/rewrite
them manually.

Note 2: there are apparently quite a few bugs with overlayfs and a few
other issues, but I wanted to get the final API design out first.

v2 changes:
- make fa_xflags_{rw,ro}_mask in struct file_attr __u64;
- add AT_FILE_ATTR_MASKS to opt in to mask semantics instead of needing
  unreliable heuristics on usize and mask values;
- reject intermediate sizes between VER0 and VER1;
- reject non-zero masks on SET without AT_FILE_ATTR_MASKS;
- add patch 2/4 for fscrypt_prepare_setflags;
- add xflags_to_flags() / flags_to_xflags() and
  fileattr_set_{legacy_to_mask,mask_to_legacy}() to translate between
  legacy RMW callers/filesystems and _mask callers/filesystems;
- clamp fa->fsx_xflags to rw_user_mask in file_attr_to_fileattr();
- update fileattr_set_prepare() to validate capabilities and projid
  changes against rw_user_mask / xflags;
- move the rw_mask == 0 early-return no-op from file_setattr() into
  vfs_fileattr_set();
- put FS_XFLAG_COMPR in FS_XFLAG_RDONLY_MASK only (keep FS_XFLAG_ENCRYPT
  in both FS_XFLAG_COMMON and FS_XFLAG_RDONLY_MASK);
- update ntfs_fileattr_set() to apply only bits selected in
  fsx_xflags_rw_mask;

Thanks,
koraynilay

[1]: https://lore.kernel.org/CAOQ4uxg8aVcWyNiFDk8djdn-M3xJcu_7-kRxVq9jjFsbcGp1ew@mail.gmail.com/
[2]: https://lore.kernel.org/CAOQ4uxjVQ9cjV=_jBjQtNg9zCuWUEJT9KNYMKV+1jwBkHen5OA@mail.gmail.com/
[3]: https://github.com/koraynilay/xfstests/tree/patches-in-queue

koraynilay (4):
  vfs: use goto out on error in vfs_fileattr_set()
  fscrypt: update fscrypt_prepare_setflags() to use xflags
  vfs: add xflags mask to fileattr API
  ntfs: switch to the new xflags fileattr API

 fs/crypto/hooks.c          |  10 +-
 fs/file_attr.c             | 357 +++++++++++++++++++++++++++++++++----
 fs/ntfs/file.c             | 109 +++++------
 include/linux/fileattr.h   |  14 +-
 include/linux/fscrypt.h    |   6 +-
 include/uapi/linux/fcntl.h |   6 +
 include/uapi/linux/fs.h    |   9 +-
 7 files changed, 409 insertions(+), 102 deletions(-)


base-commit: 3857587d9d6fa44d40d1c73bde6a39f6f7a5216c
-- 
2.56.0

