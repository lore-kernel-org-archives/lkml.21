Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033846;
	b=dSer2A+dX83mpS7OPPWpGFwrq969pN/h1jwObyNavBIij1vzze6tIxV+8rYQNwDSFRw4
	 QbFYQNZ493vg6hQs0jv20980eIskF1lDhyqHizTEL2UbkStLibNX/6WahI224+SxPstDg
	 Gwe/z+fcTccf3QzOyQ5lUvwwwW1EcetZ6tKEYFqNNbJAXolDFu+hpjON6TZEJOYLxu2xL
	 fXtH6OooB8dZilT8HN56w2c4GQAeCfGmTrqpULWroebc4IQ5b5zq5G4t6/q516czOLnv1
	 kRYydf7JrNdyElwJJJnngVHqGDhyMEs7SYnEL8Z5KSnRhlW/UNqMQZNqooSA26papgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033846;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EmMKr6gSHoH2dKRP5qeeryr94SYQSSVn/xmvtlztII0=;
	b=06wHtaZ4blEUwQ3sz6pvw4dq86pZyBnJZMFwwPXZzOFUmje9LDOC0WsZqhjGnEahRZcr
	 DvDbZYdTmKM9lSX5wQNLJ65S1rtClx1W9UZ8kgVzPV5S4eUbpjyKk/SYtwzyreEr8g6Xb
	 myyNrlC4NqA4QVDoVUUBRgGMjxiL2snfDCH+Hts2085Ij806Mp0CQSLB5qMzx1qiahzx/
	 8EDJh/+GPQtuLUMseXPa07v3vPYZxGqzIQgWRpC8ss81htdx8nQjUd/UE6aF02VCGl0u7
	 RpXRDH+hhFJV8Q++6qNs/qlWtdknBC2+4a9H7js1PjA9PFFopAyvcXnYgfETeSbW4rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="r/4UGTfV";
	arc=none smtp.remote-ip=95.215.58.70
Received: from mta1.migadu.com (out-70.mta1.migadu.com [95.215.58.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E8606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82E8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r/4UGTfV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AsyjQJaO+QbLQmBFS9Ydf8nttCyuw8mAVUIvRm2Y66o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795033842; v=1; x=1795638642;
 b=r/4UGTfVpgnLp5bgcuF487KDCDTFkFp4oHBZamZRqB1sFp5kSp8MrHkQIXV3ScGC5Kee+pFO
 nEpSrHSS4mZBaskS08GH9oO1NqmwiAvnV0nFXnRLkjRGzzxRA6GcUWR06vsFRcxVEn33yp7iVuy
 VbdgbyusWRhTnPgPqSLjxSi4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9e06d7d80b8442fc;
	Wed, 18 Nov 2026 20:30:42 +0000
X-Mizu-Trace-ID: 9e06d7d80b8442fc
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 20:30:38 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: a.kazinsky@ideco.ru
CC: danielt@kernel.org, dianders@chromium.org, gregkh@linuxfoundation.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, mort@sgi.com, naveen.osdev@gmail.com,
 stable@vger.kernel.org, tim.bird@sony.com
Subject: Re: [PATCH v2] kdb: Reject non-positive BYTESPERWORD before division
In-Reply-To: <20261118072853.1578323-1-a.kazinsky@ideco.ru>
Message-ID: <D82C97F0-F6CF-4D7D-BD47-4C1870A7E1FA@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 18 November 2026 07:28:52 GMT, Alex Kazinsky <a.kazinsky@ideco.ru>
wrote:
>kdb_md() uses BYTESPERWORD as a divisor when calculating the initial
>repeat count, before validating the word width. A zero width causes a
>division by zero. kdbgetintenv() also casts an unsigned long to int,
>so the resulting width can be negative. If the width is -1 and the
>scaled count is INT_MIN, the quotient overflows and raises a divide
>error on x86.
>
>Return KDB_BADWIDTH for non-positive widths before calculating the
>repeat count.
>
>Found by Linux Verification Center (linuxtesting.org) with SVACE static
>analysis tool.
>
>Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
>Cc: stable@vger.kernel.org
>Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>

Nice!

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>---
>v1: https://lore.kernel.org/all/20261113111152.4190309-1-a.kazinsky@ideco.ru/
>
>Changes in v2:
>- Reject negative BYTESPERWORD values as well as zero.
>- Explain the signed division overflow in the commit message.
>
> kernel/debug/kdb/kdb_main.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
>index 40c332d2179d..b1719382144b 100644
>--- a/kernel/debug/kdb/kdb_main.c
>+++ b/kernel/debug/kdb/kdb_main.c
>@@ -1527,6 +1527,9 @@ static int kdb_md(int argc, const char **argv)
> 	kdbgetintenv("RADIX", &radix);
> 	kdbgetintenv("BYTESPERWORD", &bytesperword);
> 
>+	if (bytesperword <= 0)
>+		return KDB_BADWIDTH;
>+
> 	/* Assume 'md <addr>' and start with environment values */
> 	repeat = mdcount * 16 / bytesperword;
> 
>
>
>

--- Thanks!
