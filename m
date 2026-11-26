Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662921;
	b=HFONwhtvxngRGozKJe/aoA4KmjqFzlj1I7aMj6WHPm/tOGo8KD/eBhtIG9U9jgx3p/fp
	 8DYflhW55XZswIaiVN3UgfyfHyCzCqqpukjrn6RKVBuQlfFj2uBq+GAlGSozttY65wUxx
	 63DmFIMF0uX0AmpryaHaDi95RUlBV2YRxAIrqoaRe4ihGWAUM8Pulrq4nlgSVuIX3YIJ/
	 Eehj6E4d1/gp2ppj6kDmzok0O1ZqxTztKqjFh9a0Qx8ZkhGU6qc+iFwgPibSFabfHjhzL
	 vbZPSgfoDB788rH0jbFTrK5FqhAvFMmya5MwLZzn+xejLpSD/ZHV0EKvLE9PBvZX1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sNzRYBNLRKkf0Y/gp9OREoymKpw7SvFmjDC5u9+y2bU=;
	b=p8uobEkXZfIQpf/W9fLJKyNoV+hyA+SbB5BD7vw4GnpiFdqK3xLZfD+f+hJviatjA3TA
	 9nKiOQF8zTb3LOj28eATPFdkmdj/CYkZFaF9CW3hjwWUtCo/tRuPOYN6dhwGfAAgUxo2F
	 sF0FUgv8e14MM4uSoJd03gjzLabcmPl37C4dhsKRYeDNTs8HHmO82Vhs0tvjVMhG3DXyq
	 vBl5203e+mJG5Cy0XNeHE+r0VItXSetlz7BVtOufTzHMeVOEZVbFJkjur7xFJr68C0OGZ
	 nFwOo9BXqHIqh3txdb71UTik2LH1GHiCgxRfiWtl0KQLp+Oc4U40lcJOF/SVJ7F6wzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skD2ppcL;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E004606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E004606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skD2ppcL
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so63302475e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662919; x=1796267719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNzRYBNLRKkf0Y/gp9OREoymKpw7SvFmjDC5u9+y2bU=;
        b=skD2ppcLp8Io6d1UOVIAK49rjMBwYkQ5KwfoDF0RZK3PJEsvZ0LRJ3kNOLo8CLUrRP
         YLgirbXYWF9Pg9MZUgEMOnzVrY2jwIVgD7OmWr3IYRQwKyqy628c3iwbsYdB+YJQv7KB
         vHhTGwfGVQ3Ei0/E0CuAjbYVsoyAsuh4DwxJKQlJQG5zWgmy8JWX3el5c2MZDoBrEgcF
         ZN7vym/yWsZoZoI9UTV2UtpiK92wOnTScZWeNi7wW7BRstB1Dh8V/N33bx6zhsYP+9yp
         Zm/DpZzl5ar/0ekbWXqDkdgm09FolS3Df0wdOKRkbsHHV9DAyK/AQ43ba3ISCwUoWztd
         l2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662919; x=1796267719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNzRYBNLRKkf0Y/gp9OREoymKpw7SvFmjDC5u9+y2bU=;
        b=FzU6NIjgmY4fqmO0vAAGyVSOYLdqh+/oEsNLIBX+SOwbADvFEZQUg7d0TXot9N1Ma6
         3zqjR2/KxYtQD1x3+MercF0E1jyjvTQieH/T/q0Y/bJ9FMLe5vVoiDuLFM3x12FaYked
         480vLCWqUiHZJtDIbAzkFhq2dyfPTn7WOBbNlv1vXr5cMwxvcKZGqnkcZjDx5+asTxY1
         5oGDGzQDUVIcmkY66+TOIyh54bC8GeRyEbQs4w50yJU9OqBJExZBFF6ux2cFqMcGM5Po
         nWi5otGmt/yOpA75TYuwl06J340eXKq9rKTx/ENQZeqslLQZevBmccuOEiRmve/3ArFb
         ppqw==
X-Forwarded-Encrypted: i=1; AL+hErFCJEa++NxoDzb9JuNLrx93E4LyGdD/IEa3umrjw+ucJdijOp+lfScrGBgTqicaj1c9uv3KUTKfGkOpCxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AQJ6vcRSYitzs8uvfy8IJg4BEUT08etkyzDR9LgoqsHptlugD
	Qw+XFXAqEoPGrD3QmtDaSRmSwtuRMwhjO7IjAtj8OmNsx4y91Ai0Z7f6
X-Gm-Gg: AZFdTZfHm7lqEmFwx9OaBt61yeyhp+NHwvrgNZWrGUPn4Ze97ChNhTrubxp/afnDPLG
	Mho9X9KRUD2s/sgMn96Qxe/LjrGxhFS8QFFtdsutwJXreP40kEGo147jZd31Y0AYjqTVSsEqhrL
	qxau0v7RwWg76ofLs2c2BdZ1jgSMYUTrxtnI6FVZZhKDBXmwA/V0TzMtUo2In1o7jdQbIHLS4Nl
	KT0vVlS4hEpmHwtVtzpoa0eRYTuQJoYks7qM44KuIzIaO/pH7F19vTj2uycHwLLELGBuqL4fibU
	s8o7CqORvKVVmGL6viLolSimqJLQU6uyRm6PUxkSYVbLOG5+Uobi4QN4mIf3dxrQE7QOLC2gkik
	XRC3gkMPph2KmIivkjV0fYQmgbyQuvIF8pGSnjOCX8Nih0qdulJ7SKNgvriPPzwxnvDMutsS1Mc
	Ss0hEnxovG5vtELdqDtJWydm6SJdBlTTi7K9MviTzR5/12gTfOXfWqF6izPxlNxY5SmUWDWuext
	gFAhm56zM5fRF5OzKf6yzHCwQnpdDjEeBBG/3C2xSbJtpo/+b/pBWODyul5iP4STE6aTIyzryyq
	PvmxRrD/q1vwYmWenl3hCACllR6hfIW9fLYKWONb/LWH5RCURWz9WuUgaADlpjh2xGru9gBJvpN
	WqOtak41IQd7IdnaYN5gMKA/0r05pyWSq9HG5Kr06G4WjxAOcNMKR5F1y/CTRm1+KmsMChkFse5
	BaLyQPdapVdYPJMZqA2m6lsoTq8X7MQ7VklA==
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr384054565e9.11.1795662919396;
        Wed, 25 Nov 2026 19:15:19 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm37189290f8f.49.2026.11.25.19.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:15:19 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	yangqixiao <yangqixiao@inspur.com>
Subject: [PATCH] ntb: ntb_tool: accept hexadecimal addresses in peer_mw_trans again
Date: Thu, 26 Nov 2026 06:15:06 +0300
Message-Id: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com>
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

Parse the address with %lli again, which accepts any base, as before
that commit. To keep the format and the argument type matching, which
was the point of that commit, store it in a long long; it is passed on
as u64 as before. A negative address is accepted and converted to u64,
as it was before that commit. Keep %zu for the size.

Found by running the NTB selftest against a virtual NTB device in
QEMU; the fix was tested the same way (the unmodified selftest passes,
and hexadecimal writes to peer_mw_trans0 succeed 10 out of 10 times).

Fixes: 21fbdc4d0b1e ("ntb/ntb_tool: correct sscanf format for u64 and size_t in tool_peer_mw_trans_write")
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Cc: yangqixiao <yangqixiao@inspur.com>
Assisted-by: LLM
Signed-off-by: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
---
 drivers/ntb/test/ntb_tool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/ntb/test/ntb_tool.c
+++ b/drivers/ntb/test/ntb_tool.c
@@ -928,7 +928,7 @@ static ssize_t tool_peer_mw_trans_write(
 	size_t buf_size, wsize;
 	char buf[TOOL_BUF_LEN];
 	int ret, n;
-	u64 addr;
+	long long addr;
 
 	buf_size = min(size, (sizeof(buf) - 1));
 	if (copy_from_user(buf, ubuf, buf_size))
@@ -936,7 +936,7 @@ static ssize_t tool_peer_mw_trans_write(
 
 	buf[buf_size] = '\0';
 
-	n = sscanf(buf, "%llu:%zu", &addr, &wsize);
+	n = sscanf(buf, "%lli:%zu", &addr, &wsize);
 	if (n != 2)
 		return -EINVAL;
 
-- 
2.34.1

