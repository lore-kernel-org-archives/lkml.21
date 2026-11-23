Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434306;
	b=sXJRWVz+wFersOwneyOGTxOV5LzjNuMES/Bmja4d9LTSePm9+u+bWDGpPFQ3hL21jk40
	 KbISXws3kfA7QVXKGJDO9wK4U6QeVB/+116Ax5klI/knXAnnDqMhIdgS4NtQWqamUcsPy
	 Ltiy4o92lST0tBFP+6t0+svlzWsdDEeJsFnwpNM4sKJOVXYcOJ97g56SnWuxXhMX80s6g
	 VJG4i3EMDA0WdypEuk9k+in3YhLb/Qk3/mQzF/a6D8GVKn0L6KPUbXBcyUyQ/j2PpcsrJ
	 fzkum8D5dnrjsl5zJ+FH4V9pGoZVm2nfJr2wFP5P0Ia6jSFQS0t/QwRiQYSUDKIpg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pVqS5lS0RoTOTBL4CoDpn/qs9ZBbwa0oy02KVDKJZu4=;
	b=UAHMHNXBZurTKjfz7KRNpxN4mFjMHs7r7qDk0oxz0YaAGCw3QgSRcSbDQcmFp2W7V460
	 ENOU5CfUpjOMV4shr6l5uoBumtJ8Gsn/G32lDEQwdhyhApRKmU0xldAR0OFOXTDopsJ6l
	 olrESTfFqqb423fhz66DWcAKoX4gjvOwX6kfsS4t4NZmgzUmkrjjDkMLb0T91qO5et6Or
	 8ptvrpSmWHJMcNhW3gqDm/73Ra/NoWj6D9qWLBkIU8/HUpIF/htwbpqjUdACvJ2/f4LUq
	 2L/ySP852LnWm9bTo8aTAmHDZhgDgy2+7KAycF3tAummGJWX61O+ImWHKjlg/PIaNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHJMp8Bm;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4083C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHJMp8Bm
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380c28f9e35so4268967eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1795434305; x=1796039105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVqS5lS0RoTOTBL4CoDpn/qs9ZBbwa0oy02KVDKJZu4=;
        b=YHJMp8Bmk8/Y5UGI3WO+C/4G37ilVZeCpz7VnZ7ZI2IEqbBuGcd/bi+hG2XsQHt0u7
         um+s77GVp+2kloGsHhii9lNheqXIJCDiWwoYZG38b3ObmOX4hBZ0pYvhqgAorDSuz1n9
         roxIut84FpOVTZ4fqXz+GvpsVZxTIycJSxLESdALF462vjsH2nqeASBtJr4ZWVNM0qgr
         gT/KLKX8kxCCh0S1zIh3TIdwb3XU/uJYwxtVIGxau2qZTdn5ztZMfTG/C9uru6fQimLZ
         Fh0iyxte36lYEhK1do5rJtSxdFpMh5s6nMhI8OITJZ+WoWcqjfyqesDbAqJRyImOmISc
         Y/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434305; x=1796039105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVqS5lS0RoTOTBL4CoDpn/qs9ZBbwa0oy02KVDKJZu4=;
        b=04Ck7Lqyc3cq7HAFm/R33NwA1rjRLg/Fnpmsc6IK5W76F3XzSqR6InY8qPbZ4HpkBt
         I4XSdFrleg/hIB1FWbc0SDAcbAdpLghqGuzZ/rA8sZLljsukIeTGTeNWWgD7HTmSxrX3
         VJXGQyJlDsFNbX7lGw0+1Kq8/4b6C2JxEKN8Nt3b8VIb1PYMgq/SjMtO01JUdTgeAkNo
         HuFYbNeYymUshPJOQtciheOmqjl+9Og+PLIBGE6SVS+htdyGPsFida0ADi0F0LP+tRKr
         rjp+gj6DW1c/YUVT+fPCZm4pkk12qsqqA6seHe0P7E7eWnQj2A3z3wFbGaXx3q24fhrs
         VHxA==
X-Forwarded-Encrypted: i=1; AL+hErESvEJaptwOfPioehPSBQe4Mxq/CkPDHVCBJrx07/LyGdDgbChsHbRLiVsXhr1V2FhF8+IWr+2CMCysbBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q5KdehHQLNfk+/ABDm5T56NRuBEPZghP+dwT378febAIRWldp
	cTX3d0ZMP9kbpJAGV/+dt8vds85I59Ccv9zW8pJ+7bOg/SluKaHJCdWXgzP9E+Nmhm/m
X-Gm-Gg: AZFdTZdGeibpVJDxXIjOIalBy8mjibLuKStPTwm+D8eav+35+bSNYNJngDKM/QVNEaG
	4eYP9sfd4tMYiaw4TEacEh19K4Orm4x3PfKPm8BFSv8sBLEJ6TgnxFMEpCrLhYGJz2yI2/X4Ji7
	6yfDElzMZgncBXRqsG8WHxjE9oxFJRL4JKSz5em7wOn6eT/ef9i3w+/BiLp2UbNdgSwk7VCZF34
	DSAdV1qU7bD4L0zwWciG/zbMUGNccE8NRghejTn3bQYa4qxHzlq7sGrvSkzvTnPypHhV/ZIVWt6
	s8pF3Gtn1D5FbxnmQsTTy7k4xatEEdXx6vg4UhcY9XEipsjCLZ/LNc16sdRPIdvF8gMKUJ0CqXE
	/R+GM+KSMcSSj9gQEA4wZsFWaTFdUc9m0zGNneZYpMeekYXpO6++OWppu18pTc27DH29i/BzoYX
	pEewHMqG0fbHIL0VOMv15PojT7PdWD9Q0wG/q7nyYKsI3qneCpcHZp/gcN20ZvO4pvoPhZ1Ya0F
	7/7ESZfHdQAtIzl28qiMmdpZXtKhdhbYVx8p7JVi8X4wMa0tgJeKFHGCzV3WnwbBMU2pNeDKG/d
	fvlEUuzNBGw659IWJ7c1AXFO2Xk2W61lPRsC1Y/4Up8rrvCk9XwnYEPoYyrPB1eLtlXCSdNxMHt
	KCAEQU84uH26vGR1oq4yCt4KoTpoxd+d5TBFSiw5NAQhC30AiM2pBOg==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr9810486eec.18.1795434305311;
        Mon, 23 Nov 2026 03:45:05 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:14e:94e0:654e:d7ff:13d2:447d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm41943583eec.10.2026.11.23.03.44.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:45:05 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org
Cc: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Segall <bsegall@google.com>,
	David Hildenbrand <david@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Morris <jmorris@namei.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [RFC PATCH v4 6/6] MAINTAINERS: add an entry for the Kernel Assurance Plane
Date: Mon, 23 Nov 2026 17:13:08 +0530
Message-ID: <20261123114308.8103-7-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123114308.8103-1-harisudhan@armoriq.io>
References: <20261123114308.8103-1-harisudhan@armoriq.io>
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

Add the KAP maintainers and the files they look after.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8..0946d151e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14118,6 +14118,16 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-keene*
 
+KERNEL ASSURANCE PLANE (KAP)
+M:	Ketan Bhardwaj <ketan@armoriq.io>
+M:	HARIHARA SUDHAN. R <harisudhan@armoriq.io>
+L:	linux-security-module@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/securityfs-kap
+F:	Documentation/security/kap.rst
+F:	include/linux/kap.h
+F:	security/kap/
+
 KERNEL AUTOMOUNTER
 M:	Ian Kent <raven@themaw.net>
 L:	autofs@vger.kernel.org
-- 
2.43.0

