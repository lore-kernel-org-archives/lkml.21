Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443372;
	b=uRgLkwfFKyVedaKqiBl4QLD32ApoQlKg2lyElCNRJTajz5VZ6YeqDoTyYeSrKUPJ1i/h
	 DkCAERGmamgtG3B3xsMHeL4D1k8BUw7Vtfqfwj2blB3Vgjc3DdpMF3t/TLHTg/NB4aCot
	 BZ83go+XG9fIO3tqnqvR0KNTs0RL9jVSmRc2xllmlMx0kKDI3TH0SOKyPKZaox9VxYCUX
	 EcsO1dWU9EKVvtDQKSNz8UDkjKyL5mfojoPDNco5ZgG9pIOV434RJYgOTUtNGlrWp/5X+
	 hRZf8ZgGNeboF1965E7HJ07haKU59Z+diZJbcixE/ggYzKnfdbgXC2GtT501yg6khLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q0kaLBG9armAqyKqZcboCnoBFONiD+mZBC8cBIH32JQ=;
	b=gt/jgQHQ3Qce+nurOTxhlgq5QE+az82sbskh6KScl7pZd5EFucGGS55YMmZPjihmBkaU
	 BhW3PwV8U/lJfCpfKO1gnSYXZ+lQnAbSw4ZpiaPGLXII7p/JyzlyfNcmzGCzzR6YzjEYY
	 Y9G8r+WEqGPUIWmNG/ixl7p7Q0c1CbSDB7xPN3Ui2pOLmS2P/hWb8oqRfWcnRQ5wM3tQA
	 AWERY7zm4xhe+2iViD9ETvzTymMCqa0CF19lowiTl9vUebXfoEkI/X+Vlh6iknl0KB3Xy
	 i4I0zMjbhyuZRQN0Fa+OTjOJy6Dt07j4UGb6CaU02vmxupeTVRfiQbLyL/Gmvc3AV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tc5r9Zpu;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230EE606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230EE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tc5r9Zpu
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so2083208c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443371; x=1796048171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0kaLBG9armAqyKqZcboCnoBFONiD+mZBC8cBIH32JQ=;
        b=Tc5r9ZpuLoNZ1opGkx+WuPZYVISFpfhmuOmXh1fdY4qwY/bU0+dJxJl0OBFK6EJVLd
         4rxirb/4eLe6U4ldYzhnc74jNh8kXeh8UVTRffQzO/2SuDgO4Uoo39xmT7I/1RS5/b6Y
         kWc2ub/cL5QFYDNZZlNNDz1aDE/uU0XBdQzuAitfZEgKEy2jNkli27P9t/k+BZtrvWIJ
         uJ10GffCWAmoGq7zrOn146R73b1TJsxQYm71WeLuvXvS93qgxjDxwhK3aKWE0ALe1ods
         t616uj28B+sKZVa8XQWCN/dNNWky1tbT7yhOJeEsZ/SHSjpOO5+FlY3HD0guehyl9dC+
         G6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443371; x=1796048171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0kaLBG9armAqyKqZcboCnoBFONiD+mZBC8cBIH32JQ=;
        b=XZt3+mieX0xLcXReLVvvww59cyZzjuxPEg6vFKYHArt/lvSrGYo9FaYXL0juWB6nQS
         v6SLZSXcznifEPoF3F/zswsDUGX64yFj+d9pQvGAoOgpFw7DQINIwq9prWHYOUXAHk3E
         +xuBoUGsyBn4hBfI8lFJIC97MBLqRfIXSJZg5+qD3eAC5zrqz4OfqDmXnSFpIJ+UWKVM
         u5xV5Sl2VAmoxFO7ph4hhiaRrdOtIhV0SBmGh5TlAj8NLigeWVqejm3Z4Nm1PhiDZuL6
         pDcyRNXrdkxiuOLE0Bdln20/yjYQY3A6Ersl/qzL+yG0ap0c7igqEBKhO3DyE6LZAAh3
         Qq/A==
X-Gm-Message-State: APuU4Z/yaPDK2zUVYm+wPkfgzRsvvU8lI0UKZBdNN8kNbU8mVKFdnUs+
	7DovltbYR83ehXx8lAO5HmbXhZYvIZxsaGPRR8O3kZNB9dMPAvdBIUcP
X-Gm-Gg: AZFdTZda2uSlXIcrRbE0OZ4lQ5wpXzEizh9tR3rRtuvGsJTPxKCFRal82X92JH4zMBO
	DeQIVsqzke2G616EGhLbOGZan2h2d6yEWVZ3P4tXyFXqAA4q5q6wI5OEUUCjIMpbx70Be8HPfnB
	SgZOT9QZAz61iL+huc8CtSuXLS56hkeLlp9vdJv0LPr/e379Wae7+RGMGWDHCyKAmxhhiOlb4Gf
	nms+8kPkNvRbsYOhV8oYpSuCzlHXoBg9balPcqmIC0422S6RhIrGFY0AEtS2ornRgbBjdErsfbK
	lTyLAs8tiNRX0AInx6z0QtCbVp/q7ngK/s8+Pwy3drxTFVe7n6CK85w2EXtioSjyQ58zKx8DlVM
	gvbtASObw46Re2MBhgXUg6DiIG0ar11VW4S+dkoj1MIYbX0l67ybf09MJe/L3dUmtg2JYNA8Spl
	iPf6LMc4DKvyJMT71Nlx1gILNY3+wAtXWeXi/0tIomY3WE5YKyYQK7Duxspb2GI9isDGKXwkY+N
	MVrNdk5GqunoJahaw+QhN1LL4Wwmgumu/AkVJQReEAAf3GNS91c/WxHAumpyn8hIHOULFvzjRmL
	NfOfc1MiAdRf3vxi8xpeWE2205Cdh2R3J44JJ2JfISkfBQDZN8RWZQz6hHrUmCxspv21aw==
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b556926cfbmr12460036c88.41.1795443371191;
        Mon, 23 Nov 2026 06:16:11 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38348685eec.28.2026.11.23.06.16.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:16:10 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 01/19] mm/swap: remove unused parameter for reading swap header
Date: Mon, 23 Nov 2026 22:16:00 +0800
Message-ID: <9f3715ab29bc9ee4aaa1bb92bff47c7584b73ee7.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

The swap_info_struct argument to read_swap_header() is unused. Remove it
and update the swapon() call site.

No functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index d59fa8220862..c06f9f532e74 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3630,9 +3630,8 @@ __weak unsigned long arch_max_swapfile_size(void)
 	return generic_max_swapfile_size();
 }
 
-static unsigned long read_swap_header(struct swap_info_struct *si,
-					union swap_header *swap_header,
-					struct inode *inode)
+static unsigned long read_swap_header(union swap_header *swap_header,
+				      struct inode *inode)
 {
 	int i;
 	unsigned long maxpages;
@@ -3863,7 +3862,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	}
 	swap_header = kmap_local_folio(folio, 0);
 
-	maxpages = read_swap_header(si, swap_header, inode);
+	maxpages = read_swap_header(swap_header, inode);
 	if (unlikely(!maxpages)) {
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
