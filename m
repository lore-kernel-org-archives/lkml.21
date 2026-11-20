Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245739;
	b=ZYYioot3WFMnO51EcKARb6ZCdbM31A2ZaJ/TJXJ3hLSVPR7AerIzK7n0WC2RdZ9/8wNh
	 /e0U54uBhdA3aquolDWd3V1YviGrPPOmEsoemc+COQSOTD5DX5zxNnMMszb1G9OLv3+Py
	 Zed94f51VzazsRAiJEBk7T7iTpmXApsiKMNjk9UtJjSfK88sORIEBKizHnu3CfGjfFEE3
	 ecLQhj/whLhH03I15cAF4aiXhn66TDgJkPDYnmRrmgwEughO3wutnI0W8XuxrfsJFhg2p
	 s8HJaSh07hdixcPkkB+kWSUj2vGOlpCrShaj/8U1v848k5Hdw2a0bWX0DC0lHESIyNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245739;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fWPTVdLZKQdLVpLGvu6ADbd0Jrl0EaP9dm5o4mGCfIE=;
	b=Cr1GWXOhNWNwSKyOZIikmFXhRUtNSrgr9VFDmpdP1D0WkyOiGndEyC1tbSQg+PK0XYGm
	 +u/cz5ZXXFRj2B1qlwJNmTdWCG/6e2VBv/9Tota2y4O9DFaP18vkA+DW6avVFV8XVH+QE
	 n6Mi3NyG3UNTHGJwsAFupmzzwoaP8Yq6TkJe1zfVBQ2KIZ/UonEvnk0hC2ypPTbu4L7ci
	 mcGFJLgxWkO6ItCDNqSsi0Ofg6NurXZBlXaQV1+p4vbY1xe/pIKKQlIovtaW7FaQ1DacM
	 8FlNXsz/JrdbpWtZq7Bkea49g5/1Sh11r1TkigDSa5Xs2FZ3YS6feWA2b693YjheqwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=wTzX6Liq;
	arc=none smtp.remote-ip=203.205.221.155
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8DF606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8DF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=wTzX6Liq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795245734; bh=fWPTVdLZKQdLVpLGvu6ADbd0Jrl0EaP9dm5o4mGCfIE=;
	h=From:To:Cc:Subject:Date;
	b=wTzX6LiqtlbUOgvh20DG5FQV1MyZgSFokSAdgFpuyM4ao1FIZpX+S8qVaTViw6w8O
	 yz/GGKL+tjNwjgHe/TJ+4SbxRXyBwEEeEBpdi0bUgfJXrBBfL1NWxIksEiP9H7uuu6
	 kQNN3ThCsd0evIf7NNSaVlR3jgktMBOlXHvmY8qI=
Received: from [172.18.4.77] ([202.113.185.209])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 58C2D4B2; Sat, 21 Nov 2026 15:22:12 +0800
X-QQ-mid: xmsmtpt1795245732t45esk625
Message-ID: <tencent_530751733E95518BA97CDF3C23B34E0FA608@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JubfUYDCE4nAWl5/jdCFxR1lSRHLuO/QY7iMZCQohX8GSp0vA1Zt
	 Wt6ouUvfAsuXCrEPfiItc2qABpQiaE0uzHS8Sjwo8Z64ju4zxhXK1IGF0n2Oj2CVXjiqShgNlbc+
	 xqOLK0XOXcMtUfNcG1yrIsIXxC1AIm3w6kCSuAr8hMxSCTpXqky3F6MqjLPV/KJstk3dRtJEngBW
	 GPL3c6Slj139lKKuBNamLELi7se3tNH3OthpB1HkpVfds701WuZYPkfHgp6ZNGcId7SsfPcXCsqo
	 TjNlaW0FvvDB17T0C/A14ilHhr7BzjxhUwY1aajLByj4oXFS8dgr5KN2AHLQmlgSdmW0jcXMR6it
	 SDBO82bhOBfvxjyw3tMdrUcVZKtIcLG2zJhS7dsqXWZ38itUA79PwSEN2/AGXVcp1VBQZvQM0Mov
	 6ULvdbAwy5zK2opR+Do8rAfgkizC8Ue7WDOitjEXbCaSDtUnJCjYC4GgpyayKa/kGU+K95L5oVW8
	 weknU3NVmP1tZBZx9QvRo9v+MiFQpCNHvlGXiyExDClgvUzw4OYUjs40L+BOAKHaUzIlwWInBAEd
	 SC3hz8JmHu37s6cooxq3BKqGPHsNBh8ear0L9llv4Od/u8FVutRQZfSM3cn5eJ1z0JyGXT8fu8FV
	 ODG79757uSDjuhI5lQOvmvvLvPfJEyyl7thwuZV7bUP/jxS3OVAlyeJsE469NsYP+G/+6MUquGXu
	 qXiTjwjBTH+w9BQIabO7bH4OP6z56vRqnYo/R3XDLHIs71jikCwkUjewz1UmpfDVxFjTqOQ29JTa
	 rw98g/NVnZwXa15Mopx5tfM9nQDPQRXXYiTvbDG/0h//87mIyLNt5WBbXom2KwXZw5+fM4WyiMCQ
	 dTplKLE6Vmygd8wrsDxPR0pGco3rgUU3GtkzVDzXZ6nGLnrdSZKVe9jmmLuH6SP8PK2k49NQ75Jm
	 lXZGTcN2OCbeNdF1WqJEQM9oQM6r3yV2IHB5Z7R1bgMnJs9P8GZD9KLMtTId+hOdzKwGWJHB12+L
	 UOMLjUOJbHnRktm3YuSGbIVkhXk2GDboCKtA0FmhjTHYEThjaem8PEsxEGq8UJJyE+YeNKRQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Guikun Yang <yangguikun19@qq.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: f2fs: a same-name dirent whose target inode has no NAT entry hits
 WARN_ON(1) in recover_dentry() at mount - kernel panic with panic_on_warn
Date: Fri, 20 Nov 2026 22:00:00 +0800
X-OQ-MSGID: <f2fs-recover-dentry-warn-20261120@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

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

