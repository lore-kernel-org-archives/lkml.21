Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414436;
	b=GFQIK78UbI+24KLnprCFEBlOs4+pQYEMQkzDCZSMr3hoKXt050xypU5SFjeOUl/nZZa0
	 3C2PSZbJp8zcuS1nzq3ef/kDV6Q7Yp8c8IX/khDyPZER2YtmyqxhN79JFGqfdDVu6X3Ad
	 /sIt74O5c7MZ5n9L9k1URL5O/yiWdKBjeNwpZfhjb+JK3I8vO0Ov7wLLHW0JCM7aRSVou
	 E1BXmcCV/lLoi0UFpDO4HrZfCg2IXJ3N78wzvXGpWo0cxED9LtdkaqUjZHKs6Mp+ihPD/
	 Drv0O+8zYZayAi5KG67qM5I3K6f+xluMujLIM3enUccT1jWvomGLgMAPAPQyuI17eAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Subject:From:To:Cc:Date:Message-Id:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cC9gVRTaITRF0x2YlnTwc7AlwbCdAsD7C4t5cMZ3xTI=;
	b=ekciTYXDih6iffq0YqiNljU0uZau/y0v4gG3vvOw8t47dMTvBa6v+pzlHFAoQtRewkPE
	 99D+wUpGpwg4T1KeRcywiNmnVnSG9bZMuX064m1sFbVEatixHOAWHEyHRv5IhB/O3AwiL
	 Wm46i2iOhs5SXYrD7OqXhl6fkJMknCZVo0U1XGMhixRkks2SplD+1PHxV4crbLp348W6o
	 3J4oQlEL9dCJo97+pPX2IpLbVhz97MGE02N0bouzPII6pigWLVVtlXli5jq3o0J+f2ht1
	 8owhTOJ4TL44UoKtNpRIpjBNeoBn1weMAtmUmQJmTu3yUT667TudcM3UGOvhcgo5VSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nfcm9uwZ;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4CD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nfcm9uwZ
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso2154411b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795414435; x=1796019235; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cC9gVRTaITRF0x2YlnTwc7AlwbCdAsD7C4t5cMZ3xTI=;
        b=Nfcm9uwZJ8n5gEGg+pvKMQq7yLjdaz0k6PcdsLDvEmFg37CbvZqRWaGY5r0PDHxXwU
         HsKQUpGpOKiLpXqf/PAtIf96QWp25TVb4LAsv1Ckp7YYgDSJvlv9DRHbZ0BgIyhB5Uya
         00H6ZVRavUqozJnV3fLy2LLGvOss3YSXaq9pyqRop2uo/x8ceWhpiUTmbfVE4ItiKAHC
         E2oN0qhve7mLPB/dJZRNhpUfDP6QijgI5JRYinK3FCxWvWXQXLWtTz/UnpF2uWQuzRFr
         BVyvnVHbt6MhmUz39tLmgz7GFQi8BEgd1xvVjIsSsIn8M0p/vX8OSbMavRMDRqZeFqZI
         iVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414435; x=1796019235;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cC9gVRTaITRF0x2YlnTwc7AlwbCdAsD7C4t5cMZ3xTI=;
        b=T9cO/DuwZyO+Mhjn5ubQSveuHaVEHCUbCyDpX3ECQ/vopwrObiGTIzsnRjUW9Ry/Tm
         rk7mmHaenqsqKVkdMoVP3wENk3TwTXl8jp2/vpPViP+eO7SMK+PzG0kGlqR2GgRmfBDs
         zD4Vq0NDG1c/bX4AttUZqUoLYwQM5hjXnsc9DP729l/ZXpABx1wD3Qqab5UcFp4QBa8j
         IXfZTnMw8Rq52IrLe7mkJy1OhN6/MciDkP7hc/kvaemePs2Dqi/kVHYr9oKLcagFd7vw
         3FuK2OfvuJ6kbTn4s0AJA6z6ObOQH/mJHpzEHUF6q1E9pQGYEmnE4Z+OFJt3QxjO5m2B
         MhiQ==
X-Forwarded-Encrypted: i=1; AL+hErFPw4nEFfn9lgEv4367ejvPyalGC/zBvw1659N08OKxZ2GEMLMhUcKmTUSDNvzvNvTb8F85wfjsGLJ3W58=@vger.kernel.org
X-Gm-Message-State: APuU4Z808r3DTWRBWDsDNwvqvXsILSOAeyR9MA/sgiq4VFFfL3+tsxDF
	fQSRQXMpT0zh5tPMZdXeS+8BXa+ZY0/tVTbZscbEtIcMbGRTDfAWVUkK
X-Gm-Gg: AZFdTZeWgU1f58jTjgV6eNc56k25RP9eiwEv1CbmWgOXHJXYArx/c7RPk5EpZtlDLEM
	v+Xqy2iK7/KkmLhWcURllnQeemQlz2A1SFZ5Ljn+1zszN86DoTSEW2l9PGS6AnTVcZbOFq5lq3I
	TEmIhdT72af4B58+ZCQBCFOJ4qhTA3kPSHM6hTtzR9iGnVVAUvh7DsaSsxysPDgDEnRz8KU1S1m
	5ch4kRSZDNPmbe20iL5ZuBsIZWQ1jlZ964Xxg8Ue75HhZUqv49B3VqS1EzkufkgFmK6yYxVJwQP
	Azdr4nO1m3ImdXQ68ZYkqXc05ZzMaKhYI4qEhukpTGyR4qpB+1FoVfEf/S6glo9UdLY5/2bp7fr
	TcV1pruPxe1Bx9Vjg9y13D+wlBDSiP5WqVt8ILlwJu9LDvzZp8Utxz2y0POPJswVI8zLevU34HD
	3ab631H/9wJB9UgY7BknAWH7AlohKTVxLY9wwmlcteZHOT3ujXVq78h9tki/IukToiiBda+UUot
	2RS5Fs7SAbPwRnKMRzIt8SlhyEohiZHdtzAVYY7kPnM8Owd1lHtRND08GNDknqNfVxIsc8OHNZS
	T56VFvJyrFzHGj731HGCBvfd54ie5CylhwzF8I32N5akHQQEjrlbrjvxGB9fQ4sbQhJAgCFr5SP
	/cFBxEttEyYQMiAcPV9tTSXg=
X-Received: by 2002:a05:6a20:7f8e:b0:3e2:81f5:a864 with SMTP id adf61e73a8af0-400aea11bf9mr8689588637.41.1795414435189;
        Sun, 22 Nov 2026 22:13:55 -0800 (PST)
Received: from runnervm0hi8g.cxrikbqfcygehnd5bg50p3ctfh.dx.internal.cloudapp.net ([13.83.233.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d05c0cfsm4644962a12.26.2026.11.22.22.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:13:54 -0800 (PST)
Subject: [PATCH v3] dm-integrity: reject recalculation when recalc_wq was
 never allocated
From: Yang Luohan <ylh440104@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 23 Nov 2026 06:13:52 +0000
Message-Id: <179541443270.2416.6401739253063141536@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

dm_integrity_resume() re-reads the superblock from the underlying device
so that it picks up the flags and the recalculation position.  The
constructor refuses a superblock that carries SB_FLAG_RECALCULATING when
no internal hash is configured, because recalculation needs
ic->recalc_work and ic->recalc_wq is only allocated when
ic->internal_hash is set:

	} else {
		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
			ti->error =3D "Recalculate can only be specified with internal_hash";
			r =3D -EINVAL;
			goto bad;
		}
	}

The superblock that is read back on resume is not subject to that check.
superblock_changed() only compares magic, log2_interleave_sectors,
integrity_tag_size, journal_sections, log2_sectors_per_block, the salt
and the SB_FLAG_HAVE_JOURNAL_MAC, SB_FLAG_FIXED_PADDING,
SB_FLAG_FIXED_HMAC and SB_FLAG_INLINE flags, so SB_FLAG_RECALCULATING
can be added to the on-disk superblock while the device is suspended.
Resume then reaches

	if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
		__u64 recalc_pos =3D le64_to_cpu(ic->sb->recalc_sector);

		if (recalc_pos < ic->provided_data_sectors) {
			queue_work(ic->recalc_wq, &ic->recalc_work);

with ic->recalc_wq =3D=3D NULL and dereferences a null pointer.

When the recalculation support was introduced, the call was guarded:

	if (ic->recalc_wq && ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))

commit 468dfca38b1a ("dm integrity: add a bitmap mode") dropped the
ic->recalc_wq part of the condition while restructuring the surrounding
code, so the null dereference has been reachable since that commit.

commit 875a7161fe15 ("dm-integrity: don't recalculate with HMAC because
of a dirty bitmap") re-applied the constructor's policy inside the
SB_FLAG_DIRTY_BITMAP branch, which avoids the null dereference for a
superblock that gets SB_FLAG_RECALCULATING set by resume itself, but the
standalone SB_FLAG_RECALCULATING branch further down in the same function
still queues the work unconditionally.

Reject the superblock next to superblock_changed() instead, before the
journal is replayed and before any superblock write, and restore the copy
that the constructor validated.  Checking it at the point where the work
is queued would leave SB_FLAG_RECALCULATING in the in-memory superblock,
so dm_integrity_status() would report recalculation as enabled on a
device that has no internal hash, and a later resume would take the
stale flag from ic->sb and write it back to the device.

No path inside dm_integrity_resume() sets SB_FLAG_RECALCULATING without
an internal hash: the bitmap mode branch requires internal_hash in the
constructor, dm_integrity_may_recalc_dirty_bitmap() rejects it, and
reset_recalculate is rejected by the constructor as well.  The flag can
therefore only arrive from the device, and rejecting it after the read
is enough to keep the work queue call safe.

Reproduced on 7.3.0 by loading a dm-integrity target in J mode without
internal_hash, suspending it, writing SB_FLAG_RECALCULATING with
recalc_sector =3D 0 into the on-disk superblock of the backing device, and
resuming:

	Oops: general protection fault, probably for non-canonical address 0xdffffc0=
000000020
	KASAN: null-ptr-deref in range [0x0000000000000100-0x0000000000000107]
	RIP: 0010:__queue_work+0x95/0x1030
	Call Trace:
	 queue_work_on
	 dm_integrity_resume
	 dm_table_resume_targets
	 __dm_resume
	 dm_resume
	 dev_suspend
	 ctl_ioctl
	Kernel panic - not syncing: Fatal exception

Fixes: 468dfca38b1a ("dm integrity: add a bitmap mode")
Cc: stable@vger.kernel.org
Reported-by: Yang Luohan <ylh440104@gmail.com>
Signed-off-by: Yang Luohan <ylh440104@gmail.com>
---
Changes in v3:
- the v1 patch checked ic->recalc_wq where the work is queued, which is
  too late: the journal has been replayed and the superblock may have
  been written already.  Move the rejection right after the superblock
  is read, next to superblock_changed(), and restore ic->sb from
  ic->sb_copy.
- the v2 mail carried the diff twice by mistake, so the same hunk showed
  up twice.  This version sends it once.

drivers/md/dm-integrity.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3941,6 +3941,14 @@ static void dm_integrity_resume(struct dm_target *ti)
 		goto skip_writes;
 	}
=20
+	if (unlikely(!ic->recalc_wq &&
+		     (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)))) {
+		memcpy(ic->sb, ic->sb_copy, sizeof(struct superblock));
+		DMERR("Recalculate requested, but internal_hash is not used");
+		dm_integrity_io_error(ic, "inconsistent superblock", -EINVAL);
+		goto skip_writes;
+	}
+
 	if (ic->mode =3D=3D 'R')
 		goto skip_writes;
=20
