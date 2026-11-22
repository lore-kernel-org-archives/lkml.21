Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361804;
	b=PT128TGJaCWes45RWN9ATYsvOWxhc+cf453INALfZz1h4z+aOr59EJqrauaVOdHJjJwj
	 7YdE6lWgltBUqVv/uxYH8twvEpTv2BWlj20XxBv3rLHCCUaEM5aXcuUnu/ctPDoCfsVm+
	 JghgSpD6/RbArpZLQDZZAwbBP/5fMyHX5NWV8j+iCoLJHF/KiDqS8/59wRnFtPT7mR/WB
	 5M2mUqzkcAi+fHtko/Dg5e7AEYYZRiOxOkwIw9Y/iUD59uwiO+9vwPYPxoOeLPFXx8if1
	 r5QfLM3hg+W5LPFtNomS8ZyBItLxZS+m8NzwPFAjMRprzPG+MO6c/GYrHXubvvwUeyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8YUeZtd56yJ2PhtpzFvOodt26i8q7u6e5Opw1KxAgmk=;
	b=HewjPc4dRAiG1kuSjrO1mZVdqLrKuf0lmSucqf95XNTU+5gELigh6K4LxPYjII8YK0zM
	 Zcd10uMBYPu1XepQ00sjbABI7gubw39yyOOIFLQ28xCw9U0NXHktHKArtuu68OyucD2/v
	 VJyWlZIsDN6M7aS9qMwEucYj5bgFX6zTz51N/49Fr44nTnOfsnqJ3fehggOocpMu/a9H+
	 rQoFYIqXY39T8O6RC7n34vYDsYoCZ8MedQqQNu7e4U2gaHnWbRNxYihdG4sB7XhIDChC5
	 D6Z69WMPInsizIo1D2sDlrK1BpTqAUyi98YddMDxg+DwoW1JGW1sMD5Hjpl2hnQo1jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=OGgpn4ff;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C4F606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C4F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=OGgpn4ff
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4c2da74c0so14245757b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795361803; x=1795966603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YUeZtd56yJ2PhtpzFvOodt26i8q7u6e5Opw1KxAgmk=;
        b=OGgpn4ffKsw9DLMles/9pb5XkRT7KxzN583oIW4UHzqZDzoiG35zqdu4knwGMjzVtH
         levZfbOpDVJ4VYX7XV9iQkfjLQVaMcouCPjEb8soRphfDsOCNSZ5S8UQY2/rOwbQej+m
         dT+U1HYYUxl73PFiyEjt1ZYQ3/zkptvK9kzL7QkBfBpaywHqc73oYwpJ+XIsKBJ1cPNn
         wqyPY0zrkkVQotE3NVhv5bD2vIeTeRN8Y0TtQUB7o+/TElQfK+EKaSPkZYF5q4MxvCSy
         dju0tUrpeT6JdHtzdKea82LrQFyJ7hV/uIHQnGU1wbQK5dBvTSF/nQs3eVJkuJ8MU55Q
         jPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361803; x=1795966603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YUeZtd56yJ2PhtpzFvOodt26i8q7u6e5Opw1KxAgmk=;
        b=irPGE7Yh60OYoGMqqfCAys6XrhFhBd3k6BsuG1kXe78raHEObP7zPHbGnrfTABEEi3
         VA8Xcf9YR9l7y1okbuy7whQZK9XxK+KfYRezcqDXlBYfROKVd9op7JQ5JKDSYpEfJP0L
         5mGh78UWdByCHgjM1/zKDorR97QYusbzZk2IacvZ1dmPcKoLS3APcPca/gmAvr1p80pv
         kNJ7a7u7Th9bMVhR76gcWBHB3OF5JzUHdVQiCuOsBOwgLWTFTCsrF+6y73NYnh82PBr5
         rGm93IsAOPqrpEdw1u7s0xWiGl/VkFRhbztN6kpwgOFFOZDbyqdVzHJBxDY4SoEux/am
         b1Gw==
X-Forwarded-Encrypted: i=1; AL+hErEuvH2Suo0dUj4U/n+pboKIuNAwFVRC20FTQ+CxEG3CDf8d25OfRfmwJW6FZGg73xq8i1+1EA+caME/lzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CkPwi5GUQuLHEmpRt7ySv7KWXGCr06Bu+HYOfJZ2QQGbynpY0
	vw/8yNblamgLIjAhdy3ZUI8yNC+DsmNZyiwLYa4oLy9nvpG+9ZpZkODqPuUCLFkn9g==
X-Gm-Gg: AZFdTZdJ4Hl2Xk1VwBRvuVobvRGPGib6jegpcI0tkINJTAMAYVLYV/IpWRq0lpqnG5U
	zQiID9mldPaWu6/fGG3IPN3cS6YxMgfVRniZa4Gw/b/vAkY1d0T7BYHj56muG2BgogZ4sYk/Y36
	ktS4qRQOLEjF3ZzXDWSHr02y64IdMJepHdxiJ40icZwRDSypJcm6wRNytXKSBbzCizBZfCTeNM4
	cGP/iBxR16s8qxEqlWMZ/wus8b+Ke8EMxZP1odUTmnCDiiCBpDV3EzUZxAjixyF+TOWNE/ZyZOa
	9RQYS7bIEQl2TGOMc9M6lxL3NnPwXOZW62UWATOoALilsyHjRENU05Do2vMvxQZVJtrLnW5JUej
	1pCEQul3zMZh/thHXz9ejdF5yDTA4TkviWo5LB+ovNrW8a688QdgtMM+x1VSKfvrP4lr0riWlrV
	q6mVCweDAGHmUpcbQZXOz5FSu24dsZe4ncGL/GUHZP4EmwrKWHhlwl15GsJVQMQW9vboWxwwgEk
	2msKhkMWmLXcIc/PwCMyR8wwAlv0dY0Y+i+rjR8Q3aCdCyeEqrC/GsahTxZHSF4X29Hb7KILGSC
	cCu+EBjmGB6Ja2PSV5MUFyVuxaQasIZoh9U8SJypaQ9RxgN2SLlG
X-Received: by 2002:a05:690c:9b0c:b0:873:5c6b:a305 with SMTP id 00721157ae682-8b5204dab2emr36320217b3.51.1795361803007;
        Sun, 22 Nov 2026 07:36:43 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d160sm36223427b3.10.2026.11.22.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:36:42 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Taerang Kim <kth5965@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: fix to reject inline_data inode which has blocks
Date: Sun, 22 Nov 2026 10:36:36 -0500
Message-ID: <20261122153636.2731348-1-hengyul@cs.unc.edu>
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

Commit c240c87bcd44 ("f2fs: fix to do sanity check on blocks for
inline_data inode") made f2fs_sanity_check_inline_data() return false,
i.e. "sane", as soon as an inline_data inode has blocks or node ids.

However, the function returns true for a corrupted inode, and that
commit meant to detect exactly this state. The early return also skips
the older checks that reject inline_data on a directory and on a
compressed, encrypted or verity file. As of now, such an inode on a
corrupted image is loaded, and setting this one bit in i_inline of an
inode is enough for the following:

- unlink() of a small compressed file that owns one data block hits
  BUG_ON() in clear_inode(). With panic_on_oops=1 the machine panics.
  Otherwise the task is killed, and the file system can no longer be
  unmounted (EBUSY).
- unlink() of a larger compressed file succeeds, but the orphan inode
  cannot be evicted, and the next mount fails with EIO until fsck.f2fs
  repairs the image.
- A directory lists only 70 of its 300 entries, yet rmdir removes it
  once those 70 are deleted, and fsck.f2fs then finds the other 230
  inodes unreachable.

The issue can be reproduced with:

    mkfs.f2fs -q -f -O extra_attr,compression /dev/vda
    mount -t f2fs -o compress_algorithm=lz4 /dev/vda /mnt
    touch /mnt/f; chattr +c /mnt/f; echo hello > /mnt/f; sync
    ino=$(ls -i /mnt/f | awk '{print $1}'); umount /mnt
    blk=$(dump.f2fs -d 1 -i $ino /dev/vda |
          sed -n 's/.*nat_entry.block_addr *\[0x\(.*\)\]/\1/p')
    # i_inline 0x21 -> 0x23 (F2FS_INLINE_DATA)
    printf '\043' | dd of=/dev/vda bs=1 seek=$((0x$blk * 4096 + 3)) \
        conv=notrunc
    mount -t f2fs /dev/vda /mnt; rm /mnt/f

Before that commit, the result is:

    rm: can't stat '/mnt/f': Structure needs cleaning

After it, the result is:

    kernel BUG at fs/inode.c:776!

With this patch, the result is the same as before that commit.

This patch will make the check return true for an inline_data inode
which has blocks, as the message of that commit describes.

Fixes: c240c87bcd44 ("f2fs: fix to do sanity check on blocks for inline_data inode")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

I noticed afterwards that Taerang Kim pointed out the same early return
in this thread:
https://lore.kernel.org/linux-f2fs-devel/20260317152838.26664-1-kth5965@gmail.com/

Tested on f2fs dev (b61a029304bb) with KASAN and lockdep: the reproducer
above, the same file with F2FS_DATA_EXIST also set, a 5000-byte
compressed file, and a directory with the flag and 300 entries now fail
with -EUCLEAN at iget, without BUG, lost entries or a failed mount. On
healthy images made by v6.8, v6.18, dev with and without this patch,
and sload.f2fs (default; flexible inline xattr + compression;
noinline_data; noinline_xattr; sizes around MAX_INLINE_DATA, conversion
by append, truncate, mmap, O_DIRECT, fallocate and atomic write,
symlinks, xattr node blocks, compressed files, roll-forward recovery
after F2FS_IOC_SHUTDOWN), every file reads back unchanged and fsck.f2fs
reports no error. The f2fs/*
and the generic shutdown/log/metadata quick tests of fstests that can
run here give the same results with and without the patch.

 fs/f2fs/inline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 032c1cf8c615..2c50a72580af 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -54,7 +54,7 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct f2fs_cached_block
 		return false;
 
 	if (inode_has_blocks(inode, ientry))
-		return false;
+		return true;
 
 	if (!support_inline_data(inode))
 		return true;

base-commit: b61a029304bb5531312ebc133b2a895d14dc3fee
-- 
2.53.0

