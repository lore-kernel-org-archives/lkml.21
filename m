Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729946;
	b=jP+pvqrF61R+xo3HlCuoZeAVWo1Bab6O1xYzqJqrd/TfndRS3KRHPc+MTJxQ//ZFMLY6
	 ya0Yi/WbyujKpx722If4ZgsvioRd+PZ+aY+K26m+z8Uwl7O9N4JMnrpEE1QnIsGyfOAUw
	 MAS9vVFQm2AwuaMkJGAxpv5TrzNvC5gKVUPqDcsMcRHaEBGTOZwtiCyWEg9IqEj9Bpn1a
	 N31qkmSV2dQf45vzNgTIFNjooFVKg67z+gYH09H+R8zHYpDk+iWfMWV/QTXcZp9h1vKrT
	 OjXycVAMfrYduqG5lrVlgjNhQ8f1gupoj3QLPWRjdAV3f+lEmxGY65FiSV29VfjLyZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1YnQvOR3Gw4bXN9YUJx9Lq77dYCC8vrMp788asvQVV4=;
	b=aw05jQNzf9SWUAv5YLuiBzRzJ5GeauySwXCdK0kTXzA7+eIpjj2jzAcVet9u8LT2rIMX
	 u6X7IpKXumYOHrnrnW4d8YvZ5X1MK8gGu/tr7MoR9AlzHGVAfis9Pm+aHuTm2iECKqKJr
	 rvgvq6MQRfjzXuGVFbmng1XCjfTOY6dYqpGsSbotrivbl2OJ4JIeCMWR4XyKE6XJsOZjY
	 leA1+vNCuViAM5FPQTwg4yjfctyDeljNhWZrt45e0jU7rzYnYUunFgvPltPK3a0/y903F
	 lc0xNcxnNCV/OSh6aJlVKT5siTNL1QiP4ClL84+2Fx0b+9mnj4Orvcv4MPWAoRx6quA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhRgkBfE;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4C606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhRgkBfE
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso5710386f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729945; x=1796334745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YnQvOR3Gw4bXN9YUJx9Lq77dYCC8vrMp788asvQVV4=;
        b=rhRgkBfEQfLvE1Z0jzXnQdFA1S7obYbq9YpsAIojpl6lupXu83Qa5rnCMEmkz7SO+t
         41S3vzCyfG8ktfvgZJWMACce9N+m7McHMQTKFOLoCo8zW/hcnfGajl6RfJrLjcTc1He2
         UfBAnxJQaKBHT416TFk+Wu/t+727QrqAhGcygteSR/r/cDp3OnG1znT4ecUN4OX40ljo
         XUG94eZFv+FQ+zjkaoVoCxXcOurqdDdhnB7oTCWhbX0yH292J6KtTZLJWPtptUHQMsV1
         qg/aLV2L14jtCGCHCkjCDVOMKXOGDAp0BLqoeYbcCGG2Vdj+H3s1vzXGjv/Ix1753Gs1
         3j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729945; x=1796334745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YnQvOR3Gw4bXN9YUJx9Lq77dYCC8vrMp788asvQVV4=;
        b=pOX4/tvQXDhCXox6yL77MkKFE3P/N28yCRM9Z5Rceu/PvCcEpU7vNiymazD18DZTN3
         dozFhvz/btFwfqND33ajnXezM81xS2D6+LNed/qNQGuV5kMoIXh6aCvE+hQa04KE+lzg
         mADd2kIlbHs2JaE3c/3FGUdBk212OpxXpfe+TjYAlts7v83emo6aBRfQpoV5KjMNVK/C
         1d4puIcpgdtdFN78X87/sTyoR2yYRbjfS04QF55mgPIq8GHDcnxCclTrTF/2vmsJPQTC
         q+lweAisV70/6LKCWz3Ubo8UILwLaw3m/HAY+EEbtFk+LnSItLydO74znRrXNAA0UYcW
         mkHw==
X-Forwarded-Encrypted: i=1; AL+hErFC39LS2Lq4bXASVDPpHDHdo08QT+AU5IQDkDz7wayawHK6265FqxU5tKIyetSXsI6qfj9qaSr3lx/ZBxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qNRY7wZNKqSz853Cam9iYZYUFcsI6kuU7+bWiwrG+jA4Xc+NN
	aNPjLzOxEadeMbt7LIK1BC0YiuhaaFkK136J7ncGZMf4MiG63b+3Fu0mJg9H0A==
X-Gm-Gg: AZFdTZcUh6SltZ6FCcmAIC+rwEp3OjScJlDT0cRnDFXJ02CN+qXNoNr7QvLnCgAynoU
	09DbTMgWBP/PAk/6snVJEEfbGv6noE5Xu8Mr8TIpzHIwp+llRG28PobqTjZvhpNvnzQEtrPSKUv
	cSRjXn5+rHWvWEWLbA8OlmJKKSh/nMOmZlDqhvGpjZFvGuQ3S/uhiypmPpcNaGNSPlWW08GvyKf
	NifdxRFg4dL0AhhXezZ+XSyviPHrUKG0cxOLRLkczrFZPgk/7zRvVcjHJJIMObWSzHsBaTN1m9M
	lQlQon0ORDwSwWnMQZnJ02BkgN9aSFeUNBfa+ZwRPYjYoeKcQsb6MNanklHsI1PpEWU8/gP8Qq9
	6TW60rKe/W06fTXTMJ76iljS3/M5bAfWHOEJceDdw2Y3uAWIl4/ZWNiRlk64l/HGduYM3ZxdLUA
	1Ad12olw7a/Yk13LLltLpeh/49vQwa4XBNWHB44Xva8RgJ84HzY2vM/IaoRt1qoGeJNmOX4Dzv1
	vz5Pear/f/V9Hl5T1Kya4omcR2lCQTDr5egxifh0C4FGOa9gNa8M052kwxKWs+oBcx94XynLRlc
	XiBMsLG8HjfH45maMUrWvoPCW2GWaGvwiBp1ntgWhTwmyeT3YPyDiUfeT5jNtRCi2WyEjz5LiJj
	+xMEv0zF/lBR7j/GywLgJi7NwfB+ixlbF/JU=
X-Received: by 2002:a05:6000:2c13:b0:4a6:dfe3:fd93 with SMTP id ffacd0b85a97d-4abb41f4dc6mr41417768f8f.40.1795729944154;
        Thu, 26 Nov 2026 13:52:24 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm42820523f8f.42.2026.11.26.13.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:52:23 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Huihui Huang <hhhuang@smu.edu.sg>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing/filters: Fix glob matching on zero size string fields
Date: Thu, 26 Nov 2026 21:52:20 +0000
Message-ID: <20261126215220.1205315-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The "buf" field of the ftrace print event is a char[] of size zero,
and filter_pred_string() passes that size as the length. The regex
callbacks take a zero length as a NUL-terminated string of unknown
length, but since regex_match_glob() was switched to glob_match_len()
it treats it as an empty string, so a glob never matches:

  # echo 'snapshot if buf ~ "st*r*"' > events/ftrace/print/trigger
  # echo start > trace_marker

Use glob_match() when the length is zero.

Fixes: 0a6070839b1e ("tracing: Prevent out-of-bounds read in glob matching")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace_events_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index a9d77df3e19a..42a57cb57ff9 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1118,6 +1118,10 @@ static int regex_match_end_dynstr(char *str, struct regex *r, int len)
 
 static int regex_match_glob(char *str, struct regex *r, int len)
 {
+	/* Zero is reserved for a NUL-terminated string of unknown length. */
+	if (!len)
+		return glob_match(r->pattern, str);
+
 	return glob_match_len(r->pattern, str, len) ? 1 : 0;
 }
 
-- 
2.55.0

