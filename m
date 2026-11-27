Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769340;
	b=cWqxW0Ssmq2W64UyBVl2rZOSEsEFFrycmQtKeE25MclzPaq86HLU8Z+QkhjuEmhK+noS
	 RLc+j5g6V6GV3pp4ov/qe86ruPU1i0eL+bf/hhJioB5jNFCEpdB2aNxm8PbmjoCkrpkDI
	 LlY67O7zyn1IoXyWgYj2wepQKM5v2BteRV8YYUHk7rg7Jj1wgLEP2rAeEhbX66VEcbzP7
	 6ghiuAp8Egl8j1sfOUMBxutsNVwpb4RQsSImtoM22VBEM/jIHMPF+N8OxW4RDvrrii+Bd
	 eA+x4TIxigyX7W+o9RwzLoxgn9wvC9dTpwlLSOnsLfgPrDbzr7CsXXON+m/vx8vm86g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aSulb1ZKSxB82Q0DHVFpLluzjXlQ4n39cXbO7GHm4Hg=;
	b=gymQT7fnn0tSQ9Rzg2bgWwi8cZt/H4CAhlNOtfqRwE68q0YqF9u34cYc8FSevZr4CHzn
	 5BeSvX2ZCIvRgeeXf/x3xaAH4kQo7QrV9/zsmQ9VcQ+88DxCg/2IMmLvEa5mCyE/JwckL
	 DH/jb3Qe7NVL2JIL3YP6RSeVNK7Hgs6Lw3yOLvFOjIlet1SWzfAS/osf4CISt53QpMrOi
	 4T26pso1UJLknhf9YyqWXckd7pBAxsajljslYOg8lcv9aDPmlPIfhT7eqZ77e+jEq4NKE
	 lrgOHKyAi/UhEpgqQ1N1REjgbc2sNrJLuG1BRButDKyGLi6PSmVF0FY0IQa//YfLGJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jaXo+qjx;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA0606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEA0606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jaXo+qjx
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0414c1062so47123515ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769340; x=1796374140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSulb1ZKSxB82Q0DHVFpLluzjXlQ4n39cXbO7GHm4Hg=;
        b=jaXo+qjxS4fzoJ1sRQ8Yi81AgRWhimCxet1u+2ypHmWVaS4F6bD4yNr48nufv3HKEd
         pBuvi91xlP2kgry/49Zibz3buJuD3yv+nFgstbLMZWbv6FIEqVoOgzgtfIGKMqmfyEAs
         exUFaN1Vb5eB1op9z7SruKPxs3jk4eq4fe35/q9m8jSAZqh+jhIXQIfjD55LG/5Lgzlk
         k4gzG5VzILL+/MablkEU1WzCDIm2tVf1seXgNRskbhviWLdrizUghgXqkPF5kN1xOQRh
         /x0cI0WdKXCfxTXYXH6OprpaNmImqlEly/ESj6RiS2UD918BLS2MxJ3CmRtYY4RU40SO
         7D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769340; x=1796374140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSulb1ZKSxB82Q0DHVFpLluzjXlQ4n39cXbO7GHm4Hg=;
        b=dCixDAd12VmUNAfOdtxPoN74Cv2vMc/SlxhX3D6y83uwCiFlD+ehXSboIopxG/Vs6C
         +K7lDbgo8qmVAe2WNmMd8Kv/HSMbPAD9hekxsExW+tcgvZTG+7bpIwr12+l0y2+WMt5V
         UMZrICapSkP3h158M3MnnrV7MoN5fKuHGKwO32u0eD04vaLALxwLGx4xVo1AlfeW0uPk
         TYuiF1NUxAxWQDwZpS+74BFbClCM1N4s7IrzSsZiRMU7xKoYfq7JJT+0Tawmt6V1lJg7
         6fIe88IsmIOBj1EDWVGZRnJ/k4yZu7tB5h1n7gMY2SoEnkopXMTd+hmkb0zWcd2nxepV
         D69g==
X-Forwarded-Encrypted: i=1; AL+hErHDKNOkOihvkZ5O6we2x730XdaOX1/aDLRJBcvMxwAhC2hTU6gX1hd+eYS2TeaXFtySWdfU1fXMp7dE6cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8disdAnMqKVFwhIdU6HmdZDBA1sT45s9K/W3PFqFZrCqlo3Rid
	hh6dY79Od75+A+Xg4O1PvnVsDB8Zs0ckYc+hCt8+R63B7ZOrA0Y6Mu2x
X-Gm-Gg: AZFdTZeacoAyIBmjJQAhC/H9xQhNRcNFps4dy+mAi1idxu5wW9UrsLBntRtxjd8KmIl
	3dqoo9CbbzQ6Yo02scp7Pf6+1tmCpUDFQfT1bfrQ5trLCOxLS8QA2EYRcCadKcByu0UKB2hSEcH
	mJlfkNe2gx2SZItaqKUl0mzPciL4rBwwfkwcZkddEPrPpI43C7MGs77pYGiOebGGWfxuAmI3yQk
	tCaaT2mOyN2NojKcWaY101iewHa7pievtQ9WTnNRAtypxBwKI427z9tD86GaHCxAOrZmar3kkJx
	iVPIe6eU5i3+vR8y4LtdEKkTrFqzI3yNyoyF46MnAs9BTGWmspSl7bUSrZFhY3is0dolIFlz8hR
	5R5eCaulHGeJRuhSZI8VCxa5c7H6xxY0y5PbwpLAP4hnX8r1z1IrzX1W46p3mZ6PZTov+PRqzSj
	2Twz+WjMntwfWQTNi//kjJx+RrIP0ooNmbiZzJCo9KSHb5oT10dBqXM9OV32YcpR7T2TD49F976
	4eHqP4NYlHvEXDBZPA7kPrl1Je6THpGrHxa5UPIkvQpR1eqI21WvkJaIsn282sBkUg3j+HpZ9Iw
	4P0ssB4JUZXB/K4g+Z9gD/nsXDo7VFtlkOaHA/0CQ0X/JEhhcZzyQlBVUv/q28yfZA==
X-Received: by 2002:a17:903:22c8:b0:2ef:e563:d2a2 with SMTP id d9443c01a7336-2f11414c317mr10473615ad.57.1795769339572;
        Fri, 27 Nov 2026 00:48:59 -0800 (PST)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm12289058a12.30.2026.11.27.00.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:48:59 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v6 1/2] f2fs: complete dropbehind write bios in task context
Date: Fri, 27 Nov 2026 16:48:44 +0800
Message-ID: <323235fbdeb5131f83569541c602ddc88f412b18.1795746008.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795746008.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com> <cover.1788795700.git.qiwenjie@xiaomi.com> <cover.1795746008.git.qiwenjie@xiaomi.com>
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

Mark dropbehind write bios BIO_COMPLETE_IN_TASK so the block layer can
defer their completion to task context before folio invalidation.

Allow normal and dropbehind folios to share IPU and OPU bios. Set the
flag after a dropbehind folio is successfully added, checking the original
page-cache folio rather than an encrypted or compressed replacement.

Exclude metadata-cache I/O, which may not have a file-data folio. Leave
the existing large-ATC completion path unchanged.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v5:

- Rebase onto dev, preserving the updated bio_len/bio_offset merge paths.
- Skip metadata-cache I/O before testing the original folio's hint.

 fs/f2fs/data.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cdc9e6e8633c..37d74afc8b26 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -624,6 +624,9 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	bio = bio_alloc_bioset(bdev, npages,
 				fio->op | fio->op_flags | f2fs_io_flags(fio),
 				GFP_NOIO, &f2fs_bioset);
+	if (!is_read_io(fio->op) && !fio->is_cache &&
+	    folio_test_dropbehind(fio->folio))
+		bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
 	bio->bi_iter.bi_sector = sector;
 	F2FS_BIO(bio)->entry = NULL;
 	bio->bi_private = NULL;
@@ -1077,6 +1080,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 					fio_folio->mapping->host,
 					fio_lblk, fio) &&
 			    bio_add_folio(*bio, folio, bio_len, bio_offset)) {
+				if (folio_test_dropbehind(fio->folio))
+					bio_set_flag(*bio, BIO_COMPLETE_IN_TASK);
 				ret = 0;
 				break;
 			}
@@ -1359,6 +1364,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		__submit_merged_bio(io);
 		goto alloc_new;
 	}
+	if (folio_test_dropbehind(fio->folio))
+		bio_set_flag(io->bio, BIO_COMPLETE_IN_TASK);
 
 	F2FS_BIO(io->bio)->entry_cnt++;
 
-- 
2.43.0

