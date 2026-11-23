Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466593;
	b=gz6D1UrxJ+31a+CZOjfPuK5VnnAgenN2uA4DauBLBHJ0uruTIbpJVWRDoPW+Mpuc/ryO
	 PiGrPAn37RUIp/u9m1iTkyGG1WF3ufqtZfTkZNHK6hI/oh8cdu1gCx8ReOfMJB7TYwpEy
	 k4WdQe736Y1EpikhWLg33qiCUZbJ+Z+q7tzzrkfareD0NmfZuccI+hMsDpxq2XfCuicch
	 WL5kH3gEVQmxFOtNzdnh+3w60ogrRcoy2BMKqQNFN4+pqtV2oVpJf2wS8edMqVPhDDlFw
	 rtt90qFRitmX2eEqFkjmtn0faLVbNX8UNTcK327IKf+sLEeU1lWmTVhXUWRS8gXA57g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QtiZhwkGYCfkjpfowIk4zYjE3fkt+c8PM5KV3KV1qLA=;
	b=OaAUDV0TQqeoBlhzwyOH+BupIpTEHmV5MRXg7/XB2mJU3Y+OSuX+Qq4XExLiFUTFC55E
	 LekhDpzCKyM9jhHJWZWzO4yhnSrQaI32OFpvIdlt/K9VyMKkKQ7KsMcEKoxFSGakAmb8+
	 g17FYAdvbFge14l7yY5edvXFfOs/X+aFUJ5H0oNhSECjZKHZU1Kx2PZc+5FnDbO84sExP
	 kaCHZkQWhfABBUnu+6h2q77SO804kH9rGKnmUGWjy9MXch7YRqDFLvjYjlFTCK7gLEYor
	 d6hRCr4+bKFiS10nhoiEWvZBmnxcuyK6jahfHvu9tCq5B7OsPH17iyqEeGVsCxBXD+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=vJkyG8na;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6F3606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E6F3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=vJkyG8na
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4680797c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1795466592; x=1796071392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtiZhwkGYCfkjpfowIk4zYjE3fkt+c8PM5KV3KV1qLA=;
        b=vJkyG8naUT0sTdQ0UOPpATyaoGijs3zgJ6U6Cja6AAWEwrMNcpQ5abv98Xph5elhLd
         8/KXUmh3iqum6EUykH+Um0EQhBqJCFHAiESeCtR52l9uGR5QnyPIiksEiGlgclYkEJPe
         HLoJY0V2eyi4bKcPNxxE0RPybVOalwr4UtXJ55GUPzVgaXLhGqbwE3SnsmrJFE3iOpuD
         3cxMOXkq0FGU1GWxUj2tggbz69uLuV3MsUn0a7wcRKChifkVEcrhbKgY+g5VcCYXG1n4
         RnVLEE4KdSmqrBhEjAJXI8oQYL6lqm38DZ4qEbcZKjxjCB0w62P5VaFprDAnIJ9CCs9N
         Gqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466592; x=1796071392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtiZhwkGYCfkjpfowIk4zYjE3fkt+c8PM5KV3KV1qLA=;
        b=oSEH1rbRQDNvUtfuoGaTIojuk6uA/yq0qAUmHXxyBUdQmsWc9Xvt6JM6KdMtybXpqb
         8a6GS+FnbaVDM4fBto7fxN5XvfJY3UnWxO2hb+pPfbmHZz4Y9EMaq2y5JPS1OlXb0OqV
         xuM16SuK5rT7QNJxtqNO18VO0cWUBcXUmWcAFvNU0mMoVvSg2U8G2T8/GbTBBsQ/+jhq
         tDIx3JbN+/zdVKNKla8g2+kVPmfAjYFA1GJ1dD0P2XAV57RbK2gTCJu9zvmMvTWvoVtw
         3iojPIyz4s/TE4YrXlUiDIB9Z2ToM/ueU5qJTledux9oVmdqyLrNmdzEqH1oVu87X773
         xWBQ==
X-Forwarded-Encrypted: i=1; AL+hErFPj0F+00YsD8ndV3uKZJexUBCKzBLLiooERsqhqKp1c1kc0m3p1p1n3H9T/cHzYDXwOZWxglRYa/tlIoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1vDXqKQujj0ZKmqyc/hSI8VhyPa7Y3Aaw4AvE2XBqf8bX1Zdl
	k+Fq86BUWMI6DgSao4Ju+zqSi9lOGqGk4fXGv9bNOXfJR6senGa+zy0s0HafVo/xYA==
X-Gm-Gg: AZFdTZdQ5SXr3nPcA11qXQPAdh4TF1NLzgbnqEMoP7OCFZZszYm80XoYlpMIDEPFt6H
	hoSIzQggjWaqKm96OI6PGr0cWSa0ZGZu+QVaHjdeUqTW10nxZDTN9yh96vto60pdZPujSbDij1j
	cJWbfCVsFLQp9v+U9wFgLH8c5T8+6UrrNr3paEGdkJZANjFGVnDlDL9bNqzluKY0XvqKYzlYOBc
	azKOfYB69b7nvoLtliMJIyO3TuvEnlkgISmAunkPaQjFZYi1NgmsWCyPQVe7LNEJ6UEG9465k4x
	pscg1IMGEQG3hfsyDPdB0inAFyLF97E81+1Wc+oXAEIxcxT57gEfHGcfAw0w/Y71PgAPagkHSXX
	/DwovrH+47jD3udRaGbDTMd91zt51d9yOVPzuRPoq/0/DcN9NgU9NkE8qf1hcQRWx6ZUuKx3sIT
	BmBRvL/vFff2rgcdGzfAj+5X+HAXSUd8pLfAGxyuHHDVOOSm7AI2k2F8GBT0zwlmcghWd+4/0kJ
	UOTGJnb1I/PDUwllTzOfPDMXdPJPgLuf0uhjSpd/qrF8+UmT9SiRzLY1sc8mnPKNvgJM0ACH2ya
	AR+uB2yH5LgHmILq11HNyse8T5GrRVeQKtLJUw==
X-Received: by 2002:a05:7022:ea8d:b0:1b2:373c:997 with SMTP id a92af1059eb24-1b5568f3c7bmr11869653c88.25.1795466592370;
        Mon, 23 Nov 2026 12:43:12 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm17407732c88.4.2026.11.23.12.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:43:12 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 5/5] 9p: initialize ecode in p9_check_errors()
Date: Tue, 24 Nov 2026 05:42:57 +0900
Message-ID: <20261123204257.3055515-6-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
References: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
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

An RERROR of 9P2000 has no error code, so p9pdu_readf() returns at the
"?" of the format "s?d" without writing ecode, and p9_check_errors()
prints the uninitialized value with p9_debug() when CONFIG_NET_9P_DEBUG
and P9_DEBUG_9P are set.

Fix this by initializing ecode to zero.

This patch is assisted by Claude Fable 5.2.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206901@kernel.org/
Fixes: 51a87c552dfd ("9p: rework client code to use new protocol support functions")
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v2:
- New patch.

 net/9p/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/9p/client.c b/net/9p/client.c
index e21d13e274691..482be6f375234 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -400,7 +400,7 @@ static int p9_check_errors(struct p9_client *c, struct p9_req_t *req)
 {
 	s8 type;
 	int err;
-	int ecode;
+	int ecode = 0;
 
 	err = p9_parse_header(&req->rc, NULL, &type, NULL, 0);
 	if (req->rc.size > req->rc.capacity && !req->rc.zc) {
-- 
2.56.1

