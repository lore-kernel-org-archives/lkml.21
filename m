Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602966;
	b=sBb+Zi2BzB5rzKUOmITXI/dCOg4byG1PB1cdTnp93V1+F7imy5ijNVXuKVj3Qw68UEDo
	 Z30YE2dpPQ4djvglu30DKkwS/OXKQuk14SrNjtjdgM2dgfBR9Z9zi96kKJPaQquWg262n
	 f2zNK1U3N0mLvrBgagTOJhLqsBG4AtKsrZ6JzRR2Fz/xlnjEQpUGV33et5NULyIMz/GFm
	 0QgtLXcY1wLtXqnHdpsBRiDjBHwOTWj+0d8yQP8+K8VEzxXn+sEDXrfmjfbKRbY98tjz8
	 gwvNPKC60lA5t4gs3IILKeDoEqXqkn3IhiW3bblL69UtfnHjuIgA3AlX8yBRDR4dv4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L63JJ2Ypd0n14icsjMGD3F1OXiYfHiYHbWPvy6KkKKU=;
	b=jIZUlbHkZRBkpNFPZ+S0jmoWx/iy/olxp6ZAwRzXBGspEGNM6cO6u2g67FqueLjpSt1e
	 YT+2pRK61Z+a8IuBWQikYGN7IbCYTqQtiiHTBhb9pG56wiJBGtixaZ7aBaMrJKqjdnZ/u
	 csQjpRVvcsnV1QQzQ4jY+hZ6kMPnpGKm+B+oRv99tDzqfgSVVVUdXUN5np71OlxaCurom
	 SXQg3pnDB7QWN4p1QGXaO/GRYnYWqw7AZfwm6QsLws/yaH985mh6vzqQzPpJrz/pDkWPj
	 Am2ure1XObnmpChhkTzWUZKjHHMrmU943dCy3oiNechRI+K6djeHVv4BsjA6t/At+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izWYyzf6;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA2C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izWYyzf6
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so545217f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795602964; x=1796207764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L63JJ2Ypd0n14icsjMGD3F1OXiYfHiYHbWPvy6KkKKU=;
        b=izWYyzf6PChk4NVQlxdRlyz0h1SXPl0F/x+SYQEqa/wcfWOEeY4QMPoCyVafM8Lmgo
         VuZyTy2eFfALuv8dknN5coY6zg/EmDZEOgF9K5cnuyQpuO6r9f0Kg8SEgrBJ7YX0SWq8
         EoldlxLOa/VnAdwNgXu979nMIMFsDnJPV/6P4yLugkdci0bcd3pmkPiPiBzN4uz8cUPN
         PVTSgBxqri4AJgHb6NyrPn0Htpjpdks0PI0Aba2oo8Oumz31oEsxyQKlvLHxnRf/oKwO
         S+dguKdKv78EOOLTyhFqMU2l1mQl0VDdccDnuwhyn1kUuYYnBniFgcNnf3tJFve2+wza
         jCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602964; x=1796207764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L63JJ2Ypd0n14icsjMGD3F1OXiYfHiYHbWPvy6KkKKU=;
        b=1c7tY/ZZpPk3UyjaeNdu5ucHv9m9sJk9BljOxn4MJF0q1aKtRceGB96WwJYRuJjez8
         b+Y6eNvtxglwtPCtDtWoutrwDmfJcIW989sOChBKRVyvsp+nhJ2sSK4OQ7ddvlT+OIN7
         qem0XtVwmAw3Ui27/nvqjZ8GvXk7YZfobLvFn4YFQw3lIJFKDnc4jP4zVC6boxTSyVbt
         I8uPR3qdy+LFZy1/3C2IrqvjJ63AjdPoBqLVKbB0Pvr7rjpVlXMPivRGo6BulSt8UYQr
         K9rlBdqUwO6Pw1nEVZpRU++OETUmQOYKk2CbJSNCNs4rsFhckwtUQrxwcSbdvB1c2IBq
         o25g==
X-Forwarded-Encrypted: i=1; AL+hErHBF/vdV7kfMis9Yhl26bKXnAcBtoQdfrMv94bWIOkkRtc8mzS66meEZERPjceBRVn4I4uaAzwDh40iVFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+opYwZwKmDvetZOvyyf7H3XO3UvEd49oIgj1o1tpmw/hDjHmyI
	eB819up6Jf5mC4P4IFjqBQ6x8yQK+DmHShHMH+GuCli3HkG1Pa3CjjaA
X-Gm-Gg: AZFdTZfJsk/tKgAkoF+BLYPjoBF1O9jal95Uah1NxmXV2Hjy0m4pbVoR1i7bNOttHb5
	HXNWrXCO4kJeAR2rSPFjcdPIxj5zSjb/5hPabUFGEvoEclmz+s5Shqkly49vEWzNFcAzblGVnl4
	o/hKjImVnKtZUXbteg04nSLKrQDhVaI4N4ohfa+ITPQWau56CxYhiQ1lkZUyo/02mUvsL/IUtIQ
	LTJ2VykzPRIYVONItWH58sY/4KwwVKR2RsLwxnuf0oypigFl9brK52hg5ymPxWr5W9jwG/SBjlV
	xNrGIcFdlyNpMHSspX2qjGdUZShLSpoX54VpkEQO+wEH6QeN+DSEAfnWOPcjd/xfjZLJBPKHb4F
	YUCd3DDaYSKvftbr1/+UsQOyVwl9b7qbJhfd4BcXw9iyoul+yeyo827HyX+5/hXCu+wVslsjgs6
	axa+WTsnesFBPmke+Hf/K7PRx3HCgphCXhICF4fB/9y9KG/SztK6DIN0CPP0OiX6bTNQCrBx1Kf
	83fG04mzHhEWt6G4I91AoKfmSRiDRquiM9uKe4Pu/5D0RUZZuFK1e2mf3Brw7BKiOHP9Za6jnRO
	SC0x8gTnr2BaI2oIWow9mr5NiP5b81ckfcJQuLkPbpwrzJHZGSZW1Akp27Rc1RtzDmSLjauub7i
	tueND0HV9eDzG3TDr9Z0=
X-Received: by 2002:a5d:5888:0:b0:49d:2e96:4d55 with SMTP id ffacd0b85a97d-4abb46bc931mr31985965f8f.6.1795602963822;
        Wed, 25 Nov 2026 02:36:03 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm34661276f8f.31.2026.11.25.02.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:36:03 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] f2fs: fix use after iput() of inode in gc_data_segment()
Date: Wed, 25 Nov 2026 11:34:54 +0100
Message-ID: <20261125103502.30568-2-fourier.thomas@gmail.com>
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

In phase 3 of gc_data_segment(), if f2fs_has_inline_data(inode) is true,
inode may be freed by iput() before the error message reads
inode->i_ino.

Report the error before dropping the reference.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: fc01008c92f4 ("f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC")
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0a00180c21dc..c7dc65acd052 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1650,12 +1650,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			}
 
 			if (f2fs_has_inline_data(inode)) {
-				iput(inode);
 				set_sbi_flag(sbi, SBI_NEED_FSCK);
 				f2fs_err_ratelimited(sbi,
 					"inode %llu has both inline_data flag and "
 					"data block, nid=%u, ofs_in_node=%u",
 					inode->i_ino, dni.nid, ofs_in_node);
+				iput(inode);
 				continue;
 			}
 
-- 
2.53.0

