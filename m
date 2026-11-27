Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794129;
	b=KY+2o7qJ4P2sfrk9EQ1XrcI7VNN5CCGVkMzCP3JhewKX1Nly5MrVswpb7NRceE09fZls
	 QQospbLq3mSKZN6PdpSUc3Ga0YByE5XiIiIh4zOOnlyvaXZbTEq2umKCM1UbzBHi3XvSV
	 Uct+rQ0VEppzRbwddupeVKwEtSz1qkaEP5ejFYJtKTV8BsxIkVsobxuamGYmCz1l4qIAp
	 Gx1NOgtSpvpifS7l5jBNsk+d3vYyRe6WE8vaTFBiGbgNRaMcaz/V9xYcqBicv5FcJz6yT
	 3dJNnytTN1LopsxumltkKMxlvD5Ixv+Qz/kx8GUBOp8F4r7H4ciSYPcfYVoqyVgpjbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e2fJZFZERBeQNZtQBCOfYByS4NMe3sHfsqjEP9dc6kw=;
	b=Wq4aSTrJ69EK3gPZb2n6zri8DdxUt/zaWhxI+kNvreLu00Tn8TN0bfGt3c7C7xmDw6Uj
	 0zhzJ8dbdAXH7QQ0DgwaD8qwSEBCR6LcK+J7wk20K97Wwi6BkeUlAxL6ihF4YrSvPZpCh
	 VaJL7dAVyWMRv/Dpyh5Xv5jB8n9v20NWly6OT7A4kVCgcANfjxfT37U6j3u2yxae6X3Mc
	 imCXWtL5ol7S1eBlG0HjjmrIC80nyUuUN7MQf0/i69CMEUA4D89/BnSCFksWefX7zjocW
	 5XvC10BDALuGDA9HMrVfeaqZL/38xoACchvxpgATrt7MO/Ur6bUyh31pQKIpqP6nn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SRiWno0Y;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SRiWno0Y
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so54187665e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794127; x=1796398927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2fJZFZERBeQNZtQBCOfYByS4NMe3sHfsqjEP9dc6kw=;
        b=SRiWno0Y1jdZyPsbE4n6wIFpmgpJpwhE2Su76T7JV0vCvkt5xD5pmfy1BDCLeGlsGs
         0N1KShPEoYZ8kCWwDlRuMNdqtFiQVR8lTFHc6zK1dcB+vPTN8JeA9fyc1eBzcrq5+Bzu
         8gagrolZ1aeYgxcDWBKFPC4Z/GWz5KE9FC9dmUnMpZByUmk8M2QcmFu0ZZOsWVOLI699
         u6rOYspTYX6Q85yoYrFZot8MKjQSvgrMKZP+Mxm32oyZPXJPfVPxqjkqNP7zUXTOiI7b
         lwncZWrGjEboyvV8m/WVt8uYWUkH7zfyyJc215BzJpQH2gp7bAgGKBecJLx0orpHO1KX
         Yo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794127; x=1796398927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2fJZFZERBeQNZtQBCOfYByS4NMe3sHfsqjEP9dc6kw=;
        b=LmD3IyMs0h0engQO5+kBp58BH8PcKXTW1N5/QPbdCe6/7VkC9g9emhQH3fyg2imkPv
         wCnUr/1WXss4qUi+5J2s/TW63YmLhKzHWD7mOifhrfqi4yGm4gAIB+5dvp6GS9+SNKfQ
         CNSoRXlmxqB563i+Kq18QMWq3/3/w4GLIF17vXusrqXmas14wOhe0WO1H61Gn4xfhZ8K
         fABsxW7r2kteJuh3NZ+m3yGTZ/Rx3ZJZAZIR8YDsXTp+768xUCy9/peVJj0GOW+eprxK
         eANHSAxOPJGRFzKvzNLh/NpUmuFUr5yY92HiVVtm3+WSM8Sbrp3v9EmAHhWOAeNZuVlr
         DvMw==
X-Forwarded-Encrypted: i=1; AL+hErFf3kL/+mXH4QDkHXvOiFyaGsUv++YEdadT0Z8c+Dp9o+TcDnQYsfHSYnKSmaAnUVDjzv03rRjt0hBnEAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hpwP7L1+3jWwHMrsVvwhnRfsHsgmv0TgwUHh+5bCRArfLkOwG
	93zMVo8yTNymCVmHyv5vHKTTuP/m/kcge0Uzm+k0ovQwx+XzoJJozYnT
X-Gm-Gg: AZFdTZdJWItd6srANKKjQFBDAxMCwzP7EcmmfMTbGMmMSyJ6DQEqo6Yxa9FqTGaQvH4
	3p3b/9ime32kdBo54JAiwrGiuhhWkUwE7emhBHKYotlCDkuyRBkwRfpIosmOJihOkN7vewRqA5z
	o7yZDxtBGgp/07v0kLFLP0ajOqbOO1FkpkX/RdnWZWxvu6Jvx3vRNKunctJkM2edNg4rL6NTBQn
	pr7k59Vmu73uvtM5FTZyF6KRaaz5Cuamdxuz7NLNSXPfYhfWIwkkr1oyE9ncnMOoKAdGFl/Smwl
	f8NgFT2phWr8CwkL+fWfvwjl0ZldnYHuyVlpp2zWgKFPrGfwvUKCkxlWw9J57lILUc9ygTQSdiq
	I+hGBHG9HE/9dTeQ87tGPz346TShFhcTX4ZP2se3Xw7VtfAaisr0OVeKLYIvp0Cq9tGlp2XFtKI
	q9dq7wG/KGL3F6STh36n/A0VDgqN/AY/bSAuBE5jIDh9id54AM5z2I8FzC1OFD2I9CJuODxF7wx
	ERL27VId9pmhvxLePifPo0JY9FVk0tKpeG34FZwZy9tT9FiGIrGWAFdXxf8yNnzKeOVc6MCc4PO
	xi7Xp0n9N9cDfdfqGcuZpl9o9uyp9+ehHK9j1X+pR1t9U+KRfS4jEbnzRVKxuYkx1obCwGiwxls
	6YB9s1gOvs1CwUB3BOuf2O+9HzLguL74hZfFzUctRRiOpnj/+mTIArqOtQbxbfUlJP2UTcu1YpM
	UNv6yLJAoQcZFI
X-Received: by 2002:a05:600c:c173:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb88800134mr482703475e9.11.1795794126985;
        Fri, 27 Nov 2026 07:42:06 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm959073745e9.13.2026.11.27.07.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:42:06 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: Koichiro Den <den@valinux.co.jp>,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	yangqixiao <yangqixiao@inspur.com>,
	stable@vger.kernel.org,
	Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
Subject: [PATCH v2] ntb: ntb_tool: accept hexadecimal addresses in peer_mw_trans again
Date: Fri, 27 Nov 2026 18:41:57 +0300
Message-Id: <20261127154157.3541-1-kaynak.oguzhan0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Commit 21fbdc4d0b1e ("ntb/ntb_tool: correct sscanf format for u64 and
size_t in tool_peer_mw_trans_write") changed the format of the
peer_mw_trans parser from "%lli:%zi" to "%llu:%zu". Unlike %lli, the
kernel's vsscanf() parses %llu in base 10 only, so an address written in
hexadecimal is read as 0, the ':' in the format no longer matches, and
the write fails with -EINVAL.

This breaks the usage documented at the top of ntb_tool.c
("echo 0xADD0BA5E:16384 > $DBG_DIR/peer0/peer_mw_trans0") and the NTB
selftest. tools/testing/selftests/ntb/ntb_test.sh writes back the "DMA
Address" that mw_trans<N> prints with %pad, i.e. in hexadecimal. As the
address format comes from ntb_tool itself, the first memory window test
fails this way independent of the NTB hardware driver:

  Running mw0 tests on: 0000:00:04.0 /  0000:00:05.0
  ntb_test.sh: line 117: echo: write error: Invalid argument

Split the input at the ':' and parse the address with kstrtou64() in
base 0, which accepts decimal and hexadecimal. A negative address stays
rejected, as it is since that commit. The size is parsed with %zu as
before.

Found by running the NTB selftest against a virtual NTB device in
QEMU; the fix was tested the same way (the unmodified selftest passes,
hexadecimal writes to peer_mw_trans0 succeed, and malformed input
including a negative address is rejected).

Fixes: 21fbdc4d0b1e ("ntb/ntb_tool: correct sscanf format for u64 and size_t in tool_peer_mw_trans_write")
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Cc: yangqixiao <yangqixiao@inspur.com>
Suggested-by: Koichiro Den <den@valinux.co.jp>
Assisted-by: LLM
Signed-off-by: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
---
v2:
- Keep rejecting a negative address: split at ':' with strsep() and
  parse the address with kstrtou64(base 0) instead of going back to
  %lli (Koichiro Den).
- Koichiro's Reviewed-by on v1 is not carried over, as the code changed.

v1: https://lore.kernel.org/all/20261126031506.165973-1-kaynak.oguzhan0@gmail.com/

 drivers/ntb/test/ntb_tool.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

--- a/drivers/ntb/test/ntb_tool.c
+++ b/drivers/ntb/test/ntb_tool.c
@@ -927,7 +927,8 @@ static ssize_t tool_peer_mw_trans_write(
 	struct tool_mw *outmw = outmw_wrap->mw;
 	size_t buf_size, wsize;
 	char buf[TOOL_BUF_LEN];
-	int ret, n;
+	char *addr_str, *size_str;
+	int ret;
 	u64 addr;
 
 	buf_size = min(size, (sizeof(buf) - 1));
@@ -936,8 +937,16 @@ static ssize_t tool_peer_mw_trans_write(
 
 	buf[buf_size] = '\0';
 
-	n = sscanf(buf, "%llu:%zu", &addr, &wsize);
-	if (n != 2)
+	size_str = buf;
+	addr_str = strsep(&size_str, ":");
+	if (!size_str)
+		return -EINVAL;
+
+	ret = kstrtou64(addr_str, 0, &addr);
+	if (ret)
+		return ret;
+
+	if (sscanf(size_str, "%zu", &wsize) != 1)
 		return -EINVAL;
 
 	tool_free_peer_mw(outmw->tc, outmw->widx);
-- 
2.34.1

