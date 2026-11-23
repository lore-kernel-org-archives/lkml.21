Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400127;
	b=F606OaeqjYZ0EhVmJNDe1HbpbS3G2EiB2twWZ7psqKeZiL2Pi8oEOjDsmeOc25v+cXAe
	 UOO5G9oRkZIpqbAyqhRWQyKilwDxBEpRu6i+VCtjOBWVMeU5tYpcgmSWrFyhs/bI9qW79
	 k+1OjFX8ICJsBtHFHqWSJEqvET0r7qzBHe4fLI5+P9HgkSfluxCxghYGdJqfZAO7H4fMu
	 n4I0CC3iat2U48mV/LCBqhp74+r32znBds03ww8bHJELYBS2pY7XEdPxR0IaoiCSeFkOQ
	 cRfmPHMnzP/cP5XOfTThHHft44KqpjLu1XQwOlBZpo12XeVRQq9G5cSOGa5MBIVXoSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Subject:From:To:Cc:Date:Message-Id:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Rkyx+AAwBDqEzfOhBV88iO5QEcgZ4mRADs3tiKBytS8=;
	b=Lvg/6T6SzbTXmBJhUq4ntt2ycwt/03ytcnFo3I+1LaDWuAz2RO71fjM3B2GYIWNCaDa9
	 wTUxq18V4ps90XNJolbHPQITMoe+56pkXwrUuaavkZt+5lA1f89rFbGVbAyrrUU5bU1Kb
	 GDzDoWzSQf4P43AKP5a/pt4WpriVamJ0Mg/DJsmCkJxh0VaNloHDy0+PGiFQ2cCximU7p
	 RxXyQt+2tmVxbj0RiIjsHNceXbcRCvDQ0g5EhAiWBsevcDcGdsh8UzfeQJGQUrpior/Zi
	 EXiaurUbtzJPbLOlJBnDqsjWmSLadUQ+iAgQve76pyLgpjludTbRq0jV9rm61y/LgIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abCqdR9U;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E38D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abCqdR9U
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3863db981d4so3636963eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400125; x=1796004925; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rkyx+AAwBDqEzfOhBV88iO5QEcgZ4mRADs3tiKBytS8=;
        b=abCqdR9UPPu9WY9DzxZFcTfTk8cu5u7Kk2hp9TCsZBerGhLkZeHdZVlv7dJUuMK8on
         1TKSeBD9FTQAQTGaRoTXMYnmJSSAGLMmPzaFtzdGveMXnvZmVG4mtlODk/35Q1bTWiJl
         kpv3GH7HwCaOcfugh05QI3Cb44uesQRBU6lbiy70C+pq6RNJWMczXScBuksEmc8Yaq2F
         a1PFp0Peee77Ytw6NJ2bo4gEJVwUvCE1sjDJlP5ply5aoafrzuAkgWPeehdfh8d6dCr+
         GDv7NgEjQr2Uqqn11ilp/dzG0Qq22UTk0LX/JvkSCTj2LfN3lbC/tT4dLVZ4VPYvUZhp
         2TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400125; x=1796004925;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rkyx+AAwBDqEzfOhBV88iO5QEcgZ4mRADs3tiKBytS8=;
        b=KS6PeAh1qR2h0Kz6OmnTPF0ZBu7unxR6FQ4jKiBHbJRtQlPalEkktq6/LC8ymeQMRY
         hU24ZO6dj8rnalaP7VgklMr3OMHtQY1MAUaKLimVwkksBLQqbY7Ok3A2X+6tJrYfL1zS
         PDyvS2tmHsspr0jKyDT3ZBZAfRxLUwF/73718vRlVCiXGT/Hp4/zdMAT3Sq+jBmyyzrt
         1GeDPLu3IqJ9Cvdy5Gy3pplSc7ZgGzhC6NQn8QoHhjtzSI8a1f94/tIFtcZuXnBF+Bxa
         o4oGwP/sNQfmJXKiqBBDE9A7MZtCEo1nZWris38oAzHylsogpRPa9Cp8YZX7njvXMSLq
         7MbA==
X-Forwarded-Encrypted: i=1; AL+hErFgfIyHgmiRRuJZHDhhHnVo0OfE3P768xK9BmTAmOuy/o3pXVEae2Neo2FW+NNMb1J+7XWybm+McW92JDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z83ZCU2Cn5LTp6S9av+fUcks04hxir7joQ5e6dMfydE0fIzDPVr
	jmLrUnmS12pgk3GYNgHcfBALYdn9xmO5Rr5VIFdccgsU1QcKeMQfzpnz
X-Gm-Gg: AZFdTZdPiFeh1z4eCHx0MHt85LtYaDIIdo9IWUYzHJyyoDPufgkpRHkCIMAbpsDAjYe
	gt+v5WSUuGwSyB1UMlotxaC+29R0Kg/RsqRPWJK6MZLq8u9BYrj78qaXhG1llmI8ybWI/F08fPe
	mZbLg3NYF65tnVsu4eXSb22vlHGrBghR6WecIwP1M7SBhacSXZ4M/0wRzTrgdstv+MhnMtPYWe1
	YBvftFLRbbDVE60gU7GCqBe1g6kXXctCVJkNrgqrxmumjEV2x0ppkEbGcVmIlFfS1Pa3feISTFG
	pqFMeikKHuDQym5ZufjTIS5wOT3zspx8Vr9pp1Q2rwvnSdQqZK/gVyCoBoCAO2tCJuephYIXnLm
	wfKHP/djr7ILGspFEo/WlqLHGD3aFCQgglOLbmQn9AlT7H0QHAlYMgCbyieAvlcdxZx3+6tz67j
	BnDBR+ptFWCfaxI+aEIe60JWqN8JItQARMmzHy8N02PwNOe+vxNMHouh7zD8mQ2sk0m9pCb9MIv
	90GwTMu5dLou4C0be+ksmapxFKVV2qS4ONp/UhEXKMFJ3M/Qeiole8eQFTPgemvnqCVjzUl+WOQ
	kKgiKOiyFwWD/mqzI52L1k2jolMZQj701MO6DOi1K8KCbojnpAOfSow/61+rY8QtGlQxn4iod1O
	NFKhMl7ejwPN4l9hPUKf/62M8vmg=
X-Received: by 2002:a05:7300:f68e:b0:386:240c:19d6 with SMTP id 5a478bee46e88-386241b6d72mr8613390eec.6.1795400125325;
        Sun, 22 Nov 2026 18:15:25 -0800 (PST)
Received: from runnervm0hi8g.vld3mfsqhe1uncfgcs4bzya0gb.phxx.internal.cloudapp.net ([172.182.243.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm3021818eec.27.2026.11.22.18.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:15:24 -0800 (PST)
Subject: [PATCH v2] dm-integrity: reject recalculation when recalc_wq was
 never allocated
From: Yang Luohan <ylh440104@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 23 Nov 2026 02:15:24 +0000
Message-Id: <179540012414.2174.4959926607245086522@gmail.com>
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
Changed in v2:
- reject the superblock right after it is read, next to
  superblock_changed(), and restore ic->sb from ic->sb_copy, instead of
  only checking ic->recalc_wq where the work is queued

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
