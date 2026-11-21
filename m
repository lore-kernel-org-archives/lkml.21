Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260734;
	b=g1vpsNILWOIHLihpSioQoWLJgCD3e090w6AEi18/YClTRO3oFTikA+93wNDLmFovXebM
	 y0DV8TVamX1+UkWeuluAIlZ9OD+1NPAuDJXarFOc3dZ5UgEYrSfHQ81weBie1Zxonl5HS
	 yAGEZe52Pj8DOg+dZkfd7X3W5cIbDH4UcgsDjOh83BlXRLZNPRBH8revpT7VOm0n3ldn7
	 KcCbtxBeDqi49K+s24bNG/AYMee6jwsCCBTKobulLrMG0HgYnHb324OU7U15INTQemMBi
	 tJi6BAsXWvliTYrVSNxEzTfTYEDHKN6rY9BDHRqWi1hHFoDHGykow2X7fL8JoRHGE/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eReobK1M/4MSKVVNxfhKdJx4Lmw1aJcPP01j44uODU0=;
	b=0PYOJwMTx6Bwr4cjC+NfRBvLaeUJwG9wRLvZV+0bfa55N9xfr1XsG3cxV5mNpotHF13N
	 J9yxQ8RZiCXFeRLtD2UymgMNTEDR9CgyZzkTmurwJHDtusTzwzzlm+MAW3UjRvSyoQGNw
	 GCWlzP3JyjYhkTm8OtFIBO2NdAEjfwRVjNu9PEjR18vMurOpnM7M0mXHakz4Ek8FvWECj
	 gge58aGvQ/l8V+Fl8gGjD+Bbnf6ycV0VJGRnbPjEkRlG3MZoL0yTQDSEVFIq5xDVa6Csd
	 e7CYRJkBrm3KzhTs0ZxTG/gSoZFkZPZ1at2WOYr6CPXcmqZRNbUSn+3dR7wZm64k3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hk85h/gy";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB808606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB808606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hk85h/gy
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1786077a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260733; x=1795865533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eReobK1M/4MSKVVNxfhKdJx4Lmw1aJcPP01j44uODU0=;
        b=Hk85h/gywmD+mYbWlOQCBAKntNEl7TzJiiWWSQOQdan3JY4s5yzfxEryCNe9/rg/Lu
         zMr+0BjRrnEwfhRrpEZhBu87WBgbFLEuse9gLwhJoixUx1Bz+KqBia4xOTCkUZgL0L+g
         SW0cBAUS1xcf53dHN5FVs2r7QT0aqVYFfLrdahxefIQY8jz49alISdi/EY227XsSpQ8d
         tfjydyOEo3Bq3i2zicGZyTKSSaaDU+VRpJJJ2YLW0ntFXCwBhDFumGSbtFH/b4Cm480F
         bdWgLMHVpU75FG2mXCzV0tn23Svc/uUd0FnovbSAi+5y4qIH0lGaZ9P1K/kHVU3ndl0T
         u5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260733; x=1795865533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eReobK1M/4MSKVVNxfhKdJx4Lmw1aJcPP01j44uODU0=;
        b=Co11APRg/lx1942qyCn1tJ7WR057qSvROTUv2Cmq996r+V3MF1VMBdTzI0UZ6R0Hry
         UDOYf+m64EyWAIDBZljnRBVrioJ4ntZKSmGFF9WtQFTULB3d5xoWXrkilVnV7vVGp/Sf
         iF1hy6aG5VIi0c7h0o5ws87flYHo3PDRYF65NKrH6kq7Md/0lFf5xd7g1jvvO2QH+PaF
         Ek6fcifGlZ5hLxUmQfFqNhZSRM85zTCFOSvHxx1bD/VZ+08IwdVa6WSzcVyBqVYUhCic
         eBgpftmCtXSOQwM712EmgwYVDovJc1kWRQZJ24lEYEVZxIihKRIn9P1174WdvLYPqp6X
         Endg==
X-Forwarded-Encrypted: i=1; AL+hErFMOcGe/3pCeAPRnMHgXlr/bJu4IXYeu2rrafdDymCnufbU0RYf3fNUwk+bP8ZWN6ug64Z5TATdLIgWi1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8np4dBPwpV9ZpDGgqNnLZG1sCi02ISOvL+8uqTAiNbU+ma9FKd
	MEzO95TjocmeLGpyFDYWa86LrYBEQ1XuLSd0HXJSNO7yDN7dX0oXBrP5
X-Gm-Gg: AZFdTZcBg8wiqVxrXFi7C8sIJZQ7Qbh649sWRiGJ6l7qVNf536MKDesiqe+jb18k7EO
	ageu3TaN5hus4DfTIt1Ehiqi8p5wxKpxXNogmEmWBqjV+lxyniq8lA3YpDp5Sb8wu7eMmyi90re
	uYlNxX6EDhdelw796yYSQD3qqB0lNk8Io7cHF1mZvhy8/qBzsmgvEGrdYyRH/M/C9ETFt8D+ijI
	AktZTDBAqtQp7EONfAgT6BOZZSbYYv39ZF0Y2cfwMnQqLlvToeSZt8mqbHBAgbX+YN8OZGajHmS
	dZXIdsB71wemV25UWZ3EecCyTbm9hMzdsglQsJZCYyboWivMjLk7JkmM5k9xWkK52QO/B3jq/g8
	NEPZqGmcjlrVIQUPMURH7FdLlB5bj7wWuAmbVERaAvoQGs/HL+766z5zKGXDPC0A6JvIHssrykX
	pdweMHneaPsDO1qW/l/MMqZFXWKIk760JPFSJdOZ9NMnivxPsILFvvmt/ikp62M+s281z6nJBOh
	drEauGjX7ljgK2dQawQC/YIje75jDi243sOut7hGRhn1ZzUONwBujSiixElmCbqfjWmWFP5eMWQ
	7hSPRShktxDl4gyXJJ68+wAqcUHVx1JME56+c+1rIw==
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr5850701a91.1.1795260733085;
        Sat, 21 Nov 2026 03:32:13 -0800 (PST)
Received: from [127.0.1.1] ([220.196.193.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm8322610a91.2.2026.11.21.03.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:32:12 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] verification/rvgen: Cover an invalid monitor type
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <0d9350979dc4cf67e8aed1171b74b9f6e56f6b52.1795252297.git.chaosheng.qu.linux@gmail.com>
In-Reply-To: <cover.1795252297.git.chaosheng.qu.linux@gmail.com>
References: <cover.1795252297.git.chaosheng.qu.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add a rejection test next to the other ones, so the new check is
exercised.  Without the check the command exits 0 and leaves a generated
tree behind, so the test fails on both the exit code and the message.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 tools/verification/rvgen/tests/rvgen_monitor.t | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/verification/rvgen/tests/rvgen_monitor.t b/tools/verification/rvgen/tests/rvgen_monitor.t
index 5f2562600..2a48a7b54 100644
--- a/tools/verification/rvgen/tests/rvgen_monitor.t
+++ b/tools/verification/rvgen/tests/rvgen_monitor.t
@@ -64,6 +64,10 @@ check "invalid monitor class" \
 	"$RVGEN monitor -c invalid -s tests/specs/test_da.dot -t per_cpu" 1 \
 	"Unknown monitor class" "Traceback (most recent call last)"
 
+check "invalid monitor type" \
+	"$RVGEN monitor -c da -s tests/specs/test_da.dot -t invalid" 2 \
+	"invalid choice: 'invalid'" "Traceback (most recent call last)"
+
 check "missing dot file" \
 	"$RVGEN monitor -c da -s tests/specs/nonexistent.dot -t per_cpu" 1 \
 	"No such file or directory" "Traceback (most recent call last)"
-- 
2.43.0


