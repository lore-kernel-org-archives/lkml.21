Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598126;
	b=CpbsSi/GdfxlXOJZaLtoA8H1pmbu1n+bUryvGAI8JoYPH+g6+yNhsp7BMxVkfVJ3iqUZ
	 K84JLhhSWGHJWEwe5fkuAoAITkQYNkoBZAa7coZI+hMxV9B8mSIS9ZoAosXsDkCoGKU4y
	 IqG/am1QIf1hkNOjAf43c3IFbIeqDMdFVZdj3ATx0b7KM6CrzC64zkL7bUOaxAV6gqbuE
	 TbqTPOsUnbsnw5U+2sUGNDHk5pfxHtorQNK4QWO3qvwidfRTl92+D1j1J+tuU96iNi7U+
	 pR0/ZekdcguWr7Q1aLjwyaMYcqoHm1ExH02kQ2F7akVZMWEJZlUnd08uVWiHU2qvU1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598126;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=y1kNffUcvdpobzp+ZxSevNO0697zJUK1Gx23nNr5DRA=;
	b=HQN3wBaIXKzbqrwAi/GlS6fR+ms+XcRPDUfT1Q7/4WNBdcfANwz4B5aLLwlMl1pAzw3G
	 lj2Zq/eTYPpBISnFj5jmGDM+lsrlAonn/cQIqyfvXoaqNE5y62xyIKQGbkgySWFiqUgLh
	 zBg84DF1XT9C7sUswbpSo/BGVkV+xDePJ8Z6S3dxTqVGkR1tHx3vO2pATi4zYsrQ8DOY2
	 5n/rMPrQd2NCM7ZfIjvCq5V7VvQLlLo4hDKDapWA2XTC6hE/vwP0WP5D9xDwQysUfJEQ4
	 5UQ73hdPhEQj5wjGhXRrpG4sgzcVw0nYiBeJYU5SUWpEZcig01H+/87piKPBDrjthwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HaLrY6vi;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F9606A690
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9F9606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HaLrY6vi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y1
	kNffUcvdpobzp+ZxSevNO0697zJUK1Gx23nNr5DRA=; b=HaLrY6viqHcpnU0jL7
	eP0yKx9h2tQX6XY4MuXniaW/35Y5CFq1Wza5sOm+BfCY9dT1OFWAaMfh3nHC5Inz
	5RYitasG2HO9jpCVhDAqr9mgHQXZv1BMIiKQjhYP8jN9nVm2xFD06+Z5T2n3+Qj8
	yB2uXDgX63scSD/dFxrk+RQxQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDH7yzwpgZrIz5UHg--.45691S2;
	Wed, 25 Nov 2026 17:14:25 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	chansen3@cisco.com,
	sj@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v2] tools/mm: page-types: flush pending idle bitmap bits after walking
Date: Wed, 25 Nov 2026 17:14:08 +0800
Message-Id: <20261125091408.1584017-1-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PSgvCgDH7yzwpgZrIz5UHg--.45691S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZryrJrWfKr18GF4UuFy3Jwb_yoW5Cryrpr
	ZxK34jyw4kta4fGwsxZrnrAF1rAwn3XayfGrW7G345ZayUJF1jq3Wxur10vw18WrWkCFW7
	Jrs8GF98WrWUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmwZ7UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzRNCK2sGpvOLoQAA3l

From: Xuewen Wang <wangxuewen@kylinos.cn>

mark_page_idle() buffers bits for one 64-page bitmap word and writes
that word when a page in another word is encountered.

walk_addr_ranges() tries to flush the final word by marking PFN 0.
If the last buffered PFN is below 64, this only adds a bit to the same
word and nothing is written. Otherwise it writes the pending word but
leaves an unwanted PFN 0 bit buffered. walk_page_cache() does not flush
at all, so its final pending bits are not written.

Extract the write operation into flush_page_idle() and use it both when
changing words and after either walker returns to main(). Clear the
buffer after a successful write and skip writes when it is empty.
Place the final flush before the no-summary early return and return
EXIT_FAILURE if it fails.

Use 1ULL for the bit mask so shifts by 32 through 63 are also valid
on 32-bit hosts.

Fixes: 59ae96ffc3a67 ("tools/vm/page-types.c: add support for idle page tracking")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v2:
- Return EXIT_FAILURE if the final flush_page_idle() fails, as suggested
  by Andrew Morton.

v1: https://lore.kernel.org/all/20261118021253.1691428-1-wangxuewen_ky@163.com/

Verified on live kernels (v5.10 and v6.6): after "page-types -f <file>
-i" on a 100-page test file, the kernel idle bitmap held 99/100 of the
bits before the fix and 100/100 after it.

 tools/mm/page-types.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tools/mm/page-types.c b/tools/mm/page-types.c
index 47e4781c5fc3..1695a7b42169 100644
--- a/tools/mm/page-types.c
+++ b/tools/mm/page-types.c
@@ -575,27 +575,39 @@ static int unpoison_page(unsigned long offset)
 	return 0;
 }
 
-static int mark_page_idle(unsigned long offset)
+static unsigned long page_idle_offset;
+static uint64_t page_idle_buf;
+
+static int flush_page_idle(void)
 {
-	static unsigned long off;
-	static uint64_t buf;
 	int len;
 
-	if ((offset / 64 == off / 64) || buf == 0) {
-		buf |= 1UL << (offset % 64);
-		off = offset;
+	if (!page_idle_buf)
 		return 0;
-	}
 
-	len = pwrite(page_idle_fd, &buf, 8, 8 * (off / 64));
+	len = pwrite(page_idle_fd, &page_idle_buf, 8,
+		     8 * (page_idle_offset / 64));
 	if (len < 0) {
 		perror("mark page idle");
 		return len;
 	}
 
-	buf = 1UL << (offset % 64);
-	off = offset;
+	page_idle_buf = 0;
+	return 0;
+}
+
+static int mark_page_idle(unsigned long offset)
+{
+	int ret;
+
+	if (offset / 64 != page_idle_offset / 64) {
+		ret = flush_page_idle();
+		if (ret < 0)
+			return ret;
+	}
 
+	page_idle_buf |= 1ULL << (offset % 64);
+	page_idle_offset = offset;
 	return 0;
 }
 
@@ -798,9 +810,6 @@ static void walk_addr_ranges(void)
 		else
 			walk_task(opt_offset[i], opt_size[i]);
 
-	if (opt_mark_idle)
-		mark_page_idle(0);
-
 	close(kpageflags_fd);
 }
 
@@ -1364,6 +1373,9 @@ int main(int argc, char *argv[])
 	else
 		walk_addr_ranges();
 
+	if (opt_mark_idle && flush_page_idle() < 0)
+		return EXIT_FAILURE;
+
 	if (opt_list == 1)
 		flush_page_range();
 
-- 
2.25.1

