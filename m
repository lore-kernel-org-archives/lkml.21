Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968034;
	b=w0s2je7/th1jFDPsLh90IDXU8H+bijJWiE8ZG4yjryGuiUZjpy/XHrfTS8jnUgEyjONx
	 lszFLqkTGk2AA+XnJ+xwcjqTE6kQFT6N/b/lp8nmqJl5TgS1ZIf76bNYM+kYnraYuUHF8
	 WzY7rYwNlIwPdudFM40m68vuz5EnDNbMT2spQGfMzkwfLrJ6B4ZzhaKsHpNINHgra+kEb
	 N5q/9/FVRiAWbPMO1fqKm+wh5bOSL1+oIrdncwm+uro134H7zdrMiygKwyUikdMQIU1go
	 F8Z96H4Xtuk/58kwNcZ9tNGiNQRQB5hCnIDvrKscB9xW5aOHM49LU05iAuLay/dkGBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968034;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=oMmQT4LBt4QnjZ5+vGEUUS6BupntHDb+BjkQkH+5Z5A=;
	b=QqbYW0E1MTUaKOVWetQUJV5IfBW+UlcYiJ9PnAqWZTQbcMiCAMux4p0exguiGsIm34vq
	 maDfJ+ns/D3UWSCMPqGuqLYzPMq0LDcrdLk148lvUtyugTp1BVH+twiMtNidH9YFQeGsd
	 nw2a0FwzuU2bpAY0yn6iWTv5dPv03toava8PkxXtRWVOqfZ/npXBv8VdXpY4bPySfS22E
	 VCpDLZY01JhsOL1u5Tl3nLF/Rv8XtndNJB7VUAOOFxDgYA6I8pLlgud0aAYaIHqr+GKRO
	 zJq2UY1bTNJy7WHIoGfc3WHqecSBRfzHt5ezAYHwW0okuo2TYsg0uqW0vfd7Fhe1Ndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J+FUQh3E;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA8A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J+FUQh3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oM
	mQT4LBt4QnjZ5+vGEUUS6BupntHDb+BjkQkH+5Z5A=; b=J+FUQh3EaYD0ZFihVE
	5lmw7TVgIYJcKLA3wxHzUNpBucd0IqGIBzT+aUhB7JPuVmF81Pl0yQ2OadyJzZl7
	6CTObX9LzScfzyyTrvHol1me+dHQBjncSTIaH6aDpeCmszVk2sr/z25GmB7mOU+a
	JhwXQM6/BSnm0HM3YzVL8IJOM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCn2J+nCf1q9_NEGg--.8212S2;
	Wed, 18 Nov 2026 10:12:56 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	sj@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1] tools/mm: page-types: flush pending idle bitmap bits after walking
Date: Wed, 18 Nov 2026 10:12:53 +0800
Message-Id: <20261118021253.1691428-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:QCgvCgCn2J+nCf1q9_NEGg--.8212S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZryrJrWfKr18GF4UuFy3Jwb_yoW5Wr1rpr
	ZxK34jyw4kta4fGwnxZrnrAF1rAwn3XayfGrW7Gry5Za4UJF1jq3WxWF109w18WrWkCF43
	Ars8GFy5WFWUAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jpWlkUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8AiGb2r9CahW0AAA3h

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
Place the final flush before the no-summary early return.

Use 1ULL for the bit mask so shifts by 32 through 63 are also valid
on 32-bit hosts.

Fixes: 59ae96ffc3a67 ("tools/vm/page-types.c: add support for idle page tracking")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Verified on live kernels (v5.10 and v6.6): after "page-types -f <file>
-i" on a 100-page test file, the kernel idle bitmap held 99/100 of the
bits before the fix and 100/100 after it.

 tools/mm/page-types.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tools/mm/page-types.c b/tools/mm/page-types.c
index 47e4781c5fc3..3833dba3c02e 100644
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
 
+	if (opt_mark_idle)
+		flush_page_idle();
+
 	if (opt_list == 1)
 		flush_page_range();
 
-- 
2.25.1

