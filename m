Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249385;
	b=AZPNBnG1Ie/5wggRLRwE6TxvAMhDvim95Rd1WGIhvQ7KApEFa5OM8/CVo7envzcMzlcN
	 nIUMUdzaHYkxmlGh/RsBqUofzdpbRS7PcSJBL/DN21CglNfhE0b/wxK91i7cJvNLcwjlK
	 SgPiN4WHvSu1TVuKzVmifsm3q8HHJKhCSerUvQlo8M9f1yZiaGgcv5qCBUH25Frs4Js4A
	 GC9LjCyKn5CPXvShqBlV4HJF6TDWvmlE7Yp9XHKMYmlpSXtieuVq3/78nzczCQnaE9dUc
	 lQ7kWIsErCqa/7Bg7vQsuscn7efEBrqNI2P9E1M1Y4gMH5ACTgI8LBUjqZoNk4gD83w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249385;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:MIME-Version:
	 X-OQ-MSGID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=fKGTplSFuZkys6Gs/DIwLD2p5FEp65r/thrub/uWGhA=;
	b=eJ6vrGk23mG30iB6lY0W3tk3u8QP2kcf5aVLAyzYaHYV2frv4qNItoyIHYNCfVkOlMV5
	 oyCtlVsnFQznrE/Bq0Xk9QHjVS4uZgCWw3AgETgsD/r1pqIAgMROAQW3+qmwiYjZ1tvCr
	 +vCV9Y/HOfbw9awt99e0ARO5joG+Bl+SfozNmVFyEKigTLui5oZ5DSg6ZLbghQFtRUuEh
	 jY1JvphW6oVVl4S7Wf37zwL3aVX5JaMydQQbQYxGicB6Ho70NBi97gpmgPBChwqKs9uNy
	 u4BwKL99v/3Vwf59Lucd1yGfhbH8gF6OY+FzdZUjLVPmqZczZz1NS/SY5HmAhPyRwwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=pAWWG7IJ;
	arc=none smtp.remote-ip=203.205.221.190
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6F9606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=pAWWG7IJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795249375; bh=fKGTplSFuZkys6Gs/DIwLD2p5FEp65r/thrub/uWGhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pAWWG7IJw3ooaTTZU9aZvSXfTjvcnsieB3EoQMrcdtRz+WE8DsHXWCY/3vCw1VsQr
	 sqZFU4jUXtWEwfSjAsLG/YvH+BbblxrCnp7MOGFZnOLGpJKqOZzmUAExKj80jPxexo
	 O7DrSTO+WGKGejvPhcHws76SYX3jhgj7kGEbTy0s=
Received: from [172.18.4.77] ([202.113.185.209])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 5B5A06F5; Sat, 21 Nov 2026 16:22:53 +0800
X-QQ-mid: xmsmtpt1795249373tkdbr3ijf
Message-ID: <tencent_BB8EEFED1178A776D3B5A8151FED28F55407@qq.com>
X-QQ-XMAILINFO: MNnlw0eqe4ZE/SrzUrZCmkJAqD5g8jDXfNiRiQLEJUxqea48RP1KkA4gbys0kA
	 mnOIs2tsxKPsAjr71CaXYGSc8+ghRsynrKbknElAtCXSiO4wwpcdQa52HjFN31K/0SCs3WD8LAtD
	 zRz28uQIRJ8jrDT8k9Z6b/f6FLyUZ8wAJGAeEfWJmy3MYoVMGrJ3sWfnaC94hMtUgHhTUpfmBJW6
	 jBY48R1aZV2Gu/uCViF6mPqvHZenWhoFNDifqa6yEtGiNG0y6EerrVAXUdaR5Xjrug5kNh83RNsI
	 MApBIv8wZyhzyMi6iQK76F+YBDhC0TAp1TwO1wd9AUVj5XKaj8JAdDLFvNLN1e2nQiW76OeqqsuH
	 hnueTItdhwkPLxX1zT3AnPfREtU1HIYdWLtvxxSGsOfSJ56seYyzc51sFlH99ZOrD1/kQXFGr4Un
	 TuUpEDaHpY8nMA69bpMAKXygzslS0ZdIqR7UeZtDxxlQ6TG/uZ5zlzxUH+EbGYb1cA6BSRmHEIYg
	 THTUL2jZhP9PMDit69yY7dElpB1l06R+ui5MUi5qafsHh8ubqtkRuB2Oq2cKTucJkKrXfglVe7gQ
	 K4LeSaONMk71CRRwS9TigiN0v957YGEDqCeE+vc+uSnxm1whfLNF+anjRRvB96pGjG+ofAx8JcgY
	 fenV3GtVQ767TlXhA8TrS5w6cNmAUnWYIWT9BOvNPedxde72jk/NBgt5CjUQl/Fjz9EpQYlEvEjP
	 b8liqqA6MhpNyWGoCuB4Uy446nOoHLw+y73OWRGFZhmpjqNarCsM3uoQkXcKGf7wXMDPWeM1nr7B
	 AF2fEhD/wBRyhdszlBkAna1T8heAFjSPQ6jopMcYIoI/Ub3Mh6LmgXLN2N6siawwxfl1XjVMaUnV
	 y3XEBl2qtIFJWRymz3ZesrWiKOpbXY0T1cbHbKtwbwSNxdbEvWErx2JQEGdytsTk072b8m61GrwG
	 iZbFrZtn5VbFCFlsjmhi9JI0MGRYqddgcjdqcCfQWmu/h86l91L19F3ILlcdN4XFctXRQl7xZfim
	 c3yUH0ivCm9HRCxptEZdREFyiH8JPlR3rsdegJo9FB4oxUIUyXkk91seUJUEpKKZyNuwVlJTl+yR
	 KnVyHwuOo/Fo0ihfoZ9G8Hdb5bxEso3NGf6ePoGL4YsOM/8rBEEhdCNjZRJPYHzir5Tlp8KyMHXt
	 mHhB+s6me1mOasnw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Guikun Yang <yangguikun19@qq.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: f2fs: a same-name dirent whose target inode has no NAT entry hits
 WARN_ON(1) in recover_dentry() at mount - kernel panic with panic_on_warn
Date: Fri, 20 Nov 2026 22:00:00 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OQ-MSGID: <f2fs-recover-dentry-warn-list-20261121@qq.com>
In-Reply-To: <f2fs-recover-dentry-warn-20261120@qq.com>
References: <f2fs-recover-dentry-warn-20261120@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

(Resending to the list: my previous mail used a nonexistent
list address linux-f2fs-devel@lists.linux.dev and was rejected;
the correct address from MAINTAINERS is lists.sourceforge.net.
The report below is unchanged.)

Hi Jaegeuk, Chao,

Mounting a crafted f2fs image with fsync data to recover ends in a
WARN_ON(1) during mount-time recovery, before any syscall beyond
mount(); with panic_on_warn the box panics at boot.

  F2FS-fs (vda): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
  F2FS-fs (vda): recover_dentry: inode with [ino:xxx] has invalid encrypted name
  ------------[ cut here ]------------
  WARNING: fs/f2fs/recovery.c:223 at f2fs_recover_fsync_data+...
  Kernel panic - not syncing: kernel: panic_on_warn set ...

## The path

fs/f2fs/recovery.c, recover_dentry():

	de = __f2fs_find_entry(dir, &fname, &dentry_blk);
	if (de && inode->i_ino == le32_to_cpu(de->ino))
		goto out_put;

	if (de) {
		einode = f2fs_iget_retry(inode->i_sb, le32_to_cpu(de->ino));
		if (IS_ERR(einode)) {
			WARN_ON(1);                       /* :223 */
			err = PTR_ERR(einode);
			if (err == -ENOENT)
				err = -EEXIST;
			goto out_put;
		}

The recovered inode's filename is looked up in the parent directory.
When a same-name dirent exists but points at a different ino whose NAT
entry is missing (blk_addr == NULL_ADDR), f2fs_iget() returns -ENOENT
and the function hits WARN_ON(1). Nothing on the way to the assertion
checks that the dirent target exists: the name lookup and the inode
lookup read two independent on-disk structures, and a corrupted or
fuzzed image can leave them inconsistent.

The mount is enough: no post-mount syscall is needed, the recovery
walk reaches the entry as soon as the last checkpoint carries fsync
data for the crafted dentry.

## Related but distinct reports

This is a third independent spot in the same recovery walk:

 - recover_orphan_inode() had f2fs_bug_on(PTR_ERR(inode) == -ENOENT)
   for an orphan whose NAT entry is missing; fixed by treating the
   missing inode as fs corruption (downgrade to f2fs_err +
   SBI_NEED_FSCK) - that fix does not touch recover_dentry().
 - do_recover_data() cross-checks ni.ino against the node footer and
   hits f2fs_bug_on at recovery.c:698 - reported separately.

Same family: an ino read from one on-disk structure does not resolve
through the NAT, and the recovery code asserts instead of treating it
as corruption.

## Reproducer

A crafted image where the fsync dentry entry to recover names a file
whose dirent in the parent block points at an ino with no NAT entry;
mounting the image reproduces the WARNING (3/3 runs with
panic_on_warn=0, panic at boot with panic_on_warn=1). A control image
identical except that the dirent points at an existing inode mounts
and recovers normally.

The image builder and the run script are available on request.

## Versions

Reproduced on 7.3.0 (self-built, panic_on_warn=1 for the panic
demonstration). The WARN_ON(1) at recovery.c:223 is unchanged in
current mainline. No report found on the syzbot dashboard for
recover_dentry/f2fs_iget_retry, and no list thread found for this
assertion.

## Possible fix direction

Treat the missing dirent target like the orphan case: log f2fs_err,
set SBI_NEED_FSCK, skip the dentry (the recovered inode keeps its
name from the fsync entry) or fall back to -EEXIST handling, instead
of WARN_ON(1).

Thanks,
Guikun Yang

