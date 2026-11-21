Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795234452;
	b=ZqBADLxCe5UyHDKt6BwEiO810nnfmZcKvxBH9zu1Ls8Hs7zoVlOgLCK0fPhXQ6Asfv3n
	 82kEjs3yL7XYyloeQ9bizVgWFDQq3ZKXT8RThxBazCeK9tnJxO+DzXI+YAy0WhF2yBej2
	 gNXafEoRRZG8jNdGuZVYZn1CLzRuTRcY9Mz9WofnGOV6m2FeBtxfmbS0YpSUZcqzHvkDk
	 2OrUjBxSyt23psnPoRzxv7gTEB9T/1LYYtpzapG9cctOB5LF7kFj2qesJiqpLf0Mw7DH7
	 4/K1SrvmZbNzjp6rx7/VjHwXOFca7R7QjpwexzG6qGNldqdpPnT1U/dyrs2Axal1M/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s1oUBUVsJdLlZK0BnMYfKVB2CVE8s/YWPNE5QQrqzaA=;
	b=r9VI/iLtUJmxIA9xJSVULgYrAyQpvXBhvS3oqrOEUcmlNB3/nrlhdHWKIzQJvA0AaJ8p
	 UCJqCtFmoF7QbrXTmp0G2Y34pRgYg+7pI8B/X2SoolkFzpPod+XoWcSgO5Rjn4efb0Yhl
	 n9p9rYTTd/m76Vdtf89ikP1Xchd9UqqXeoHiX7Y1BqHkCUBMMaiMP+XeKfo/xFF7t3vPK
	 AwnSy/K+AYcc6Slt+R3zNnCMSAJwRn/KRyYYZ5PPsxCgPoIPpIqsF1HC356JvswHb5dYa
	 0aUld133bOVKo63gqU9CtEQB3TEzExybwbCa40mZAvexFNFOoFEzNvas42MAZ+EeKnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=perfloop.ai;
	spf=pass smtp.mailfrom=perfloop.ai;
	dkim=pass header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b="eD/tFb9W";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F141606A695
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F141606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=eD/tFb9W
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b190cdc9feso1041301b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:14:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795234446; cv=none;
        d=google.com; s=arc-20260327;
        b=DpbW26lXlB4dfKZBw6mOSRjXaqUIKtDZY9uWwABhFC6mtvozonLWbOqjWpsHx/trSM
         FdI8ub8llZvtp6yPnWrFr0DhY1oNZ8Hpd9KLJXT7yMQA01aHeo89o3Flwhvgh3XNeYuM
         wDQwo0p+rV2POl+/zZy8ShNirZM98H77U94NlPImNei8CtDj7XuM9/Z+L47WayV2ED/j
         aksN0ZS2+dGC0vJQx+qkg7lQ6YNa+Dtzomq/G5BBQFq0Db01KEmvXie4O4ZMJ8EaBqBX
         UY7BdLArEscB5ullh7jhWUomVF/OxdVrIYKcDoON2Xv9DytVSEeK4/g0i7chby3FVAhX
         kFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=s1oUBUVsJdLlZK0BnMYfKVB2CVE8s/YWPNE5QQrqzaA=;
        fh=fXYDVh5eI3O7+uodRa1sJ16DGiOY5gXXGoz+ZINu588=;
        b=mYc8O8H0YLwUJb8aKkmC4OmX6elwJLYMM+WQpvL47CIzhHKPf8efJ+Q1AVybQtOdU0
         sQ9QmYDMTEHuZEtFbkUceO3eH5xrzOCUdRVEJQHsgOjPcRuM5s17+0h2VctwhGzsBUXE
         QHKZHjASOynr3mjsiKHcZzVydQktYmqXoclaC6X9y9B7MbfcSUlIMEnUpiO6LkMCsKrk
         G5gLm6a0KyHIdjtYtp0W74fgtIe1oyNW7OvFFP1rBD2f6H/mXB0c4kUPWccX1oDNPlah
         DKy57kTd2HxcTPMU5mTduZ3ectZoCRH9SLVmu6gKwbzoWOYxonP1iae6XA9kqRc9wu7o
         bPJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perfloop.ai; s=google; t=1795234446; x=1795839246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1oUBUVsJdLlZK0BnMYfKVB2CVE8s/YWPNE5QQrqzaA=;
        b=eD/tFb9W0QTkZfqXX2nY5syzxoHKkMcvyjIGZ7Wk1DVYUwMwEfvGxY+UxaJ2PAVwxY
         uQ/yNcPc2mIkQA6v3NAk7JWhYcWgCV7X02rDRlNSgR1+E5S1Fym992p5q/+xwqH3bDUS
         2aW/FfCl3UW3jPngIzEVKSbwo5eRz+f2bPx56lLGX3nsqCCgBv3SpKk9Zi2NLLKeVVrI
         Tp6jDVbYVE9rx/Ovu/yF5YQ9gOb9ZPscWckCvNdwJlZTuSfB58YOWRs3Wxmfv5tuJgGQ
         nZzej4qYVdSJCcmyF41kXyDYTRcohlHjMIiB0AZQ98VGF9YidyUsb5LwXWmYNVB8SoeR
         jrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234446; x=1795839246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1oUBUVsJdLlZK0BnMYfKVB2CVE8s/YWPNE5QQrqzaA=;
        b=FA8CScHPmzxwDXt8OqZRDP/7/kmW1zqiPTDVrxk3DZ9bBdvzoIW00XLlHobNeboqV/
         alrsevgosy82WkFnknCmRpfpXqbhT12djucu08lIRde7o/4AaihGRXq16ES0Nuu021sO
         wwdlxpjLWwEaLUAwmAz6/768Ip+Pikkw8sl85ptx1TbyDJedflfEWkidQB1L/6+XgDp2
         +jcl0io6Bxto1u3B13skQrF61u5//ENrYBu+dsqT8+Z5maf06xkH4e+Fkxuj8kX+2qSJ
         NtCowAqJeAWMWxR1Ejiu4h0N9M1HdHo33fnaeTziFLGxJsoyKxXvwrchVKfvszX6VyhY
         Jtpg==
X-Forwarded-Encrypted: i=1; AL+hErEcp22E7Ffl390e90Tk8iOVGCiw4BoiSxxjFNWWH3SeUWPKdb2+dE7JrfHHbbttfBpRIJ2q6NkjY1gpd2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HQ6w9gHHcxm3ebCvPPBaaD0/TdHuV2DABYUr+imJ7Urf3PndP
	z2xfr2xEBxcU+BoBkDaG+MvI3PV3KUniNEm6mmQ938DJpHGFkLTe/vRCOawLVgoM4MqMX7EWEBf
	+kt5UUCzTBrAlPgpB/ysLG4lPs6au+Hk3WYMj9oDgsAI/VcNDGQJZtVuCldk=
X-Gm-Gg: AYBFou3e1uwZotYBdtoALcPtf1sk8k0Ia9oKP4bPMrg1+fMTz+oqHIwAPsdwjP3R3Iq
	Ueb1UnKQkgjUvicQblOLwEavDb8yRA/ymvxrIqNiCGDVHPAirWHdf/jqqjL9Ljy04eyv+Hcu10A
	QQIN3qXDyJ25Qa3Q/b6Pw2swkBcBkVJgeP6hzaG7/B+PPoHMDIoeVJccPGNIKWqYeOYR2d67w/g
	XNBtcptK4eVzKq1NRZbFBGlXir7gibENzOuJexIwyUG8gQdIOeIwqxWLwd1wzpA8oLkm5SDnTH2
	nvCs92W5nOR0cebIeGiZSm0Oy6v+k2cLFcRy2DML5trGiHyWliZo5toSNHTZOalcNK545EM23Fn
	zWrMczEvSgQBPW1bPv6OwVdogTWxXiRCB52qb9l/UAo3gDC6kFRJuoZwvFSzlNWlbzy17YZSF3M
	hpK272RjzEmOStJ43vbB4tinqNCWY+rBY5BI1iR11fGX8111tnUJKj4mwd02rudsqVnJ/w1Ahjy
	donndPxlTNztQ/NIn+ZFegpM5ZoN4BC8w7HXlQljHlhSlGPrhY/03j+MvT/Btfb57f6NGoOubyu
	9bzh4VooXyxA13ROFcImOJWGOlGaT8SfRT48S5nGUg==
X-Received: by 2002:a05:6808:1645:b0:503:8f9d:f11a with SMTP id
 5614622812f47-57a0a10c7a2mr5856561b6e.29.1795234446035; Fri, 20 Nov 2026
 20:14:06 -0800 (PST)
Received: from 202080787392 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 21 Nov 2026 04:14:05 +0000
Received: from 202080787392 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 22:14:00 -0600
From: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>
In-Reply-To: <CAEEBa3XJt0XU+5pXNQz_tjZyPEeEnY67i_QGupOnHLnXB=BVDw@mail.gmail.com>
References: <CAEEBa3XJt0XU+5pXNQz_tjZyPEeEnY67i_QGupOnHLnXB=BVDw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 04:14:05 +0000
X-Gm-Features: Aa3M54opRXm5ReTm4e3sjvrgM48zr-FpYqoMbn_tWRbU6Gsjp5HSemBksayrHS0
Message-ID: <CAEEBa3Un8x208Ox=20TTmGgcmdMSTCC41fB7SWP7uuY1N3xLPw@mail.gmail.com>
Subject: [PATCH v2] jbd2: fix fast commit recovery failure when the FC area is full
To: "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Cc: Harshad Shirwadkar <harshadshirwadkar@gmail.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

jbd2_journal_load() sets j_fc_last to s_maxlen, which is the first block
past the end of the journal, and jbd2_fc_get_buf() never hands out a
block at or beyond j_fc_last.  The recovery loop in fc_do_one_pass()
nevertheless runs while next_fc_block <=3D j_fc_last.  If ordinary fsync
use has filled every usable fast commit block before the next full
commit, recovery reads one block past the journal and jread() fails
with -EFSCORRUPTED ("JBD2: corrupted journal superblock").  The
filesystem then fails to mount after a crash until e2fsck is run.

Stop the loop at j_fc_last.

That alone is not enough.  ext4_fc_replay() calls
ext4_fc_set_bitmaps_and_counters() only when it is called again after
fc_replay_num_tags has reached zero.  A TAIL tag always ends its block,
so the call that handles the last tag returns JBD2_FC_REPLAY_CONTINUE
and the finishing call used to come from the next block.  When the last
fast commit block is the last block of the journal there is no next
call, ext4_fc_replay_inode() has already cleared the inode's blocks in
the bitmap and e2fsck reports a block bitmap difference.  Do the
finishing step in the same call that consumes the last tag, and drop
the in-loop copy, which would otherwise run it twice.

Reproduced in User-Mode Linux with 1 KiB blocks (mke2fs -J size=3D8,
63 usable fast commit blocks) and 4 KiB blocks (default journal, 15
usable blocks): with the fast commit area exactly full the unpatched
kernel fails the mount, and with one block fewer it recovers.  With this
patch mount succeeds, the file has all fast committed data, and
e2fsck -fn exits 0 with no differences after recovery, for the full,
one-block-short and three-fast-commit cases at both block sizes.

This bug was found with Perfloop, an automated code analysis tool. The
fix, this message and the reproducer were written with AI assistance and
reviewed by me.

Fixes: 5b849b5f96b4 ("jbd2: fast commit recovery path")
Fixes: 8016e29f4362 ("ext4: fast commit recovery path")
Cc: stable@vger.kernel.org
Signed-off-by: Tom=C3=A1s Senart <ts@perfloop.ai>
---
v2:
- Please do not apply v1. v1 only changed the loop bound. As the
  Sashiko review pointed out, a full fast commit area then mounts but
  skips ext4_fc_set_bitmaps_and_counters(), and e2fsck -fn reports
  "Block bitmap differences: +2113" (4 KiB) and "+32769" (1 KiB) after
  recovery. ext4_fc_replay() now finishes the replay in the call that
  consumes the last tag.
- The reproducer now runs e2fsck -fn after recovery.

Tested on torvalds master 65e4fd942f72a9dba0e4e257290c4fa1aa756854,
under User-Mode Linux only, with one journal size per block size, and
only with INODE fast commit tags (no create, link or range tags).

 fs/ext4/fast_commit.c | 9 +++++----
 fs/jbd2/recovery.c    | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index 0cac890cf370..5d9b95817ac6 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -2608,11 +2608,8 @@ static int ext4_fc_replay(journal_t *journal,
struct buffer_head *bh,
 		ext4_fc_get_tl(&tl, cur);
 		val =3D cur + EXT4_FC_TAG_BASE_LEN;

-		if (state->fc_replay_num_tags =3D=3D 0) {
-			ret =3D JBD2_FC_REPLAY_STOP;
-			ext4_fc_set_bitmaps_and_counters(sb);
+		if (state->fc_replay_num_tags =3D=3D 0)
 			break;
-		}

 		ext4_debug("Replay phase, tag:%s\n", tag2str(tl.fc_tag));
 		state->fc_replay_num_tags--;
@@ -2656,6 +2653,10 @@ static int ext4_fc_replay(journal_t *journal,
struct buffer_head *bh,
 			break;
 		ret =3D JBD2_FC_REPLAY_CONTINUE;
 	}
+	if (ret >=3D 0 && state->fc_replay_num_tags =3D=3D 0) {
+		ext4_fc_set_bitmaps_and_counters(sb);
+		ret =3D JBD2_FC_REPLAY_STOP;
+	}
 	return ret;
 }

diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
index cac8c2cd4a92..a59de33a2a4a 100644
--- a/fs/jbd2/recovery.c
+++ b/fs/jbd2/recovery.c
@@ -242,7 +242,7 @@ static int fc_do_one_pass(journal_t *journal,
 	if (!journal->j_fc_replay_callback)
 		return 0;

-	while (next_fc_block <=3D journal->j_fc_last) {
+	while (next_fc_block < journal->j_fc_last) {
 		jbd2_debug(3, "Fast commit replay: next block %ld\n",
 			  next_fc_block);
 		err =3D jread(&bh, journal, next_fc_block);
--=20
2.55.0
