Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992950;
	b=M0zB0n19R6H12c4+x37D1jhxb99lTW6IxVe1NJwDDOa5zJh0Njz+eCq1SlwjidNF+uWa
	 Yms3OomPAoDnoROdujs5mnH4p/uBG3DwCDPwW6BPvSfu4pp8i9d0ac+AvQUArDvDYaQIY
	 AgJQr7VkubF+Hth9M69SrcdnyyvHPyIyE4cHK5cqCU8VW30DgEfgfIgT74FlEr+ApFmpG
	 tUFR46LGbYEFCy6q/5bqHflG4zXtLoxzW+9opzS3kIWayRzyHhwhaps4Ar/sOktSfQmCN
	 /6tIZk03r1p94XKyhXG/lWPHLomrexxTP78AX9IN8q9Ujz1Jc8R6mir3IRe7TTcCBbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992950;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=dHtuWAtrj+xNhQpB4xrei+7wLFyasNoXtGo9DFiqG+M=;
	b=O5duYZ2oLz3GI0woYCETPRc/Vlo/Yz/jNEWr/kMsaIxkDuhUFXM70V9B1UCd6HOrxPus
	 wJUZ9cSMfeqRnOVwm9SsnZ5i38a2STsxhVMB4inrhWVnITB+FKWbYHBg99FOXI6eV2iYW
	 B9tNGsFruWvxvrLJvyWkzzskTaxv8PJ5GLlCibS7Zad5c7rovHtwdzV08U6rIoR/d+P8P
	 pWL/GAIcpH3ov5HLkNlkABt2XfC5M1IO+ga9ZvBslv+77Dh6jrW89iIZJNY8bB62xi1ls
	 eAaEurm28GQvN3QtxH418GJbgFOXM+3Pyh2ZdQ6fNIA9oWNRHBl0sPOl/Mglx635s8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M39xBiBF;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC60606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M39xBiBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dH
	tuWAtrj+xNhQpB4xrei+7wLFyasNoXtGo9DFiqG+M=; b=M39xBiBFBvDiq9w+HW
	JVbnIKVf9XUaZUWgzjr6Nj5jULx4g4sBEfIh7VjDCBK1WCUljxi5w8MIZfjRfMr1
	h3wDtWDXmWkSSa0LRrOIRRkdRinqcN7tKyBX+oZrHo5ER16m7iIYAB6pnZcRT6Sc
	0YVpVfuY3dN/b9xTPVGgQNJf0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_+gOa_1qh6wGIA--.32884S2;
	Wed, 18 Nov 2026 17:08:31 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 08/37] ntfs: preserve buffered fallback writeback errors
Date: Wed, 18 Nov 2026 17:06:32 +0800
Message-Id: <20261118090701.1858849-9-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3_+gOa_1qh6wGIA--.32884S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDCFW7CFWfGr4fWrWfZrb_yoWkKFc_Wr
	yvy3409r1UCF1kGw1xCFnYyFs5tw4FgFWfXryFkF98J34kJwn8urs5AFs5CFZrWayqgFyr
	Grs3u3y5XrnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUNBMtUUUUU==
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQ-34Gr9aw8hOQAA3+

From: Xuewen Wang <wangxuewen@kylinos.cn>

The buffered fallback of a direct write waits for writeback before
invalidating the written pages. It replaces any writeback failure with EIO,
discarding more specific errors such as ENOMEM.

Return the error from filemap_write_and_wait_range() through the existing
cleanup path.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Extract buffered-fallback writeback errno propagation from v5 patch 23.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 55c48d174b28..b1c6a84bf955 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -805,7 +805,7 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret2 = filemap_write_and_wait_range(iocb->ki_filp->f_mapping,
 				offset, end);
 		if (ret2) {
-			ret = -EIO;
+			ret = ret2;
 			goto out;
 		}
 		invalidate_mapping_pages(iocb->ki_filp->f_mapping,
-- 
2.51.0

