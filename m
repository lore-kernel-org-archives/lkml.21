Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145812;
	b=3BP6liACapQtSn4PdxoICWgiu5AuuNst9chKivf155+wPhjE7KEq978+HpSRxHCsb6JT
	 2C1uRbatJ0/iRB8x7hzxJ2m/u5YboVsOEdWBwIPBeSpo1dKPTDe0fw2W6nIjtugZUkUQH
	 klYTyE9A0e13QY1qfXtg/cCRjLuuu9DccuaDP65Ezqt5sKgxYh+mMYVDb+fYiQsdz4m29
	 IWI6PETcSnZjM85L7Rj6QJGHYZKVW4Zvhw7z85q53AwEv1zMc3pAr5QrUWcq/z8O5fnGw
	 WncEtL6S++ZQVrQLg5O6a7rsjD8TYX7WSgOKPe8v3KroGJoI1Fn1IZUZ4plURRazdJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MI0ADFbz8sRruSBF8RUNgyc7izln8BOExEANme5gYDY=;
	b=ZH/ZyEn+ckx9vYh0E+U1D1kF67cJuoIeLEJN8e8pSW2amTfQCt3CKtcAJaD65H38cB8/
	 LAKqKN7nNQJ0GnXqOSUdZ6BrAs4AlEc7ca45mTJrq3CENmSxYJljYBi9zpmok9LFtgF77
	 Z7yJ5v3U2OqSezltL7i/r/sS04WvQ2LUZt3oJTiwIIeZfsVzuNmUiKXPo5v+qH3dBfNvb
	 9f5jFFCTopeXw07Cmaez7zd9ytKQbahvskX8+RGsTaaJHmX11kUIPrXyu0mAT2HdKZjiB
	 TW11H+IcqHFHQdkCCPKZnle3NsfLQxnpFxTgY5N4QuLDq061G0J0NmEn9XSvwmjrJ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWLQQSFC;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C9606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603C9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWLQQSFC
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385c497bf94so456104eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795145811; x=1795750611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI0ADFbz8sRruSBF8RUNgyc7izln8BOExEANme5gYDY=;
        b=WWLQQSFCS4ynPz3MDQQN+2srUsJXfSACEjDNn4aPY5yuqJIeJgXXOkH9JZnRHWQERS
         FAHDuBj+ASqN9RwgLxGLAqFDY+KRkly5fAsnRiDtdYsGNeIsh824wjAN6hPCIeOftw6Q
         L+fsf9Lk/uv9YJRyxARVncHptGi56d59adUqa4tuKJ52ZOXAOdUj1vnqGHQwyGZ1SXzc
         N7h65crNW192X60Y6CA1P+Xio1+fVJWLlCX2aP0tLabCNuBzZPVyGmldtusx8kIiQT/2
         5Pwx+BUPG1ozLCkVf42X8RkFZ9nmlNO0jpjURUyEmVkiFy9z5cZiweyo0NhihzztUsBU
         UuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145811; x=1795750611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI0ADFbz8sRruSBF8RUNgyc7izln8BOExEANme5gYDY=;
        b=wbEmrdJMcrBfV3bWkIQmGK9LMzo+/DtkE8G+vs91SFN0uMhB5zKxL3Akzw2BrVxL2C
         l43l/WkuM/ztanYAQ5XmDW9HRuuC5rxrMiEdcsKL1ooJCOr84jxb4lNQlKbcynngTQvf
         37n2+rAOizMz59XVSvJh91Q1KZatMS34xFuPnA1iC74+vtNT9BusRQpJU8RhkjhT+L61
         uRV3rM4ZD/sONDmYUeLB5UYBFFT6tSy72z8DPkC8FSwyHVYdYY73PwVnGkeNr/0bLwaI
         a/nkPtKY0XTUzHzAphnO8DrdkPdE8BOxmMArQNoV5FHUc52rzMrVhIEL62/6v9pPmjkA
         j5vw==
X-Forwarded-Encrypted: i=1; AL+hErE04jfceKQ4xPjpFw4Gqn6XdxXY2kK6qVZYWr2kQiGKNhX2g3z1Sz3ItAyOEFPRYdcBP/Ab5YckJZcZtU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+waCmv3Hq5Nbmqoe2gz8OAm6RmWEOFpi+Yv8TA+I913peXAoV0
	2ThyKInBy+zDOQDAWXt2RZgpi7yq+Pa67LH9vKARcC6snMnSSMxULbF1
X-Gm-Gg: AYBFou3duKCsDKutDzW5MO4/NCVaS6Tjh16Y2s4FcFmUsBCTpstwMqnxuppoDiVwkkY
	4N1SH5A6hdmcInqzFLNAYRowLdlaaTJPm9M65mZ3n+f61twzcIi5u653o7bruwPlSd/lrGoPmh3
	AIPZqrfc9CjbkeWBSv6RfWm1czjy7PNtgJjM5tW5MH6R9W5kr4fIJaNriaY2rTDtipPqXciIYOD
	iwjMzALIMNz7CUXYO7C5Q1wjFLNdRTrcB2zMQVNAqzEOU6EFGAphO/vlYIHN30FRCdxQZkyVmNo
	bz2QwW9HNx8BUZ4CnZ31tH6unVYKUdYe7KmXIolRwvcXmf29fpRFHRBGFb2d2/zgMFF1bxKev+o
	J3m4HIz5taokF6331PTPfHcoplOgmLz6DP1T7lmpnWcT0K1mBQ8MAJmAEIYvFspGD4qFiv8+ipB
	CYen0mRsdZx8sYvChZSz2735ieXJokYu0hHPzJ+z4hIfqNhP6MoNxm9+51QJoQXlFQ0tSxkei5D
	46kvuWs82fNtWyJCVmV2HLk3mbhzbwtpoVA0i/rIhUjpdae6AYYtOFJNV4WWDilVklUhyyEn51i
	qvNVm67JrcuLZXjY3U+ZBgJTHpfCGArT2l+s6CvBz8pkcTV+SQEGfkrkeeXaoUqw5w==
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr1785949eec.4.1795145811208;
        Thu, 19 Nov 2026 19:36:51 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm2982064eec.16.2026.11.19.19.36.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 19:36:50 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Ding Feng <dingf3ng@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Ian Kent <raven@themaw.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] statmount: retry an overflowed string before reporting -EOVERFLOW
Date: Fri, 20 Nov 2026 11:36:44 +0800
Message-ID: <20261120033644.99834-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
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

statmount_string() compares the seq_file count with the caller's buffer
size before it checks whether the seq_file overflowed. After an
overflow, seq->count equals seq->size, so every buffer of up to
sizeof(struct statmount) + seq->size bytes gets -EOVERFLOW, and the
retry with a larger seq buffer never runs.

The result can still fit in such a buffer. statmount_mnt_root() and
statmount_sb_source() write escaped strings and unescape them in place,
so the escaped form can overflow the 3 * PATH_MAX seq buffer while the
final string is much shorter. A bind mount whose root is a 3765-byte
path of spaces needs a 4.3 KiB buffer, but STATMOUNT_MNT_ROOT fails
with -EOVERFLOW for every buffer up to 12800 bytes and succeeds from
12801.

Check for the overflow first, so the string is regenerated in a larger
seq buffer and the size check sees its final length.

Fixes: 68385d77c05b ("statmount: simplify string option retrieval")
Assisted-by: Claude:claude-opus-5-5 Frama-C
Signed-off-by: Ding Feng <dingf3ng@gmail.com>
---

Notes:
    Tested on v7.4-rc3 (65e4fd942), arm64 tinyconfig in QEMU. The test bind
    mounts a tmpfs directory whose path below the tmpfs root is 15 names of
    250 spaces (3765 bytes, about 15000 bytes escaped) and calls statmount()
    with STATMOUNT_MNT_ROOT; the result needs 4279 bytes:
    
      bufsize   unpatched    patched
      1024      EOVERFLOW    EOVERFLOW
      4096      EOVERFLOW    EOVERFLOW
      8192      EOVERFLOW    ok
      12800     EOVERFLOW    ok
      12801     ok           ok
    
    A plain mount gives the same results on both kernels (1024 ok, 512
    EOVERFLOW).
    
    With this order, a buffer too small for a string longer than the seq
    buffer now costs one or more retries before -EOVERFLOW, instead of
    failing at once.
    
    This came up while proving statmount(2) against its man page with
    Frama-C/WP.

 fs/namespace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index aecd05ac0..2c4987942 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -5813,15 +5813,15 @@ static int statmount_string(struct kstatmount *s, u64 flag)
 	 */
 	if (seq->count == start)
 		return ret;
+	/* signal a retry */
+	if (unlikely(seq_has_overflowed(seq)))
+		return -EAGAIN;
+
 	if (unlikely(check_add_overflow(sizeof(*sm), seq->count, &kbufsize)))
 		return -EOVERFLOW;
 	if (kbufsize >= s->bufsize)
 		return -EOVERFLOW;
 
-	/* signal a retry */
-	if (unlikely(seq_has_overflowed(seq)))
-		return -EAGAIN;
-
 	if (ret)
 		return ret;
 
-- 
2.47.3

