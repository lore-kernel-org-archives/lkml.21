Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172542;
	b=UHLsM/9cRuqRZEUs7If+ImUk0aFiHhGkMfJTwkgI4ljYi4/FfmA08E1CS7iCryoeUiYQ
	 gUu7+v1Zw7t/Ch5CMhy/0S+hkKuspaKoUmym9gtFW4X9KEmlr6GfW8I+eHR6wYuTulSRk
	 ZOYygs6lfvfN4kZKABmMdoCw8KFKBObtfCgDPTk6911TNbDXhoN6wbBIFnZHo5av3Wtl0
	 4bwTNvCDMo3TtLkLguQt2eRU2/Pb/WvpuJOa/92eoyfNDTbVIv8jluW5K1+XTw8XQIMVD
	 1MjF9JQDZyxohZSyKIOCOG41zqD5cItIWjRyoYkXwY3W8CapHkHkPpmfjSZMh9ABKsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NkbG5LB1NV/xKpH/oha2h+NsDn7aeLKmyfn1a4faE08=;
	b=3vfH7LAi2HSLLG1tKANeXPPaYtY0rcWFdY2sSOIQLduaDaSuXE2VIUs3PLUEg+whf5zC
	 1fj22bO82J+Z6wgfKaQrF1jyUA1Zd93tIxvZTkpmSTRDYlUGe6CrLlPWRqfxfkIOqEU3x
	 /5+KC7AFSuf3JuHLTQv7ZBkMopzrOqmQtK5pWajVO3xleTt1/1wLF5rTFanS8SiebgMXV
	 g7bNOv5oiNibow6u/NyAk/C7lSyrzOYOHLxCVwBmU1KGE5EZxFkNoAC5NqX3mAQNceyIJ
	 UzlIjAJGzdQj09ZYt3TNbZco6B54Wr55X+BVX9d6BkiV4agRaF6tMxKolutpGmubraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0dxDfOl;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769BA606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0dxDfOl
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-381c5130f4bso189794eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172541; x=1795777341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkbG5LB1NV/xKpH/oha2h+NsDn7aeLKmyfn1a4faE08=;
        b=r0dxDfOllU/QYRhojgtSm89tr2UxvFaFD1UFRr1X8M3Es/PCsOgsA2LtD73TF+Kgan
         pT98fKbt5GT09xhZwwKIIvjQGUjg4clQX9GhfOigVxsUnWToUf5pz+cJstXHJ7xMxEfH
         QTu8Uk8YKcobcZzXklZFCGae7XOk1O6ontMoeTfJDk6tsbaiQ1eky/LHSSDe1SyPMS6k
         N+/BHcm5zCa4b6PwsQ1nPsu69m0VbCgzqxJwwiO4Y1Zupx+CVxZJSYBMaHlrSOUBimuh
         DYffBFHfZ5VKz8BbFqRv7JuvVQzfuSsThitV+k6gltLr8pIqFNoFyYYsvm/n0On48JQY
         XiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172541; x=1795777341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkbG5LB1NV/xKpH/oha2h+NsDn7aeLKmyfn1a4faE08=;
        b=T52RCK3AQ5Pu0pDk6ptpYswhnNQiwhRyQB2VwBL1sSU4UNq28uTUVI8+Kjb025lL1e
         uPTSHr6a79zlXxFrHGvv9ToKuCeIeURQMVG9K9EkpryYdg9BT1mCrIG93VJLfTEMi8ql
         RgMMtNB/HuNXL2LOmdBnr0QFwDnS+6Ge8YgNceywsgf86v4QeV5+M7zp0NvsTvMbyuiR
         b7OTzymQzBIa3bPylgy3uMLnTEaUWP/OCWizG3v1WSuhoGmNNlLV7KtNm0Wb4EfWDu8n
         au+rIZyezm+6TVVt57H7pUkerRh7N9jmvr3MKYOQPBRs96TpbzRLqD3IWH++TsGiub2k
         BkZA==
X-Forwarded-Encrypted: i=1; AL+hErGfVYiJLJSNAhdTuK77QLdZD54ECjCNVWl2ImceFgX/0w4chfXsqFo4C5Z9OIpSnOSATebunHpRgeWJVRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ewndpm0lA1f1T+7P6CgNgGlrzxJ4F2ToigLi76qeh03a2XDA1
	OAXMS5czNRSyP0PeO+hAaMO1cAqRBMHTag5xCeuERxtLIZ3LJqfL993Enlwrd+3h/DmmwA==
X-Gm-Gg: AZFdTZed9aKpa+5b3cV/vWGtg4B6NjcYUz7DlbN7R6z3QIPNYONtjQXbNfmlwT/nuVD
	70/M9b684m+0WvhoYdLliqHRtRJSb/tLQ3zLjXSzTQV1S1y/Kv1QmPJvDxmguW9GSdvntjNcT7B
	5R5Pgk5kQKXjFg7z29nobnBpOf3KrfHw7xY33RMZ9rb0aMA8ev9N6fBVNmDy4Sb7OwnvywxnTiu
	UiP9f3HB8ArXf0JUX2uub4WEfK10Xt+vRzopKrp0dXAJZ7+gQ8pOFK4E0sS1DZQ4BCmlWE5/bX/
	UcQLfs9fK52j7aDqbwmvy/ydEo/+NwjJbPZ3mq9iOkZLjSEs1zfnlA8Sl0Jj/AxfoTJDTs51lQN
	O9yAND7vXEZ5glTRtqGHCOLMuOAuhP6OgWOpI8t/0Vfj4b09QrATGUfLlYacItBZUZIBoWagTuO
	7GkSeey1Ldtk85W3ykZHTqxQNBvR+NYh0ExP+Flldz9nHzRhqxoUufez0r9P9WpqlnEV9o+Dxhe
	PIpU+WJrUylLhX8g1ZUd3P8O5BiLXVEiMYytVu0WUvy4kDWdeqK2PuFbarBSNBlFKcBW5bKrmPp
	TDOQSU6zbkdB11uuv7iw1H51pReNSrenfCKg17TgYIF8Sc8sw+Re4bKhKrB/gYc7CZR+zyl1gzI
	zbLj6NqLT50sANx/hDsOeIYLiggS7zxDe4bpCSReWnudeSMBvwbRFLJrk1aM=
X-Received: by 2002:a05:7300:f483:b0:384:e31e:3c58 with SMTP id 5a478bee46e88-385714160f6mr2276276eec.33.1795172541457;
        Fri, 20 Nov 2026 03:02:21 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm6561530eec.17.2026.11.20.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:02:21 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] f2fs: read atomic replacements through the COW inode
Date: Fri, 20 Nov 2026 11:02:13 +0000
Message-ID: <20261120110213.68391-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Starting an atomic replacement drops the page cache and resets i_size,
but keeps the original block mappings so the operation can be aborted.
After a sparse write extends the replacement, buffered reads still use
those original mappings for the skipped range and cache the old data.
Commit removes the old gap mappings, but the cached data remains visible
even after reopening the file. A subsequent partial write to the gap can
write those stale bytes back to disk.

Resolve buffered reads through the COW inode during atomic replacement,
in both f2fs_read_single_page() and f2fs_read_data_large_folio(), so
unwritten ranges are read as holes. Keep using the original inode for
the read bio and its encryption context. Once FI_ATOMIC_COMMITTED is set,
use the newly committed original mappings again.

f2fs_commit_atomic_write() sets FI_ATOMIC_COMMITTED before it removes
the old gap mappings. Hold the mapping invalidate lock while committing,
as f2fs_abort_atomic_write_locked() does, so that buffered reads cannot
map those blocks in between.

Fixes: 41e8f85a75fc ("f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE")
Cc: stable@kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v1 -> v2:
- Rebase onto the f2fs dev branch.
- Also map through the COW inode in f2fs_read_data_large_folio().
- Drop the invalidate lock from f2fs_abort_atomic_write(); the callers
  take it since "f2fs: support subpage blocks in atomic writes".

v1: https://lore.kernel.org/linux-f2fs-devel/20261104191621.89561-1-dennylin0707@gmail.com/

 fs/f2fs/data.c    | 14 ++++++++++++--
 fs/f2fs/segment.c |  2 ++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cdc9e6e8633c..b006f92b3c70 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2650,6 +2650,14 @@ static inline blk_opf_t f2fs_ra_op_flags(struct readahead_control *rac)
 	return rac ? REQ_RAHEAD : 0;
 }
 
+static struct inode *f2fs_read_map_inode(struct inode *inode)
+{
+	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE) &&
+	    !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
+		return F2FS_I(inode)->cow_inode;
+	return inode;
+}
+
 static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 				 struct folio *folio, unsigned int nr_pages,
 				 struct f2fs_map_blocks *map,
@@ -2695,7 +2703,8 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 	map->m_lblk = block_in_file;
 	map->m_len = last_block - block_in_file;
 
-	ret = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_DEFAULT);
+	ret = f2fs_map_blocks(f2fs_read_map_inode(inode), map,
+			      F2FS_GET_BLOCK_DEFAULT);
 	if (ret)
 		goto out;
 got_it:
@@ -3490,7 +3499,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		map.m_lblk = index;
 		map.m_len = max_nr_blocks;
 
-		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
+		ret = f2fs_map_blocks(f2fs_read_map_inode(inode), &map,
+				      F2FS_GET_BLOCK_DEFAULT);
 		if (ret)
 			goto err_out;
 got_it:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 066b7cf813d7..b3554b27751c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -417,11 +417,13 @@ int f2fs_commit_atomic_write(struct inode *inode)
 		return err;
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
+	filemap_invalidate_lock(inode->i_mapping);
 	f2fs_lock_op(sbi, &lc);
 
 	err = __f2fs_commit_atomic_write(inode);
 
 	f2fs_unlock_op(sbi, &lc);
+	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	return err;

base-commit: b61a029304bb5531312ebc133b2a895d14dc3fee
-- 
2.43.0

