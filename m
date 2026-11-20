Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181958;
	b=18/qoyQzkDm/5U1kDca3BOlEhnBwVEoR3oPj/GhMq+0c6HtBwg6Il2SElsE3uZS8cak3
	 EOfQ8MS1OFbKcKknd38ZJx/fuCl669CWw+JFjxPY9EwgRuMl2ByrT2g/zOHG7faAesOHA
	 E4LVgo8xhFUSRm21ntjdyqzMUnqHf+E8qu5hwSJ5cRypecyy/2D4M9oAVpvS8MDiCwzlF
	 lpFSSEO/6SFGh7DfLr9UJkdld+K4mqqaVo319p2sDp3Pg32EXQSWQXKKIk3KsJEVu8qn0
	 UYYcZwe/HjIBfh8k4aPeR473VzQyDZCf9BEeZpSAV7tGJsF1ienUF8UlGNzlleO6XTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOrB8ZBemxu8yPvkvxyPd5fTfr0XdnHBAfznsD9q6Zw=;
	b=raG4J6Owu0pcn9gzepfF5VNjOvh1iz3s37kQtbVR/zzjJJ1/UvHSbkMjnQzFg+0TSrY/
	 sWFm82jO3Esd0M+YPkhFuT8nFn0OIYwzu/vQW1EffBGT5pJ9PtZ0JcCpz1KnbYXKJ6Ii6
	 2jggCye8cMCqzk5oKU7Nz/rKX5JHGB9HVrYD5Npqj6VwMj8yHAS97Z9NZBukmXyiwdtnf
	 O4yuhjHo2FiLPSi9FOjMZOo2A9X50LVFOTm6NEIf6/AisllBt0v7U/Yctri1ZVPhGbkV3
	 2xSIZzzjMFB4To4cpjAIEk52cWU4/VihffPl9PIfLGgeZSxQ/4LHV/sax8aNz08sPZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEfyWaqf;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341E606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B341E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEfyWaqf
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1815950eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181957; x=1795786757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOrB8ZBemxu8yPvkvxyPd5fTfr0XdnHBAfznsD9q6Zw=;
        b=cEfyWaqfKsrBgDY4rZncxE4ZRuSkuUIGHQVlM7Uh/BMmI3ToHjmGuCQo+nhWqG6MNt
         rCyp0/0dHancumZXgL0FJWfL0hpSBtwF8/Fzrpe1cB6jpA1s7CPDjMuMgVY5KnznmMgP
         43lQTPN+hN/arz8AmaTCz4SBXLrJSNoyhrTW97qsyN5AbcCEv9yoRnSqumuHuj3OxL6V
         08975yJqS4KpqZC3qoT2104pLZKQ150ptQFMXoh/JtmZcHLntj0lL3rfkZII70p7vxSS
         pXdO3LqxRkK7VSVu89ubRYRpxiqXBwj92MUOZQbIlP4VPGjCsckZoNC718GuhTy0Rpzh
         doGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181957; x=1795786757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOrB8ZBemxu8yPvkvxyPd5fTfr0XdnHBAfznsD9q6Zw=;
        b=HtIVVWG8W4KPBeMws2+eN5uhcZ+/ZiKlyNj3Ex4rdyfFkS+gLEE4UHQG+je1/oolIi
         VxsVmgY5S881oDqnOcRIOQ3piEC5dnEmu343ZtCCKM909yb0Ijnni7Ji92klKLPXOfvf
         yHyRt4rVQf+MMEvkXztaqXONDwWNtc8RcZsWfwlY54hj46HEQc8phsm2qbQyfSjsecIS
         47m19aGM7YAG89LIX3A3NuVHYSEkqTjkZ1Uz+yw/Isk8gNeoBy9uYEeYjgwavxJgRpt7
         eiuknfYsI4H7cEXB4ZoVXyGaNJLdw8qDZz2BAyzy9oITQraZalQtnicJnqB+ioTeoJu1
         tULg==
X-Forwarded-Encrypted: i=1; AL+hErFngJkWPkHsJKgVwyq/Tdu6yZdMG5JhFfmnlgfH52OPHiRFHzKackyavZxIQAw2cWvTn90P3CSJ7y/rlC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q7J+EqWSESMb7FM6l8ovu1jbiTxHo9UfFK3SBnWCQ+bdN6Ozx
	r7q4dcUUW0KtGu8hM3PN2FGZbEOoCuQeqeMa6cBdo7xv4iPTgclgUdrY
X-Gm-Gg: AZFdTZeJ//IR3xnS2jGZBl+UlTGqEpuQ5GprPKAQ3HyfjbE6rTfzIaxaNgQJF2+YZmQ
	BeZ/7p/Sc7ynioA5pdv8ESRzlUPetn/9tZhzf08hFWW6eB3yQaAX5Ku87nsfNONOTTfmlyS+dl2
	lMlraSpkYu7Io8hTtu3FKpr/D9xRljG+5CiVXSvj0XRSdqFSAJuIyWE93MPwPctqNwJ943uDw+4
	JvHq1ApOjLv13nnN26QnXmcIjfdtQMLYM8fHpqoPBhXnyAtMXMWpLbk4p0Ga9IKqaTmuZ9TZhHi
	4bINNdVCF3OVhbdcRXkSahZ1xNpSKVV6BGkJ5aQ6d3jrvEfMQ9OvA3d8vvVxxs9hhfsYnBaX5aE
	KR4WGWLofQAqj36+XabIbyripQK48u43I5YilrNuMnOLdg4fGCqs2GgYtYcZvJWeBzG96Y4f36f
	1rMTXm8V9M7605n1UwQ/aQSHFlxHnlV/jLcgbSyVN9nBp6UXjnEU2xiYdZtfYR3fNRGEgrA4dOn
	gN4qP8dzXaAAETUwpONsEoEMdUEbdVofIKUzlvLZEuOQErJXkkGc2/GYZm9gBo4EsjdK39atqPn
	Z58ja7GQZxJFLhN9aOFA5Czmof9tYh8ruwumLsw+QTakPppvDwTXOEV5MOIDfEVM9Sme7p+kCAy
	V2mkgGzwDuw==
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr105006eec.7.1795181956894;
        Fri, 20 Nov 2026 05:39:16 -0800 (PST)
Received: from tarun-lywait.mydebianvm ([49.205.203.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm8673442eec.6.2026.11.20.05.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:39:16 -0800 (PST)
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: tarun.k.lywait@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: octeon: Align function parameters
Date: Fri, 20 Nov 2026 19:09:05 +0530
Message-ID: <20261120133905.2146-1-tarun.k.lywait@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAPmeTTDDU3vQ7rzW9qVtruu5_RA3WNm3OQYsUB=+U3HMaQJfTg@mail.gmail.com>
References: <CAPmeTTDDU3vQ7rzW9qVtruu5_RA3WNm3OQYsUB=+U3HMaQJfTg@mail.gmail.com>
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

Align the function parameters to the open paranthesis and change the
parameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.

Issue reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e..cc1204e20 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1387,8 +1387,10 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 { }
 
 static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+							       u64 queue,
+							       union cvmx_pko_command_word0 pko_cmd,
+							       union cvmx_buf_ptr packet,
+							       enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.47.3

