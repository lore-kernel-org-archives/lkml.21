Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592399;
	b=kZBT060SuVe1SKOLChwYAHRUnGo9kGEFBoPWOPH5KjB9gfywbKjfkknPKICtXB9lyne+
	 /h8Q7p14ryLq2AJcuB+qKXQZbs+9dvYmVfppxxDcA4WuHXSTGEGvbhMQvoSPhnks9EPo1
	 szbojxKFpbPB47gm4+Xr5xRCbtoQnu7zOs9Pr2UY5y0HGlZ2Agzg9v67UcnZEWjgZj3nt
	 /aB7u2LTXljzOhWKb29NYX+QP9qCrnuO7PqJZNyNT2Y2zqmj4xDMXIgqfD2CGRv7shmPx
	 r34Y1uLiAhS5Hl0eumb58zuGqDH9bUO8clGkthFtHfl0oDExIklmLN6lveHhn2LxMpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fic+huB0IdoHR3E/p8bmW1S+ux+MyhR7gu/qGNu0uOA=;
	b=oSU4fDUR2gGYJw8PnjvIPqa1x8IISdwJjhilEgiSFS8DFIeoUl7eRfrl/FMPlmUPQrxe
	 uesWl4uXNIwkHj1P1SYaRfmq1R/iQjstpQiOUdQj4PQvXaMYw8kmqNBa9LqaLd1T3VdV2
	 mE5Oy/cOyjmGtxRFP6YKNszuL7bcYyimFr587jb6EmDFDJqxB4lQqvToGbz80N4SWdwYi
	 MKfyb8haXbGXOFZdzFJXRRnFy8LVFGD3VKo85vI7u+hrwAqu5TFlJCYxZss1WQDvCH7hN
	 PwwAmLYWrfbbqPQ3MIq/7JldwdU2ilsO8plyMMHCIeLty72dqLaq1qbeu4UgJlDBbpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjjSHTcS;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C84606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C84606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjjSHTcS
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a9be758734so3369980f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592397; x=1796197197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fic+huB0IdoHR3E/p8bmW1S+ux+MyhR7gu/qGNu0uOA=;
        b=cjjSHTcSrHrh4Uxp8wVViuT4smzPfmMkjlhfaP9Ka1QzEjRMy9zDbQziVzv1TaBRYW
         aF7+sjCV5MT4p0r3q7WYpiYe+k4+PwcPC5W4mR+cGDYkLrsQkmRmKPVTi0zkrzSv69d5
         n9A/5nrEsV9exQCHsIhMgOlj4UrbORTRRk4QlZ8a1Th9Hl4b6Kos3hLAXjRCUHDh/FMo
         TFSg1y6DPd+TlFQj9EzNCMjXYHzYJUJsSzhhrlIUjkw2Bt2n7UVUHmrd0e4UtLeyLZXm
         CsNq69+hQCp/Zj13orM1N/2tzNO/LUjU3+7CEiDkxR9Vnmnd9zC/s4ysZbQyZkvz5u0S
         JeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592397; x=1796197197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fic+huB0IdoHR3E/p8bmW1S+ux+MyhR7gu/qGNu0uOA=;
        b=RbZR3/rr8unaDhCMk+Rhl+Bz0b/WZkwkUhLqDijSs0rnBUaCRyOna2JDFxc9xsHI8q
         7pDQGZrH4SlAkOIn/IFwhlzuqnSEqA01wjoSUrX1wRqSdhz9wEAIRESvyZbjjOCB1DaF
         k7QCw1uFnjC3rd9jx3QSZBtHSZaoSqHi/JfYwxbQ9+6jX5/6VjXVcVtcoWiK0XrGJDAE
         ot6x7l5MRkAKgRznS1sLmDg7FatIsZiy+hQqCzm+gpRcks5idtTbr8AhXWBowgRvNdy9
         jSwplipH0dASfPwK9nHwvJRbQYSue1vGO8WhDzHkdFTKIRMUUN6dTt9eV6pv2fNDgDus
         b6GA==
X-Forwarded-Encrypted: i=1; AL+hErGsETR7Qh5T4PqFYca0VayQxkVK9UEOeaNlVHVK5EpjERrjTTRMfGPkq50Wuo5WeOS3Bhnw7cKIfs/XFoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pQnUPFSc71VAcQ4i2FQL1mPFjdTIWW220EKMpxv3ezxDdZXVW
	8n30oZtJfSHzZP0NdL2Fwg1iFc9upaaQdOVELbzXOon5xXgpbAhAaTlA
X-Gm-Gg: AZFdTZeo3/BQ+8/7Y8IjE36a+2VICaLfTPr/SeSQ2Owirfsc8nsltZbMRf0pUF5n4Dp
	ccq25baaaxQmErwMaH+WrnSTV1qRwZPkDT02hTYffMnxZh8v4x6swKkIbrg4CM92v6N7zYjXP7c
	XgdzyqR1OzzYbJKQRlPdObEKA9FGvkq+U+c+eE3FQavwB303Shb/769lrorr0J1FZMkU1tj9vcj
	NBcKh6wxhvt585IvAmYP/BVwnWlBrAc5LMfn0p2mNzzQHPam1enzsrPsx0RONbgGcpvTQAEJ4aK
	R+eg4D1Uz747Mg/2pjorf+vvKCGZRLIofUSYy9IlsKHQQeeWff0ckafhqXHOycEt9T5T3awqWwj
	hchP6O1ShPB4YC1ShfBezyzoe79SnjI5V4UQJ3CbGjWxBPiAOib79TY9SNs0HyeXdYQUDeYpQeo
	yTfe3C9vGXRtWoEXOBXhibMrLrLbTJSONZOGpmTEzyjPogcOle9YWfsqhJ08NZxEx4P6ciXN6rb
	WuRKOBc6BpHuDXijpJKZQxmEgZDrbdgo/6R8JOZdPIMOyrST45TQUGKEVNLtScXb9mbxmYtrAlT
	+cWavP9aLa88wd9YGjXBvrdMEhSEy6T2pF50tdrVammPB1yy5liRBWdow4QY5TG2hesedeX9uSv
	Jt5GbDQawqU6g2nsVWFaaO44OkMNuFw9k9GvZniQwrDCXElQ+wukCgQiON6htkHkOpf3B0oPqWH
	32GprWLN7gv0sthx97FajeS7MgIsxYtR5Hnn+rwWa9lT4Zrx+Gim5ODem8WFAg36hwslRZUJUsX
	C1v5kYtsHtvjyKQOA==
X-Received: by 2002:a05:6000:2b8a:b0:4a7:b365:19dd with SMTP id ffacd0b85a97d-4abb4b85bcbmr21938249f8f.53.1795592396978;
        Tue, 24 Nov 2026 23:39:56 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-fb56-7a23-de2e-e3d4.rev.sfr.net. [2a02:8434:fda5:4201:fb56:7a23:de2e:e3d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm31725489f8f.47.2026.11.24.23.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:39:56 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: bootconfig: Document the current config limits
Date: Wed, 25 Nov 2026 08:39:41 +0100
Message-ID: <8b11df1def359a2b28cd4bb6c42606e25ab9d6d7.1795592381.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Bootconfig has accepted 8192 nodes since the node limit was raised for
DCC support. The admin guide still describes the old 1024-node limit and
derives example entry counts from it.

Describe the current node budget and how keys and values consume nodes.
Document the 32767-byte limit for initrd attachments, including the
terminating NUL byte and excluding alignment padding.

Fixes: 6c40624930c5 ("bootconfig: Increase max nodes of bootconfig from 1024 to 8192 for DCC support")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

Thanks again for the reviews. The guide still lists the old 1024-node
limit. I checked the 8192-node limit on my Ubuntu machine and tested a
maximum-size config with all four initrd alignment paddings on top of
your padding fix.

Thanks,
Eduardo

 Documentation/admin-guide/bootconfig.rst | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index 3d6412458c8b6..30bf89cf0f67a 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -354,18 +354,13 @@ The final kernel cmdline will be the following::
 Config File Limitation
 ======================
 
-Currently the maximum config size is 32KB and the total key-words (not
-key-value entries) must be under 1024 nodes.
-Note: this is not the number of entries but nodes, an entry must consume
-more than 2 nodes (a key-word and a value). So theoretically, it will be
-up to 512 key-value pairs. If keys contains 3 words in average, it can
-contain 256 key-value pairs. In most cases, the number of config items
-will be under 100 entries and smaller than 8KB, so it would be enough.
-If the node number exceeds 1024, parser returns an error even if the file
-size is smaller than 32KB. (Note that this maximum size is not including
-the padding null characters.)
-Anyway, since bootconfig command verifies it when appending a boot config
-to initrd image, user can notice it before boot.
+A bootconfig can contain up to 8192 nodes. Each component of a key and
+each value, including each element of an array, consumes one node. Keys
+with a common prefix share the nodes for that prefix.
+
+The data is limited to 32767 bytes, independently of the node count.
+For a bootconfig attached to an initrd, the limit includes the
+terminating NUL byte. Alignment padding is excluded.
 
 
 Bootconfig APIs

base-commit: 56bb11fe6aacc7666938e8e6765b44aa0cf1fcdd
-- 
2.53.0

