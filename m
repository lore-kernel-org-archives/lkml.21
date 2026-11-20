Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188696;
	b=NXz9zwa6jmj+cyPzaGeckYGSeZVAbEN+dlNp0FH8yi//gGcxj8ySP6O4PC01XvjIXgNy
	 erAAj65hKby8KonnBTQQlne0wrWU3j97yfVsd50DDIaeb4gk3WcBgAQAWf8jLyyEfnTzI
	 RbimtSp5aA8sj3C+VgpvAlbBdGPugaRdsIKFLyXN4Hdtxf1Cuf0O8phWs46X45vcjNRuw
	 95XeiJMJCm7ljFD9pNyJ+JQYiB0hxgwXGFGbTkgm1TXb5fUR/QS6otDHeCsQvREX6vr2O
	 dHCoemM8s0lptbygnlleWNT2fVIMHQWcGMgl8z+tF8zenuZ4gFwrWUNqHgitq0DsO9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Subject:From:To:Cc:Date:Message-Id:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2Fk1w9jeAUcBKJwd/lnefIUkj5jtEhXzNyw129b7Mp4=;
	b=SK2xv9CdbmEpOSWl9mY8+JSrofQlow8fnchnCHipY1wAu2Lv4jlOMAj+9HkqBklGtmmR
	 0g+BhII3UJmMhK+tZvICA2lMg0qvHW9fI1yDBAB9OCFj2d5iWwH3UEb81YUfgaP+w6J1G
	 0nZmWaK+5T/WCzkdCt2mA53zY8/Wg1T5VKCy7tIcM7IZjk66vcXCLdH1xVhgu3ztGOElE
	 FRt0GWkezG1PxkkUh6jbEbZAqjeRmZcgkXOO5dOaK0/c/nqglsSeLJ3QVjD2eM3pCTBNe
	 DPjckICSRUlVuaFrXWedQ2ufHrDdjR/jtrNc6rpeTersMm4K9sp+LChBbKwsYIxlptQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGp90viJ;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE863606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE863606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGp90viJ
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so620334241.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188695; x=1795793495; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Fk1w9jeAUcBKJwd/lnefIUkj5jtEhXzNyw129b7Mp4=;
        b=kGp90viJRo1P8ykjTv6ctPMZgAZAyrKfC2ShhP1c259bRMR3ALdkN6hzjGTtdJDpth
         xbDp2gnhsSFQA7PSRXrTbBe2F9NP9jtmFY2rOwoFzzqz63zJQ4PAvS/IRcrIJKwa1OsT
         90HL9lpH87ah/035ot26ZSViy5vr6wGJDmIvQieiG2k+fIMmiIvx7Pf2v744Qa3D66wD
         Ja5Il67DcigfsIJoZQth7oP6UAWv5gKr5Q3bTWSARq/CrC0vWGjicQG8zClZDC5UsiH6
         J4sQXvMpoWjTKIbpKtu0IC9QnPHtf+RB+TI9/NcUsOIuRZIR8taDaO5qaZHgYa6QPMz3
         DgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188695; x=1795793495;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Fk1w9jeAUcBKJwd/lnefIUkj5jtEhXzNyw129b7Mp4=;
        b=xVeAJmCcSheEHmL4CEjHVAviCYVKSc6Db9Lk8hBiVGR8U4yci1F9EysRWVAe33154N
         RRZr6uSZWqc70GNmASHDiu58KWYU8BlFaWDKbikBsw50jOA+NrOI2D1DcY6xar1dIqCw
         7fG0Nntflcu1od3eZqSvfzEbnP5iIaTbIP0SMLJ9BzVpRexGyXKAcMYRa/bfv2p0IQ6O
         eZavjtjEzzEy+DLG1NKKFPmHutIcfFjVhMQwF+Oay5qJDS4XyEgVE2qwjlmCFtZ7Gj2X
         oLEyECZstk3aVep/2N0g0URIFAknn2M3gSe90Q1PcNpv3qAMgzbHlY2OolCzD8IPjsLF
         uQAg==
X-Forwarded-Encrypted: i=1; AL+hErFRM9lRTkzTE85IjQy7t1fpyqjvooKUALZV8ES3ap5JRpIxbxP695LJoal5/csqNLbimtwFk3JEgd7rK6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C74dur5w5glS6WAbLkRIdk5vdU0Uy2JVTJFh1wOwnS5+5LX9D
	Jqd4nrvNDwuCZ+SOfi+XCI00jDITz95GtFEoD1o5R8kz4pGPviyHh315
X-Gm-Gg: AZFdTZcA0huoWhTNR2xKMZgwZV3CjeXmgVv2kJoVJv527IgaZwD6XH1/Rcdgu0Dov5v
	AjQykVN20o662rn1L67q3L4aUcZtHb8c4xlBx1cxXhACWMC7iSjk4cbIjZobUnMNUBAgWV6etpx
	bOBC/VPS+FI63XZSwO+B2ZexMZHNYE8DZmJvojrweFme+yfiJAJ8OAky4sskj0I+4BWSCCvlFIL
	i5wxb2LE9Fg8W2H+NNGZ4sLDd6LgChXnOg0tOIHxgzaoVJOwHdnptnVEchXKBQmKhBrrpMpp4bV
	rklBCANJUpYOQX2QD8wulp/DS1Dc1s4lP51TjXn55jhHmKoCREZWNsLo4SZFe8Hnb5josRMziRI
	bnV0fcZLGrLeUA/Shvz0mZygsJhP8MeRukZkAxYRDZqeWyNTsNK1u6kHB+GjrhqMmlUC6xmxI2q
	3sSzYBTynIHp8qhtvrpcXaNyrHYW3BSF4I/dJ08+rQDi26/Rtgv/aGiWa+xGEVdxpZj1j2VVVUX
	djATcUQEuRfzmM7ObaX2qkJY5d88QH5Eh7y7LtxlLsD9pJVsqV7Xt/UC55986u/JlwqR5+1tA72
	uAQFScUtLPxryXAE2/9nrUuULoBAkIhMobb/lRTRPv8IGk8hX8zwL9Z2DrxkKslJLL8fdI5QQvI
	hvtEU9n6T0+UuQR8d6sRg0nF6b6BDvrmDuNsLfukDyLfzySY=
X-Received: by 2002:a67:e7cb:0:b0:7d0:6e40:f3e2 with SMTP id ada2fe7eead31-7d7396249a8mr1610590137.28.1795188694660;
        Fri, 20 Nov 2026 07:31:34 -0800 (PST)
Received: from runnervmccnms.p0xmmthrhzuuvfcj5u5s3tz0nc.bx.internal.cloudapp.net ([74.235.125.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b456csm28334916d6.13.2026.11.20.07.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:31:34 -0800 (PST)
Subject:
 [PATCH] dm-integrity: reject recalculation when recalc_wq was never allocated
From: Yang Luohan <ylh440104@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 20 Nov 2026 15:31:33 +0000
Message-Id: <179518869380.2402.12815883988413214937@gmail.com>
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

Check ic->recalc_wq before queueing the work.  If recalculation is
requested but no internal hash is configured, report the inconsistent
superblock and leave the device alone instead of panicking.

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

--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -4046,6 +4046,11 @@ static void dm_integrity_resume(struct dm_target *ti)
 	if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
 		__u64 recalc_pos =3D le64_to_cpu(ic->sb->recalc_sector);
=20
+		if (unlikely(!ic->recalc_wq)) {
+			DMERR("Recalculate requested, but internal_hash is not used");
+			dm_integrity_io_error(ic, "inconsistent superblock", -EINVAL);
+			goto skip_writes;
+		}
 		DEBUG_print("recalc pos: %llx / %llx\n", recalc_pos, ic->provided_data_sec=
tors);
 		if (recalc_pos < ic->provided_data_sectors) {
 			queue_work(ic->recalc_wq, &ic->recalc_work);
